import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/generated/crm.pbgrpc.dart'; // Import CrmServiceClient and AuthServiceClient
import 'package:admin/services/grpc_client.dart'; // Import GrpcClient for channel and shutdown
import 'package:grpc/grpc.dart'; // Import CallOptions

// --- Configuration ---

// ##########################################################################
// # CRITICAL: YOU MUST REPLACE THESE WITH VALID CREDENTIALS                #
// #           FOR AN *EXISTING* USER WITH DIRECTOR PRIVILEGES              #
// ##########################################################################
const bootstrapDirectorEmail =
    'director@example.com'; // <<<--- REPLACE THIS WITH A REAL, EXISTING DIRECTOR EMAIL
const bootstrapDirectorPassword =
    'password'; // <<<--- REPLACE THIS WITH THE CORRECT PASSWORD FOR THAT DIRECTOR

// Details for the NEW director to be created
const newDirectorLogin =
    'new_director_via_script@example.com'; // You can change this if needed
const newDirectorPassword = 'password123'; // Choose a secure password
const newDirectorName = 'New Director (Script)';
const placeholderOfficeId =
    'office_1'; // Replace if you have a specific, valid office ID for your backend
// ---

Future<void> main() async {
  String? bootstrapToken;
  String? newUserId;

  print('Initializing gRPC client...');
  // Initialize the gRPC client (ensure server address/port are correct in GrpcClient)
  final channel = GrpcClient().channel; // Get the channel
  final authClient = AuthServiceClient(channel);
  final crmClient = CrmServiceClient(channel);

  try {
    // --- Step 1: Login as Bootstrap Director ---
    print('Attempting login as bootstrap director: $bootstrapDirectorEmail');
    final loginReq = crm.LoginRequest(
      email: bootstrapDirectorEmail,
      password: bootstrapDirectorPassword,
    );
    final loginResp = await authClient.login(loginReq);
    // Check if token is empty (non-nullable string in proto)
    if (loginResp.token.isEmpty) {
      throw Exception(
          'Login failed or received empty token for bootstrap director. Verify credentials.');
    }
    bootstrapToken = loginResp.token;
    print('Bootstrap director login successful.');

    // Create CallOptions with the bootstrap token
    final bootstrapCallOptions = CallOptions(
      metadata: {'authorization': 'Bearer $bootstrapToken'},
    );

    // --- Step 2: Create the New User (using bootstrap token) ---
    print('Attempting to create new user: $newDirectorLogin');
    final userObject = crm.User(login: newDirectorLogin);
    final createUserReq = crm.CreateUserRequest(
      user: userObject,
      password: newDirectorPassword,
    );
    final createUserResp = await crmClient.createUser(
      createUserReq,
      options: bootstrapCallOptions, // Use token
    );
    // Check if userId is empty (non-nullable string in proto)
    if (createUserResp.userId.isEmpty) {
      throw Exception('CreateUser response did not contain userId');
    }
    newUserId = createUserResp.userId;
    print('New user created successfully with ID: $newUserId');

    // --- Step 3: Create the New Employee (using bootstrap token) ---
    print('Attempting to create employee for user ID: $newUserId');
    final employeeData = crm.Employee(
      userId: newUserId,
      name: newDirectorName,
      email: newDirectorLogin,
      role: crm.EmployeeRole.DIRECTOR, // Assign DIRECTOR role
      officeId:
          placeholderOfficeId, // Ensure this office exists in your backend
      isActive: true,
    );
    final createEmployeeReq = crm.CreateEmployeeRequest(employee: employeeData);
    // Use the SAME bootstrap token to authorize employee creation
    final createEmployeeResp = await crmClient.createEmployee(
      createEmployeeReq,
      options: bootstrapCallOptions, // Use token
    );
    // Check if employeeId is empty (non-nullable string in proto)
    if (createEmployeeResp.employeeId.isEmpty) {
      throw Exception('CreateEmployee response did not contain employeeId');
    }
    print(
        'Employee created successfully with ID: ${createEmployeeResp.employeeId}');

    // --- Success ---
    print('\n--- New Director Account Created Successfully ---');
    print('Login:    $newDirectorLogin');
    print('Password: $newDirectorPassword');
    print('User ID:  $newUserId');
    print('---------------------------------------------');
    print(
        'You should now be able to log in to the app using these credentials.');
  } catch (e) {
    print('\n--- ERROR DURING DIRECTOR CREATION ---');
    print('Error: $e');
    if (bootstrapToken == null) {
      print(
          '-> Failed during bootstrap login. Verify bootstrap credentials ($bootstrapDirectorEmail) and server connectivity.');
    } else if (newUserId == null) {
      print(
          '-> Failed during user creation. Check CreateUser permissions for the bootstrap director.');
    } else {
      print(
          '-> Failed during employee creation. Check CreateEmployee permissions for the bootstrap director, or verify data (e.g., ensure office ID \'$placeholderOfficeId\' exists).');
    }
    print('----------------------------------------');
  } finally {
    // Shutdown the gRPC channel
    await GrpcClient().shutdown();
    print('gRPC client shutdown.');
  }
}

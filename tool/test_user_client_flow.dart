import 'package:flutter/foundation.dart'; // For debugPrint
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart'; // For generating unique emails

// Adjust path based on your project structure
// Add prefix 'crm' to avoid name clashes
import '../lib/generated/crm.pb.dart' as crm;
import '../lib/generated/crm.pbgrpc.dart';

// --- gRPC Client Setup ---
// Replace with your actual client setup if different
AuthServiceClient getAuthClient() {
  final channel = ClientChannel('localhost',
      port: 50051,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return AuthServiceClient(channel);
}

CrmServiceClient getCrmClient() {
  final channel = ClientChannel('localhost',
      port: 50051,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return CrmServiceClient(channel);
}
// --- End Client Setup ---

// Function to demonstrate the user-client flow
Future<void> testUserClientFlow() async {
  final authClient = getAuthClient();
  final crmClient = getCrmClient();
  const uuid = Uuid();
  String? managerToken; // To store the token after login
  String? newClientId; // To store the created client ID
  String? newUserId;

  debugPrint('--- Starting User-Client Flow Test ---');

  // --- 1. Create a new User ---
  final userLogin = 'flutter_user_${uuid.v4()}@example.com';
  const userPassword = 'password123';

  try {
    debugPrint('1. Creating User: $userLogin...');
    final createUserReq = crm.CreateUserRequest(
      user: crm.User(login: userLogin),
      password: userPassword,
    );
    final createUserRes = await crmClient.createUser(createUserReq);
    newUserId = createUserRes.userId;
    if (newUserId.isEmpty) {
      throw Exception("Received empty user ID");
    }
    debugPrint('   User created successfully! User ID: $newUserId');

    // --- 1b. Create Employee for the new User ---
    debugPrint('1b. Creating Employee for User...');
    final createEmployeeReq = crm.CreateEmployeeRequest(
      employee: crm.Employee(
        userId: newUserId,
        login: userLogin,
        name: 'Test Manager',
        role: crm.EmployeeRole.MANAGER,
        isActive: true,
        email: userLogin,
      ),
      userLogin: userLogin,
      userPassword: userPassword,
    );
    final createEmployeeRes = await crmClient.createEmployee(createEmployeeReq);
    final newEmployeeId = createEmployeeRes.employeeId;
    if (newEmployeeId.isEmpty) {
      throw Exception("Received empty employee ID");
    }
    debugPrint('   Employee created successfully! Employee ID: $newEmployeeId');
  } catch (e) {
    debugPrint('   Error creating user/employee: $e');
    debugPrint('--- Test Failed at User/Employee Creation ---');
    return;
  }

  // --- 2. Login as the new Employee ---
  try {
    debugPrint('2. Logging in as Employee: $userLogin...');
    final loginEmployeeReq = crm.LoginEmployeeRequest(
      login: userLogin,
      password: userPassword,
    );
    final loginEmployeeRes = await authClient.loginEmployee(loginEmployeeReq);
    managerToken = loginEmployeeRes.token;
    if (managerToken.isEmpty) {
      throw Exception("Received empty token");
    }
    debugPrint('   Employee login successful! Token received.');
  } catch (e) {
    debugPrint('   Error logging in as employee: $e');
    debugPrint('--- Test Failed at Employee Login ---');
    return;
  }

  // --- 3. Create a Client using the Manager's token ---
  try {
    debugPrint('3. Creating Client using Manager token...');
    final clientFirstName = 'FlutterClient_${uuid.v4()}';
    // Use the 'crm' prefix for protobuf enums
    const clientSource = crm.ClientSource.CLIENT_SOURCE_ONLINE; // Enum value

    // Use the 'crm' prefix for protobuf messages
    final createClientReq = crm.CreateClientRequest(
      client: crm.Client(
        firstName: clientFirstName,
        lastName: 'TestFlutter',
        phone: '+98765432109', // Example valid E.164
        source: clientSource, // Assign enum value directly
      ),
    );

    // Add the token to the call options (metadata)
    final options =
        CallOptions(metadata: {'authorization': 'Bearer $managerToken'});

    final createClientRes =
        await crmClient.createClient(createClientReq, options: options);
    newClientId = createClientRes.clientId;
    // Simplify null check - clientId from proto is non-nullable string
    if (newClientId.isEmpty) {
      throw Exception("Received empty client ID");
    }
    debugPrint('   Client created successfully! Client ID: $newClientId');
  } catch (e) {
    debugPrint('   Error creating client: $e');
    debugPrint('--- Test Failed at Client Creation ---');
    return; // Stop if client creation fails
  }

  // --- 4. List Clients using the Manager's token and verify ---
  try {
    debugPrint('4. Listing Clients using Manager token...');
    await Future.delayed(
        const Duration(milliseconds: 200)); // Small delay for propagation

    // Use the 'crm' prefix for protobuf messages
    final listClientsReq = crm.ListClientsRequest(pageSize: 100);
    final options =
        CallOptions(metadata: {'authorization': 'Bearer $managerToken'});

    final listClientsRes =
        await crmClient.listClients(listClientsReq, options: options);

    bool found = false;
    for (final client in listClientsRes.clients) {
      if (client.clientId == newClientId) {
        debugPrint(
            '   Successfully found created Client ID: ${client.clientId} in the list.');
        found = true;
        break;
      }
    }

    if (found) {
      debugPrint('--- Test Succeeded --- ');
    } else {
      debugPrint(
          '   Error: Newly created client (ID: $newClientId) not found in the list.');
      debugPrint('--- Test Failed at Client Verification ---');
    }
  } catch (e) {
    debugPrint('   Error listing clients: $e');
    debugPrint('--- Test Failed at Client Listing ---');
    return;
  }
}

// Main function to run the test flow
Future<void> main() async {
  await testUserClientFlow();
  // Ensure the script exits after completion
  // Note: Channels might keep the process alive; explicit shutdown might be needed
  // depending on how channels are managed globally in a real app.
  // For this simple script, exiting might be sufficient.
}

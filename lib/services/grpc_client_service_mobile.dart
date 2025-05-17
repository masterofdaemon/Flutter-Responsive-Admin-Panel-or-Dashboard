import 'package:grpc/grpc.dart';
import 'package:admin/services/grpc_client.dart'; // Import shared client
import 'package:admin/generated/crm.pb.dart' as crm; // Added crm alias
import 'package:admin/generated/crm.pbgrpc.dart'; // Removed duplicate import
import 'package:fixnum/fixnum.dart' as $fixnum;

class GrpcClientService {
  // Shared channel with authentication
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  GrpcClientService();

  // --- Client Methods ---
  Future<List<crm.Client>> listClients(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListClientsRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      // Include authorization header via GrpcClient
      final response = await _client.listClients(
        request,
        options: GrpcClient().getCallOptions(),
      );
      return response.clients;
    } on GrpcError {
      return [];
    } catch (_) {
      return [];
    }
  }

  Future<crm.Client> createClient(crm.Client client) async {
    final request = crm.CreateClientRequest(client: client);
    try {
      final response = await _client.createClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
      // Fetch the created client to return the full object
      return await getClient(response.clientId);
    } catch (e) {
      rethrow;
    }
  }

  Future<crm.Client> getClient(String clientId) async {
    final request = crm.GetClientRequest(clientId: clientId);
    try {
      final response = await _client.getClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
      return response.client;
    } catch (e) {
      rethrow;
    }
  }

  Future<crm.Client> updateClient(
      String clientId, crm.Client clientData) async {
    final request =
        crm.UpdateClientRequest(clientId: clientId, clientData: clientData);
    try {
      final response = await _client.updateClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
      return response.client;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteClient(String clientId) async {
    final request = crm.DeleteClientRequest(clientId: clientId);
    try {
      await _client.deleteClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
    } catch (e) {
      rethrow;
    }
  }

  // --- Employee Methods ---
  Future<List<crm.Employee>> listEmployees(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListEmployeesRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      // print('Requesting employees, pageSize: $pageSize, pageToken: $pageToken');
      final response = await _client.listEmployees(
        request,
        options: GrpcClient().getCallOptions(),
      );
      return response.employees;
    } catch (e) {
      print('Error during listEmployees: $e');
      return [];
    }
  }

  /// Creates an employee with login credentials. Returns the full Employee object after creation.
  Future<crm.Employee> createEmployee({
    required crm.Employee employee,
    required String userLogin,
    required String userPassword,
    $fixnum.Int64? telegramId,
  }) async {
    final request = crm.CreateEmployeeRequest(
      employee: employee,
      userLogin: userLogin,
      userPassword: userPassword,
      telegramId: telegramId,
    );
    try {
      print('Creating employee: \\${employee.name} (login: \\${userLogin})');
      final response = await _client.createEmployee(
        request,
        options: GrpcClient().getCallOptions(),
      );
      // Fetch the full employee object using the returned employeeId
      return await getEmployee(response.employeeId);
    } catch (e) {
      print('Error during createEmployee: $e');
      rethrow;
    }
  }

  // /// Authenticates an employee and returns the login response (token, etc).
  // Future<crm.LoginEmployeeResponse> loginEmployee({
  //   required String login,
  //   required String password,
  // }) async {
  //   final authClient = AuthServiceClient(GrpcClient().channel);
  //   final request = crm.LoginEmployeeRequest(
  //     login: login,
  //     password: password,
  //   );
  //   try {
  //     print('Logging in employee: $login');
  //     final response = await authClient.loginEmployee(
  //       request,
  //       options: GrpcClient().getCallOptions(),
  //     );
  //     return response;
  //   } catch (e) {
  //     print('Error during loginEmployee: $e');
  //     rethrow;
  //   }
  // }

  Future<crm.Employee> getEmployee(String employeeId) async {
    final request = crm.GetEmployeeRequest(employeeId: employeeId);
    try {
      print('Fetching employee ID: $employeeId');
      final response = await _client.getEmployee(
        request,
        options: GrpcClient().getCallOptions(),
      );
      return response.employee;
    } catch (e) {
      print('Error during getEmployee: $e');
      rethrow;
    }
  }

  Future<crm.Employee> updateEmployee(
      String employeeId, crm.Employee employeeData) async {
    final request = crm.UpdateEmployeeRequest(
        employeeId: employeeId, employeeData: employeeData);
    try {
      print('Updating employee ID: $employeeId');
      final response = await _client.updateEmployee(
        request,
        options: GrpcClient().getCallOptions(),
      );
      return response.employee;
    } catch (e) {
      print('Error during updateEmployee: $e');
      rethrow;
    }
  }

  Future<void> deleteEmployee(String employeeId) async {
    final request = crm.DeleteEmployeeRequest(employeeId: employeeId);
    try {
      print('Deleting employee ID: $employeeId');
      await _client.deleteEmployee(
        request,
        options: GrpcClient().getCallOptions(),
      );
    } catch (e) {
      print('Error during deleteEmployee: $e');
      rethrow;
    }
  }

  // --- User Methods ---
  // Returns the userId of the created user
  Future<String> createUser(String login, String password) async {
    // Create a User object with the login (email)
    final userObject = crm.User(login: login);
    // Create the request with the User object and password
    final request = crm.CreateUserRequest(user: userObject, password: password);
    try {
      print('Creating user: $login');
      final response = await _client.createUser(
        request,
        options: GrpcClient().getCallOptions(), // Requires admin privileges
      );
      // Response contains the userId
      if (response.userId.isNotEmpty) {
        return response.userId;
      } else {
        throw Exception('CreateUserResponse did not contain userId');
      }
    } catch (e) {
      print('Error during createUser: $e');
      rethrow;
    }
  }

  Future<List<crm.User>> listUsers(
      {int pageSize = 100, String pageToken = ''}) async {
    // Fetch more users for dropdown
    final request =
        crm.ListUsersRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      // print('Requesting users, pageSize: $pageSize, pageToken: $pageToken');
      final response = await _client.listUsers(
        request,
        options: GrpcClient().getCallOptions(),
      );
      return response.users;
    } catch (e) {
      print('Error during listUsers: $e');
      return [];
    }
  }

  // --- Office Methods (for dropdowns) ---
  Future<List<crm.Office>> listOffices(
      {int pageSize = 100, String pageToken = ''}) async {
    // Fetch more offices for dropdown
    final request =
        crm.ListOfficesRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      print('Requesting offices, pageSize: $pageSize, pageToken: $pageToken');
      final response = await _client.listOffices(
        request,
        options: GrpcClient().getCallOptions(),
      );
      return response.offices;
    } catch (e) {
      print('Error during listOffices: $e');
      return [];
    }
  }

  // No local channel to shutdown: uses shared GrpcClient
}

// Factory function remains the same
GrpcClientService getGrpcClientService({
  String host = 'localhost',
  int grpcPort = 50051,
  int grpcWebPort = 50051, // Keep signature consistent
  bool useTls = false,
}) =>
    GrpcClientService(); // Completed the factory function

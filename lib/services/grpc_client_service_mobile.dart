import 'package:grpc/grpc.dart';
import 'package:admin/services/grpc_client.dart'; // Import shared client
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;

class GrpcClientService {
  // Shared channel with authentication
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  GrpcClientService() {
    print('GrpcClientService: connected via shared GrpcClient channel');
  }

  // --- Client Methods ---
  Future<List<crm.Client>> listClients(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListClientsRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      print('Requesting clients, pageSize: $pageSize, pageToken: $pageToken');
      // Include authorization header via GrpcClient
      final response = await _client.listClients(
        request,
        options: GrpcClient().getCallOptions(),
      );
      print('Fetched clients from backend:');
      for (final c in response.clients) {
        print(
            '  id: ${c.clientId}, firstName: ${c.firstName}, lastName: ${c.lastName}, phone: ${c.phone}, email: ${c.email}, source: ${c.source}');
      }
      return response.clients;
    } on GrpcError catch (e) {
      print('gRPC error during listClients: ${e.message}');
      return [];
    } catch (e) {
      print('Error during listClients: $e');
      return [];
    }
  }

  Future<crm.Client> createClient(crm.Client client) async {
    final request = crm.CreateClientRequest(client: client);
    try {
      print('Creating client: ${client.firstName} ${client.lastName}');
      final response = await _client.createClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
      // Fetch the created client to return the full object
      return await getClient(response.clientId);
    } catch (e) {
      print('Error during createClient: $e');
      rethrow;
    }
  }

  Future<crm.Client> getClient(String clientId) async {
    final request = crm.GetClientRequest(clientId: clientId);
    try {
      print('Fetching client ID: $clientId');
      final response = await _client.getClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
      return response.client;
    } catch (e) {
      print('Error during getClient: $e');
      rethrow;
    }
  }

  Future<crm.Client> updateClient(
      String clientId, crm.Client clientData) async {
    final request =
        crm.UpdateClientRequest(clientId: clientId, clientData: clientData);
    try {
      print('Updating client ID: $clientId');
      final response = await _client.updateClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
      return response.client;
    } catch (e) {
      print('Error during updateClient: $e');
      rethrow;
    }
  }

  Future<void> deleteClient(String clientId) async {
    final request = crm.DeleteClientRequest(clientId: clientId);
    try {
      print('Deleting client ID: $clientId');
      await _client.deleteClient(
        request,
        options: GrpcClient().getCallOptions(), // Add auth options
      );
    } catch (e) {
      print('Error during deleteClient: $e');
      rethrow;
    }
  }

  // --- Employee Methods ---
  Future<List<crm.Employee>> listEmployees(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListEmployeesRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      print('Requesting employees, pageSize: $pageSize, pageToken: $pageToken');
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

  Future<crm.Employee> createEmployee(crm.Employee employee) async {
    final request = crm.CreateEmployeeRequest(employee: employee);
    try {
      print('Creating employee: ${employee.name}');
      final response = await _client.createEmployee(
        request,
        options: GrpcClient().getCallOptions(),
      );
      // Assuming CreateEmployeeResponse returns the ID, fetch the full employee
      return await getEmployee(response.employeeId);
    } catch (e) {
      print('Error during createEmployee: $e');
      rethrow;
    }
  }

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
      print('Requesting users, pageSize: $pageSize, pageToken: $pageToken');
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
    GrpcClientService();

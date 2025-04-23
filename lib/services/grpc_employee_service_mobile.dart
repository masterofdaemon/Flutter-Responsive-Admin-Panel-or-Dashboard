// Replace the stub with real gRPC implementation for Employee service
import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;

class GrpcEmployeeService {
  late final ClientChannel _channel;
  late final CrmServiceClient _client;

  GrpcEmployeeService({
    String host = 'localhost',
    int grpcPort = 50051,
    bool useTls = false,
  }) {
    _channel = ClientChannel(
      host,
      port: grpcPort,
      options: ChannelOptions(
        credentials: useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );
    _client = CrmServiceClient(_channel);
  }

  Future<List<crm.Employee>> listEmployees(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListEmployeesRequest(
      pageSize: pageSize,
      pageToken: pageToken,
    );
    final response = await _client.listEmployees(request);
    return response.employees;
  }

  Future<crm.Employee> createEmployee(crm.Employee employee) async {
    final request = crm.CreateEmployeeRequest(employee: employee);
    final response = await _client.createEmployee(request);
    return await getEmployee(response.employeeId);
  }

  Future<crm.Employee> getEmployee(String employeeId) async {
    final request = crm.GetEmployeeRequest(employeeId: employeeId);
    final response = await _client.getEmployee(request);
    return response.employee;
  }

  Future<crm.Employee> updateEmployee(
      String employeeId, crm.Employee data) async {
    final request = crm.UpdateEmployeeRequest(
      employeeId: employeeId,
      employeeData: data,
    );
    final response = await _client.updateEmployee(request);
    return response.employee;
  }

  Future<void> deleteEmployee(String employeeId) async {
    final request = crm.DeleteEmployeeRequest(employeeId: employeeId);
    await _client.deleteEmployee(request);
  }

  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}

GrpcEmployeeService getGrpcEmployeeService({
  String host = 'localhost',
  int grpcPort = 50051,
  bool useTls = false,
}) =>
    GrpcEmployeeService(host: host, grpcPort: grpcPort, useTls: useTls);

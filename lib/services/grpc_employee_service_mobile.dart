// Replace the stub with real gRPC implementation for Employee service
import 'package:flutter/foundation.dart'; // Import for kDebugMode
import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;

class GrpcEmployeeService {
  late final ClientChannel _channel;
  late final CrmServiceClient _client;
  static const String _tag = 'GrpcEmployeeService';

  GrpcEmployeeService({
    String host = '31.41.13.175',
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
    if (kDebugMode) {
      print(
          '$_tag: Initialized with host: $host, port: $grpcPort, useTls: $useTls');
    }
  }

  Future<List<crm.Employee>> listEmployees(
      {int pageSize = 20, String pageToken = ''}) async {
    if (kDebugMode) {
      print(
          '$_tag: listEmployees called with pageSize: $pageSize, pageToken: "$pageToken"');
    }
    final request = crm.ListEmployeesRequest(
      pageSize: pageSize,
      pageToken: pageToken,
    );
    try {
      final response = await _client.listEmployees(request);
      if (kDebugMode) {
        print(
            '$_tag: listEmployees successful, ${response.employees.length} employees fetched.');
        // Log the role of each employee
        for (int i = 0; i < response.employees.length; i++) {
          final employee = response.employees[i];
          print(
              '$_tag: Employee #${i + 1}: ID=${employee.employeeId}, Name=${employee.name}, Role=${employee.role}');
        }
      }
      return response.employees;
    } catch (e) {
      if (kDebugMode) {
        print('$_tag: listEmployees failed: $e');
      }
      rethrow;
    }
  }

  Future<crm.Employee> createEmployee(crm.Employee employee) async {
    if (kDebugMode) {
      // Using writeToJsonMap for potentially better structured logging if toShortString isn't available or suitable
      print(
          '$_tag: createEmployee called with employee data: ${employee.writeToJsonMap()}');
    }
    final request = crm.CreateEmployeeRequest(employee: employee);
    try {
      final response = await _client.createEmployee(request);
      if (kDebugMode) {
        print(
            '$_tag: createEmployee call successful, server responded with employeeId: ${response.employeeId}. Fetching created employee details...');
      }
      return await getEmployee(response.employeeId.toString());
    } catch (e) {
      if (kDebugMode) {
        print('$_tag: createEmployee failed: $e');
      }
      rethrow;
    }
  }

  Future<crm.Employee> getEmployee(String employeeId) async {
    if (kDebugMode) {
      print('$_tag: getEmployee called with employeeId: $employeeId');
    }
    final request =
        crm.GetEmployeeRequest(employeeId: int.tryParse(employeeId) ?? 0);
    try {
      final response = await _client.getEmployee(request);
      if (kDebugMode) {
        print(
            '$_tag: getEmployee successful for employeeId: $employeeId. Employee data: ${response.employee.writeToJsonMap()}');
      }
      return response.employee;
    } catch (e) {
      if (kDebugMode) {
        print('$_tag: getEmployee failed for employeeId: $employeeId: $e');
      }
      rethrow;
    }
  }

  Future<crm.Employee> updateEmployee(
      String employeeId, crm.Employee data) async {
    if (kDebugMode) {
      print(
          '$_tag: updateEmployee called for employeeId: $employeeId with data: ${data.writeToJsonMap()}');
    }
    final request = crm.UpdateEmployeeRequest(
      employeeId: int.tryParse(employeeId) ?? 0,
      employeeData: data,
    );
    try {
      final response = await _client.updateEmployee(request);
      if (kDebugMode) {
        print(
            '$_tag: updateEmployee successful for employeeId: $employeeId. Updated employee data: ${response.employee.writeToJsonMap()}');
      }
      return response.employee;
    } catch (e) {
      if (kDebugMode) {
        print('$_tag: updateEmployee failed for employeeId: $employeeId: $e');
      }
      rethrow;
    }
  }

  Future<void> deleteEmployee(String employeeId) async {
    if (kDebugMode) {
      print('$_tag: deleteEmployee called for employeeId: $employeeId');
    }
    final request =
        crm.DeleteEmployeeRequest(employeeId: int.tryParse(employeeId) ?? 0);
    try {
      await _client.deleteEmployee(request);
      if (kDebugMode) {
        print('$_tag: deleteEmployee successful for employeeId: $employeeId');
      }
    } catch (e) {
      if (kDebugMode) {
        print('$_tag: deleteEmployee failed for employeeId: $employeeId: $e');
      }
      rethrow;
    }
  }

  Future<void> shutdown() async {
    if (kDebugMode) {
      print('$_tag: shutdown called');
    }
    try {
      await _channel.shutdown();
      if (kDebugMode) {
        print('$_tag: Channel shutdown complete.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('$_tag: Channel shutdown failed: $e');
      }
      rethrow;
    }
  }
}

GrpcEmployeeService getGrpcEmployeeService({
  String host = '31.41.13.175',
  int grpcPort = 50051,
  bool useTls = false,
}) {
  // This factory function itself doesn't need extensive logging usually,
  // as the constructor of GrpcEmployeeService already logs initialization.
  // if (kDebugMode) {
  //   print('getGrpcEmployeeService: Creating instance with host: $host, port: $grpcPort, useTls: $useTls');
  // }
  return GrpcEmployeeService(host: host, grpcPort: grpcPort, useTls: useTls);
}

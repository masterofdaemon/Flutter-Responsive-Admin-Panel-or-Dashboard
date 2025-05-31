import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:admin/generated/crm.pb.dart' as pb;
import 'package:admin/generated/crm.pbgrpc.dart' as pbgrpc;
import 'package:admin/services/grpc_client.dart';
import 'package:admin/services/auth_service.dart';

class UserManagementService with ChangeNotifier {
  // Singleton implementation
  static UserManagementService? _instance;
  
  static UserManagementService get instance {
    _instance ??= UserManagementService._internal();
    return _instance!;
  }
  
  UserManagementService._internal();
  
  factory UserManagementService() => instance;

  pbgrpc.CrmServiceClient get _crmClient {
    final channel = GrpcClient().channel;
    return pbgrpc.CrmServiceClient(channel);
  }

  List<pb.Employee> _employees = [];
  List<pb.User> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<pb.Employee> get employees => List.unmodifiable(_employees);
  List<pb.User> get users => List.unmodifiable(_users);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Load all employees with their details
  Future<bool> loadAllEmployees() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final request = pb.ListEmployeesRequest();
      final response = await _crmClient.listEmployees(request);
      
      _employees = response.employees;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Failed to load employees: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Load all users
  Future<bool> loadAllUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final request = pb.ListUsersRequest();
      final response = await _crmClient.listUsers(request);
      
      _users = response.users;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Failed to load users: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Disable an employee account with all security measures
  Future<bool> disableEmployee(int employeeId, String reason) async {
    try {
      final authService = AuthService.instance;
      
      // Find the employee to check their role
      final employee = _employees.firstWhere(
        (emp) => emp.employeeId == employeeId,
        orElse: () => throw Exception('Employee not found'),
      );

      // Check if current user can disable this specific employee
      if (!authService.canDisableSpecificEmployee(employee.role)) {
        throw Exception('You do not have permission to disable this employee');
      }

      // Step 1: Generate random password
      final newPassword = _generateRandomPassword();

      // Step 2: Update employee to inactive and change password
      // Create updated employee data
      final updatedEmployee = employee.rebuild((b) => b
        ..isActive = false
        ..notes = employee.notes.isNotEmpty 
          ? '${employee.notes}\n\nDisabled on ${DateTime.now().toIso8601String()}: $reason'
          : 'Disabled on ${DateTime.now().toIso8601String()}: $reason');

      final updateRequest = pb.UpdateEmployeeRequest(
        employeeId: employeeId,
        employeeData: updatedEmployee,
        password: newPassword, // New random password
      );

      await _crmClient.updateEmployee(updateRequest);

      // Update local state
      final index = _employees.indexWhere((emp) => emp.employeeId == employeeId);
      if (index != -1) {
        _employees[index] = updatedEmployee;
      }

      notifyListeners();
      return true;

    } catch (e) {
      _errorMessage = 'Failed to disable employee: ${e.toString()}';
      notifyListeners();
      return false;
    }
  }

  /// Enable/reactivate an employee account
  Future<bool> enableEmployee(int employeeId, String reason) async {
    try {
      final authService = AuthService.instance;
      
      // Find the employee
      final employee = _employees.firstWhere(
        (emp) => emp.employeeId == employeeId,
        orElse: () => throw Exception('Employee not found'),
      );

      // Check permissions
      if (!authService.canDisableSpecificEmployee(employee.role)) {
        throw Exception('You do not have permission to enable this employee');
      }

      // Create updated employee data
      final updatedEmployee = employee.rebuild((b) => b
        ..isActive = true
        ..notes = employee.notes.isNotEmpty 
          ? '${employee.notes}\n\nReactivated on ${DateTime.now().toIso8601String()}: $reason'
          : 'Reactivated on ${DateTime.now().toIso8601String()}: $reason');

      final updateRequest = pb.UpdateEmployeeRequest(
        employeeId: employeeId,
        employeeData: updatedEmployee,
      );

      await _crmClient.updateEmployee(updateRequest);

      // Update local state
      final index = _employees.indexWhere((emp) => emp.employeeId == employeeId);
      if (index != -1) {
        _employees[index] = updatedEmployee;
      }

      notifyListeners();
      return true;

    } catch (e) {
      _errorMessage = 'Failed to enable employee: ${e.toString()}';
      notifyListeners();
      return false;
    }
  }

  /// Reset password for an employee (generates new random password)
  Future<String?> resetEmployeePassword(int employeeId, String reason) async {
    try {
      final authService = AuthService.instance;
      
      if (!authService.canResetUserPasswords()) {
        throw Exception('You do not have permission to reset passwords');
      }

      final newPassword = _generateRandomPassword();

      // Find the employee
      final employee = _employees.firstWhere(
        (emp) => emp.employeeId == employeeId,
        orElse: () => throw Exception('Employee not found'),
      );

      final updateRequest = pb.UpdateEmployeeRequest(
        employeeId: employeeId,
        employeeData: employee, // Keep existing data
        password: newPassword,
      );

      await _crmClient.updateEmployee(updateRequest);

      return newPassword;

    } catch (e) {
      _errorMessage = 'Failed to reset password: ${e.toString()}';
      notifyListeners();
      return null;
    }
  }

  /// Bulk disable multiple employees
  Future<Map<int, bool>> bulkDisableEmployees(
    List<int> employeeIds, 
    String reason,
  ) async {
    final results = <int, bool>{};
    
    for (final employeeId in employeeIds) {
      results[employeeId] = await disableEmployee(employeeId, reason);
    }
    
    return results;
  }

  /// Bulk enable multiple employees
  Future<Map<int, bool>> bulkEnableEmployees(
    List<int> employeeIds, 
    String reason,
  ) async {
    final results = <int, bool>{};
    
    for (final employeeId in employeeIds) {
      results[employeeId] = await enableEmployee(employeeId, reason);
    }
    
    return results;
  }

  /// Generate a random secure password
  String _generateRandomPassword({int length = 12}) {
    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*';
    final Random random = Random.secure();
    return String.fromCharCodes(
      Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  /// Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// Refresh all data
  Future<void> refreshData() async {
    await Future.wait([
      loadAllEmployees(),
      loadAllUsers(),
    ]);
  }
}

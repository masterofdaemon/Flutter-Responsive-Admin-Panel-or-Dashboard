import 'package:admin/constants.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
// import 'package:admin/responsive.dart'; // Removed unused import
import 'package:admin/screens/employee_form_screen.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final GrpcClientService _grpcService = GrpcClientService();
  List<crm.Employee> _employees = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadEmployees();
  }

  Future<void> _loadEmployees() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final employees = await _grpcService.listEmployees(
          pageSize: 100); // Fetch more for list view
      if (mounted) {
        setState(() {
          _employees = employees;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Error loading employees: $e';
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _deleteEmployee(crm.Employee employeeToDelete) async {
    // Optional: Show confirmation dialog
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: Text(
            'Are you sure you want to delete employee "${employeeToDelete.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() {
      _isLoading = true; // Show loading indicator during deletion
    });

    try {
      await _grpcService.deleteEmployee(employeeToDelete.employeeId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Employee "${employeeToDelete.name}" deleted successfully')),
        );
        _loadEmployees(); // Refresh the list
      }
    } on GrpcError catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting employee: ${e.message}')),
        );
        setState(() {
          _isLoading = false; // Stop loading on error
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting employee: $e')),
        );
        setState(() {
          _isLoading = false; // Stop loading on error
        });
      }
    }
    // No finally block needed here as _loadEmployees handles the final state
  }

  void _navigateToAddEmployee() async {
    final result = await Navigator.push(
      context,
      // Call constructor directly without prefix
      MaterialPageRoute(builder: (context) => EmployeeFormScreen()),
    );
    if (result == true && mounted) {
      _loadEmployees(); // Refresh list if an employee was added/updated
    }
  }

  void _navigateToEditEmployee(String employeeId) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          // Call constructor directly without prefix
          builder: (context) => EmployeeFormScreen(employeeId: employeeId)),
    );
    if (result == true && mounted) {
      _loadEmployees(); // Refresh list if an employee was added/updated
    }
  }

  // Helper to display role names nicely
  String _getRoleDisplayName(crm.EmployeeRole role) {
    return role.name.replaceFirst('EMPLOYEE_ROLE_', '').replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading
                ? null
                : _loadEmployees, // Disable refresh while loading
            tooltip: 'Refresh List',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Optional Header can go here
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _errorMessage != null
                      ? Center(
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Error: $_errorMessage',
                                      style:
                                          const TextStyle(color: Colors.red)),
                                  const SizedBox(height: 10),
                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.refresh),
                                    label: const Text('Retry'),
                                    onPressed: _loadEmployees,
                                  )
                                ],
                              )))
                      : _employees.isEmpty
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('No employees found.'),
                                const SizedBox(height: 10),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add First Employee'),
                                  onPressed: _navigateToAddEmployee,
                                )
                              ],
                            ))
                          : RefreshIndicator(
                              onRefresh: _loadEmployees,
                              child: SingleChildScrollView(
                                physics:
                                    const AlwaysScrollableScrollPhysics(), // Enable pull-to-refresh even when content fits
                                padding: const EdgeInsets.all(defaultPadding),
                                child: Container(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  decoration: const BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: DataTable(
                                      columnSpacing: defaultPadding,
                                      // minWidth: 600, // Uncomment if needed for wider tables
                                      columns: const [
                                        DataColumn(label: Text('Name')),
                                        DataColumn(label: Text('Email')),
                                        DataColumn(label: Text('Role')),
                                        DataColumn(label: Text('Office ID')),
                                        DataColumn(label: Text('Active')),
                                        DataColumn(label: Text('Actions')),
                                      ],
                                      rows: List.generate(
                                        _employees.length,
                                        (index) =>
                                            employeeDataRow(_employees[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddEmployee,
        tooltip: 'Add Employee',
        child: const Icon(Icons.add),
        backgroundColor: primaryColor, // Use theme color
      ),
    );
  }

  DataRow employeeDataRow(crm.Employee employeeInfo) {
    return DataRow(
      cells: [
        DataCell(Text(employeeInfo.name)),
        DataCell(Text(employeeInfo.email)),
        DataCell(Text(_getRoleDisplayName(employeeInfo.role))),
        DataCell(Text(employeeInfo
            .officeId)), // TODO: Fetch office name if needed for display
        DataCell(Icon(
          employeeInfo.isActive ? Icons.check_circle : Icons.cancel,
          color: employeeInfo.isActive ? Colors.green : Colors.grey,
          semanticLabel: employeeInfo.isActive ? 'Active' : 'Inactive',
        )),
        DataCell(
          Row(
            mainAxisSize:
                MainAxisSize.min, // Prevent row from expanding unnecessarily
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: primaryColor),
                onPressed: () =>
                    _navigateToEditEmployee(employeeInfo.employeeId),
                tooltip: 'Edit Employee',
                splashRadius: 20, // Smaller splash for icon buttons
              ),
              const SizedBox(width: 4),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => _deleteEmployee(
                    employeeInfo), // Pass the whole employee object
                tooltip: 'Delete Employee',
                splashRadius: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

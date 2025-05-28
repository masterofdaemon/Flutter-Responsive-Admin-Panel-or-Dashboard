import 'package:admin/constants.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/screens/employee_form_screen.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:admin/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:grpc/grpc.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
      final employees = await _grpcService.listEmployees(pageSize: 100);
      // Log received employees
      if (mounted) {
        print("Fetched employees: ${employees.length}");
        for (var emp in employees) {
          print(
              "Employee ID: ${emp.employeeId}, Name: ${emp.name}, Role from GRPC: ${emp.role}, Role Name: ${emp.role.name}, Role Value: ${emp.role.value}");
        }
      }
      if (mounted) {
        setState(() {
          _employees = employees;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        final localizations = AppLocalizations.of(context);
        setState(() {
          _errorMessage =
              localizations.employeeListScreenErrorLoading(e.toString());
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _deleteEmployee(crm.Employee employeeToDelete) async {
    // Optional: Show confirmation dialog
    final localizations = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.employeeListScreenConfirmDeleteTitle),
        content: Text(localizations
            .employeeListScreenConfirmDeleteContent(employeeToDelete.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:
                Text(localizations.employeeListScreenConfirmDeleteActionCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child:
                Text(localizations.employeeListScreenConfirmDeleteActionDelete),
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
      await _grpcService.deleteEmployee(employeeToDelete.employeeId.toString());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  localizations.employeeListScreenFeedbackSuccessDelete(
                      employeeToDelete.name))),
        );
        _loadEmployees(); // Refresh the list
      }
    } on GrpcError catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations.employeeListScreenFeedbackErrorDelete(
                  e.message ?? e.toString()))),
        );
        setState(() {
          _isLoading = false; // Stop loading on error
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .employeeListScreenFeedbackErrorDelete(e.toString()))),
        );
        setState(() {
          _isLoading = false; // Stop loading on error
        });
      }
    }
    // No finally block needed here as _loadEmployees handles the final state
  }

  void _showEmployeeFormModal({String? employeeId}) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => EmployeeFormScreen(employeeId: employeeId),
    );
    if (result == true && mounted) {
      _loadEmployees(); // Refresh list if an employee was added/updated
    }
  }

  // Helper to display role names nicely
  String _getRoleDisplayName(crm.EmployeeRole role) {
    print(
        "Before _getRoleDisplayName: role: $role, role.name: ${role.name}, role.value: ${role.value}");
    // Handle EMPLOYEE_ROLE_UNSPECIFIED explicitly
    if (role == crm.EmployeeRole.EMPLOYEE_ROLE_UNSPECIFIED) {
      print(
          "_getRoleDisplayName: Detected UNSPECIFIED, returning 'UNSPECIFIED'");
      return 'UNSPECIFIED';
    }
    String displayName =
        role.name.replaceFirst('EMPLOYEE_ROLE_', '').replaceAll('_', ' ');
    print(
        "_getRoleDisplayName: Processed role: $role, role.name: ${role.name}, role.value: ${role.value}, displayName: $displayName");
    return displayName;
  }

  PlutoGridStateManager? _plutoGridStateManager;

  List<PlutoColumn> _getPlutoColumns() {
    final localizations = AppLocalizations.of(context);
    return [
      PlutoColumn(
        title: localizations.employeeListScreenColumnName,
        field: 'name',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 180,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.employeeListScreenColumnEmail,
        field: 'email',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 220,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.employeeListScreenColumnRole,
        field: 'role',
        type: PlutoColumnType.text(),
        enableEditingMode: true,
        width: 140,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.employeeListScreenColumnOfficeId,
        field: 'officeId',
        type: PlutoColumnType.text(),
        enableEditingMode: true,
        width: 120,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.employeeListScreenColumnActive,
        field: 'active',
        type: PlutoColumnType.text(),
        enableEditingMode: true,
        width: 80,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.employeeListScreenColumnActions,
        field: 'actions',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.center,
        renderer: (rendererContext) {
          final String employeeIdStr =
              rendererContext.row.cells['id']?.value?.toString() ?? '';
          // Find the original employee object to pass to _deleteEmployee if needed,
          // or ensure _deleteEmployee can work with just the ID string.
          // For _navigateToEditEmployee, the string ID is fine.
          final employee = _employees.firstWhere(
              (e) => e.employeeId.toString() == employeeIdStr,
              orElse: () =>
                  crm.Employee() // Return a default/empty employee if not found
              );

          return Consumer<AuthService>(
            builder: (context, auth, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Edit button - only show if user can manage employees
                  if (auth.canManageEmployees())
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: primaryColor),
                        onPressed: () =>
                            _showEmployeeFormModal(employeeId: employeeIdStr),
                        tooltip: localizations.employeeListScreenTooltipEdit,
                        splashRadius: 16,
                        iconSize: 18,
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ),
                  // Delete button - only show if user can delete records (directors only)
                  if (auth.canDeleteRecords())
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => _deleteEmployee(employee),
                        tooltip: localizations.employeeListScreenTooltipDelete,
                        splashRadius: 16,
                        iconSize: 18,
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ),
                  // View-only indicator for users who can only view
                  if (!auth.canManageEmployees() && !auth.canDeleteRecords())
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    ];
  }

  void _updatePlutoGridRows() {
    if (_plutoGridStateManager == null) return;
    final rows = _employees.map((employee) {
      print(
          "Processing employee for grid: ID: ${employee.employeeId}, Name: ${employee.name}, Role: ${employee.role}, Role Name: ${employee.role.name}, Role Value: ${employee.role.value}");
      return PlutoRow(
        cells: {
          'id': PlutoCell(
              value: employee.employeeId
                  .toString()), // Ensure ID is string for consistency if used as string elsewhere
          'name': PlutoCell(value: employee.name),
          'email': PlutoCell(value: employee.email),
          'role': PlutoCell(value: _getRoleDisplayName(employee.role)),
          'officeId': PlutoCell(value: employee.officeId.toString()),
          'active': PlutoCell(value: employee.isActive ? 'Yes' : 'No'),
          'actions': PlutoCell(
              value: employee.employeeId
                  .toString()), // Ensure ID is string for consistency
        },
      );
    }).toList();
    _plutoGridStateManager!.removeAllRows();
    _plutoGridStateManager!.appendRows(rows);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section with title and refresh button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.employeeListScreenTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _loadEmployees,
                  icon: const Icon(Icons.refresh),
                  label: Text(localizations.employeeListScreenTooltipRefresh),
                ),
              ],
            ),
          ),
          // Content section
          Expanded(
            child: SafeArea(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _errorMessage != null
                      ? Center(
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(_errorMessage!,
                                      style:
                                          const TextStyle(color: Colors.red)),
                                  const SizedBox(height: 10),
                                  ElevatedButton.icon(
                                    icon: const Icon(Icons.refresh),
                                    label: Text(localizations
                                        .employeeListScreenButtonRetry),
                                    onPressed: _loadEmployees,
                                  )
                                ],
                              )))
                      : _employees.isEmpty
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(localizations
                                    .employeeListScreenNoEmployeesFound),
                                const SizedBox(height: 10),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.add),
                                  label: Text(localizations
                                      .employeeListScreenButtonAddFirst),
                                  onPressed: () => _showEmployeeFormModal(),
                                )
                              ],
                            ))
                          : RefreshIndicator(
                              onRefresh: _loadEmployees,
                              child: Padding(
                                padding: const EdgeInsets.all(defaultPadding),
                                child: PlutoGrid(
                                  columns: _getPlutoColumns(),
                                  rows: [],
                                  onLoaded: (PlutoGridOnLoadedEvent event) {
                                    _plutoGridStateManager = event.stateManager;
                                    _updatePlutoGridRows();
                                  },
                                  configuration: PlutoGridConfiguration(
                                    style: PlutoGridStyleConfig(
                                      gridBorderColor: Colors.grey,
                                      rowHeight: 45,
                                      columnHeight: 45,
                                      borderColor: Colors.black38,
                                      gridBackgroundColor: secondaryColor,
                                      columnTextStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    columnSize: const PlutoGridColumnSizeConfig(
                                      autoSizeMode: PlutoAutoSizeMode.scale,
                                    ),
                                    scrollbar: const PlutoGridScrollbarConfig(
                                      isAlwaysShown: true,
                                      draggableScrollbar: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEmployeeFormModal(),
        tooltip: localizations.employeeListScreenTooltipAdd,
        child: const Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }

  DataRow employeeDataRow(crm.Employee employeeInfo) {
    return DataRow(
      cells: [
        DataCell(Text(employeeInfo.email)),
        DataCell(Text(_getRoleDisplayName(employeeInfo.role))),
        DataCell(Text(employeeInfo.officeId
            .toString())), // TODO: Fetch office name if needed for display
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
                onPressed: () => _showEmployeeFormModal(
                    employeeId: employeeInfo.employeeId.toString()),
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

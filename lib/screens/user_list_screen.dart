import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/constants.dart';
import 'package:admin/services/auth_service.dart';
import 'package:admin/services/user_management_service.dart';
import 'package:admin/generated/crm.pb.dart' as pb;
import 'package:admin/l10n/app_localizations.dart';
import 'package:admin/responsive.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserManagementService _userManagementService = UserManagementService.instance;
  final Set<int> _selectedEmployeeIds = <int>{};
  String _searchQuery = '';
  pb.EmployeeRole? _filterRole;
  bool? _filterActiveStatus;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  String enumToString(dynamic enumValue) {
    if (enumValue == null) return '';
    return enumValue.toString().split('.').last;
  }

  Future<void> _loadData() async {
    await _userManagementService.loadAllEmployees();
  }

  List<pb.Employee> get _filteredEmployees {
    var employees = _userManagementService.employees.where((employee) {
      // Search filter
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        final matchesName = employee.name.toLowerCase().contains(query);
        final matchesEmail = employee.email.toLowerCase().contains(query);
        final matchesLogin = employee.login.toLowerCase().contains(query);
        if (!matchesName && !matchesEmail && !matchesLogin) {
          return false;
        }
      }

      // Role filter
      if (_filterRole != null && employee.role != _filterRole) {
        return false;
      }

      // Active status filter
      if (_filterActiveStatus != null && employee.isActive != _filterActiveStatus) {
        return false;
      }

      return true;
    }).toList();

    // Sort by name
    employees.sort((a, b) => a.name.compareTo(b.name));
    return employees;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final authService = context.watch<AuthService>();

    return Consumer<UserManagementService>(
      builder: (context, userManagement, child) {
        if (userManagement.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userManagement.errorMessage != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                const SizedBox(height: 16),
                Text(
                  userManagement.errorMessage!,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadData,
                  child: Text(localizations.retry),
                ),
              ],
            ),
          );
        }

        final employees = _filteredEmployees;

        return Column(
          children: [
            // Header with title and actions
            _buildHeader(context, localizations, authService),
            
            // Filters and search
            _buildFiltersSection(context, localizations),
            
            // Bulk actions bar (shown when items are selected)
            if (_selectedEmployeeIds.isNotEmpty)
              _buildBulkActionsBar(context, localizations, authService),
            
            // Employee list
            Expanded(
              child: employees.isEmpty
                  ? _buildEmptyState(context, localizations)
                  : _buildEmployeeList(context, localizations, authService, employees),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations localizations, AuthService authService) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.userManagement,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  localizations.userManagementDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          if (authService.canCreateEmployees()) ...[
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to create employee screen
                // Navigator.of(context).push(...);
              },
              icon: const Icon(Icons.add),
              label: Text(localizations.addEmployee),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
          const SizedBox(width: 8),
          IconButton(
            onPressed: _loadData,
            icon: const Icon(Icons.refresh),
            tooltip: localizations.refresh,
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersSection(BuildContext context, AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          // Search bar
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: localizations.searchUsers,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              
              // Role filter
              SizedBox(
                width: 150,
                child: DropdownButtonFormField<pb.EmployeeRole?>(
                  value: _filterRole,
                  decoration: InputDecoration(
                    labelText: localizations.role,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  items: [
                    DropdownMenuItem<pb.EmployeeRole?>(
                      value: null,
                      child: Text(localizations.allRoles),
                    ),
                    ...pb.EmployeeRole.values
                        .where((role) => role != pb.EmployeeRole.EMPLOYEE_ROLE_UNSPECIFIED)
                        .map((role) => DropdownMenuItem<pb.EmployeeRole?>(
                              value: role,
                              child: Text(enumToString(role)),
                            )),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _filterRole = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              
              // Status filter
              SizedBox(
                width: 120,
                child: DropdownButtonFormField<bool?>(
                  value: _filterActiveStatus,
                  decoration: InputDecoration(
                    labelText: localizations.status,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  items: [
                    DropdownMenuItem<bool?>(
                      value: null,
                      child: Text(localizations.allStatuses),
                    ),
                    DropdownMenuItem<bool?>(
                      value: true,
                      child: Text(localizations.active),
                    ),
                    DropdownMenuItem<bool?>(
                      value: false,
                      child: Text(localizations.disabled),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _filterActiveStatus = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }

  Widget _buildBulkActionsBar(BuildContext context, AppLocalizations localizations, AuthService authService) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 8),
      color: primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          Text(
            localizations.selectedItems(_selectedEmployeeIds.length),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 16),
          TextButton(
            onPressed: () {
              setState(() {
                _selectedEmployeeIds.clear();
              });
            },
            child: Text(localizations.clearSelection),
          ),
          const Spacer(),
          
          // Bulk actions
          if (authService.canPerformBulkUserOperations()) ...[
            ElevatedButton.icon(
              onPressed: () => _performBulkDisable(context, localizations),
              icon: const Icon(Icons.block),
              label: Text(localizations.disableSelected),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () => _performBulkEnable(context, localizations),
              icon: const Icon(Icons.check_circle),
              label: Text(localizations.enableSelected),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations localizations) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            localizations.noUsersFound,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            localizations.tryAdjustingFilters,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeList(
    BuildContext context, 
    AppLocalizations localizations, 
    AuthService authService, 
    List<pb.Employee> employees,
  ) {
    if (Responsive.isMobile(context)) {
      return _buildMobileList(context, localizations, authService, employees);
    } else {
      return _buildDesktopTable(context, localizations, authService, employees);
    }
  }

  Widget _buildMobileList(
    BuildContext context, 
    AppLocalizations localizations, 
    AuthService authService, 
    List<pb.Employee> employees,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(defaultPadding),
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];
        final isSelected = _selectedEmployeeIds.contains(employee.employeeId);

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Checkbox(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _selectedEmployeeIds.add(employee.employeeId);
                  } else {
                    _selectedEmployeeIds.remove(employee.employeeId);
                  }
                });
              },
            ),
            title: Text(
              employee.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employee.email),
                Text(enumToString(employee.role)),
                Row(
                  children: [
                    _buildStatusChip(employee.isActive, localizations),
                    const SizedBox(width: 8),
                    if (employee.telegramId != 0)
                      const Icon(Icons.telegram, size: 16, color: Colors.blue),
                  ],
                ),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (value) => _handleEmployeeAction(
                context, localizations, authService, employee, value,
              ),
              itemBuilder: (context) => _buildEmployeeActions(
                localizations, authService, employee,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopTable(
    BuildContext context, 
    AppLocalizations localizations, 
    AuthService authService, 
    List<pb.Employee> employees,
  ) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Table header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                // Select all checkbox
                Checkbox(
                  value: _selectedEmployeeIds.length == employees.length && employees.isNotEmpty,
                  tristate: true,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedEmployeeIds.addAll(
                          employees.map((e) => e.employeeId),
                        );
                      } else {
                        _selectedEmployeeIds.clear();
                      }
                    });
                  },
                ),
                const SizedBox(width: 16),
                
                // Headers
                Expanded(
                  flex: 3,
                  child: Text(
                    localizations.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    localizations.email,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.role,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.status,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.lastLogin,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 80), // Actions column
              ],
            ),
          ),
          
          // Table body
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                final isSelected = _selectedEmployeeIds.contains(employee.employeeId);

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey[200]!,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _selectedEmployeeIds.add(employee.employeeId);
                            } else {
                              _selectedEmployeeIds.remove(employee.employeeId);
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 16),
                      
                      // Name with avatar
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: primaryColor.withOpacity(0.1),
                              child: Text(
                                employee.name.isNotEmpty 
                                  ? employee.name[0].toUpperCase()
                                  : 'U',
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employee.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    employee.login,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Email
                      Expanded(
                        flex: 3,
                        child: Text(
                          employee.email,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      // Role
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getRoleColor(employee.role).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            enumToString(employee.role),
                            style: TextStyle(
                              color: _getRoleColor(employee.role),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      
                      // Status
                      Expanded(
                        flex: 2,
                        child: _buildStatusChip(employee.isActive, localizations),
                      ),
                      
                      // Last login (placeholder)
                      Expanded(
                        flex: 2,
                        child: Text(
                          '-', // TODO: Add last login data when available
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      
                      // Actions
                      SizedBox(
                        width: 80,
                        child: PopupMenuButton<String>(
                          onSelected: (value) => _handleEmployeeAction(
                            context, localizations, authService, employee, value,
                          ),
                          itemBuilder: (context) => _buildEmployeeActions(
                            localizations, authService, employee,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.more_vert,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(bool isActive, AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isActive ? localizations.active : localizations.disabled,
        style: TextStyle(
          color: isActive ? Colors.green[700] : Colors.red[700],
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }

  Color _getRoleColor(pb.EmployeeRole role) {
    switch (role) {
      case pb.EmployeeRole.DIRECTOR:
        return Colors.purple[700]!;
      case pb.EmployeeRole.MANAGER:
        return Colors.blue[700]!;
      case pb.EmployeeRole.CHIEF_MANAGER:
        return Colors.indigo[700]!;
      case pb.EmployeeRole.ACCOUNTANT:
        return Colors.orange[700]!;
      case pb.EmployeeRole.TRANSLATOR:
        return Colors.green[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  List<PopupMenuEntry<String>> _buildEmployeeActions(
    AppLocalizations localizations, 
    AuthService authService, 
    pb.Employee employee,
  ) {
    final List<PopupMenuEntry<String>> actions = [];

    // View profile action
    actions.add(
      PopupMenuItem<String>(
        value: 'view',
        child: Row(
          children: [
            const Icon(Icons.visibility, size: 16),
            const SizedBox(width: 8),
            Text(localizations.viewProfile),
          ],
        ),
      ),
    );

    // Edit action
    if (authService.canEditEmployeeInfo()) {
      actions.add(
        PopupMenuItem<String>(
          value: 'edit',
          child: Row(
            children: [
              const Icon(Icons.edit, size: 16),
              const SizedBox(width: 8),
              Text(localizations.edit),
            ],
          ),
        ),
      );
    }

    actions.add(const PopupMenuDivider());

    // Reset password action
    if (authService.canResetUserPasswords()) {
      actions.add(
        PopupMenuItem<String>(
          value: 'reset_password',
          child: Row(
            children: [
              const Icon(Icons.lock_reset, size: 16, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                localizations.resetPassword,
                style: const TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
      );
    }

    // Disable/Enable action
    if (authService.canDisableSpecificEmployee(employee.role)) {
      if (employee.isActive) {
        actions.add(
          PopupMenuItem<String>(
            value: 'disable',
            child: Row(
              children: [
                const Icon(Icons.block, size: 16, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  localizations.disableAccount,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        );
      } else {
        actions.add(
          PopupMenuItem<String>(
            value: 'enable',
            child: Row(
              children: [
                const Icon(Icons.check_circle, size: 16, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  localizations.enableAccount,
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
        );
      }
    }

    return actions;
  }

  void _handleEmployeeAction(
    BuildContext context,
    AppLocalizations localizations,
    AuthService authService,
    pb.Employee employee,
    String action,
  ) {
    switch (action) {
      case 'view':
        _showEmployeeDetailsDialog(context, localizations, employee);
        break;
      case 'edit':
        // Navigate to edit employee screen
        break;
      case 'reset_password':
        _showResetPasswordDialog(context, localizations, employee);
        break;
      case 'disable':
        _showDisableConfirmationDialog(context, localizations, employee);
        break;
      case 'enable':
        _showEnableConfirmationDialog(context, localizations, employee);
        break;
    }
  }

  void _showEmployeeDetailsDialog(
    BuildContext context,
    AppLocalizations localizations,
    pb.Employee employee,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.employeeDetails),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow(localizations.name, employee.name),
              _buildDetailRow(localizations.email, employee.email),
              _buildDetailRow(localizations.login, employee.login),
              _buildDetailRow(localizations.role, enumToString(employee.role)),
              _buildDetailRow(
                localizations.status, 
                employee.isActive ? localizations.active : localizations.disabled,
              ),
              if (employee.telegramId != 0)
                _buildDetailRow(localizations.telegramId, employee.telegramId.toString()),
              if (employee.whatsappNumber.isNotEmpty)
                _buildDetailRow(localizations.whatsappNumber, employee.whatsappNumber),
              if (employee.notes.isNotEmpty)
                _buildDetailRow(localizations.notes, employee.notes),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.close),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _showResetPasswordDialog(
    BuildContext context,
    AppLocalizations localizations,
    pb.Employee employee,
  ) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.resetPassword),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.resetPasswordWarning(employee.name)),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: localizations.reason,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localizations.reasonRequired)),
                );
                return;
              }

              Navigator.of(context).pop();
              
              final newPassword = await _userManagementService.resetEmployeePassword(
                employee.employeeId,
                reasonController.text.trim(),
              );

              if (newPassword != null) {
                _showNewPasswordDialog(context, localizations, employee.name, newPassword);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.passwordResetFailed),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text(localizations.resetPassword),
          ),
        ],
      ),
    );
  }

  void _showNewPasswordDialog(
    BuildContext context,
    AppLocalizations localizations,
    String employeeName,
    String newPassword,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(localizations.passwordResetSuccess),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.newPasswordGenerated(employeeName, newPassword)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      newPassword,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Copy to clipboard
                      // Clipboard.setData(ClipboardData(text: newPassword));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(localizations.copiedToClipboard)),
                      );
                    },
                    icon: const Icon(Icons.copy),
                    tooltip: localizations.copyPassword,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              localizations.passwordResetInstructions,
              style: TextStyle(
                color: Colors.orange[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.understood),
          ),
        ],
      ),
    );
  }

  void _showDisableConfirmationDialog(
    BuildContext context,
    AppLocalizations localizations,
    pb.Employee employee,
  ) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.disableAccount),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.disableAccountWarning(employee.name)),
            const SizedBox(height: 8),
            Text(
              localizations.disableAccountConsequences,
              style: TextStyle(
                color: Colors.red[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: localizations.reason,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localizations.reasonRequired)),
                );
                return;
              }

              Navigator.of(context).pop();
              
              final success = await _userManagementService.disableEmployee(
                employee.employeeId,
                reasonController.text.trim(),
              );

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.accountDisabledSuccess(employee.name)),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.accountDisableFailed),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(localizations.disableAccount),
          ),
        ],
      ),
    );
  }

  void _showEnableConfirmationDialog(
    BuildContext context,
    AppLocalizations localizations,
    pb.Employee employee,
  ) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.enableAccount),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.enableAccountConfirmation(employee.name)),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: localizations.reason,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localizations.reasonRequired)),
                );
                return;
              }

              Navigator.of(context).pop();
              
              final success = await _userManagementService.enableEmployee(
                employee.employeeId,
                reasonController.text.trim(),
              );

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.accountEnabledSuccess(employee.name)),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.accountEnableFailed),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text(localizations.enableAccount),
          ),
        ],
      ),
    );
  }

  void _performBulkDisable(BuildContext context, AppLocalizations localizations) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.bulkDisableAccounts),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.bulkDisableWarning(_selectedEmployeeIds.length)),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: localizations.reason,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localizations.reasonRequired)),
                );
                return;
              }

              Navigator.of(context).pop();
              
              final results = await _userManagementService.bulkDisableEmployees(
                _selectedEmployeeIds.toList(),
                reasonController.text.trim(),
              );

              final successCount = results.values.where((success) => success).length;
              final failureCount = results.length - successCount;

              setState(() {
                _selectedEmployeeIds.clear();
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localizations.bulkOperationResult(successCount, failureCount)),
                  backgroundColor: failureCount == 0 ? Colors.green : Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(localizations.disableSelected),
          ),
        ],
      ),
    );
  }

  void _performBulkEnable(BuildContext context, AppLocalizations localizations) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.bulkEnableAccounts),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.bulkEnableConfirmation(_selectedEmployeeIds.length)),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: localizations.reason,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localizations.reasonRequired)),
                );
                return;
              }

              Navigator.of(context).pop();
              
              final results = await _userManagementService.bulkEnableEmployees(
                _selectedEmployeeIds.toList(),
                reasonController.text.trim(),
              );

              final successCount = results.values.where((success) => success).length;
              final failureCount = results.length - successCount;

              setState(() {
                _selectedEmployeeIds.clear();
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localizations.bulkOperationResult(successCount, failureCount)),
                  backgroundColor: failureCount == 0 ? Colors.green : Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text(localizations.enableSelected),
          ),
        ],
      ),
    );
  }
}

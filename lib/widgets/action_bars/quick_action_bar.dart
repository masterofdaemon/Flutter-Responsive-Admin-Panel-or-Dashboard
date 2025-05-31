import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/constants.dart';
import 'package:admin/services/auth_service.dart';
import 'package:admin/controllers/layout_controller.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:admin/responsive.dart';

class QuickActionBar extends StatelessWidget {
  final String? screenType; // Made optional to auto-detect

  const QuickActionBar({
    super.key,
    this.screenType,
  });

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final layoutController = context.watch<LayoutController>();
    final menuController = context.watch<MenuAppController>();
    final localizations = AppLocalizations.of(context);

    // Auto-detect screen type if not provided
    final currentScreenType = screenType ?? _detectScreenType(menuController.selectedScreen);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context) ? 24 : 16,
        vertical: 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: Column(
        children: [
          // Primary Actions Row
          _buildPrimaryActions(context, authService, localizations, currentScreenType),

          // Bulk Actions Row (only show when items are selected)
          if (layoutController.hasSelectedItems)
            _buildBulkActions(context, layoutController, localizations, currentScreenType),
        ],
      ),
    );
  }

  String _detectScreenType(Widget screen) {
    final screenType = screen.runtimeType.toString();
    
    if (screenType.contains('LendingApplication')) return 'applications';
    if (screenType.contains('Client')) return 'clients';
    if (screenType.contains('User')) return 'users';
    if (screenType.contains('Employee')) return 'employees';
    if (screenType.contains('BusinessRegistration')) return 'businesses';
    if (screenType.contains('InsurancePolicy')) return 'insurance';
    if (screenType.contains('LegalCase')) return 'legal';
    if (screenType.contains('Interaction')) return 'interactions';
    if (screenType.contains('TrainingCourse')) return 'training';
    if (screenType.contains('Dashboard')) return 'dashboard';
    
    return 'default';
  }

  Widget _buildPrimaryActions(
    BuildContext context,
    AuthService authService,
    AppLocalizations localizations,
    String currentScreenType,
  ) {
    return Row(
      children: [
        // Role-based action buttons
        ..._buildRoleBasedActions(context, authService, localizations, currentScreenType),

        const Spacer(),

        // Right sidebar toggle button
        if (Responsive.isDesktop(context)) _buildSidebarToggle(context),
      ],
    );
  }

  List<Widget> _buildRoleBasedActions(
    BuildContext context,
    AuthService authService,
    AppLocalizations localizations,
    String currentScreenType,
  ) {
    List<Widget> actions = [];

    // Screen-specific primary actions
    switch (currentScreenType) {
      case 'applications':
        if (authService.canManageApplications()) {
          actions.add(_buildActionButton(
            icon: Icons.add_circle_outline,
            label: 'Create New Application',
            onPressed: () => _navigateToCreateApplication(context),
            isPrimary: true,
          ));
          actions.add(const SizedBox(width: 12));
        }
        break;
        
      case 'clients':
        if (authService.canManageClients()) {
          actions.add(_buildActionButton(
            icon: Icons.person_add_outlined,
            label: 'Add New Client',
            onPressed: () => _navigateToAddClient(context),
            isPrimary: true,
          ));
          actions.add(const SizedBox(width: 12));
        }
        break;
        
      case 'users':
        if (authService.canManageUsers()) {
          actions.add(_buildActionButton(
            icon: Icons.group_add_outlined,
            label: 'Add New User',
            onPressed: () => _navigateToAddUser(context),
            isPrimary: true,
          ));
          actions.add(const SizedBox(width: 12));
        }
        break;
        
      case 'employees':
        if (authService.canManageUsers()) {
          actions.add(_buildActionButton(
            icon: Icons.badge_outlined,
            label: 'Add New Employee',
            onPressed: () => _navigateToAddEmployee(context),
            isPrimary: true,
          ));
          actions.add(const SizedBox(width: 12));
        }
        break;
        
      case 'businesses':
        if (authService.canManageApplications()) {
          actions.add(_buildActionButton(
            icon: Icons.business_outlined,
            label: 'Register Business',
            onPressed: () => _navigateToRegisterBusiness(context),
            isPrimary: true,
          ));
          actions.add(const SizedBox(width: 12));
        }
        break;
        
      default:
        // General actions for dashboard or unknown screens
        if (authService.canManageApplications()) {
          actions.add(_buildActionButton(
            icon: Icons.add_circle_outline,
            label: 'Quick Add',
            onPressed: () => _showQuickAddMenu(context),
            isPrimary: true,
          ));
          actions.add(const SizedBox(width: 12));
        }
    }

    // Secondary actions (always available based on role)
    if (authService.canManageClients() && currentScreenType != 'clients') {
      actions.add(_buildActionButton(
        icon: Icons.person_add_outlined,
        label: 'Add Partner',
        onPressed: () => _navigateToAddPartner(context),
      ));
      actions.add(const SizedBox(width: 12));
    }

    // Accountant-specific actions
    if (authService.isAccountant()) {
      actions.add(_buildSearchField(context, localizations));
      actions.add(const SizedBox(width: 12));

      if (currentScreenType == 'applications') {
        actions.add(_buildActionButton(
          icon: Icons.payment,
          label: 'Mark Payment',
          onPressed: () => _showMarkPaymentDialog(context),
          color: Colors.green,
        ));
      }
    }

    return actions;
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    bool isPrimary = false,
    Color? color,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? primaryColor : (color ?? Colors.grey[100]),
        foregroundColor: isPrimary
            ? Colors.white
            : (color != null ? Colors.white : Colors.black87),
        elevation: isPrimary ? 2 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildSearchField(
      BuildContext context, AppLocalizations localizations) {
    return SizedBox(
      width: 280,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by application number or client name...',
          prefixIcon: const Icon(Icons.search, size: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primaryColor),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        onChanged: (query) {
          context.read<LayoutController>().setSearchQuery(query);
        },
      ),
    );
  }

  Widget _buildSidebarToggle(BuildContext context) {
    final layoutController = context.watch<LayoutController>();

    return IconButton(
      icon: Icon(
        layoutController.isRightSidebarCollapsed
            ? Icons.chevron_left
            : Icons.chevron_right,
        color: secondaryColor,
      ),
      onPressed: () => layoutController.toggleRightSidebar(),
      tooltip: 'Toggle Right Panel',
    );
  }

  Widget _buildBulkActions(
    BuildContext context,
    LayoutController layoutController,
    AppLocalizations localizations,
    String currentScreenType,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: primaryColor, size: 20),
          const SizedBox(width: 8),
          Text(
            '${layoutController.selectedItemsCount} items selected',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: secondaryColor,
            ),
          ),
          const SizedBox(width: 16),

          // Bulk action buttons
          _buildBulkActionButton(
            icon: Icons.delete_outline,
            label: 'Delete',
            color: Colors.red,
            onPressed: () => _showBulkDeleteDialog(context),
          ),
          const SizedBox(width: 8),

          _buildBulkActionButton(
            icon: Icons.download,
            label: 'Export',
            color: Colors.blue,
            onPressed: () => _performBulkExport(context),
          ),
          const SizedBox(width: 8),

          // Screen-specific bulk actions
          ..._buildScreenSpecificBulkActions(context, currentScreenType),

          const Spacer(),

          TextButton(
            onPressed: () => layoutController.clearSelection(),
            child: const Text('Clear Selection'),
          ),
        ],
      ),
    );
  }

  Widget _buildBulkActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16, color: color),
      label: Text(label, style: TextStyle(color: color)),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }

  List<Widget> _buildScreenSpecificBulkActions(BuildContext context, String currentScreenType) {
    List<Widget> actions = [];

    switch (currentScreenType) {
      case 'applications':
        actions.addAll([
          _buildBulkActionButton(
            icon: Icons.edit,
            label: 'Update Status',
            color: Colors.orange,
            onPressed: () => _showBulkStatusDialog(context),
          ),
          const SizedBox(width: 8),
          _buildBulkActionButton(
            icon: Icons.assignment,
            label: 'Assign to Officer',
            color: Colors.purple,
            onPressed: () => _showBulkAssignDialog(context),
          ),
          const SizedBox(width: 8),
        ]);
        break;
        
      case 'clients':
        actions.addAll([
          _buildBulkActionButton(
            icon: Icons.group,
            label: 'Merge Clients',
            color: Colors.indigo,
            onPressed: () => _showBulkMergeDialog(context),
          ),
          const SizedBox(width: 8),
          _buildBulkActionButton(
            icon: Icons.mail_outline,
            label: 'Send Notification',
            color: Colors.teal,
            onPressed: () => _showBulkNotificationDialog(context),
          ),
          const SizedBox(width: 8),
        ]);
        break;
        
      case 'users':
        actions.addAll([
          _buildBulkActionButton(
            icon: Icons.security,
            label: 'Update Permissions',
            color: Colors.amber,
            onPressed: () => _showBulkPermissionsDialog(context),
          ),
          const SizedBox(width: 8),
          _buildBulkActionButton(
            icon: Icons.lock_reset,
            label: 'Reset Passwords',
            color: Colors.deepOrange,
            onPressed: () => _showBulkPasswordResetDialog(context),
          ),
          const SizedBox(width: 8),
        ]);
        break;
        
      case 'employees':
        actions.addAll([
          _buildBulkActionButton(
            icon: Icons.work_outline,
            label: 'Update Department',
            color: Colors.brown,
            onPressed: () => _showBulkDepartmentDialog(context),
          ),
          const SizedBox(width: 8),
        ]);
        break;
        
      case 'businesses':
        actions.addAll([
          _buildBulkActionButton(
            icon: Icons.check_circle_outline,
            label: 'Approve Registration',
            color: Colors.green,
            onPressed: () => _showBulkApprovalDialog(context),
          ),
          const SizedBox(width: 8),
        ]);
        break;
    }

    return actions;
  }

  // Navigation methods
  void _navigateToCreateApplication(BuildContext context) {
    // TODO: Navigate to application form
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Create Application')),
    );
  }

  void _navigateToAddPartner(BuildContext context) {
    // TODO: Navigate to partner form
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Add Partner')),
    );
  }

  void _navigateToAddUser(BuildContext context) {
    // TODO: Navigate to user form
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Add User')),
    );
  }

  void _navigateToAddClient(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Add Client')),
    );
  }

  void _navigateToAddEmployee(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Add Employee')),
    );
  }

  void _navigateToRegisterBusiness(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Register Business')),
    );
  }

  void _showQuickAddMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Quick Add',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('New Application'),
              onTap: () {
                Navigator.pop(context);
                _navigateToCreateApplication(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add_outlined),
              title: const Text('New Client'),
              onTap: () {
                Navigator.pop(context);
                _navigateToAddClient(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.group_add_outlined),
              title: const Text('New User'),
              onTap: () {
                Navigator.pop(context);
                _navigateToAddUser(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Action methods
  void _showMarkPaymentDialog(BuildContext context) {
    // TODO: Show mark payment dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mark Payment Dialog')),
    );
  }

  void _showBulkDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Selected Items'),
        content: const Text(
            'Are you sure you want to delete the selected items? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performBulkDelete(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showBulkStatusDialog(BuildContext context) {
    // TODO: Show bulk status update dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Status Update Dialog')),
    );
  }

  void _showBulkAssignDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Assign Dialog')),
    );
  }

  void _showBulkMergeDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Merge Dialog')),
    );
  }

  void _showBulkNotificationDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Notification Dialog')),
    );
  }

  void _showBulkPermissionsDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Permissions Dialog')),
    );
  }

  void _showBulkPasswordResetDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Password Reset Dialog')),
    );
  }

  void _showBulkDepartmentDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Department Update Dialog')),
    );
  }

  void _showBulkApprovalDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk Approval Dialog')),
    );
  }

  void _performBulkDelete(BuildContext context) {
    final layoutController = context.read<LayoutController>();
    layoutController.performBulkAction('delete', (selectedIds) async {
      // TODO: Implement actual bulk delete
      await Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Deleted ${selectedIds.length} items')),
      );
    });
  }

  void _performBulkExport(BuildContext context) {
    final layoutController = context.read<LayoutController>();
    layoutController.performBulkAction('export', (selectedIds) async {
      // TODO: Implement actual bulk export
      await Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exported ${selectedIds.length} items')),
      );
    });
  }
}

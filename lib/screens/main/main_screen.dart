import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/controllers/layout_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/constants.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:admin/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/services/auth_service.dart' as auth_service;
import 'package:admin/utils/enum_helpers.dart';
import 'package:admin/widgets/right_sidebar/right_sidebar.dart';
import 'package:admin/widgets/action_bars/quick_action_bar.dart';

import 'components/new_side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      backgroundColor: bgColor,
      drawer: Responsive.isMobile(context) ? _buildDrawer(context) : null,
      body: Consumer<LayoutController>(
        builder: (context, layoutController, _) {
          return Row(
            children: [
              // Fixed Side Navigation for Desktop/Tablet
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                const NewSideMenu(),

              // Main Content Area
              Expanded(
                child: Column(
                  children: [
                    // Top App Bar
                    _buildTopAppBar(context),

                    // Quick Action Bar
                    const QuickActionBar(),

                    // Main Content
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(defaultPadding),
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              context.watch<MenuAppController>().selectedScreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Right Sidebar (Desktop only)
              RightSidebar(
                isCollapsed: layoutController.isRightSidebarCollapsed,
                onToggle: layoutController.toggleRightSidebar,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTopAppBar(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context) && !Responsive.isTablet(context))
            IconButton(
              icon: const Icon(Icons.menu, color: secondaryColor),
              onPressed: context.read<MenuAppController>().controlMenu,
            ),

          Expanded(
            child: Row(
              children: [
                Text(
                  'CRM Dashboard',
                  style: TextStyle(
                    fontSize: Responsive.isDesktop(context) ? 20 : 18,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          if (Responsive.isDesktop(context))
            Flexible(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive width based on available space
                  final availableWidth = constraints.maxWidth;
                  final searchWidth = availableWidth.clamp(150.0, 300.0);

                  return Container(
                    width: searchWidth,
                    height: 40,
                    decoration: BoxDecoration(
                      color: bgColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  );
                },
              ),
            ),

          if (Responsive.isDesktop(context)) const SizedBox(width: 16),

          // Notifications & Right Sidebar Toggle (Desktop only)
          if (Responsive.isDesktop(context))
            Consumer<LayoutController>(
              builder: (context, layoutController, _) {
                return IconButton(
                  icon: Stack(
                    children: [
                      const Icon(Icons.notifications_outlined,
                          color: secondaryColor),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (layoutController.isRightSidebarCollapsed) {
                      layoutController.toggleRightSidebar();
                    }
                  },
                  tooltip: 'Open Notifications',
                );
              },
            )
          else
            // Mobile notifications button (no sidebar toggle)
            IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_outlined,
                      color: secondaryColor),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                // TODO: Show notifications modal for mobile
              },
            ),

          const SizedBox(width: 16),

          // Logout Button
          Consumer<auth_service.AuthService>(
            builder: (context, auth, _) {
              if (!auth.isAuthenticated) return const SizedBox.shrink();
              final localizations = AppLocalizations.of(context);
              return IconButton(
                icon: const Icon(Icons.logout, color: secondaryColor),
                onPressed: () => _showLogoutConfirmation(context),
                tooltip: localizations.sideMenuLogout,
              );
            },
          ),

          const SizedBox(width: 16),

          // User Profile
          Flexible(
            child: Consumer<auth_service.AuthService>(
              builder: (context, auth, _) {
                final employee = auth.employeeProfile;
                final user = auth.userProfile;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.png'),
                      radius: 18,
                    ),
                    const SizedBox(width: 8),
                    if (auth.isAuthenticated && employee != null)
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              employee.name.isNotEmpty
                                  ? employee.name
                                  : (user?.login ?? 'User'),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: secondaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              getEmployeeRoleName(employee.role),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    else if (auth.isAuthenticated && user != null)
                      Flexible(
                        child: Text(
                          user.login,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    else
                      const Flexible(
                        child: Text(
                          'Not logged in',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return const Drawer(
      child: NewSideMenu(),
    );
  }

  Future<void> _showLogoutConfirmation(BuildContext context) async {
    final localizations = AppLocalizations.of(context);
    final authService = context.read<auth_service.AuthService>();

    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.logout, color: Colors.orange),
              const SizedBox(width: 8),
              Text(localizations.logoutConfirmationTitle),
            ],
          ),
          content: Text(localizations.logoutConfirmationMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(localizations.logoutConfirmationCancel),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: Text(localizations.logoutConfirmationConfirm),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      try {
        await authService.logout();
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error during logout: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}

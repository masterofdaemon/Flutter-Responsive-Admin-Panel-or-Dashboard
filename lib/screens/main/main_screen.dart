import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/services/auth_service.dart' as auth_service;
import 'package:admin/utils/enum_helpers.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Theme.of(context)
              .canvasColor
              .withAlpha(230), // 0.9 * 255 = 229.5 -> 230
          child: Column(
            // Use Column instead of ListView
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_pic.png'),
                      radius: 40,
                    ),
                    const SizedBox(height: 16),
                    Consumer<auth_service.AuthService>(
                      builder: (context, auth, _) {
                        final employee = auth.employeeProfile;
                        final user = auth.userProfile;
                        if (auth.isAuthenticated && employee != null) {
                          return Text(
                            employee.name.isNotEmpty
                                ? employee.name
                                : (user?.login ?? 'User'),
                            style: Theme.of(context).textTheme.titleLarge,
                          );
                        } else if (auth.isAuthenticated && user != null) {
                          return Text(
                            user.login,
                            style: Theme.of(context).textTheme.titleLarge,
                          );
                        } else {
                          return Text(
                            'Not logged in',
                            style: Theme.of(context).textTheme.titleLarge,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 4),
                    Consumer<auth_service.AuthService>(
                      builder: (context, auth, _) {
                        final employee = auth.employeeProfile;
                        if (auth.isAuthenticated && employee != null) {
                          return Text(
                            'Role: ' + getEmployeeRoleName(employee.role),
                            style: Theme.of(context).textTheme.bodySmall,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
              // SideMenu is a ListView, wrap it in Expanded so Column gives it finite height
              Expanded(
                child: SideMenu(),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // User info/profile bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.black.withAlpha(13), // 0.05 * 255 = 12.75 -> 13
              child: Row(
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: context.read<MenuAppController>().controlMenu,
                    ),
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.png'),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Consumer<auth_service.AuthService>(
                      builder: (context, auth, _) {
                        final employee = auth.employeeProfile;
                        final user = auth.userProfile;
                        if (auth.isAuthenticated && employee != null) {
                          // Show employee name and role
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                employee.name.isNotEmpty
                                    ? employee.name
                                    : (user?.login ?? 'User'),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                'Role: ' + getEmployeeRoleName(employee.role),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          );
                        } else if (auth.isAuthenticated && user != null) {
                          // Fallback: show user login
                          return Text(
                            user.login,
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        } else {
                          return Text(
                            'Not logged in',
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We want this side menu only for large screen
                  if (Responsive.isDesktop(context))
                    Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenu(),
                    ),
                  Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    // Display the screen selected in the controller
                    child: context.watch<MenuAppController>().selectedScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

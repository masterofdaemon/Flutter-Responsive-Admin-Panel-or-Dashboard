import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/responsive.dart';
import 'package:admin/constants.dart';
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
      backgroundColor: bgColor,
      drawer: Responsive.isMobile(context) ? _buildDrawer(context) : null,
      body: Row(
        children: [
          // Fixed Side Navigation for Desktop/Tablet
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            Container(
              width: Responsive.isDesktop(context) ? 280 : 260,
              decoration: BoxDecoration(
                color: secondaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(2, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSideHeader(context),
                  Expanded(child: SideMenu()),
                ],
              ),
            ),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Top App Bar
                _buildTopAppBar(context),

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
                      child: context.watch<MenuAppController>().selectedScreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding * 1.5),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor,
                width: 3,
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
              radius: 35,
            ),
          ),
          const SizedBox(height: 16),
          Consumer<auth_service.AuthService>(
            builder: (context, auth, _) {
              final employee = auth.employeeProfile;
              final user = auth.userProfile;
              if (auth.isAuthenticated && employee != null) {
                return Column(
                  children: [
                    Text(
                      employee.name.isNotEmpty
                          ? employee.name
                          : (user?.login ?? 'User'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        getEmployeeRoleName(employee.role),
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              } else if (auth.isAuthenticated && user != null) {
                return Text(
                  user.login,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                );
              } else {
                return const Text(
                  'Not logged in',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                );
              }
            },
          ),
        ],
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
            Container(
              width: 300,
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
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),

          if (Responsive.isDesktop(context)) const SizedBox(width: 16),

          // Notifications
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined, color: secondaryColor),
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
            onPressed: () {},
          ),

          const SizedBox(width: 16),

          // User Profile
          Consumer<auth_service.AuthService>(
            builder: (context, auth, _) {
              final employee = auth.employeeProfile;
              final user = auth.userProfile;
              return Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.png'),
                    radius: 18,
                  ),
                  const SizedBox(width: 8),
                  if (auth.isAuthenticated && employee != null)
                    Column(
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
                        ),
                        Text(
                          getEmployeeRoleName(employee.role),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    )
                  else if (auth.isAuthenticated && user != null)
                    Text(
                      user.login,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: secondaryColor,
                      ),
                    )
                  else
                    const Text(
                      'Not logged in',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: secondaryColor,
        child: Column(
          children: [
            _buildSideHeader(context),
            Expanded(child: SideMenu()),
          ],
        ),
      ),
    );
  }
}

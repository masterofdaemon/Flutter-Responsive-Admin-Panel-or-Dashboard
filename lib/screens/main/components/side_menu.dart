import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/screens/client_list_screen.dart'; // Import the new screen
import 'package:admin/screens/dashboard/dashboard_screen.dart'; // Import DashboardScreen
import 'package:admin/screens/employee_list_screen.dart'; // Import the new Employee list screen
import 'package:admin/screens/interaction_list_screen.dart'; // Import the new Interaction list screen
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:admin/services/auth_service.dart'; // Import AuthService
import 'package:admin/generated/crm.pb.dart' show EmployeeRole;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the controller
    final menuAppController = Provider.of<MenuAppController>(context);
    final auth = Provider.of<AuthService>(context);
    final role = auth.employeeProfile?.role;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              menuAppController.setSelectedScreen(DashboardScreen());
            },
          ),
          if (role == null ||
              role == EmployeeRole.MANAGER ||
              role == EmployeeRole.CHIEF_MANAGER ||
              role == EmployeeRole.DIRECTOR)
            DrawerListTile(
              title: "Clients",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                menuAppController.setSelectedScreen(const ClientListScreen());
              },
            ),
          if (role == EmployeeRole.DIRECTOR ||
              role == EmployeeRole.CHIEF_MANAGER)
            DrawerListTile(
              title: "Employees",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                menuAppController.setSelectedScreen(const EmployeeListScreen());
              },
            ),
          DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          if (role == null ||
              role == EmployeeRole.MANAGER ||
              role == EmployeeRole.CHIEF_MANAGER ||
              role == EmployeeRole.DIRECTOR)
            DrawerListTile(
              title: "Interactions",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {
                menuAppController
                    .setSelectedScreen(const InteractionListScreen());
              },
            ),
          DrawerListTile(
            title: "Store",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Logout",
            svgSrc: "assets/icons/menu_setting.svg", // Use a suitable icon
            press: () async {
              // Call AuthService.logout and return to login
              await Provider.of<AuthService>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

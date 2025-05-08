import 'package:admin/l10n/app_localizations.dart';
import 'package:admin/screens/client_list_screen.dart';
// Import EmployeeFormScreen
import 'package:admin/screens/employee_list_screen.dart';
import 'package:admin/screens/login_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/translation_orders/translation_order_list_screen.dart'; // Import TranslationOrderListScreen
import 'package:admin/screens/insurance_policy_list_screen.dart';
import 'package:admin/screens/user_form_screen.dart';
import 'package:admin/screens/training_course_list_screen.dart';
import 'package:admin/screens/business_registration_list_screen.dart';
import 'package:admin/screens/lending_application_list_screen.dart';
import 'package:admin/services/auth_service.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    // Return ListView directly, not wrapped in a Drawer
    return ListView(
      children: [
        DrawerHeader(
          child: Image.asset("assets/images/logo.png"),
        ),
        DrawerListTile(
          title: localizations.sideMenuDashboard,
          svgSrc: "assets/icons/menu_dashboard.svg",
          press: () {
            // Close drawer first
            Navigator.pop(context);
            // Check if already on MainScreen or navigate
            // Assuming MainScreen is the root or initial screen after login
            if (ModalRoute.of(context)?.settings.name != '/') {
              // Use pushReplacement to avoid stacking main screens
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }
          },
        ),
        DrawerListTile(
          title: localizations.sideMenuClients,
          svgSrc: "assets/icons/menu_tran.svg",
          press: () {
            Navigator.pop(context); // Close drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClientListScreen()),
            );
          },
        ),
        DrawerListTile(
          title: localizations.sideMenuEmployees,
          svgSrc: "assets/icons/menu_profile.svg",
          press: () {
            Navigator.pop(context); // Close drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EmployeeListScreen()),
            );
          },
        ),
        DrawerListTile(
          title: localizations.sideMenuTranslations,
          svgSrc: "assets/icons/menu_doc.svg", // Example icon
          press: () {
            Navigator.pop(context); // Close drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TranslationOrderListScreen()),
            );
          },
        ),
        DrawerListTile(
          title: localizations.sideMenuInsurancePolicies,
          svgSrc:
              "assets/icons/menu_store.svg", // Use a relevant icon or replace
          press: () {
            Navigator.pop(context); // Close drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const InsurancePolicyListScreen()),
            );
          },
        ),
        DrawerListTile(
          title: localizations.sideMenuTrainingCourses,
          svgSrc: "assets/icons/menu_doc.svg", // Use a relevant icon or replace
          press: () {
            Navigator.pop(context); // Close drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TrainingCourseListScreen()),
            );
          },
        ),
        DrawerListTile(
          title: localizations.sideMenuBusinessRegistrations,
          svgSrc:
              "assets/icons/menu_store.svg", // Use a relevant icon or replace
          press: () {
            Navigator.pop(context); // Close drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BusinessRegistrationListScreen()),
            );
          },
        ),
        DrawerListTile(
          title: localizations.sideMenuLendingApplications,
          svgSrc:
              "assets/icons/menu_store.svg", // Use a relevant icon or replace
          press: () {
            Navigator.pop(context); // Close drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LendingApplicationListScreen()),
            );
          },
        ),
        // --- Admin Section ---
        // Use Consumer to check role for admin-only items
        Consumer<AuthService>(
          builder: (context, auth, _) {
            // Show admin items only if logged in and role is DIRECTOR
            if (auth.isAuthenticated &&
                auth.employeeProfile?.role == crm.EmployeeRole.DIRECTOR) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(), // Separator for admin section
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(localizations.sideMenuAdminTools,
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold)),
                  ),
                  DrawerListTile(
                    title: localizations.sideMenuCreateUser,
                    svgSrc: "assets/icons/menu_profile.svg", // Placeholder icon
                    press: () {
                      Navigator.pop(context); // Close drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserFormScreen()),
                      );
                    },
                  ),
                  // Add "Create Employee" tile here later
                ],
              );
            } else {
              // Return an empty container if not an admin
              return Container();
            }
          },
        ),
        const Divider(), // Separator after potential admin section
        // --- End Admin Section ---
        DrawerListTile(
          title: localizations.sideMenuTask,
          svgSrc: "assets/icons/menu_task.svg",
          press: () {},
        ),
        DrawerListTile(
          title: localizations.sideMenuStore,
          svgSrc: "assets/icons/menu_store.svg",
          press: () {},
        ),
        DrawerListTile(
          title: localizations.sideMenuNotification,
          svgSrc: "assets/icons/menu_notification.svg",
          press: () {},
        ),
        DrawerListTile(
          title: localizations.sideMenuProfile,
          svgSrc: "assets/icons/menu_profile.svg",
          press: () {},
        ),
        DrawerListTile(
          title: localizations.sideMenuSettings,
          svgSrc: "assets/icons/menu_setting.svg",
          press: () {},
        ),
        // Logout Tile
        ListTile(
          onTap: () async {
            Navigator.pop(context); // Close drawer
            final authService =
                Provider.of<AuthService>(context, listen: false);
            await authService.logout();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false,
            );
          },
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            "assets/icons/menu_setting.svg",
            colorFilter:
                const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
            height: 16,
          ),
          title: Text(
            localizations.sideMenuLogout,
            style: TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}

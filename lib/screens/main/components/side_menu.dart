import 'package:admin/l10n/app_localizations.dart';
import 'package:admin/screens/client_list_screen.dart';
import 'package:admin/screens/employee_list_screen.dart';
import 'package:admin/screens/login_screen.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/translation_orders/translation_order_list_screen.dart';
import 'package:admin/screens/insurance_policy_list_screen.dart';
import 'package:admin/screens/user_form_screen.dart';
import 'package:admin/screens/training_course_list_screen.dart';
import 'package:admin/screens/business_registration_list_screen.dart';
import 'package:admin/screens/lending_application_list_screen.dart';
import 'package:admin/screens/banks/banks_screen.dart';
import 'package:admin/screens/offices/offices_screen.dart';
import 'package:admin/services/auth_service.dart';
import 'package:admin/constants.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Container(
      color: secondaryColor,
      child: Consumer<AuthService>(
        builder: (context, auth, _) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: defaultPadding),
              // Dashboard - always accessible
              DrawerListTile(
                title: localizations.sideMenuDashboard,
                svgSrc: "assets/icons/menu_dashboard.svg",
                press: () {
                  context.read<MenuAppController>().setSelectedScreen(
                        DashboardScreen(),
                      );
                },
              ),
              // Clients - accessible to managers and above
              if (auth.canViewClients())
                DrawerListTile(
                  title: localizations.sideMenuClients,
                  svgSrc: "assets/icons/menu_tran.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const ClientListScreen(),
                        );
                  },
                ),
              // Employees - accessible to chief managers and directors
              if (auth.canViewEmployees())
                DrawerListTile(
                  title: localizations.sideMenuEmployees,
                  svgSrc: "assets/icons/menu_profile.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const EmployeeListScreen(),
                        );
                  },
                ),
              // Translation Orders - accessible to translators and above
              if (auth.canViewTranslationOrders())
                DrawerListTile(
                  title: localizations.sideMenuTranslations,
                  svgSrc: "assets/icons/menu_doc.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const TranslationOrderListScreen(),
                        );
                  },
                ),
              // Business services - accessible to managers and above
              if (auth.canViewClients())
                DrawerListTile(
                  title: localizations.sideMenuInsurancePolicies,
                  svgSrc: "assets/icons/menu_store.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const InsurancePolicyListScreen(),
                        );
                  },
                ),
              if (auth.canViewClients())
                DrawerListTile(
                  title: localizations.sideMenuTrainingCourses,
                  svgSrc: "assets/icons/menu_doc.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const TrainingCourseListScreen(),
                        );
                  },
                ),
              if (auth.canViewClients())
                DrawerListTile(
                  title: localizations.sideMenuBusinessRegistrations,
                  svgSrc: "assets/icons/menu_store.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const BusinessRegistrationListScreen(),
                        );
                  },
                ),
              if (auth.canViewClients())
                DrawerListTile(
                  title: localizations.sideMenuLendingApplications,
                  svgSrc: "assets/icons/menu_store.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const LendingApplicationListScreen(),
                        );
                  },
                ),
              if (auth.canViewClients())
                DrawerListTile(
                  title: localizations.sideMenuBanks,
                  svgSrc: "assets/icons/menu_store.svg",
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const BanksScreen(),
                        );
                  },
                ),
              // Offices - accessible to chief managers and directors (or adjust as needed)
              if (auth
                  .canViewEmployees()) // Example: Same permission as employees for now
                DrawerListTile(
                  title: localizations
                      .sideMenuOffices, // Add this to localization files
                  svgSrc: "assets/icons/folder.svg", // Example icon
                  press: () {
                    context.read<MenuAppController>().setSelectedScreen(
                          const OfficesScreen(),
                        );
                  },
                ),
              // Admin Section - only directors can access
              if (auth.canViewAdminTools())
                Column(
                  children: [
                    const Divider(color: Colors.white24),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        'Admin Section', // Use localization key if available
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    DrawerListTile(
                      title:
                          'User Management', // Use localization key if available
                      svgSrc: "assets/icons/menu_profile.svg",
                      press: () {
                        context.read<MenuAppController>().setSelectedScreen(
                              const UserFormScreen(),
                            );
                      },
                    ),
                  ],
                ),
              const Divider(color: Colors.white24),
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
              const SizedBox(height: defaultPadding),
              // Logout Tile
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  onTap: () async {
                    await Provider.of<AuthService>(context, listen: false)
                        .logout();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  tileColor: Colors.red.withOpacity(0.1),
                  horizontalTitleGap: 12.0,
                  leading: SvgPicture.asset(
                    "assets/icons/menu_setting.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                    height: 16,
                  ),
                  title: Text(
                    'Logout', // Use localization key if available
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
            ],
          );
        },
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: ListTile(
        onTap: press,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hoverColor: primaryColor.withOpacity(0.1),
        horizontalTitleGap: 12.0,
        leading: SvgPicture.asset(
          svgSrc,
          colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
          height: 18,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

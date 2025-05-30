import 'package:admin/l10n/app_localizations.dart';
import 'package:admin/constants.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/screens/main/components/direction_tile.dart';
import 'package:admin/screens/main/components/top_action_buttons.dart';
import 'package:admin/services/auth_service.dart';
import 'package:admin/services/direction_service.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/client_list_screen.dart';
import 'package:admin/screens/translation_orders/translation_order_list_screen.dart';
import 'package:admin/screens/insurance_policy_list_screen.dart';
import 'package:admin/screens/training_course_list_screen.dart';
import 'package:admin/screens/legal_case_list_screen.dart';

import 'package:admin/screens/lending_application_list_screen.dart';
import 'package:admin/screens/banks/banks_screen.dart';
import 'package:admin/screens/user_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NewSideMenu extends StatelessWidget {
  const NewSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Consumer3<MenuAppController, AuthService, DirectionService>(
      builder: (context, menuController, authService, directionService, _) {
        final isCollapsed = menuController.isSidebarCollapsed;
        final isApplicationsMode = menuController.isApplicationsMode;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: isCollapsed ? 80 : 260,
          color: secondaryColor,
          child: Column(
            children: [
              // Header with collapse button
              _buildHeader(context, isCollapsed, menuController, localizations),

              // Top action buttons
              TopActionButtons(
                isApplicationsSelected: isApplicationsMode,
                onApplicationsPressed: () {
                  print(
                      '🎯 Applications mode selected - navigating to Dashboard');
                  menuController.setApplicationsMode(true);
                  // Navigate to dashboard or main application view
                  menuController.setSelectedScreen(DashboardScreen());
                },
                onClientsPressed: () {
                  print(
                      '🎯 Clients mode selected - navigating to ClientListScreen');
                  menuController.setApplicationsMode(false);
                  // Navigate to clients screen
                  menuController.setSelectedScreen(const ClientListScreen());
                },
                isCollapsed: isCollapsed,
              ),

              const SizedBox(height: 16),

              // Directions section
              if (!isCollapsed)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      localizations.sideMenuDirections,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 8),

              // Directions list
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ...directionService.directions.map(
                      (direction) => DirectionTile(
                        direction: direction,
                        localizedName: _getLocalizedDirectionName(
                            localizations, direction.nameKey),
                        onPressed: () {
                          print('🎯 Direction selected: ${direction.nameKey}');
                          directionService.selectDirection(direction.id);
                          menuController.setSelectedDirection(direction.id);

                          // Navigate to appropriate screen based on direction
                          Widget targetScreen;
                          switch (direction.nameKey) {
                            case 'directionTranslationAgency':
                              targetScreen = const TranslationOrderListScreen();
                              break;
                            case 'directionInsuranceServices':
                              targetScreen = const InsurancePolicyListScreen();
                              break;
                            case 'directionAdvancedTraining':
                              targetScreen = const TrainingCourseListScreen();
                              break;
                            case 'directionLending':
                              targetScreen =
                                  const LendingApplicationListScreen();
                              break;
                            case 'directionOpeningAccounts':
                              targetScreen = const BanksScreen();
                              break;
                            case 'directionLegalServices':
                              targetScreen = const LegalCaseListScreen();
                              break;
                            case 'directionCopyrightProtection':
                            case 'directionPropertyValuation':
                              // Default to dashboard for now - TODO: Create specific screens
                              targetScreen = DashboardScreen();
                              break;
                            default:
                              targetScreen = DashboardScreen();
                          }

                          print(
                              '📱 Navigating to: ${targetScreen.runtimeType}');
                          menuController.setSelectedScreen(targetScreen);
                        },
                        isCollapsed: isCollapsed,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // General sections
                    if (!isCollapsed)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(color: Colors.white24),
                      ),

                    // Role-based general sections
                    ..._buildGeneralSections(
                        context, authService, localizations, isCollapsed),

                    const SizedBox(height: 16),
                  ],
                ),
              ),

              // User info and logout at bottom
              _buildBottomSection(
                  context, authService, localizations, isCollapsed),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isCollapsed,
      MenuAppController menuController, AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (!isCollapsed) ...[
            // Logo or app name
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    height: 24,
                    colorFilter:
                        const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      localizations.sideMenuAdminPanel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Collapse button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => menuController.toggleSidebar(),
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  isCollapsed ? Icons.chevron_right : Icons.chevron_left,
                  color: Colors.white70,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGeneralSections(
    BuildContext context,
    AuthService authService,
    AppLocalizations localizations,
    bool isCollapsed,
  ) {
    final sections = <Widget>[];

    // All Applications - visible to most roles
    if (authService.canViewClients() ||
        authService.canViewTranslationOrders()) {
      sections.add(_buildGeneralTile(
        title: localizations.sideMenuAllApplications,
        icon: "assets/icons/menu_doc.svg",
        onPressed: () {
          print('🎯 All Applications clicked');
          context.read<MenuAppController>().setSelectedScreen(
                DashboardScreen(),
              );
        },
        isCollapsed: isCollapsed,
      ));
    }

    // Partners - visible to managers and above
    if (authService.canViewClients()) {
      sections.add(_buildGeneralTile(
        title: localizations.sideMenuPartners,
        icon: "assets/icons/menu_tran.svg",
        onPressed: () {
          print('🎯 Partners clicked');
          context.read<MenuAppController>().setSelectedScreen(
                const ClientListScreen(),
              );
        },
        isCollapsed: isCollapsed,
      ));
    }

    // Acts - visible to accountants and above
    if (authService.canViewClients()) {
      // TODO: Create proper permission for acts
      sections.add(_buildGeneralTile(
        title: localizations.sideMenuActs,
        icon: "assets/icons/menu_doc.svg",
        onPressed: () {
          print('🎯 Acts clicked');
          context.read<MenuAppController>().setSelectedScreen(
                DashboardScreen(), // TODO: Create Acts screen
              );
        },
        isCollapsed: isCollapsed,
      ));
    }

    // Admin sections
    if (authService.canViewAdminTools()) {
      sections.add(_buildGeneralTile(
        title: localizations.sideMenuCreateUser,
        icon: "assets/icons/menu_profile.svg",
        onPressed: () {
          print('🎯 Create User clicked');
          context.read<MenuAppController>().setSelectedScreen(
                const UserFormScreen(),
              );
        },
        isCollapsed: isCollapsed,
      ));

      sections.add(_buildGeneralTile(
        title: localizations.sideMenuSettings,
        icon: "assets/icons/menu_setting.svg",
        onPressed: () {
          print('🎯 Settings clicked');
          context.read<MenuAppController>().setSelectedScreen(
                DashboardScreen(), // TODO: Create Settings screen
              );
        },
        isCollapsed: isCollapsed,
      ));
    }

    return sections;
  }

  Widget _buildGeneralTile({
    required String title,
    required String icon,
    required VoidCallback onPressed,
    required bool isCollapsed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isCollapsed ? 8 : 16,
        vertical: 2,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isCollapsed ? 8 : 12,
              vertical: 12,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter:
                      const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                  height: 18,
                ),
                if (!isCollapsed) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(
    BuildContext context,
    AuthService authService,
    AppLocalizations localizations,
    bool isCollapsed,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Divider(color: Colors.white24),
          const SizedBox(height: 8),

          // User info
          if (!isCollapsed && authService.employeeProfile != null) ...[
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: primaryColor.withOpacity(0.2),
                  child: Text(
                    authService.employeeProfile!.name.isNotEmpty
                        ? authService.employeeProfile!.name[0].toUpperCase()
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
                        authService.employeeProfile!.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        authService.currentUserRole?.name ?? '',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  String _getLocalizedDirectionName(
      AppLocalizations localizations, String nameKey) {
    switch (nameKey) {
      case 'directionTranslationAgency':
        return localizations.directionTranslationAgency;
      case 'directionLegalServices':
        return localizations.directionLegalServices;
      case 'directionInsuranceServices':
        return localizations.directionInsuranceServices;
      case 'directionLending':
        return localizations.directionLending;
      case 'directionOpeningAccounts':
        return localizations.directionOpeningAccounts;
      case 'directionAdvancedTraining':
        return localizations.directionAdvancedTraining;
      case 'directionCopyrightProtection':
        return localizations.directionCopyrightProtection;
      case 'directionPropertyValuation':
        return localizations.directionPropertyValuation;
      default:
        return nameKey;
    }
  }
}

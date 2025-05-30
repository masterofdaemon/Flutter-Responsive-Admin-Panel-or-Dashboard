import 'package:admin/constants.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopActionButtons extends StatelessWidget {
  final bool isApplicationsSelected;
  final VoidCallback onApplicationsPressed;
  final VoidCallback onClientsPressed;
  final bool isCollapsed;

  const TopActionButtons({
    super.key,
    required this.isApplicationsSelected,
    required this.onApplicationsPressed,
    required this.onClientsPressed,
    this.isCollapsed = false,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    if (isCollapsed) {
      return Column(
        children: [
          _buildButton(
            icon: "assets/icons/menu_doc.svg",
            isSelected: isApplicationsSelected,
            onPressed: onApplicationsPressed,
            tooltip: localizations.topActionButtonsApplications,
          ),
          const SizedBox(height: 8),
          _buildButton(
            icon: "assets/icons/menu_tran.svg",
            isSelected: !isApplicationsSelected,
            onPressed: onClientsPressed,
            tooltip: localizations.topActionButtonsClients,
          ),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _buildFullButton(
              text: localizations.topActionButtonsApplications,
              icon: "assets/icons/menu_doc.svg",
              isSelected: isApplicationsSelected,
              onPressed: onApplicationsPressed,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildFullButton(
              text: localizations.topActionButtonsClients,
              icon: "assets/icons/menu_tran.svg",
              isSelected: !isApplicationsSelected,
              onPressed: onClientsPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String icon,
    required bool isSelected,
    required VoidCallback onPressed,
    String? tooltip,
  }) {
    return Tooltip(
      message: tooltip ?? '',
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected
                    ? primaryColor.withOpacity(0.2)
                    : Colors.transparent,
                border: isSelected
                    ? Border.all(color: primaryColor)
                    : Border.all(color: Colors.white24),
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  isSelected ? primaryColor : Colors.white70,
                  BlendMode.srcIn,
                ),
                height: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullButton({
    required String text,
    required String icon,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                isSelected ? primaryColor.withOpacity(0.2) : Colors.transparent,
            border: isSelected
                ? Border.all(color: primaryColor)
                : Border.all(color: Colors.white24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  isSelected ? primaryColor : Colors.white70,
                  BlendMode.srcIn,
                ),
                height: 16,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? primaryColor : Colors.white70,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

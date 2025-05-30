import 'package:admin/constants.dart';
import 'package:admin/models/business_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DirectionTile extends StatelessWidget {
  final BusinessDirection direction;
  final String localizedName;
  final VoidCallback onPressed;
  final bool isCollapsed;

  const DirectionTile({
    super.key,
    required this.direction,
    required this.localizedName,
    required this.onPressed,
    this.isCollapsed = false,
  });

  @override
  Widget build(BuildContext context) {
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: direction.isSelected
                  ? primaryColor.withOpacity(0.2)
                  : Colors.transparent,
              border: direction.isSelected
                  ? Border.all(color: primaryColor.withOpacity(0.5))
                  : null,
            ),
            child: isCollapsed
                ? Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          direction.iconPath,
                          colorFilter: ColorFilter.mode(
                            direction.isSelected
                                ? primaryColor
                                : Colors.white70,
                            BlendMode.srcIn,
                          ),
                          height: 18,
                        ),
                      ),
                      if (direction.pendingCount > 0)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: _buildCounterBadge(isSmall: true),
                        ),
                    ],
                  )
                : Row(
                    children: [
                      SvgPicture.asset(
                        direction.iconPath,
                        colorFilter: ColorFilter.mode(
                          direction.isSelected ? primaryColor : Colors.white70,
                          BlendMode.srcIn,
                        ),
                        height: 18,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          localizedName,
                          style: TextStyle(
                            color: direction.isSelected
                                ? primaryColor
                                : Colors.white70,
                            fontSize: 14,
                            fontWeight: direction.isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                      if (direction.pendingCount > 0) _buildCounterBadge(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildCounterBadge({bool isSmall = false}) {
    Color badgeColor;
    switch (direction.priority) {
      case DirectionPriority.critical:
        badgeColor = Colors.red;
        break;
      case DirectionPriority.attention:
        badgeColor = Colors.orange;
        break;
      case DirectionPriority.none:
        badgeColor = Colors.grey;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 4 : 6,
        vertical: isSmall ? 2 : 3,
      ),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(
        minWidth: isSmall ? 16 : 20,
        minHeight: isSmall ? 16 : 20,
      ),
      child: Text(
        direction.pendingCount > 99 ? '99+' : direction.pendingCount.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: isSmall ? 10 : 12,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/right_sidebar/notifications_panel.dart';
import 'package:admin/widgets/right_sidebar/calendar_panel.dart';

class RightSidebar extends StatefulWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const RightSidebar({
    super.key,
    this.isCollapsed = false,
    required this.onToggle,
  });

  @override
  State<RightSidebar> createState() => _RightSidebarState();
}

class _RightSidebarState extends State<RightSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  static const double _expandedWidth = 320.0;
  static const double _collapsedWidth = 60.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Create a simple 0.0 to 1.0 animation
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Set initial value based on collapsed state
    // 0.0 = collapsed, 1.0 = expanded
    _animationController.value = widget.isCollapsed ? 0.0 : 1.0;
  }

  double _getCurrentWidth() {
    // Interpolate between collapsed and expanded widths based on animation value
    return _collapsedWidth +
        (_expandedWidth - _collapsedWidth) * _animation.value;
  }

  @override
  void didUpdateWidget(RightSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapsed != widget.isCollapsed) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    // Animate to target value: 0.0 for collapsed, 1.0 for expanded
    final targetValue = widget.isCollapsed ? 0.0 : 1.0;
    _animationController.animateTo(targetValue);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Only show on desktop
    if (!Responsive.isDesktop(context)) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final currentWidth = _getCurrentWidth();

        return Container(
          width: currentWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(-2, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildHeader(),
              if (currentWidth > 250)
                Expanded(
                  child: _buildContent(),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: secondaryColor.withValues(alpha: 0.05),
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // If too narrow, show nothing to prevent overflow
          if (constraints.maxWidth < 30) {
            return const SizedBox.shrink();
          }

          // If narrow, show only the close button
          if (constraints.maxWidth < 250) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.close, color: secondaryColor, size: 20),
                  onPressed: widget.onToggle,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                ),
              ],
            );
          }

          // Standard layout for wider containers
          return Row(
            children: [
              Expanded(
                child: Text(
                  'Right Panel',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: secondaryColor, size: 20),
                onPressed: widget.onToggle,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    return const Column(
      children: [
        // Notifications Panel - Fixed height
        SizedBox(
          height: 300,
          child: NotificationsPanel(),
        ),
        SizedBox(height: 16),
        // Calendar Panel - Takes remaining space
        Expanded(
          child: CalendarPanel(),
        ),
      ],
    );
  }
}

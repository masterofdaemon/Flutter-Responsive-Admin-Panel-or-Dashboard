import 'package:admin/screens/dashboard/dashboard_screen.dart'; // Import default screen
import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _selectedScreen = DashboardScreen(); // Default screen
  bool _isSidebarCollapsed = false;
  String? _selectedDirectionId;
  bool _isApplicationsMode =
      false; // Track if we're in Applications or Clients mode

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  Widget get selectedScreen =>
      _selectedScreen; // Getter for the selected screen
  bool get isSidebarCollapsed => _isSidebarCollapsed;
  String? get selectedDirectionId => _selectedDirectionId;
  bool get isApplicationsMode => _isApplicationsMode;

  // Method to update the selected screen
  void setSelectedScreen(Widget screen) {
    _selectedScreen = screen;
    notifyListeners(); // Notify listeners about the change
    // Close the drawer if it's open (optional, good UX on mobile)
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.closeDrawer();
    }
  }

  // Toggle sidebar collapsed state
  void toggleSidebar() {
    _isSidebarCollapsed = !_isSidebarCollapsed;
    notifyListeners();
  }

  // Set sidebar collapsed state
  void setSidebarCollapsed(bool collapsed) {
    if (_isSidebarCollapsed != collapsed) {
      _isSidebarCollapsed = collapsed;
      notifyListeners();
    }
  }

  // Set selected direction for filtering
  void setSelectedDirection(String? directionId) {
    _selectedDirectionId = directionId;
    notifyListeners();
  }

  // Toggle between Applications and Clients mode
  void setApplicationsMode(bool isApplications) {
    if (_isApplicationsMode != isApplications) {
      _isApplicationsMode = isApplications;
      notifyListeners();
    }
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}

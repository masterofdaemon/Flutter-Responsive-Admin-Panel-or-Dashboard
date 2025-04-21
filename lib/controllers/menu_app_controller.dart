import 'package:admin/screens/dashboard/dashboard_screen.dart'; // Import default screen
import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _selectedScreen = DashboardScreen(); // Default screen

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  Widget get selectedScreen =>
      _selectedScreen; // Getter for the selected screen

  // Method to update the selected screen
  void setSelectedScreen(Widget screen) {
    _selectedScreen = screen;
    notifyListeners(); // Notify listeners about the change
    // Close the drawer if it's open (optional, good UX on mobile)
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.closeDrawer();
    }
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}

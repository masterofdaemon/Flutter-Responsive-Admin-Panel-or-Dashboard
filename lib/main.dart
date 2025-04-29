import 'package:admin/constants.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/login_screen.dart'; // Import LoginScreen
import 'package:admin/services/auth_service.dart'; // Import AuthService
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// Import the extensions to make them available across the app

void main() {
  // Ensure GrpcClient is initialized if needed before runApp
  // GrpcClient(); // Singleton initializes itself
  runApp(
    // Wrap the app with MultiProvider to provide AuthService
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuAppController()),
        ChangeNotifierProvider(
            create: (context) => AuthService()), // Provide AuthService
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      // Use Consumer to react to AuthService changes
      home: Consumer<AuthService>(
        builder: (context, authService, child) {
          // Show LoginScreen if not authenticated, otherwise show MainScreen
          return authService.isAuthenticated
              ? MainScreen()
              : const LoginScreen();
        },
      ),
    );
  }
}

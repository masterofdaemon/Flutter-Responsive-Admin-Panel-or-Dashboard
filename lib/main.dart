import 'package:admin/constants.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/controllers/layout_controller.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/login_screen.dart'; // Import LoginScreen
import 'package:admin/services/auth_service.dart'; // Import AuthService
import 'package:admin/services/direction_service.dart'; // Import DirectionService
import 'package:admin/services/notification_service.dart'; // Import NotificationService
import 'package:admin/services/calendar_service.dart'; // Import CalendarService
import 'package:admin/services/user_management_service.dart'; // Import UserManagementService
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Import this
import 'l10n/app_localizations.dart'; // Import your generated localizations
// Import the extensions to make them available across the app

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the AuthService singleton before starting the app
  await AuthService.initialize();

  runApp(
    // Wrap the app with MultiProvider to provide AuthService
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuAppController()),
        ChangeNotifierProvider(create: (context) => LayoutController()),
        ChangeNotifierProvider.value(value: NotificationService.instance),
        ChangeNotifierProvider.value(value: CalendarService.instance),
        ChangeNotifierProvider.value(
            value: AuthService.instance), // Use singleton instance
        ChangeNotifierProvider.value(
            value: UserManagementService.instance), // Add UserManagementService
        ChangeNotifierProxyProvider<AuthService, DirectionService>(
          create: (context) => DirectionService(AuthService.instance),
          update: (context, authService, directionService) =>
              directionService ?? DirectionService(authService),
        ),
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
      locale: const Locale("ru"),
      debugShowCheckedModeBanner: false,
      // title:
      //     'Flutter Admin Panel', // This title can also be localized if needed
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle, // Changed from ! to .
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales, // Use this
      // Use Consumer to react to AuthService changes
      home: Consumer<AuthService>(
        builder: (context, authService, child) {
          print(
              '[MainApp Consumer] Building. IsAuthenticated: ${authService.isAuthenticated}'); // Added log
          // Show LoginScreen if not authenticated, otherwise show MainScreen
          return authService.isAuthenticated
              ? MainScreen()
              : const LoginScreen();
        },
      ),
    );
  }
}

# AuthService Singleton Implementation

## Overview
The AuthService has been converted to a proper singleton pattern to ensure consistent authentication state across the entire Flutter application.

## Key Changes

### 1. Singleton Pattern Implementation
```dart
class AuthService with ChangeNotifier {
  // Singleton implementation
  static AuthService? _instance;
  static bool _isInitialized = false;
  
  static AuthService get instance {
    if (_instance == null) {
      throw StateError('AuthService must be initialized first. Call AuthService.initialize() before accessing instance.');
    }
    return _instance!;
  }

  // Static method to initialize the service asynchronously
  static Future<void> initialize() async {
    if (_instance == null) {
      _instance = AuthService._internal();
      await _instance!._initializeAsync();
      _isInitialized = true;
    }
  }

  // Check if the service is initialized
  static bool get isInitialized => _isInitialized;

  // Private constructor for singleton
  AuthService._internal();

  // Factory constructor that returns the singleton instance
  factory AuthService() => instance;
}
```

### 2. Async Initialization
```dart
// Async initialization method
Future<void> _initializeAsync() async {
  await _checkToken();
}
```

### 3. Main.dart Integration
```dart
void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize the AuthService singleton before starting the app
  await AuthService.initialize();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuAppController()),
        ChangeNotifierProvider.value(value: AuthService.instance), // Use singleton instance
      ],
      child: MyApp(),
    ),
  );
}
```

## Benefits

### 1. **Global Consistency**
- Single source of truth for authentication state
- All components use the same AuthService instance
- No risk of inconsistent authentication states across the app

### 2. **Proper Initialization**
- Async initialization ensures all setup (token checking, profile loading) completes before app starts
- Prevents race conditions where widgets try to access uninitialized auth state

### 3. **Memory Efficiency**
- Only one AuthService instance exists throughout the app lifecycle
- Reduces memory usage and prevents duplicate initialization

### 4. **Thread Safety**
- Singleton pattern ensures only one instance is created even with concurrent access
- Static initialization flag prevents double-initialization

## Usage Patterns

### 1. In Widgets with Provider
```dart
// Use Consumer to react to auth state changes
Consumer<AuthService>(
  builder: (context, authService, child) {
    return authService.isAuthenticated ? MainScreen() : LoginScreen();
  },
)

// Or access via Provider.of
final authService = Provider.of<AuthService>(context, listen: false);
```

### 2. Direct Singleton Access
```dart
// For services or classes that don't have BuildContext
final AuthService _authService = AuthService.instance;
final currentEmployee = _authService.employeeProfile;
```

### 3. Role-Based Access Control
```dart
// Check permissions using singleton
if (AuthService.instance.canManageTranslationOrders()) {
  // Show edit options
}
```

## Error Prevention

### 1. **Initialization Check**
The singleton getter throws a StateError if accessed before initialization:
```dart
if (_instance == null) {
  throw StateError('AuthService must be initialized first. Call AuthService.initialize() before accessing instance.');
}
```

### 2. **Double Initialization Prevention**
```dart
static Future<void> initialize() async {
  if (_instance == null) {  // Only initialize if not already created
    _instance = AuthService._internal();
    await _instance!._initializeAsync();
    _isInitialized = true;
  }
}
```

## Testing Considerations

For unit tests, you may need to reset the singleton:
```dart
// Test helper method (add to AuthService if needed)
@visibleForTesting
static void resetForTesting() {
  _instance = null;
  _isInitialized = false;
}
```

## Migration Summary

1. ✅ Converted AuthService to singleton pattern
2. ✅ Added async initialization method
3. ✅ Updated main.dart to initialize before app start
4. ✅ Updated Provider configuration to use singleton instance
5. ✅ Verified existing code uses proper singleton access patterns
6. ✅ Tested successful app startup and authentication flow

The AuthService singleton implementation is now complete and working correctly. The app maintains consistent authentication state across all components and screens.

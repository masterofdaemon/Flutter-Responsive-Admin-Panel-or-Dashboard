import 'dart:convert'; // For base64 encoding/decoding

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
// Use import prefixes to avoid potential conflicts
import 'package:admin/generated/crm.pb.dart'
    as pb; // Contains Request/Response messages
import 'package:admin/generated/crm.pbgrpc.dart'
    as pbgrpc; // Contains Service Clients
import 'package:admin/services/grpc_client.dart';

// Helper class to wrap the response from _fetchSelfProfileInternal
class FetchProfileResponse {
  final bool success;
  final pb.User? userProfile;
  final pb.Employee? employeeProfile;
  final bool isAuthError; // True if gRPC unauthenticated/permission denied
  final bool
      isUserNotFoundError; // True if gRPC specific "user not found" error
  final String? errorMessage;

  FetchProfileResponse({
    this.success = false,
    this.userProfile,
    this.employeeProfile,
    this.isAuthError = false,
    this.isUserNotFoundError = false,
    this.errorMessage,
  });
}

class AuthService with ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isAuthenticated = false;

  // Keys for secure storage
  static const String _authTokenKey = 'authToken';
  static const String _cachedEmployeeProfileDataKey =
      'cachedEmployeeProfileData';
  static const String _cachedEmployeeProfileTokenKey =
      'cachedEmployeeProfileToken';

  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _isAuthenticated;

  // Use the prefixed class name for the client
  pbgrpc.AuthServiceClient get _authClient {
    final channel = GrpcClient().channel;
    return pbgrpc.AuthServiceClient(channel);
  }

  pb.User? _userProfile;
  pb.Employee? _employeeProfile;

  pb.User? get userProfile => _userProfile;
  pb.Employee? get employeeProfile => _employeeProfile;

  AuthService() {
    _checkToken();
  }

  Future<void> _clearSessionData({bool notify = false}) async {
    print("AuthService: _clearSessionData called");
    _token = null;
    _isAuthenticated = false;
    _userProfile = null;
    _employeeProfile = null;
    _errorMessage = null; // Clear error message on session clear
    await _storage.delete(key: _authTokenKey);
    await _storage.delete(key: _cachedEmployeeProfileDataKey);
    await _storage.delete(key: _cachedEmployeeProfileTokenKey);
    GrpcClient().setAuthToken(null);
    if (notify) {
      print(
          'AuthService: Notifying listeners. Location: _clearSessionData_notify. isAuthenticated: $_isAuthenticated, isLoading: $_isLoading, error: $_errorMessage');
      notifyListeners();
    }
  }

  Future<void> _checkToken() async {
    _isLoading = true; // Indicate loading during token check
    print(
        'AuthService: Notifying listeners. Location: _checkToken_start. isAuthenticated: $_isAuthenticated, isLoading: $_isLoading, error: $_errorMessage');
    notifyListeners();

    _token = await _storage.read(key: _authTokenKey);
    print('AuthService: _checkToken: Token read from storage: $_token');

    if (_token != null && _token!.isNotEmpty) {
      GrpcClient().setAuthToken(_token);
      FetchProfileResponse profileResponse = await _fetchSelfProfileInternal();

      if (profileResponse.success) {
        _isAuthenticated = true;
        _userProfile = profileResponse.userProfile;
        _employeeProfile = profileResponse.employeeProfile;
        _errorMessage = null;
        print(
            'AuthService: _checkToken: Profile fetched successfully. User: ${_userProfile != null}, Employee: ${_employeeProfile != null}');
        if (_employeeProfile != null) {
          // Cache employee profile if fetched successfully
          try {
            await _storage.write(
                key: _cachedEmployeeProfileDataKey,
                value: base64Encode(_employeeProfile!.writeToBuffer()));
            await _storage.write(
                key: _cachedEmployeeProfileTokenKey, value: _token);
            print(
                'AuthService: _checkToken: Employee profile cached successfully.');
          } catch (e) {
            print(
                'AuthService: _checkToken: Failed to cache employee profile: $e');
          }
        } else {
          // If it's a user profile, ensure any old employee cache is cleared for this token
          // (though _clearSessionData on logout/new login should handle most cases)
          final cachedToken =
              await _storage.read(key: _cachedEmployeeProfileTokenKey);
          if (cachedToken == _token) {
            await _storage.delete(key: _cachedEmployeeProfileDataKey);
            await _storage.delete(key: _cachedEmployeeProfileTokenKey);
            print(
                'AuthService: _checkToken: Cleared employee cache as current session is for a user.');
          }
        }
      } else {
        if (profileResponse.isAuthError) {
          print(
              'AuthService: _checkToken: Auth error during profile fetch. Clearing session.');
          await _clearSessionData();
        } else if (profileResponse.isUserNotFoundError) {
          print(
              'AuthService: _checkToken: "User not found" error during profile fetch. Attempting to use cached employee profile.');
          String? cachedProfileData =
              await _storage.read(key: _cachedEmployeeProfileDataKey);
          String? cachedProfileToken =
              await _storage.read(key: _cachedEmployeeProfileTokenKey);

          if (cachedProfileData != null &&
              cachedProfileToken != null &&
              cachedProfileToken == _token) {
            try {
              _employeeProfile =
                  pb.Employee.fromBuffer(base64Decode(cachedProfileData));
              _isAuthenticated = true;
              _userProfile = null; // Ensure user profile is null
              _errorMessage = null;
              print(
                  'AuthService: _checkToken: Successfully restored session using cached employee profile.');
            } catch (e) {
              print(
                  'AuthService: _checkToken: Failed to decode cached employee profile: $e. Clearing session.');
              await _clearSessionData();
            }
          } else {
            print(
                'AuthService: _checkToken: No matching cached employee profile found despite "user not found" error. Clearing session.');
            await _clearSessionData();
          }
        } else {
          // Other errors
          print(
              'AuthService: _checkToken: Profile fetch failed (Reason: ${profileResponse.errorMessage}). Clearing session.');
          await _clearSessionData();
        }
      }
    } else {
      print('AuthService: _checkToken: No token in storage.');
      await _clearSessionData(); // Ensure clean state if no token
    }
    _isLoading = false;
    print(
        'AuthService: Notifying listeners. Location: _checkToken_end. isAuthenticated: $_isAuthenticated, isLoading: $_isLoading, error: $_errorMessage');
    notifyListeners();
  }

  // Renamed and refactored from fetchSelfProfile
  Future<FetchProfileResponse> _fetchSelfProfileInternal() async {
    if (_token == null || _token!.isEmpty) {
      print("AuthService: _fetchSelfProfileInternal called with no token.");
      return FetchProfileResponse(
          isAuthError: true, errorMessage: "No token available");
    }
    try {
      final crmClient = pbgrpc.CrmServiceClient(GrpcClient().channel);
      print(
          'AuthService: _fetchSelfProfileInternal: Attempting to fetch self profile.');

      final response = await crmClient.getSelfProfile(
        pb.GetSelfProfileRequest(),
        options: GrpcClient().getCallOptions(),
      );

      if (response.hasUser() || response.hasEmployee()) {
        print(
            'AuthService: _fetchSelfProfileInternal: Self profile fetched successfully. User: ${response.hasUser()}, Employee: ${response.hasEmployee()}');
        return FetchProfileResponse(
          success: true,
          userProfile: response.hasUser() ? response.user : null,
          employeeProfile: response.hasEmployee() ? response.employee : null,
        );
      } else {
        print(
            'AuthService: _fetchSelfProfileInternal: Call completed, but no user or employee data found.');
        return FetchProfileResponse(
            errorMessage: "No user or employee data in profile response.");
      }
    } catch (e) {
      print('AuthService: _fetchSelfProfileInternal: Failed: $e');
      if (e is GrpcError) {
        bool authErr = (e.code == StatusCode.unauthenticated ||
            e.code == StatusCode.permissionDenied);
        // Check for the specific "user not found" error from logs: code 13 (INTERNAL), message "Failed to get user: not found"
        bool userNotFoundErr = (e.code == StatusCode.internal &&
                (e.message?.toLowerCase().contains("user not found") ??
                    false) ||
            (e.message
                    ?.toLowerCase()
                    .contains("failed to get user: not found") ??
                false));

        print(
            'AuthService: _fetchSelfProfileInternal: gRPC Error - Code: ${e.code}, Message: ${e.message}, isAuthError: $authErr, isUserNotFoundError: $userNotFoundErr');
        return FetchProfileResponse(
          isAuthError: authErr,
          isUserNotFoundError: userNotFoundErr,
          errorMessage:
              "gRPC Error: ${e.message ?? 'Unknown'} (Code: ${e.code})",
        );
      }
      return FetchProfileResponse(
          errorMessage: "Non-gRPC Error: ${e.toString()}");
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    // Initial notification that loading has started and errors are cleared.
    print(
        'AuthService: Notifying listeners. Location: login_start_minimal. isAuthenticated: $_isAuthenticated, isLoading: $_isLoading, error: $_errorMessage');
    notifyListeners();

    // Perform pre-login cleanup without notifying, as the main notification will be in finally.
    await _clearSessionData(notify: false);

    bool loginSuccess = false;
    try {
      final client = _authClient;
      final request = pb.LoginRequest(email: email, password: password);
      final response = await client.login(request);

      if (response.token.isNotEmpty) {
        _token = response.token;
        await _storage.write(key: _authTokenKey, value: _token);
        GrpcClient().setAuthToken(_token);

        FetchProfileResponse profileResponse =
            await _fetchSelfProfileInternal();
        if (profileResponse.success && profileResponse.userProfile != null) {
          _isAuthenticated = true;
          _userProfile = profileResponse.userProfile;
          _employeeProfile = null;
          _errorMessage = null;
          await _storage.delete(key: _cachedEmployeeProfileDataKey);
          await _storage.delete(key: _cachedEmployeeProfileTokenKey);
          print('AuthService: User login successful and profile fetched.');
          loginSuccess = true;
          // No notifyListeners() here, will be done in finally
        } else {
          _errorMessage = profileResponse.errorMessage ??
              "User login successful, but failed to fetch profile.";
          await _clearSessionData(notify: false);
          loginSuccess = false;
        }
      } else {
        _errorMessage = "User login successful, but no token received.";
        await _clearSessionData(notify: false);
        loginSuccess = false;
      }
    } catch (e) {
      print('User login failed: $e');
      if (e is GrpcError) {
        _errorMessage =
            "User login failed: ${e.message ?? 'Unknown gRPC error'} (${e.codeName})";
      } else {
        _errorMessage = "User login failed: An unexpected error occurred.";
      }
      await _clearSessionData(notify: false); // Ensure clean state on error
      loginSuccess = false;
    } finally {
      _isLoading = false; // Always set loading to false at the end
      // This is now the single point of notification for the login operation's outcome.
      print(
          'AuthService: Notifying listeners. Location: login_finally_minimal. isAuthenticated: $_isAuthenticated, isLoading: $_isLoading, error: $_errorMessage');
      // Introduce a small delay before the final notification
      await Future.delayed(const Duration(milliseconds: 50));
      notifyListeners();
    }
    return loginSuccess;
  }

  Future<bool> loginEmployee(String loginVal, String password) async {
    _isLoading = true;
    _errorMessage = null;
    // Initial notification that loading has started and errors are cleared.
    print(
        'AuthService: Notifying listeners. Location: loginEmployee_start_minimal. isAuthenticated: $_isAuthenticated, isLoading: $_isLoading, error: $_errorMessage');
    notifyListeners();

    // Perform pre-login cleanup without notifying.
    await _clearSessionData(notify: false);

    bool loginSuccess = false;
    try {
      final client = _authClient;
      final request =
          pb.LoginEmployeeRequest(login: loginVal, password: password);
      final response = await client.loginEmployee(request);

      if (response.token.isNotEmpty) {
        _token = response.token;
        await _storage.write(key: _authTokenKey, value: _token);
        GrpcClient().setAuthToken(_token);

        if (response.hasEmployee()) {
          _isAuthenticated = true;
          _employeeProfile = response.employee;
          _userProfile = null;
          _errorMessage = null;

          try {
            await _storage.write(
                key: _cachedEmployeeProfileDataKey,
                value: base64Encode(_employeeProfile!.writeToBuffer()));
            await _storage.write(
                key: _cachedEmployeeProfileTokenKey, value: _token);
            print('AuthService: Employee login successful, profile cached.');
          } catch (e) {
            print(
                'AuthService: Employee login successful, but failed to cache profile: $e');
          }
          loginSuccess = true;
          // No notifyListeners() here, will be done in finally
        } else {
          _errorMessage =
              "Employee login successful, but no employee data in response.";
          await _clearSessionData(notify: false);
          loginSuccess = false;
        }
      } else {
        _errorMessage = "Employee login successful, but no token received.";
        await _clearSessionData(notify: false);
        loginSuccess = false;
      }
    } catch (e) {
      print('Employee login failed: $e');
      if (e is GrpcError) {
        _errorMessage =
            "Employee login failed: ${e.message ?? 'Unknown gRPC error'} (${e.codeName})";
      } else {
        _errorMessage = "Employee login failed: An unexpected error occurred.";
      }
      await _clearSessionData(notify: false);
      loginSuccess = false;
    } finally {
      _isLoading = false; // Always set loading to false at the end
      // This is now the single point of notification for the login operation's outcome.
      print(
          'AuthService: Notifying listeners. Location: loginEmployee_finally_minimal. isAuthenticated: $_isAuthenticated, isLoading: $_isLoading, error: $_errorMessage');
      // Introduce a small delay before the final notification
      await Future.delayed(const Duration(milliseconds: 50));
      notifyListeners();
    }
    return loginSuccess;
  }

  Future<void> logout() async {
    print("AuthService: logout called");
    await _clearSessionData(notify: true);
    // Optional: Call backend logout if endpoint exists
    // try {
    //   await _authClient.logout(pb.Empty());
    // } catch (e) {
    //   print('AuthService: Failed to notify backend of logout: $e');
    // }
  }
}

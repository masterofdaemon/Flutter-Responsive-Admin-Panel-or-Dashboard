import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
// Use import prefixes to avoid potential conflicts
import 'package:admin/generated/crm.pb.dart'
    as pb; // Contains Request/Response messages
import 'package:admin/generated/crm.pbgrpc.dart'
    as pbgrpc; // Contains Service Clients
import 'package:admin/services/grpc_client.dart';

class AuthService with ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isAuthenticated = false;

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

  Future<void> _checkToken() async {
    _token = await _storage.read(key: 'authToken');
    print('AuthService: _checkToken: Token read from storage: $_token');
    if (_token != null && _token!.isNotEmpty) {
      GrpcClient().setAuthToken(_token);
      bool profileFetched = await fetchSelfProfile();

      if (profileFetched) {
        // If profile was fetched successfully, then we are authenticated.
        // fetchSelfProfile itself might set _isAuthenticated to false on specific auth errors,
        // so we check its return value first.
        _isAuthenticated = true;
        print(
            'AuthService: _checkToken: Profile fetched successfully. isAuthenticated = true.');
      } else {
        // If profile fetch failed (either no data, or an error including auth error in fetchSelfProfile)
        _isAuthenticated = false; // Ensure it is false
        print(
            'AuthService: _checkToken: Profile fetch failed or auth error during fetch. isAuthenticated = false. Clearing token.');
        // Token is cleared here (or already cleared in fetchSelfProfile if it was an auth error)
        if (_token != null) {
          // Check if token wasn't already nulled by fetchSelfProfile
          _token = null;
          await _storage.delete(key: 'authToken');
          GrpcClient().setAuthToken(null);
        }
      }
    } else {
      _isAuthenticated = false;
      GrpcClient().setAuthToken(null);
      print(
          'AuthService: _checkToken: No token in storage, isAuthenticated = false');
    }
    notifyListeners(); // Single notify at the end of _checkToken
  }

  // Modified fetchSelfProfile to not notify and to return a success status
  Future<bool> fetchSelfProfile() async {
    if (_token == null || _token!.isEmpty) {
      print("AuthService: fetchSelfProfile called with no token.");
      _isAuthenticated = false; // Ensure state is consistent
      return false;
    }
    try {
      final crmClient = pbgrpc.CrmServiceClient(GrpcClient().channel);
      final currentToken =
          GrpcClient().getCallOptions().metadata['authorization'];
      print(
          'AuthService: Attempting to fetch self profile. Token from getCallOptions: $currentToken');

      final response = await crmClient.getSelfProfile(
        pb.GetSelfProfileRequest(),
        options: GrpcClient().getCallOptions(),
      );
      _userProfile = response.hasUser() ? response.user : null;
      _employeeProfile = response.hasEmployee() ? response.employee : null;

      if (_userProfile != null || _employeeProfile != null) {
        print(
            'AuthService: Self profile fetched successfully. User: ${_userProfile != null}, Employee: ${_employeeProfile != null}');
        // _isAuthenticated = true; // Caller will set this based on overall flow
        return true; // Indicate success
      } else {
        print(
            'AuthService: Self profile fetch call completed, but no user or employee data was found in the response.');
        _userProfile = null;
        _employeeProfile = null;
        // This situation might mean the token is valid but there's no profile, or an issue.
        // Consider it a failure for authentication purposes if no profile is found with a token.
        // _isAuthenticated = false; // Caller will decide based on this return
        return false; // Indicate profile not found
      }
    } catch (e) {
      print('Failed to fetch self profile: $e');
      _userProfile = null;
      _employeeProfile = null;
      if (e is GrpcError &&
          (e.code == StatusCode.unauthenticated ||
              e.code == StatusCode.permissionDenied)) {
        print(
            'AuthService: Fetch self profile failed due to auth error. Clearing token.');
        _token = null;
        await _storage.delete(key: 'authToken');
        GrpcClient().setAuthToken(null);
        _isAuthenticated = false; // Explicitly set to false due to auth error
      }
      return false; // Indicate failure
    }
    // No notifyListeners() here
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final client = _authClient;
      final request = pb.LoginRequest(email: email, password: password);
      final response = await client.login(request);

      if (response.token.isNotEmpty) {
        _token = response.token;
        await _storage.write(key: 'authToken', value: _token);
        GrpcClient().setAuthToken(_token);
        _employeeProfile = null; // Clear employee profile on user login

        bool profileFetched = await fetchSelfProfile();
        if (profileFetched) {
          _isAuthenticated = true;
          _errorMessage = null;
          print(
              'AuthService: User login successful. Profile fetched. IsAuthenticated: $_isAuthenticated');
          return true;
        } else {
          _errorMessage = "User login successful, but failed to fetch profile.";
          _isAuthenticated =
              false; // Ensure this is false if profile fetch fails
          _token = null; // Clean up token as it might be invalid
          await _storage.delete(key: 'authToken');
          GrpcClient().setAuthToken(null);
          print(
              'AuthService: User login, but profile fetch failed. Token cleared.');
          return false;
        }
      } else {
        _errorMessage = "User login successful, but no token received.";
        _isAuthenticated = false;
        return false;
      }
    } catch (e) {
      print('User login failed: $e');
      if (e is GrpcError) {
        _errorMessage =
            "User login failed: ${e.message ?? 'Unknown gRPC error'} (${e.codeName})";
      } else {
        _errorMessage = "User login failed: An unexpected error occurred.";
      }
      _isAuthenticated = false;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> loginEmployee(String loginVal, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final client = _authClient;
      final request =
          pb.LoginEmployeeRequest(login: loginVal, password: password);
      final response = await client.loginEmployee(request);

      if (response.token.isNotEmpty) {
        _token = response.token;
        await _storage.write(key: 'authToken', value: _token);
        GrpcClient().setAuthToken(_token);
        _userProfile = null; // Clear user profile on employee login

        if (response.hasEmployee()) {
          _employeeProfile = response.employee;
          _isAuthenticated = true; // Employee profile came with login response
          _errorMessage = null;
          print(
              'AuthService: Employee login successful (profile in response). IsAuthenticated: $_isAuthenticated');
          // Optionally, still call fetchSelfProfile to ensure everything is consistent or get more data
          // bool consistentProfile = await fetchSelfProfile();
          // if (!consistentProfile || _employeeProfile == null) { ... handle inconsistency ... }
          return true;
        } else {
          // Try to fetch profile if not included in login response
          bool profileFetched = await fetchSelfProfile();
          if (profileFetched && _employeeProfile != null) {
            _isAuthenticated = true;
            _errorMessage = null;
            print(
                'AuthService: Employee login successful (profile fetched). IsAuthenticated: $_isAuthenticated');
            return true;
          } else {
            _errorMessage =
                "Employee login successful, but failed to fetch employee profile.";
            _isAuthenticated = false;
            _token = null;
            await _storage.delete(key: 'authToken');
            GrpcClient().setAuthToken(null);
            print(
                'AuthService: Employee login, but profile fetch failed. Token cleared.');
            return false;
          }
        }
      } else {
        _errorMessage = "Employee login successful, but no token received.";
        _isAuthenticated = false;
        return false;
      }
    } catch (e) {
      print('Employee login failed: $e');
      if (e is GrpcError) {
        _errorMessage =
            "Employee login failed: ${e.message ?? 'Unknown gRPC error'} (${e.codeName})";
      } else {
        _errorMessage = "Employee login failed: An unexpected error occurred.";
      }
      _isAuthenticated = false;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _token = null;
    _isAuthenticated = false;
    _userProfile = null;
    _employeeProfile = null;
    await _storage.delete(key: 'authToken');
    GrpcClient().setAuthToken(null);
    notifyListeners();
    // Optional: Call backend logout
    // try {
    //   await _authClient.logout(pb.Empty()); // Assuming Empty message exists in pb
    // } catch (e) {
    //   print('Failed to notify backend of logout: $e');
    // }
  }
}

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
    print('AuthService: Token read from storage: $_token'); // Log the token
    if (_token != null && _token!.isNotEmpty) {
      _isAuthenticated = true;
      GrpcClient().setAuthToken(_token);
      await fetchSelfProfile(); // Fetch profile information if token exists
    } else {
      _isAuthenticated = false;
      GrpcClient().setAuthToken(null); // Ensure token is cleared if not found
    }
    notifyListeners();
  }

  Future<void> fetchSelfProfile() async {
    try {
      final crmClient = pbgrpc.CrmServiceClient(GrpcClient().channel);
      // Log the token that getCallOptions is expected to use
      final currentToken =
          GrpcClient().getCallOptions().metadata['authorization'];
      print(
          'AuthService: Attempting to fetch self profile. Token from getCallOptions: $currentToken');

      final response = await crmClient.getSelfProfile(
        pb.GetSelfProfileRequest(),
        options: GrpcClient()
            .getCallOptions(), // This will call the modified getCallOptions
      );
      _userProfile = response.hasUser() ? response.user : null;
      _employeeProfile = response.hasEmployee() ? response.employee : null;

      if (_userProfile != null || _employeeProfile != null) {
        print(
            'AuthService: Self profile fetched successfully. User: ${_userProfile != null}, Employee: ${_employeeProfile != null}');
      } else {
        print(
            'AuthService: Self profile fetch call completed, but no user or employee data was found in the response.');
      }
      notifyListeners();
    } catch (e) {
      print('Failed to fetch self profile: $e');
      _userProfile = null;
      _employeeProfile = null;
      // Optionally set error message
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final client = _authClient;
      // Use the prefixed class name for the request message
      final request = pb.LoginRequest(email: email, password: password);
      // The response type pb.LoginResponse is inferred
      final response = await client.login(request);

      if (response.token.isNotEmpty) {
        _token = response.token;
        await _storage.write(key: 'authToken', value: _token);
        _isAuthenticated = true;
        _errorMessage = null;
        GrpcClient().setAuthToken(_token);

        await fetchSelfProfile();
        print(
            'AuthService: After fetchSelfProfile in login. IsAuthenticated: $_isAuthenticated, UserProfile: ${_userProfile != null}, EmployeeProfile: ${_employeeProfile != null}');
        return true;
      } else {
        _errorMessage = "Login successful, but no token received.";
        _isAuthenticated = false;
        return false;
      }
    } catch (e) {
      print('Login failed: $e');
      if (e is GrpcError) {
        _errorMessage =
            "Login failed: ${e.message ?? 'Unknown gRPC error'} (${e.codeName})";
      } else {
        _errorMessage = "Login failed: An unexpected error occurred.";
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

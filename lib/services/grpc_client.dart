import 'package:admin/services/config.dart';
import 'package:grpc/grpc.dart';

class GrpcClient {
  static final GrpcClient _singleton = GrpcClient._internal();

  factory GrpcClient() {
    return _singleton;
  }

  GrpcClient._internal() {
    // Initialize the channel here
    _initializeChannel();
  }

  late ClientChannel _channel;
  String? _token; // To store the authentication token

  // Use config values for host/port
  final String _host = grpcHost;
  final int _port = grpcPort;

  void _initializeChannel() {
    _channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(
        // Use secure credentials if your server uses TLS
        // credentials: ChannelCredentials.secure(),
        // Use insecure credentials for local development ONLY
        credentials: ChannelCredentials.insecure(),
        // Adjust connection timeout as needed
        connectionTimeout: Duration(seconds: 10),
      ),
    );
  }

  ClientChannel get channel => _channel;

  // Method to update the token after login
  void setAuthToken(String? token) {
    _token = token;
    // Re-create the channel or update options if necessary,
    // especially if using interceptors for auth.
    // For simplicity, we'll assume an interceptor handles adding the token.
  }

  // Method to get call options with the auth token (if using metadata)
  CallOptions getCallOptions() {
    final headers = <String, String>{};
    print(
        'GrpcClient: getCallOptions called. Current token: $_token'); // Added log
    if (_token != null && _token!.isNotEmpty) {
      headers['authorization'] = 'Bearer $_token';
      print(
          'GrpcClient: Authorization header set with token: Bearer $_token'); // Added log
    } else {
      print('GrpcClient: No token available or token is empty.'); // Added log
    }
    return CallOptions(metadata: headers);
  }

  // Optional: Add interceptors for automatically adding the token
  // ClientChannel get channelWithAuth {
  //   return ClientChannel(
  //     _host,
  //     port: _port,
  //     options: const ChannelOptions(
  //       credentials: ChannelCredentials.insecure(),
  //     ),
  //     interceptors: [_authInterceptor()],
  //   );
  // }
  //
  // ClientInterceptor _authInterceptor() {
  //   return (method, options, invoker) {
  //     final newOptions = options.mergedWith(getCallOptions());
  //     return invoker(method, newOptions);
  //   };
  // }

  // Method to shut down the channel when the app closes
  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}

import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcUserService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.User>> listUsers(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListUsersRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listUsers(request,
          options: GrpcClient().getCallOptions());
      return response.users;
    } on GrpcError catch (e) {
      print('gRPC error during listUsers: $e');
      rethrow;
    }
  }

  Future<crm.User> createUser(crm.User user, String password) async {
    // Note: Password handling might need adjustment based on actual auth flow
    final request = crm.CreateUserRequest(user: user, password: password);
    final response = await _client.createUser(request,
        options: GrpcClient().getCallOptions());
    return await getUser(response.userId);
  }

  Future<crm.User> getUser(String userId) async {
    final request = crm.GetUserRequest(userId: userId);
    final response =
        await _client.getUser(request, options: GrpcClient().getCallOptions());
    return response.user;
  }

  Future<crm.User> updateUser(String userId, crm.User data) async {
    // Note: Password update might be handled separately
    final request = crm.UpdateUserRequest(userId: userId, userData: data);
    final response = await _client.updateUser(request,
        options: GrpcClient().getCallOptions());
    return response.user;
  }

  Future<void> deleteUser(String userId) async {
    final request = crm.DeleteUserRequest(userId: userId);
    await _client.deleteUser(request, options: GrpcClient().getCallOptions());
  }

  // Add other User specific methods if needed, e.g., ChangePassword
}

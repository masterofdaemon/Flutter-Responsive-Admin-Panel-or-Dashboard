// import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcUserService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<crm.CreateUserResponse> createUser(
      crm.CreateUserRequest request) async {
    return await _client.createUser(request,
        options: GrpcClient().getCallOptions());
  }
}

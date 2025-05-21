import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcAccountOpeningRequestService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.AccountOpeningRequest>> listAccountOpeningRequests(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListAccountOpeningRequestsRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listAccountOpeningRequests(request,
          options: GrpcClient().getCallOptions());
      return response.accountOpeningRequests;
    } on GrpcError catch (e) {
      print('gRPC error during listAccountOpeningRequests: $e');
      rethrow;
    }
  }

  Future<crm.AccountOpeningRequest> createAccountOpeningRequest(
      crm.AccountOpeningRequest req) async {
    final request =
        crm.CreateAccountOpeningRequestRequest(accountOpeningRequest: req);
    final response = await _client.createAccountOpeningRequest(request,
        options: GrpcClient().getCallOptions());
    return await getAccountOpeningRequest(response.requestId);
  }

  Future<crm.AccountOpeningRequest> getAccountOpeningRequest(
      int requestId) async {
    final request = crm.GetAccountOpeningRequestRequest(requestId: requestId);
    final response = await _client.getAccountOpeningRequest(request,
        options: GrpcClient().getCallOptions());
    return response.accountOpeningRequest;
  }

  Future<crm.AccountOpeningRequest> updateAccountOpeningRequest(
      int requestId, crm.AccountOpeningRequest data) async {
    final request = crm.UpdateAccountOpeningRequestRequest(
        requestId: requestId, requestData: data);
    final response = await _client.updateAccountOpeningRequest(request,
        options: GrpcClient().getCallOptions());
    return response.accountOpeningRequest;
  }

  Future<void> deleteAccountOpeningRequest(int requestId) async {
    final request =
        crm.DeleteAccountOpeningRequestRequest(requestId: requestId);
    await _client.deleteAccountOpeningRequest(request,
        options: GrpcClient().getCallOptions());
  }
}

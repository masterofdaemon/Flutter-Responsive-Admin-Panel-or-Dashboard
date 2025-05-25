import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcLendingApplicationService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.LendingApplication>> listLendingApplications(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListLendingApplicationsRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listLendingApplications(request,
          options: GrpcClient().getCallOptions());
      return response.lendingApplications;
    } on GrpcError catch (e) {
      print('gRPC error during listLendingApplications: $e');
      rethrow;
    }
  }

  Future<crm.LendingApplication> createLendingApplication(
      crm.LendingApplication application) async {
    final request =
        crm.CreateLendingApplicationRequest(lendingApplication: application);
    final response = await _client.createLendingApplication(request,
        options: GrpcClient().getCallOptions());
    return await getLendingApplication(response.requestId.toString());
  }

  Future<crm.LendingApplication> getLendingApplication(String requestId) async {
    final request = crm.GetLendingApplicationRequest(
        requestId: int.tryParse(requestId) ?? 0);
    final response = await _client.getLendingApplication(request,
        options: GrpcClient().getCallOptions());
    return response.lendingApplication;
  }

  Future<crm.LendingApplication> updateLendingApplication(
      String requestId, crm.LendingApplication data) async {
    final request = crm.UpdateLendingApplicationRequest(
        requestId: int.tryParse(requestId) ?? 0, applicationData: data);
    final response = await _client.updateLendingApplication(request,
        options: GrpcClient().getCallOptions());
    return response.lendingApplication;
  }

  Future<void> deleteLendingApplication(String requestId) async {
    final request = crm.DeleteLendingApplicationRequest(
        requestId: int.tryParse(requestId) ?? 0);
    await _client.deleteLendingApplication(request,
        options: GrpcClient().getCallOptions());
  }
}

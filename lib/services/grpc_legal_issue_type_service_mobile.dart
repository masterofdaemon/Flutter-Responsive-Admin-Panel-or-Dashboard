import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcLegalIssueTypeService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.LegalIssueType>> listLegalIssueTypes(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListLegalIssueTypesRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listLegalIssueTypes(request,
          options: GrpcClient().getCallOptions());
      return response.legalIssueTypes;
    } on GrpcError catch (e) {
      print('gRPC error during listLegalIssueTypes: $e');
      rethrow;
    }
  }

  Future<crm.LegalIssueType> createLegalIssueType(
      crm.LegalIssueType issueType) async {
    final request = crm.CreateLegalIssueTypeRequest(legalIssueType: issueType);
    final response = await _client.createLegalIssueType(request,
        options: GrpcClient().getCallOptions());
    return await getLegalIssueType(response.issueTypeId);
  }

  Future<crm.LegalIssueType> getLegalIssueType(int issueTypeId) async {
    final request = crm.GetLegalIssueTypeRequest(issueTypeId: issueTypeId);
    final response = await _client.getLegalIssueType(request,
        options: GrpcClient().getCallOptions());
    return response.legalIssueType;
  }

  Future<crm.LegalIssueType> updateLegalIssueType(
      int issueTypeId, crm.LegalIssueType data) async {
    final request = crm.UpdateLegalIssueTypeRequest(
        issueTypeId: issueTypeId, issueTypeData: data);
    final response = await _client.updateLegalIssueType(request,
        options: GrpcClient().getCallOptions());
    return response.legalIssueType;
  }

  Future<void> deleteLegalIssueType(int issueTypeId) async {
    final request = crm.DeleteLegalIssueTypeRequest(issueTypeId: issueTypeId);
    await _client.deleteLegalIssueType(request,
        options: GrpcClient().getCallOptions());
  }
}

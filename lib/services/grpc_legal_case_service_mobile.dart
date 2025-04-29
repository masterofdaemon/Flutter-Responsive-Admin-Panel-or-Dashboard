import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcLegalCaseService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.LegalCase>> listLegalCases(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListLegalCasesRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listLegalCases(request,
          options: GrpcClient().getCallOptions());
      return response.legalCases;
    } on GrpcError catch (e) {
      print('gRPC error during listLegalCases: $e');
      rethrow;
    }
  }

  Future<crm.LegalCase> createLegalCase(crm.LegalCase legalCase) async {
    final request = crm.CreateLegalCaseRequest(legalCase: legalCase);
    final response = await _client.createLegalCase(request,
        options: GrpcClient().getCallOptions());
    return await getLegalCase(response.caseId);
  }

  Future<crm.LegalCase> getLegalCase(String caseId) async {
    final request = crm.GetLegalCaseRequest(caseId: caseId);
    final response = await _client.getLegalCase(request,
        options: GrpcClient().getCallOptions());
    return response.legalCase;
  }

  Future<crm.LegalCase> updateLegalCase(
      String caseId, crm.LegalCase data) async {
    final request = crm.UpdateLegalCaseRequest(caseId: caseId, caseData: data);
    final response = await _client.updateLegalCase(request,
        options: GrpcClient().getCallOptions());
    return response.legalCase;
  }

  Future<void> deleteLegalCase(String caseId) async {
    final request = crm.DeleteLegalCaseRequest(caseId: caseId);
    await _client.deleteLegalCase(request,
        options: GrpcClient().getCallOptions());
  }
}

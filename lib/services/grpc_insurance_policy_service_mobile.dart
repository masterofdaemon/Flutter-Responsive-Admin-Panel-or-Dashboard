import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcInsurancePolicyService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.InsurancePolicy>> listInsurancePolicies(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListInsurancePoliciesRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listInsurancePolicies(request,
          options: GrpcClient().getCallOptions());
      return response.insurancePolicies;
    } on GrpcError catch (e) {
      print('gRPC error during listInsurancePolicies: $e');
      rethrow;
    }
  }

  Future<crm.InsurancePolicy> createInsurancePolicy(
      crm.InsurancePolicy policy) async {
    final request = crm.CreateInsurancePolicyRequest(insurancePolicy: policy);
    final response = await _client.createInsurancePolicy(request,
        options: GrpcClient().getCallOptions());
    return await getInsurancePolicy(response.policyId.toString());
  }

  Future<crm.InsurancePolicy> getInsurancePolicy(String policyId) async {
    final request =
        crm.GetInsurancePolicyRequest(policyId: int.tryParse(policyId) ?? 0);
    final response = await _client.getInsurancePolicy(request,
        options: GrpcClient().getCallOptions());
    return response.insurancePolicy;
  }

  Future<crm.InsurancePolicy> updateInsurancePolicy(
      String policyId, crm.InsurancePolicy data) async {
    final request = crm.UpdateInsurancePolicyRequest(
        policyId: int.tryParse(policyId) ?? 0, policyData: data);
    final response = await _client.updateInsurancePolicy(request,
        options: GrpcClient().getCallOptions());
    return response.insurancePolicy;
  }

  Future<void> deleteInsurancePolicy(String policyId) async {
    final request =
        crm.DeleteInsurancePolicyRequest(policyId: int.tryParse(policyId) ?? 0);
    await _client.deleteInsurancePolicy(request,
        options: GrpcClient().getCallOptions());
  }
}

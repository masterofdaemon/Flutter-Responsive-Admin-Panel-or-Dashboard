import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcPartnerService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.Partner>> listPartners(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListPartnersRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listPartners(request,
          options: GrpcClient().getCallOptions());
      return response.partners;
    } on GrpcError catch (e) {
      print('gRPC error during listPartners: $e');
      rethrow;
    }
  }

  Future<crm.Partner> createPartner(crm.Partner partner) async {
    final request = crm.CreatePartnerRequest(partner: partner);
    final response = await _client.createPartner(request,
        options: GrpcClient().getCallOptions());
    return await getPartner(response.partnerId);
  }

  Future<crm.Partner> getPartner(int partnerId) async {
    final request = crm.GetPartnerRequest(partnerId: partnerId);
    final response = await _client.getPartner(request,
        options: GrpcClient().getCallOptions());
    return response.partner;
  }

  Future<crm.Partner> updatePartner(int partnerId, crm.Partner data) async {
    final request =
        crm.UpdatePartnerRequest(partnerId: partnerId, partnerData: data);
    final response = await _client.updatePartner(request,
        options: GrpcClient().getCallOptions());
    return response.partner;
  }

  Future<void> deletePartner(int partnerId) async {
    final request = crm.DeletePartnerRequest(partnerId: partnerId);
    await _client.deletePartner(request,
        options: GrpcClient().getCallOptions());
  }
}

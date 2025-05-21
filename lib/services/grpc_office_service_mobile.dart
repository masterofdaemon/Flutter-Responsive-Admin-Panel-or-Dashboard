import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcOfficeService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.Office>> listOffices(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListOfficesRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listOffices(request,
          options: GrpcClient().getCallOptions());
      return response.offices;
    } on GrpcError catch (e) {
      print('gRPC error during listOffices: $e');
      rethrow;
    }
  }

  Future<crm.Office> createOffice(crm.Office office) async {
    final request = crm.CreateOfficeRequest(office: office);
    final response = await _client.createOffice(request,
        options: GrpcClient().getCallOptions());
    return await getOffice(response.officeId);
  }

  Future<crm.Office> getOffice(int officeId) async {
    final request = crm.GetOfficeRequest(officeId: officeId);
    final response = await _client.getOffice(request,
        options: GrpcClient().getCallOptions());
    return response.office;
  }

  Future<crm.Office> updateOffice(int officeId, crm.Office data) async {
    final request =
        crm.UpdateOfficeRequest(officeId: officeId, officeData: data);
    final response = await _client.updateOffice(request,
        options: GrpcClient().getCallOptions());
    return response.office;
  }

  Future<void> deleteOffice(int officeId) async {
    final request = crm.DeleteOfficeRequest(officeId: officeId);
    await _client.deleteOffice(request, options: GrpcClient().getCallOptions());
  }
}

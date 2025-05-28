import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/services/grpc_client.dart';
import 'package:grpc/grpc.dart';

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
    try {
      final response = await _client.createOffice(request,
          options: GrpcClient().getCallOptions());
      // Assuming the create RPC returns the created office with its ID
      // If it returns an ID, you might want to fetch the full office object:
      // return await getOffice(response.officeId.toString());
      // For now, let's assume it returns the full office or we adapt based on actual proto definition
      // If CreateOfficeResponse only has office_id, then we need a getOffice call here.
      // Let's assume for now the backend returns the created office in the response or we adjust later.
      // For simplicity, if CreateOfficeResponse contains the created office directly:
      // return response.office; // This depends on the .proto definition of CreateOfficeResponse
      // Based on the proto, CreateOfficeResponse has office_id. So we should fetch.
      return await getOffice(response.officeId.toString());
    } on GrpcError catch (e) {
      print('gRPC error during createOffice: $e');
      rethrow;
    }
  }

  Future<crm.Office> getOffice(String officeId) async {
    final request = crm.GetOfficeRequest(officeId: int.tryParse(officeId) ?? 0);
    try {
      final response = await _client.getOffice(request,
          options: GrpcClient().getCallOptions());
      return response.office;
    } on GrpcError catch (e) {
      print('gRPC error during getOffice: $e');
      rethrow;
    }
  }

  Future<crm.Office> updateOffice(
      String officeId, crm.Office officeData) async {
    final request = crm.UpdateOfficeRequest(
        officeId: int.tryParse(officeId) ?? 0, officeData: officeData);
    try {
      final response = await _client.updateOffice(request,
          options: GrpcClient().getCallOptions());
      return response.office;
    } on GrpcError catch (e) {
      print('gRPC error during updateOffice: $e');
      rethrow;
    }
  }

  Future<void> deleteOffice(String officeId) async {
    final request =
        crm.DeleteOfficeRequest(officeId: int.tryParse(officeId) ?? 0);
    try {
      await _client.deleteOffice(request,
          options: GrpcClient().getCallOptions());
    } on GrpcError catch (e) {
      print('gRPC error during deleteOffice: $e');
      rethrow;
    }
  }
}

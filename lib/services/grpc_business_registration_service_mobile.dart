import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcBusinessRegistrationService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.BusinessRegistration>> listBusinessRegistrations(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListBusinessRegistrationsRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listBusinessRegistrations(request,
          options: GrpcClient().getCallOptions());
      return response.businessRegistrations;
    } on GrpcError catch (e) {
      print('gRPC error during listBusinessRegistrations: $e');
      rethrow;
    }
  }

  Future<crm.BusinessRegistration> createBusinessRegistration(
      crm.BusinessRegistration registration) async {
    final request = crm.CreateBusinessRegistrationRequest(
        businessRegistration: registration);
    final response = await _client.createBusinessRegistration(request,
        options: GrpcClient().getCallOptions());
    return await getBusinessRegistration(response.requestId);
  }

  Future<crm.BusinessRegistration> getBusinessRegistration(
      String requestId) async {
    final request = crm.GetBusinessRegistrationRequest(requestId: requestId);
    final response = await _client.getBusinessRegistration(request,
        options: GrpcClient().getCallOptions());
    return response.businessRegistration;
  }

  Future<crm.BusinessRegistration> updateBusinessRegistration(
      String requestId, crm.BusinessRegistration data) async {
    final request = crm.UpdateBusinessRegistrationRequest(
        requestId: requestId, registrationData: data);
    final response = await _client.updateBusinessRegistration(request,
        options: GrpcClient().getCallOptions());
    return response.businessRegistration;
  }

  Future<void> deleteBusinessRegistration(String requestId) async {
    final request = crm.DeleteBusinessRegistrationRequest(requestId: requestId);
    await _client.deleteBusinessRegistration(request,
        options: GrpcClient().getCallOptions());
  }
}

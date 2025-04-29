import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcTrainingEnrollmentService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.TrainingEnrollment>> listTrainingEnrollments(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListTrainingEnrollmentsRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listTrainingEnrollments(request,
          options: GrpcClient().getCallOptions());
      return response.trainingEnrollments;
    } on GrpcError catch (e) {
      print('gRPC error during listTrainingEnrollments: $e');
      rethrow;
    }
  }

  Future<crm.TrainingEnrollment> createTrainingEnrollment(
      crm.TrainingEnrollment enrollment) async {
    final request =
        crm.CreateTrainingEnrollmentRequest(trainingEnrollment: enrollment);
    final response = await _client.createTrainingEnrollment(request,
        options: GrpcClient().getCallOptions());
    return await getTrainingEnrollment(response.enrollmentId);
  }

  Future<crm.TrainingEnrollment> getTrainingEnrollment(
      String enrollmentId) async {
    final request =
        crm.GetTrainingEnrollmentRequest(enrollmentId: enrollmentId);
    final response = await _client.getTrainingEnrollment(request,
        options: GrpcClient().getCallOptions());
    return response.trainingEnrollment;
  }

  Future<crm.TrainingEnrollment> updateTrainingEnrollment(
      String enrollmentId, crm.TrainingEnrollment data) async {
    final request = crm.UpdateTrainingEnrollmentRequest(
        enrollmentId: enrollmentId, enrollmentData: data);
    final response = await _client.updateTrainingEnrollment(request,
        options: GrpcClient().getCallOptions());
    return response.trainingEnrollment;
  }

  Future<void> deleteTrainingEnrollment(String enrollmentId) async {
    final request =
        crm.DeleteTrainingEnrollmentRequest(enrollmentId: enrollmentId);
    await _client.deleteTrainingEnrollment(request,
        options: GrpcClient().getCallOptions());
  }
}

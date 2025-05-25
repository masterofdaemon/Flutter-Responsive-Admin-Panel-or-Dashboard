import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcTrainingCourseService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.TrainingCourse>> listTrainingCourses(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListTrainingCoursesRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listTrainingCourses(request,
          options: GrpcClient().getCallOptions());
      return response.trainingCourses;
    } on GrpcError catch (e) {
      print('gRPC error during listTrainingCourses: $e');
      rethrow;
    }
  }

  Future<crm.TrainingCourse> createTrainingCourse(
      crm.TrainingCourse course) async {
    final request = crm.CreateTrainingCourseRequest(trainingCourse: course);
    final response = await _client.createTrainingCourse(request,
        options: GrpcClient().getCallOptions());
    return await getTrainingCourse(response.courseId.toString());
  }

  Future<crm.TrainingCourse> getTrainingCourse(String courseId) async {
    final request =
        crm.GetTrainingCourseRequest(courseId: int.tryParse(courseId) ?? 0);
    final response = await _client.getTrainingCourse(request,
        options: GrpcClient().getCallOptions());
    return response.trainingCourse;
  }

  Future<crm.TrainingCourse> updateTrainingCourse(
      String courseId, crm.TrainingCourse data) async {
    final request = crm.UpdateTrainingCourseRequest(
        courseId: int.tryParse(courseId) ?? 0, courseData: data);
    final response = await _client.updateTrainingCourse(request,
        options: GrpcClient().getCallOptions());
    return response.trainingCourse;
  }

  Future<void> deleteTrainingCourse(String courseId) async {
    final request =
        crm.DeleteTrainingCourseRequest(courseId: int.tryParse(courseId) ?? 0);
    await _client.deleteTrainingCourse(request,
        options: GrpcClient().getCallOptions());
  }
}

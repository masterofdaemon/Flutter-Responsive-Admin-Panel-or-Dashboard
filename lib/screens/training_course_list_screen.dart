import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_training_course_service_mobile.dart';
import 'training_course_form_screen.dart';

class TrainingCourseListScreen extends StatefulWidget {
  const TrainingCourseListScreen({super.key});

  @override
  State<TrainingCourseListScreen> createState() =>
      _TrainingCourseListScreenState();
}

class _TrainingCourseListScreenState extends State<TrainingCourseListScreen> {
  final GrpcTrainingCourseService _service = GrpcTrainingCourseService();
  late Future<List<crm.TrainingCourse>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  void _loadCourses() {
    setState(() {
      _coursesFuture = _service.listTrainingCourses(pageSize: 100);
    });
  }

  void _navigateToForm({String? courseId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingCourseFormScreen(courseId: courseId),
      ),
    );
    if (result == true) {
      _loadCourses();
    }
  }

  Future<void> _deleteCourse(String courseId) async {
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Course?'),
          content: const Text('Are you sure you want to delete this course?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );
      if (confirm == true) {
        await _service.deleteTrainingCourse(courseId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Course deleted successfully')),
        );
        _loadCourses();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting course: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Courses'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Course',
            onPressed: () => _navigateToForm(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadCourses(),
        child: FutureBuilder<List<crm.TrainingCourse>>(
          future: _coursesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No training courses found.'));
            }
            final courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title:
                        Text(course.name.isNotEmpty ? course.name : 'No Name'),
                    subtitle: Text(
                        'Price: ${course.price}\nCommission: ${course.commissionPercent}%'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: 'Edit Course',
                          onPressed: () =>
                              _navigateToForm(courseId: course.courseId),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete Course',
                          onPressed: () => _deleteCourse(course.courseId),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

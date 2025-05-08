import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_training_course_service_mobile.dart';
import 'training_course_form_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context);
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(localizations.trainingCourseListScreenConfirmDeleteTitle),
          content:
              Text(localizations.trainingCourseListScreenConfirmDeleteContent),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(localizations.trainingCourseListScreenActionCancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(localizations.trainingCourseListScreenActionDelete),
            ),
          ],
        ),
      );
      if (confirm == true) {
        await _service.deleteTrainingCourse(courseId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  localizations.trainingCourseListScreenFeedbackSuccessDelete)),
        );
        _loadCourses();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .trainingCourseListScreenFeedbackErrorDelete(e.toString()))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.trainingCourseListScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).maybePop();
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }
          },
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: localizations.trainingCourseListScreenTooltipAdd,
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
              return Center(
                  child: Text(
                      localizations.trainingCourseListScreenErrorLoading(
                          snapshot.error.toString())));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                      localizations.trainingCourseListScreenNoCoursesFound));
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
                    title: Text(course.name.isNotEmpty
                        ? course.name
                        : localizations.trainingCourseListScreenListItemNoName),
                    subtitle: Text(
                        localizations.trainingCourseListScreenListItemSubtitle(
                      course.price.toString(),
                      course.commissionPercent.toString(),
                    )),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip:
                              localizations.trainingCourseListScreenTooltipEdit,
                          onPressed: () =>
                              _navigateToForm(courseId: course.courseId),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: localizations
                              .trainingCourseListScreenTooltipDelete,
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

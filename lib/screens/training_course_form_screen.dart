import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_training_course_service_mobile.dart';

class TrainingCourseFormScreen extends StatefulWidget {
  final String? courseId;
  const TrainingCourseFormScreen({super.key, this.courseId});

  @override
  State<TrainingCourseFormScreen> createState() =>
      _TrainingCourseFormScreenState();
}

class _TrainingCourseFormScreenState extends State<TrainingCourseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcTrainingCourseService _service = GrpcTrainingCourseService();
  bool _isLoading = false;
  bool _isEditMode = false;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _commissionController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.courseId != null;
    if (_isEditMode) {
      _loadCourse();
    }
  }

  Future<void> _loadCourse() async {
    setState(() => _isLoading = true);
    try {
      final course = await _service.getTrainingCourse(widget.courseId!);
      _nameController.text = course.name;
      _priceController.text = course.price.toString();
      _commissionController.text = course.commissionPercent.toString();
      _descriptionController.text = course.description;
      _notesController.text = course.notes;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading course: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveCourse() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final course = crm.TrainingCourse(
        courseId: widget.courseId ?? '',
        name: _nameController.text.trim(),
        price: double.tryParse(_priceController.text.trim()) ?? 0.0,
        commissionPercent:
            double.tryParse(_commissionController.text.trim()) ?? 0.0,
        description: _descriptionController.text.trim(),
        notes: _notesController.text.trim(),
      );
      if (_isEditMode) {
        await _service.updateTrainingCourse(widget.courseId!, course);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Course updated successfully')),
        );
      } else {
        await _service.createTrainingCourse(course);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Course created successfully')),
        );
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving course: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _commissionController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Course' : 'Add Course'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration:
                          const InputDecoration(labelText: 'Course Name'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _commissionController,
                      decoration: const InputDecoration(
                          labelText: 'Commission Percent'),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'Notes'),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveCourse,
                        child: Text(
                            _isEditMode ? 'Update Course' : 'Create Course'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_interaction_service.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:admin/generated/google/protobuf/timestamp.pb.dart' as pb;

class InteractionFormScreen extends StatefulWidget {
  final String? interactionId;
  const InteractionFormScreen({Key? key, this.interactionId}) : super(key: key);
  @override
  _InteractionFormScreenState createState() => _InteractionFormScreenState();
}

class _InteractionFormScreenState extends State<InteractionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = getGrpcInteractionService();
  bool _isEdit = false;
  bool _loading = false;

  final _typeCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _endTimeCtrl = TextEditingController();
  DateTime? _date;
  DateTime? _endTime;
  bool _isScheduled = false;
  bool _isCompleted = false;
  final _notesFocus = FocusNode();

  List<crm.Client> _clients = [];
  List<crm.Employee> _employees = [];
  String? _selectedClientId;
  String? _selectedEmployeeId;
  String _clientFilter = '';
  String _employeeFilter = '';

  @override
  void initState() {
    super.initState();
    _isEdit = widget.interactionId != null;
    _fetchDropdownData();
    if (_isEdit) _loadData();
  }

  Future<void> _fetchDropdownData() async {
    try {
      final clients = await _service.getAllClients();
      final employees = await _service.getAllEmployees();
      setState(() {
        _clients = clients;
        _employees = employees;
      });
    } catch (e) {
      // Optionally handle error
    }
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);
    try {
      final i = await _service.getInteraction(widget.interactionId!);
      _selectedClientId = i.clientId;
      _selectedEmployeeId = i.employeeId;
      _typeCtrl.text = i.type;
      _descriptionCtrl.text = i.description;
      _subjectCtrl.text = i.subject;
      _isScheduled = i.isScheduled;
      _isCompleted = i.isCompleted;
      _notesCtrl.text = i.notes;
      if (i.hasDate()) {
        _date =
            DateTime.fromMillisecondsSinceEpoch(i.date.seconds.toInt() * 1000);
        _dateCtrl.text = DateFormat('yyyy-MM-dd').format(_date!);
      }
      if (i.hasEndTime()) {
        _endTime = DateTime.fromMillisecondsSinceEpoch(
            i.endTime.seconds.toInt() * 1000);
        _endTimeCtrl.text = DateFormat('yyyy-MM-dd HH:mm').format(_endTime!);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error loading: $e')));
      Navigator.pop(context);
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final interaction = crm.Interaction(
      interactionId: _isEdit ? widget.interactionId : null,
      clientId: _selectedClientId ?? '',
      employeeId: _selectedEmployeeId ?? '',
      type: _typeCtrl.text.trim(),
      description: _descriptionCtrl.text.trim(),
      subject: _subjectCtrl.text.trim(),
      isScheduled: _isScheduled,
      isCompleted: _isCompleted,
      notes: _notesCtrl.text.trim(),
    );
    if (_date != null) {
      interaction.date = pb.Timestamp.fromDateTime(_date!);
    }
    if (_endTime != null) {
      interaction.endTime = pb.Timestamp.fromDateTime(_endTime!);
    }

    try {
      if (_isEdit) {
        await _service.updateInteraction(widget.interactionId!, interaction);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Updated')));
      } else {
        await _service.createInteraction(interaction);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Created')));
      }
      Navigator.pop(context, true);
    } on GrpcError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('gRPC error: ${e.message}')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    // Remove unused controllers
    //_clientIdCtrl.dispose();
    //_employeeIdCtrl.dispose();
    _typeCtrl.dispose();
    _descriptionCtrl.dispose();
    _dateCtrl.dispose();
    _subjectCtrl.dispose();
    _endTimeCtrl.dispose();
    _notesCtrl.dispose();
    _notesFocus.dispose();
    _service.shutdown();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _date = picked;
        _dateCtrl.text = DateFormat('yyyy-MM-dd').format(_date!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Interaction' : 'Add Interaction'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _loading ? null : _save,
          )
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Client Dropdown with filter ---
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Filter Clients'),
                      onChanged: (v) => setState(() => _clientFilter = v),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedClientId,
                      items: _clients
                          .where((c) =>
                              c.firstName
                                  .toLowerCase()
                                  .contains(_clientFilter.toLowerCase()) ||
                              c.lastName
                                  .toLowerCase()
                                  .contains(_clientFilter.toLowerCase()) ||
                              c.email
                                  .toLowerCase()
                                  .contains(_clientFilter.toLowerCase()))
                          .map((c) => DropdownMenuItem(
                                value: c.clientId,
                                child: Text(
                                    '${c.firstName} ${c.lastName} (${c.email})'),
                              ))
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _selectedClientId = val),
                      decoration: InputDecoration(labelText: 'Client'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 8),
                    // --- Employee Dropdown with filter ---
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Filter Employees'),
                      onChanged: (v) => setState(() => _employeeFilter = v),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedEmployeeId,
                      items: _employees
                          .where((e) =>
                              e.name
                                  .toLowerCase()
                                  .contains(_employeeFilter.toLowerCase()) ||
                              e.email
                                  .toLowerCase()
                                  .contains(_employeeFilter.toLowerCase()))
                          .map((e) => DropdownMenuItem(
                                value: e.employeeId,
                                child: Text('${e.name} (${e.email})'),
                              ))
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _selectedEmployeeId = val),
                      decoration: InputDecoration(labelText: 'Employee'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: _pickDate,
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            hintText: 'Select date',
                          ),
                          controller: _dateCtrl,
                          validator: (v) => _date == null ? 'Required' : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _typeCtrl,
                      decoration: InputDecoration(labelText: 'Type'),
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _descriptionCtrl,
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _subjectCtrl,
                      decoration: InputDecoration(labelText: 'Subject'),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        final now = DateTime.now();
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _endTime ?? now,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            _endTime = picked;
                            _endTimeCtrl.text = DateFormat('yyyy-MM-dd HH:mm')
                                .format(_endTime!);
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'End Time',
                            hintText: 'Select end time',
                          ),
                          controller: _endTimeCtrl,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                          value: _isScheduled,
                          onChanged: (v) =>
                              setState(() => _isScheduled = v ?? false),
                        ),
                        Text('Scheduled'),
                        SizedBox(width: 16),
                        Checkbox(
                          value: _isCompleted,
                          onChanged: (v) =>
                              setState(() => _isCompleted = v ?? false),
                        ),
                        Text('Completed'),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _notesCtrl,
                      focusNode: _notesFocus,
                      decoration: InputDecoration(labelText: 'Notes'),
                      maxLines: 2,
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _loading ? null : _save,
                        child: Text(_isEdit ? 'Update' : 'Create'),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

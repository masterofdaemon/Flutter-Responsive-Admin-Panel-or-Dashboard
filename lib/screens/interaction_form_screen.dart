import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_interaction_service_mobile.dart'; // Corrected import
import 'package:admin/services/grpc_client_service_mobile.dart'; // Added for fetching clients
import 'package:admin/services/grpc_employee_service_mobile.dart'; // Added for fetching employees
import 'package:grpc/grpc.dart'; // Added for GrpcError
import 'package:admin/generated/google/protobuf/timestamp.pb.dart'
    as $2; // Correct alias for Timestamp
import 'package:intl/intl.dart'; // Added for DateFormat

class InteractionFormScreen extends StatefulWidget {
  final crm.Interaction? interaction; // Optional for editing

  const InteractionFormScreen({Key? key, this.interaction}) : super(key: key);

  @override
  _InteractionFormScreenState createState() => _InteractionFormScreenState();
}

class _InteractionFormScreenState extends State<InteractionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  // Ensure all controllers and state variables are defined
  late TextEditingController _notesController;
  late TextEditingController
      _subjectCtrl; // Assuming this exists based on errors
  late TextEditingController
      _descriptionCtrl; // Assuming this exists based on errors
  String? _selectedClientId;
  String? _selectedEmployeeId;
  DateTime? _selectedInteractionDate; // Renamed from _date for clarity
  DateTime? _selectedEndTime; // Renamed from _endTime for clarity
  crm.InteractionType _selectedInteractionType =
      crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED;
  bool _isScheduled = false; // Assuming this exists
  bool _isCompleted = false; // Assuming this exists

  // Instantiate services directly
  final GrpcInteractionService _interactionService = GrpcInteractionService();
  final GrpcClientService _clientService =
      GrpcClientService(); // Instantiate client service
  final GrpcEmployeeService _employeeService =
      GrpcEmployeeService(); // Instantiate employee service

  List<crm.Client> _clients = [];
  List<crm.Employee> _employees = [];
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers using widget.interaction
    _notesController =
        TextEditingController(text: widget.interaction?.notes ?? '');
    _subjectCtrl = TextEditingController(
        text: widget.interaction?.subject ?? ''); // Initialize
    _descriptionCtrl = TextEditingController(
        text: widget.interaction?.description ?? ''); // Initialize
    _selectedClientId = widget.interaction?.clientId;
    _selectedEmployeeId = widget.interaction?.employeeId;
    _selectedInteractionType = widget.interaction?.type ??
        crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED;
    _isScheduled = widget.interaction?.isScheduled ?? false; // Initialize
    _isCompleted = widget.interaction?.isCompleted ?? false; // Initialize

    // Initialize dates from Timestamps using correct field names and has... methods
    if (widget.interaction?.hasDate() ?? false) {
      // Use hasDate()
      _selectedInteractionDate =
          widget.interaction!.date.toDateTime(); // Use date field
    }
    if (widget.interaction?.hasEndTime() ?? false) {
      // Use hasEndTime()
      _selectedEndTime =
          widget.interaction!.endTime.toDateTime(); // Use endTime field
    }

    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      // Fetch clients and employees using their respective services
      final clientsFuture =
          _clientService.listClients(pageSize: 1000); // Fetch all for dropdown
      final employeesFuture = _employeeService.listEmployees(
          pageSize: 1000); // Fetch all for dropdown

      final results = await Future.wait([clientsFuture, employeesFuture]);
      _clients = results[0] as List<crm.Client>;
      _employees = results[1] as List<crm.Employee>;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load initial data: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveInteraction() async {
    if (!_formKey.currentState!.validate()) {
      return; // Don't save if form is invalid
    }
    setState(() {
      _isSaving = true;
    });

    // Create or update the interaction object using correct field names
    final interactionData = crm.Interaction(
      interactionId:
          widget.interaction?.interactionId ?? '', // Keep ID for update
      clientId: _selectedClientId ?? '', // Ensure non-null for proto
      employeeId: _selectedEmployeeId ?? '', // Ensure non-null for proto
      type: _selectedInteractionType,
      notes: _notesController.text,
      subject: _subjectCtrl.text,
      description: _descriptionCtrl.text,
      isScheduled: _isScheduled,
      isCompleted: _isCompleted,
      // Convert DateTime back to Timestamp using $2 alias and correct field names
      date: _selectedInteractionDate != null
          ? $2.Timestamp.fromDateTime(_selectedInteractionDate!)
          : null, // Use date field
      endTime: _selectedEndTime != null
          ? $2.Timestamp.fromDateTime(_selectedEndTime!)
          : null, // Use endTime field
    );

    try {
      if (widget.interaction == null) {
        // Create new interaction
        await _interactionService.createInteraction(interactionData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Interaction created successfully')),
        );
      } else {
        // Update existing interaction
        await _interactionService.updateInteraction(
            interactionData.interactionId, interactionData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Interaction updated successfully')),
        );
      }
      Navigator.of(context).pop(true); // Indicate success
    } on GrpcError catch (e) {
      // Catch GrpcError
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to save interaction: ${e.message ?? e}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  // Helper function to select date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedInteractionDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedInteractionDate) {
      setState(() {
        _selectedInteractionDate = picked;
      });
    }
  }

  // Helper function to select end time
  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
          _selectedEndTime ?? _selectedInteractionDate ?? DateTime.now()),
    );
    if (pickedTime != null) {
      setState(() {
        final now = _selectedInteractionDate ?? DateTime.now();
        _selectedEndTime = DateTime(
            now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.interaction == null
            ? 'Add Interaction'
            : 'Edit Interaction'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _isSaving ? null : _saveInteraction,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Client Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedClientId,
                      decoration: const InputDecoration(labelText: 'Client'),
                      items: _clients.map((crm.Client client) {
                        return DropdownMenuItem<String>(
                          value: client.clientId,
                          child: Text('${client.firstName} ${client.lastName}'),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedClientId = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a client' : null,
                    ),
                    const SizedBox(height: 16),

                    // Employee Dropdown - Use employee.name
                    DropdownButtonFormField<String>(
                      value: _selectedEmployeeId,
                      decoration: const InputDecoration(labelText: 'Employee'),
                      items: _employees.map((crm.Employee employee) {
                        return DropdownMenuItem<String>(
                          value: employee.employeeId,
                          child: Text(employee.name.isNotEmpty
                              ? employee.name
                              : employee
                                  .employeeId), // Use name field, fallback to ID
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedEmployeeId = newValue;
                        });
                      },
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please select an employee'
                          : null,
                    ),
                    const SizedBox(height: 16),

                    // Interaction Type Dropdown
                    DropdownButtonFormField<crm.InteractionType>(
                      value: _selectedInteractionType,
                      decoration:
                          const InputDecoration(labelText: 'Interaction Type'),
                      items: crm.InteractionType.values
                          .where((type) =>
                              type !=
                              crm.InteractionType
                                  .INTERACTION_TYPE_UNSPECIFIED) // Exclude unspecified
                          .map((crm.InteractionType type) {
                        return DropdownMenuItem<crm.InteractionType>(
                          value: type,
                          child: Text(type.name
                              .replaceFirst('INTERACTION_TYPE_', '')
                              .replaceAll('_', ' ')),
                        );
                      }).toList(),
                      onChanged: (crm.InteractionType? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedInteractionType = newValue;
                          });
                        }
                      },
                      validator: (value) => value ==
                              crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED
                          ? 'Please select a type'
                          : null,
                    ),
                    const SizedBox(height: 16),

                    // Interaction Date Picker
                    ListTile(
                      title: Text(
                          'Interaction Date: ${_selectedInteractionDate == null ? 'Not set' : DateFormat('yyyy-MM-dd').format(_selectedInteractionDate!)}'),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () => _selectDate(context),
                    ),
                    const SizedBox(height: 16),

                    // End Time Picker
                    ListTile(
                      title: Text(
                          'End Time: ${_selectedEndTime == null ? 'Not set' : DateFormat('HH:mm').format(_selectedEndTime!)}'),
                      trailing: const Icon(Icons.access_time),
                      onTap: () => _selectEndTime(context),
                    ),
                    const SizedBox(height: 16),

                    // Subject Field
                    TextFormField(
                      controller: _subjectCtrl,
                      decoration: const InputDecoration(labelText: 'Subject'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a subject';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Description Field
                    TextFormField(
                      controller: _descriptionCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),

                    // Notes Field
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'Notes'),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),

                    // Is Scheduled Checkbox
                    CheckboxListTile(
                      title: const Text('Scheduled'),
                      value: _isScheduled,
                      onChanged: (bool? value) {
                        setState(() {
                          _isScheduled = value ?? false;
                        });
                      },
                    ),

                    // Is Completed Checkbox
                    CheckboxListTile(
                      title: const Text('Completed'),
                      value: _isCompleted,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCompleted = value ?? false;
                        });
                      },
                    ),

                    if (_isSaving) ...[
                      const SizedBox(height: 16),
                      const Center(child: CircularProgressIndicator()),
                    ]
                  ],
                ),
              ),
            ),
    );
  }
}

// Helper extension for capitalizing strings (optional, place in a utils file)
// ...existing code...

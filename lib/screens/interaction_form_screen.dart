import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_interaction_service_mobile.dart';
import 'package:admin/services/grpc_client_service_mobile.dart';
import 'package:admin/services/grpc_employee_service_mobile.dart';
import 'package:grpc/grpc.dart';
import 'package:admin/generated/google/protobuf/timestamp.pb.dart' as $2;
import 'package:intl/intl.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/l10n/app_localizations.dart';

class InteractionFormScreen extends StatefulWidget {
  final crm.Interaction? interaction;

  const InteractionFormScreen({Key? key, this.interaction}) : super(key: key);

  @override
  _InteractionFormScreenState createState() => _InteractionFormScreenState();
}

class _InteractionFormScreenState extends State<InteractionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _summaryController;
  late TextEditingController _notesController;
  String? _selectedClientId;
  String? _selectedManagerId;
  DateTime? _selectedInteractionDate;
  crm.InteractionType _selectedInteractionType =
      crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED;

  final GrpcInteractionService _interactionService = GrpcInteractionService();
  final GrpcClientService _clientService = GrpcClientService();
  final GrpcEmployeeService _employeeService = GrpcEmployeeService();

  List<crm.Client> _clients = [];
  List<crm.Employee> _employees = []; // Will be used for managers
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _summaryController =
        TextEditingController(text: widget.interaction?.summary ?? '');
    _notesController =
        TextEditingController(text: widget.interaction?.notes ?? '');
    _selectedClientId = widget.interaction?.clientId.toString();
    _selectedManagerId = widget.interaction?.managerId.toString();
    _selectedInteractionType = widget.interaction?.type ??
        crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED;

    if (widget.interaction?.hasInteractionDate() ?? false) {
      _selectedInteractionDate =
          widget.interaction!.interactionDate.toDateTime();
    }

    _loadInitialData();
  }

  @override
  void dispose() {
    _summaryController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isLoading = true;
    });
    // final localizations = AppLocalizations.of(context); // Get localizations if needed for error messages
    try {
      final clientsFuture = _clientService.listClients(pageSize: 1000);
      final managersFuture = _employeeService.listEmployees(
          pageSize: 1000); // Assuming employees are managers

      final results = await Future.wait([clientsFuture, managersFuture]);
      _clients = results[0] as List<crm.Client>;
      _employees = results[1] as List<crm.Employee>;
    } catch (e) {
      // Consider using localizations for error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading data: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveInteraction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isSaving = true;
    });
    final localizations = AppLocalizations.of(context);

    final interactionData = crm.Interaction(
      interactionId: widget.interaction?.interactionId ??
          0, // Keep as int for crm.Interaction
      clientId: _selectedClientId != null && _selectedClientId!.isNotEmpty
          ? int.tryParse(_selectedClientId!) ?? 0
          : 0,
      managerId: _selectedManagerId != null && _selectedManagerId!.isNotEmpty
          ? int.tryParse(_selectedManagerId!) ?? 0
          : 0,
      type: _selectedInteractionType,
      summary: _summaryController.text,
      notes: _notesController.text,
      interactionDate: _selectedInteractionDate != null
          ? $2.Timestamp.fromDateTime(_selectedInteractionDate!)
          : null,
    );

    try {
      if (widget.interaction == null) {
        await _interactionService.createInteraction(interactionData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  localizations.interactionFormScreenFeedbackSuccessCreate)),
        );
      } else {
        await _interactionService.updateInteraction(
            widget.interaction!.interactionId,
            interactionData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  localizations.interactionFormScreenFeedbackSuccessUpdate)),
        );
      }
      Navigator.of(context).pop(true);
    } on GrpcError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                localizations.interactionFormScreenFeedbackErrorSaving(
                    e.message ?? e.toString()))),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .interactionFormScreenFeedbackErrorUnexpected(e.toString()))),
      );
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.interaction == null
            ? localizations.interactionFormScreenTitleAdd
            : localizations.interactionFormScreenTitleEdit),
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
                    DropdownButtonFormField<String>(
                      value: _selectedClientId,
                      decoration: InputDecoration(
                          labelText:
                              localizations.interactionFormScreenLabelClient),
                      items: _clients.map((crm.Client client) {
                        return DropdownMenuItem<String>(
                          value: client.clientId.toString(),
                          child: Text('${client.firstName} ${client.lastName}'),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedClientId = newValue;
                        });
                      },
                      validator: (value) => value == null
                          ? localizations
                              .interactionFormScreenValidationSelectClient
                          : null,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedManagerId,
                      decoration: InputDecoration(
                          labelText: localizations
                              .interactionFormScreenLabelEmployee), // Reusing Employee label
                      items: _employees.map((crm.Employee employee) {
                        return DropdownMenuItem<String>(
                          value: employee.employeeId.toString(),
                          child: Text(employee.name.isNotEmpty
                              ? employee.name
                              : employee.employeeId.toString()),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedManagerId = newValue;
                        });
                      },
                      validator: (value) => value == null || value.isEmpty
                          ? localizations
                              .interactionFormScreenValidationSelectEmployee // Reusing Employee validation
                          : null,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<crm.InteractionType>(
                      value: _selectedInteractionType,
                      decoration: InputDecoration(
                          labelText: localizations
                              .interactionFormScreenLabelInteractionType),
                      items: crm.InteractionType.values
                          .where((type) =>
                              type !=
                              crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED)
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
                          ? localizations
                              .interactionFormScreenValidationSelectType
                          : null,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: Text(
                          localizations
                              .interactionFormScreenLabelInteractionDate(
                                  _selectedInteractionDate ==
                                          null
                                      ? localizations
                                          .interactionFormScreenLabelDateNotSet
                                      : DateFormat('yyyy-MM-dd')
                                          .format(_selectedInteractionDate!))),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () => _selectDate(context),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _summaryController,
                      decoration: const InputDecoration(
                          labelText: 'Summary'), // Placeholder label
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a summary'; // Placeholder validation
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                          labelText:
                              localizations.interactionFormScreenLabelNotes),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
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

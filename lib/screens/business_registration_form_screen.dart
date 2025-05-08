import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_business_registration_service_mobile.dart';
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/screens/main/main_screen.dart';

class BusinessRegistrationFormScreen extends StatefulWidget {
  final String? requestId;
  const BusinessRegistrationFormScreen({super.key, this.requestId});

  @override
  State<BusinessRegistrationFormScreen> createState() =>
      _BusinessRegistrationFormScreenState();
}

class _BusinessRegistrationFormScreenState
    extends State<BusinessRegistrationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcBusinessRegistrationService _service =
      GrpcBusinessRegistrationService();
  bool _isLoading = false;
  bool _isEditMode = false;

  final _clientIdController = TextEditingController();
  final _managerIdController = TextEditingController();
  final _bankIdController = TextEditingController();
  final _paymentIdController = TextEditingController();
  final _notesController = TextEditingController();

  crm.RegistrationType? _registrationType;
  crm.Status? _status;
  DateTime? _applicationDate;
  DateTime? _registrationDate;
  bool _agentCommissionReceived = false;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.requestId != null;
    if (_isEditMode) {
      _loadRegistration();
    }
  }

  Future<void> _loadRegistration() async {
    setState(() => _isLoading = true);
    try {
      final reg = await _service.getBusinessRegistration(widget.requestId!);
      _clientIdController.text = reg.clientId;
      _managerIdController.text = reg.managerId;
      _bankIdController.text = reg.bankId;
      _paymentIdController.text = reg.paymentId;
      _notesController.text = reg.notes;
      _registrationType = reg.registrationType;
      _status = reg.status;
      _applicationDate =
          reg.hasApplicationDate() ? reg.applicationDate.toDateTime() : null;
      _registrationDate =
          reg.hasRegistrationDate() ? reg.registrationDate.toDateTime() : null;
      _agentCommissionReceived = reg.agentCommissionReceived;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading registration: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveRegistration() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final reg = crm.BusinessRegistration(
        requestId: widget.requestId ?? '',
        clientId: _clientIdController.text.trim(),
        managerId: _managerIdController.text.trim(),
        bankId: _bankIdController.text.trim(),
        paymentId: _paymentIdController.text.trim(),
        notes: _notesController.text.trim(),
        registrationType: _registrationType ??
            crm.RegistrationType.REGISTRATION_TYPE_UNSPECIFIED,
        status: _status ?? crm.Status.STATUS_UNSPECIFIED,
        applicationDate: _applicationDate != null
            ? dateTimeToTimestamp(_applicationDate!)
            : null,
        registrationDate: _registrationDate != null
            ? dateTimeToTimestamp(_registrationDate!)
            : null,
        agentCommissionReceived: _agentCommissionReceived,
      );
      if (_isEditMode) {
        await _service.updateBusinessRegistration(widget.requestId!, reg);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration updated successfully')),
        );
      } else {
        await _service.createBusinessRegistration(reg);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration created successfully')),
        );
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving registration: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _pickDate(BuildContext context, bool isApplication) async {
    final initialDate = isApplication
        ? _applicationDate ?? DateTime.now()
        : _registrationDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isApplication) {
          _applicationDate = picked;
        } else {
          _registrationDate = picked;
        }
      });
    }
  }

  @override
  void dispose() {
    _clientIdController.dispose();
    _managerIdController.dispose();
    _bankIdController.dispose();
    _paymentIdController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Registration' : 'Add Registration'),
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
                      controller: _clientIdController,
                      decoration: const InputDecoration(labelText: 'Client ID'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _managerIdController,
                      decoration:
                          const InputDecoration(labelText: 'Manager ID'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _bankIdController,
                      decoration: const InputDecoration(labelText: 'Bank ID'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<crm.RegistrationType>(
                      value: _registrationType,
                      items: crm.RegistrationType.values
                          .where((t) =>
                              t !=
                              crm.RegistrationType
                                  .REGISTRATION_TYPE_UNSPECIFIED)
                          .map((t) => DropdownMenuItem(
                                value: t,
                                child: Text(t.name),
                              ))
                          .toList(),
                      onChanged: (t) => setState(() => _registrationType = t),
                      decoration:
                          const InputDecoration(labelText: 'Registration Type'),
                      validator: (v) => v == null ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<crm.Status>(
                      value: _status,
                      items: crm.Status.values
                          .where((s) => s != crm.Status.STATUS_UNSPECIFIED)
                          .map((s) => DropdownMenuItem(
                                value: s,
                                child: Text(s.name),
                              ))
                          .toList(),
                      onChanged: (s) => setState(() => _status = s),
                      decoration: const InputDecoration(labelText: 'Status'),
                      validator: (v) => v == null ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(_applicationDate != null
                              ? 'Application: ${formatDate(_applicationDate!)}'
                              : 'Application Date'),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(context, true),
                          child: const Text('Pick'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(_registrationDate != null
                              ? 'Registration: ${formatDate(_registrationDate!)}'
                              : 'Registration Date'),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(context, false),
                          child: const Text('Pick'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _paymentIdController,
                      decoration:
                          const InputDecoration(labelText: 'Payment ID'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'Notes'),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Agent Commission Received'),
                      value: _agentCommissionReceived,
                      onChanged: (v) =>
                          setState(() => _agentCommissionReceived = v),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveRegistration,
                        child: Text(_isEditMode
                            ? 'Update Registration'
                            : 'Create Registration'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_business_registration_service_mobile.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:admin/services/grpc_employee_service.dart';
import 'package:admin/services/grpc_bank_service.dart';
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
  final GrpcClientService _clientService = GrpcClientService();
  final GrpcEmployeeService _employeeService = GrpcEmployeeService();
  final GrpcBankService _bankService = GrpcBankService();
  bool _isLoading = false;
  bool _isEditMode = false;

  final _paymentIdController = TextEditingController();
  final _notesController = TextEditingController();

  crm.Client? _selectedClient;
  crm.Employee? _selectedManager;
  crm.Bank? _selectedBank;
  crm.RegistrationType? _registrationType;
  crm.Status? _status;
  DateTime? _applicationDate;
  DateTime? _registrationDate;
  bool _agentCommissionReceived = false;

  List<crm.Client> _clients = [];
  List<crm.Employee> _managers = [];
  List<crm.Bank> _banks = [];

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.requestId != null;
    // Don't load dropdown data here, wait for didChangeDependencies
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadDropdownData();
    if (_isEditMode) {
      _loadRegistration();
    }
  }

  Future<void> _loadDropdownData() async {
    try {
      final results = await Future.wait([
        _clientService.listClients(pageSize: 100),
        _employeeService.listEmployees(pageSize: 100),
        _bankService.listBanks(pageSize: 100),
      ]);

      setState(() {
        _clients = results[0] as List<crm.Client>;
        _managers = (results[1] as List<crm.Employee>)
            .where((e) =>
                e.role == crm.EmployeeRole.MANAGER ||
                e.role == crm.EmployeeRole.CHIEF_MANAGER ||
                e.role == crm.EmployeeRole.DIRECTOR)
            .toList();
        _banks = results[2] as List<crm.Bank>;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading dropdown data: $e')),
        );
      }
    }
  }

  Future<void> _loadRegistration() async {
    setState(() => _isLoading = true);
    try {
      final reg = await _service.getBusinessRegistration(widget.requestId!);

      // Find matching objects for dropdowns
      _selectedClient = _clients.firstWhere(
        (c) => c.clientId == reg.clientId,
        orElse: () => crm.Client()..clientId = reg.clientId,
      );
      _selectedManager = _managers.firstWhere(
        (m) => m.employeeId == reg.managerId,
        orElse: () => crm.Employee()..employeeId = reg.managerId,
      );
      _selectedBank = _banks.firstWhere(
        (b) => b.bankId == reg.bankId,
        orElse: () => crm.Bank()..bankId = reg.bankId,
      );

      _paymentIdController.text = reg.paymentId.toString();
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
        requestId:
            widget.requestId != null ? int.tryParse(widget.requestId!) ?? 0 : 0,
        clientId: _selectedClient?.clientId ?? 0,
        managerId: _selectedManager?.employeeId ?? 0,
        bankId: _selectedBank?.bankId ?? 0,
        paymentId: int.tryParse(_paymentIdController.text.trim()) ?? 0,
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
                    // Client Dropdown
                    DropdownButtonFormField<crm.Client>(
                      value: _selectedClient,
                      hint: const Text('Select Client'),
                      isExpanded: true,
                      items: _clients.map((crm.Client client) {
                        return DropdownMenuItem<crm.Client>(
                          value: client,
                          child: Text(
                            '${client.firstName} ${client.lastName}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (crm.Client? newValue) {
                        setState(() {
                          _selectedClient = newValue;
                        });
                      },
                      validator: (value) => value == null ? 'Required' : null,
                      decoration: const InputDecoration(
                        labelText: 'Client',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Manager Dropdown
                    DropdownButtonFormField<crm.Employee>(
                      value: _selectedManager,
                      hint: const Text('Select Manager'),
                      isExpanded: true,
                      items: _managers.map((crm.Employee manager) {
                        return DropdownMenuItem<crm.Employee>(
                          value: manager,
                          child: Text(
                            manager.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (crm.Employee? newValue) {
                        setState(() {
                          _selectedManager = newValue;
                        });
                      },
                      validator: (value) => value == null ? 'Required' : null,
                      decoration: const InputDecoration(
                        labelText: 'Manager',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Bank Dropdown
                    DropdownButtonFormField<crm.Bank>(
                      value: _selectedBank,
                      hint: const Text('Select Bank'),
                      isExpanded: true,
                      items: _banks.map((crm.Bank bank) {
                        return DropdownMenuItem<crm.Bank>(
                          value: bank,
                          child: Text(
                            bank.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (crm.Bank? newValue) {
                        setState(() {
                          _selectedBank = newValue;
                        });
                      },
                      validator: (value) => value == null ? 'Required' : null,
                      decoration: const InputDecoration(
                        labelText: 'Bank',
                        border: OutlineInputBorder(),
                      ),
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
                      decoration: const InputDecoration(
                          labelText: 'Payment ID'), // No longer "Optional"
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Payment ID is required.'; // Make it required
                        }
                        final n = int.tryParse(value.trim());
                        if (n == null) {
                          return 'Please enter a valid number.';
                        }
                        if (n <= 0) {
                          return 'Payment ID must be a positive number.';
                        }
                        return null;
                      },
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

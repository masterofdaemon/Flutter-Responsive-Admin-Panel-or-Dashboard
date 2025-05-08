import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_lending_application_service_mobile.dart';
import 'package:admin/services/grpc_client_service_mobile.dart';
import 'package:admin/services/grpc_employee_service_mobile.dart';
import 'package:admin/services/grpc_bank_service_mobile.dart';
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/l10n/app_localizations.dart'; // Import AppLocalizations

class LendingApplicationFormScreen extends StatefulWidget {
  final String? requestId;
  const LendingApplicationFormScreen({super.key, this.requestId});

  @override
  State<LendingApplicationFormScreen> createState() =>
      _LendingApplicationFormScreenState();
}

class _LendingApplicationFormScreenState
    extends State<LendingApplicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcLendingApplicationService _service =
      GrpcLendingApplicationService();
  final GrpcClientService _clientService = GrpcClientService();
  final GrpcEmployeeService _employeeService = GrpcEmployeeService();
  final GrpcBankService _bankService = GrpcBankService();
  bool _isLoading = false;
  bool _isEditMode = false;

  // Controllers
  final _requestedAmountController = TextEditingController();
  final _approvedAmountController = TextEditingController();
  final _paymentIdController = TextEditingController();
  final _notesController = TextEditingController();
  final _expectedCommissionController = TextEditingController();
  final _companyCommissionPercentController = TextEditingController();
  final _calculatedCommissionAmountController = TextEditingController();

  crm.Client? _selectedClient;
  crm.Employee? _selectedManager;
  crm.Bank? _selectedBank;
  crm.Status? _status;
  DateTime? _applicationDate;
  DateTime? _approvalDate;
  DateTime? _fundsReceivedDate;
  DateTime? _companyContractDate;
  bool _commissionPaid = false;
  bool _agentCommissionReceived = false;

  List<crm.Client> _clients = [];
  List<crm.Employee> _managers = [];
  List<crm.Bank> _banks = [];

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.requestId != null;
    _loadDropdownData().then((_) {
      if (_isEditMode) {
        _loadApplication();
      }
    });
  }

  Future<void> _loadDropdownData() async {
    setState(() => _isLoading = true);
    final localizations = AppLocalizations.of(context);
    try {
      final clients = await _clientService.listClients(pageSize: 1000);
      final managers = await _employeeService.listEmployees(pageSize: 1000);
      final banks = await _bankService.listBanks(pageSize: 1000);
      setState(() {
        _clients = clients;
        _managers = managers;
        _banks = banks;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text(localizations.errorLoadingDropdownMessage(e.toString()))),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadApplication() async {
    setState(() => _isLoading = true);
    final localizations = AppLocalizations.of(context);
    try {
      final app = await _service.getLendingApplication(widget.requestId!);
      _selectedClient = _clients.isEmpty
          ? null
          : _clients
              .where((c) => c.clientId == app.clientId)
              .cast<crm.Client?>()
              .firstWhere((c) => c != null, orElse: () => null);
      _selectedManager = _managers.isEmpty
          ? null
          : _managers
              .where((m) => m.employeeId == app.managerId)
              .cast<crm.Employee?>()
              .firstWhere((m) => m != null, orElse: () => null);
      _selectedBank = _banks.isEmpty
          ? null
          : _banks
              .where((b) => b.bankId == app.bankId)
              .cast<crm.Bank?>()
              .firstWhere((b) => b != null, orElse: () => null);
      _requestedAmountController.text = app.requestedAmount.toString();
      _approvedAmountController.text = app.approvedAmount.toString();
      _paymentIdController.text = app.paymentId;
      _notesController.text = app.notes;
      _expectedCommissionController.text = app.expectedCommission.toString();
      _companyCommissionPercentController.text =
          app.companyCommissionPercent.toString();
      _calculatedCommissionAmountController.text =
          app.calculatedCommissionAmount.toString();
      _status = app.status;
      _applicationDate =
          app.hasApplicationDate() ? app.applicationDate.toDateTime() : null;
      _approvalDate =
          app.hasApprovalDate() ? app.approvalDate.toDateTime() : null;
      _fundsReceivedDate = app.hasFundsReceivedDate()
          ? app.fundsReceivedDate.toDateTime()
          : null;
      _companyContractDate = app.hasCompanyContractDate()
          ? app.companyContractDate.toDateTime()
          : null;
      _commissionPaid = app.commissionPaid;
      _agentCommissionReceived = app.agentCommissionReceived;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                localizations.errorLoadingApplicationMessage(e.toString()))),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveApplication() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    final localizations = AppLocalizations.of(context);
    try {
      final app = crm.LendingApplication(
        requestId: widget.requestId ?? '',
        clientId: _selectedClient?.clientId ?? '',
        managerId: _selectedManager?.employeeId ?? '',
        bankId: _selectedBank?.bankId ?? '',
        requestedAmount:
            double.tryParse(_requestedAmountController.text.trim()) ?? 0.0,
        approvedAmount:
            double.tryParse(_approvedAmountController.text.trim()) ?? 0.0,
        applicationDate: _applicationDate != null
            ? dateTimeToTimestamp(_applicationDate!)
            : null,
        approvalDate:
            _approvalDate != null ? dateTimeToTimestamp(_approvalDate!) : null,
        fundsReceivedDate: _fundsReceivedDate != null
            ? dateTimeToTimestamp(_fundsReceivedDate!)
            : null,
        companyContractDate: _companyContractDate != null
            ? dateTimeToTimestamp(_companyContractDate!)
            : null,
        expectedCommission:
            double.tryParse(_expectedCommissionController.text.trim()) ?? 0.0,
        status: _status ?? crm.Status.STATUS_UNSPECIFIED,
        paymentId: _paymentIdController.text.trim(),
        notes: _notesController.text.trim(),
        companyCommissionPercent:
            double.tryParse(_companyCommissionPercentController.text.trim()) ??
                0.0,
        calculatedCommissionAmount: double.tryParse(
                _calculatedCommissionAmountController.text.trim()) ??
            0.0,
        commissionPaid: _commissionPaid,
        agentCommissionReceived: _agentCommissionReceived,
      );
      if (_isEditMode) {
        await _service.updateLendingApplication(widget.requestId!, app);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations.applicationUpdatedSuccessMessage)),
        );
      } else {
        await _service.createLendingApplication(app);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations.applicationCreatedSuccessMessage)),
        );
      }
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                localizations.errorSavingApplicationMessage(e.toString()))),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _requestedAmountController.dispose();
    _approvedAmountController.dispose();
    _paymentIdController.dispose();
    _notesController.dispose();
    _expectedCommissionController.dispose();
    _companyCommissionPercentController.dispose();
    _calculatedCommissionAmountController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context, DateTime? initialDate,
      ValueChanged<DateTime?> onPicked) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onPicked(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
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
        title: Text(_isEditMode
            ? localizations.editLendingApplicationTitle
            : localizations.addLendingApplicationTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: localizations.saveApplicationTooltip,
            onPressed: _isLoading ? null : _saveApplication,
          ),
        ],
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
                      decoration: InputDecoration(
                          labelText: localizations.clientLabelText),
                      items: _clients
                          .map((c) => DropdownMenuItem(
                                value: c,
                                child: Text(
                                    '${c.firstName} ${c.lastName} (${c.clientId})'),
                              ))
                          .toList(),
                      onChanged: (val) => setState(() => _selectedClient = val),
                      validator: (val) => val == null
                          ? localizations.pleaseSelectClientError
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // Manager Dropdown
                    DropdownButtonFormField<crm.Employee>(
                      value: _selectedManager,
                      decoration: InputDecoration(
                          labelText: localizations.managerLabelText),
                      items: _managers
                          .map((m) => DropdownMenuItem(
                                value: m,
                                child: Text('${m.name} (${m.employeeId})'),
                              ))
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _selectedManager = val),
                      validator: (val) => val == null
                          ? localizations.pleaseSelectManagerError
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // Bank Dropdown
                    DropdownButtonFormField<crm.Bank>(
                      value: _selectedBank,
                      decoration: InputDecoration(
                          labelText: localizations.bankLabelText),
                      items: _banks
                          .map((b) => DropdownMenuItem(
                                value: b,
                                child: Text('${b.name} (${b.bankId})'),
                              ))
                          .toList(),
                      onChanged: (val) => setState(() => _selectedBank = val),
                      validator: (val) => val == null
                          ? localizations.pleaseSelectBankError
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // Requested Amount
                    TextFormField(
                      controller: _requestedAmountController,
                      decoration: InputDecoration(
                          labelText: localizations.requestedAmountLabelText),
                      keyboardType: TextInputType.number,
                      validator: (val) => val == null || val.isEmpty
                          ? localizations.enterRequestedAmountError
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // Approved Amount
                    TextFormField(
                      controller: _approvedAmountController,
                      decoration: InputDecoration(
                          labelText: localizations.approvedAmountLabelText),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    // Application Date
                    Row(
                      children: [
                        Expanded(
                          child: Text(localizations.applicationDateLabelText(
                              _applicationDate != null
                                  ? formatDate(_applicationDate!)
                                  : '-')),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(context, _applicationDate,
                              (d) => setState(() => _applicationDate = d)),
                          child: Text(localizations.pickDateButtonText),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Approval Date
                    Row(
                      children: [
                        Expanded(
                          child: Text(localizations.approvalDateLabelText(
                              _approvalDate != null
                                  ? formatDate(_approvalDate!)
                                  : '-')),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(context, _approvalDate,
                              (d) => setState(() => _approvalDate = d)),
                          child: Text(localizations.pickDateButtonText),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Funds Received Date
                    Row(
                      children: [
                        Expanded(
                          child: Text(localizations.fundsReceivedDateLabelText(
                              _fundsReceivedDate != null
                                  ? formatDate(_fundsReceivedDate!)
                                  : '-')),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(
                              context,
                              _fundsReceivedDate,
                              (d) => setState(() => _fundsReceivedDate = d)),
                          child: Text(localizations.pickDateButtonText),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Company Contract Date
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              localizations.companyContractDateLabelText(
                                  _companyContractDate != null
                                      ? formatDate(_companyContractDate!)
                                      : '-')),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(
                              context,
                              _companyContractDate,
                              (d) => setState(() => _companyContractDate = d)),
                          child: Text(localizations.pickDateButtonText),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Expected Commission
                    TextFormField(
                      controller: _expectedCommissionController,
                      decoration: InputDecoration(
                          labelText: localizations.expectedCommissionLabelText),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    // Status Dropdown
                    DropdownButtonFormField<crm.Status>(
                      value: _status,
                      decoration: InputDecoration(
                          labelText: localizations.statusLabelText),
                      items: crm.Status.values
                          .where((s) => s != crm.Status.STATUS_UNSPECIFIED)
                          .map((s) => DropdownMenuItem(
                                value: s,
                                child: Text(s.name
                                    .replaceFirst('STATUS_', '')
                                    .replaceAll('_',
                                        ' ')), // Consider localizing status names if needed
                              ))
                          .toList(),
                      onChanged: (val) => setState(() => _status = val),
                      validator: (val) => val == null
                          ? localizations.pleaseSelectStatusError
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // Payment ID
                    TextFormField(
                      controller: _paymentIdController,
                      decoration: InputDecoration(
                          labelText: localizations.paymentIdLabelText),
                    ),
                    const SizedBox(height: 16),
                    // Notes
                    TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .notesLabelTextShort), // Reused notesLabelText
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    // Company Commission Percent
                    TextFormField(
                      controller: _companyCommissionPercentController,
                      decoration: InputDecoration(
                          labelText:
                              localizations.companyCommissionPercentLabelText),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    // Calculated Commission Amount
                    TextFormField(
                      controller: _calculatedCommissionAmountController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .calculatedCommissionAmountLabelText),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    // Commission Paid
                    SwitchListTile(
                      title: Text(localizations.commissionPaidLabelText),
                      value: _commissionPaid,
                      onChanged: (val) => setState(() => _commissionPaid = val),
                    ),
                    // Agent Commission Received
                    SwitchListTile(
                      title:
                          Text(localizations.agentCommissionReceivedLabelText),
                      value: _agentCommissionReceived,
                      onChanged: (val) =>
                          setState(() => _agentCommissionReceived = val),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton.icon(
                        icon: Icon(_isEditMode
                            ? Icons.save
                            : Icons.add_circle_outline),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: Text(_isEditMode
                              ? localizations.updateApplicationButtonText
                              : localizations.createApplicationButtonText),
                        ),
                        onPressed: _isLoading ? null : _saveApplication,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

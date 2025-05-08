import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_insurance_policy_service_mobile.dart';
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/l10n/app_localizations.dart';

class InsurancePolicyFormScreen extends StatefulWidget {
  final String? policyId;
  const InsurancePolicyFormScreen({super.key, this.policyId});

  @override
  State<InsurancePolicyFormScreen> createState() =>
      _InsurancePolicyFormScreenState();
}

class _InsurancePolicyFormScreenState extends State<InsurancePolicyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcInsurancePolicyService _service = GrpcInsurancePolicyService();
  bool _isLoading = false;
  bool _isEditMode = false;

  // Controllers
  final _policyNumberController = TextEditingController();
  final _clientIdController = TextEditingController();
  final _managerIdController = TextEditingController();
  final _amountController = TextEditingController();
  final _renewalStatusController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime? _startDate;
  DateTime? _expiryDate;
  crm.Status? _status;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.policyId != null;
    if (_isEditMode) {
      // Defer context-dependent operations until after the first frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _loadPolicy();
        }
      });
    }
  }

  Future<void> _loadPolicy() async {
    if (!mounted) return; // Ensure widget is still mounted
    setState(() => _isLoading = true);
    final localizations = AppLocalizations.of(context);
    try {
      final policy = await _service.getInsurancePolicy(widget.policyId!);
      if (!mounted) return;
      _policyNumberController.text = policy.policyNumber;
      _clientIdController.text = policy.clientId;
      _managerIdController.text = policy.managerId;
      _amountController.text = policy.amount.toString();
      _renewalStatusController.text = policy.renewalStatus;
      _notesController.text = policy.notes;
      _startDate = policy.hasStartDate() ? policy.startDate.toDateTime() : null;
      _expiryDate =
          policy.hasExpiryDate() ? policy.expiryDate.toDateTime() : null;
      _status = policy.status;
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .insurancePolicyFormScreenFeedbackErrorLoading(e.toString()))),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _savePolicy() async {
    if (!_formKey.currentState!.validate()) return;
    if (!mounted) return;
    setState(() => _isLoading = true);
    final localizations = AppLocalizations.of(context);
    try {
      final policy = crm.InsurancePolicy(
        policyId: widget.policyId ?? '',
        policyNumber: _policyNumberController.text.trim(),
        clientId: _clientIdController.text.trim(),
        managerId: _managerIdController.text.trim(),
        amount: double.tryParse(_amountController.text.trim()) ?? 0.0,
        renewalStatus: _renewalStatusController.text.trim(),
        notes: _notesController.text.trim(),
        status: _status ?? crm.Status.STATUS_UNSPECIFIED,
        startDate: _startDate != null ? dateTimeToTimestamp(_startDate!) : null,
        expiryDate:
            _expiryDate != null ? dateTimeToTimestamp(_expiryDate!) : null,
      );
      if (_isEditMode) {
        await _service.updateInsurancePolicy(widget.policyId!, policy);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .insurancePolicyFormScreenFeedbackSuccessUpdate)),
        );
      } else {
        await _service.createInsurancePolicy(policy);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .insurancePolicyFormScreenFeedbackSuccessCreate)),
        );
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .insurancePolicyFormScreenFeedbackErrorSaving(e.toString()))),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _policyNumberController.dispose();
    _clientIdController.dispose();
    _managerIdController.dispose();
    _amountController.dispose();
    _renewalStatusController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final localizations = AppLocalizations.of(context);
    final initialDate =
        isStart ? _startDate ?? DateTime.now() : _expiryDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: isStart
          ? localizations.insurancePolicyFormScreenLabelStartDate
          : localizations.insurancePolicyFormScreenLabelExpiryDate,
      confirmText: localizations.insurancePolicyFormScreenPickDateButton,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _expiryDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode
            ? localizations.insurancePolicyFormScreenTitleEdit
            : localizations.insurancePolicyFormScreenTitleAdd),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).maybePop();
            } else {
              // Ensure MainScreen is also localized if it needs context for AppLocalizations
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainScreen()), // MainScreen might need localization context
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
                      controller: _policyNumberController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .insurancePolicyFormScreenLabelPolicyNumber),
                      validator: (v) => v == null || v.isEmpty
                          ? localizations
                              .insurancePolicyFormScreenValidationRequired
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _clientIdController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .insurancePolicyFormScreenLabelClientId),
                      validator: (v) => v == null || v.isEmpty
                          ? localizations
                              .insurancePolicyFormScreenValidationRequired
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _managerIdController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .insurancePolicyFormScreenLabelManagerId),
                      validator: (v) => v == null || v.isEmpty
                          ? localizations
                              .insurancePolicyFormScreenValidationRequired
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .insurancePolicyFormScreenLabelAmount),
                      keyboardType: TextInputType.number,
                      validator: (v) => v == null || v.isEmpty
                          ? localizations
                              .insurancePolicyFormScreenValidationRequired
                          : null,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(_startDate != null
                              ? localizations
                                  .insurancePolicyFormScreenLabelStartDateWithValue(
                                      formatDate(_startDate!))
                              : localizations
                                  .insurancePolicyFormScreenLabelStartDate),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(context, true),
                          child: Text(localizations
                              .insurancePolicyFormScreenPickDateButton),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(_expiryDate != null
                              ? localizations
                                  .insurancePolicyFormScreenLabelExpiryDateWithValue(
                                      formatDate(_expiryDate!))
                              : localizations
                                  .insurancePolicyFormScreenLabelExpiryDate),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(context, false),
                          child: Text(localizations
                              .insurancePolicyFormScreenPickDateButton),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<crm.Status>(
                      value: _status,
                      items: crm.Status.values
                          .where((s) => s != crm.Status.STATUS_UNSPECIFIED)
                          .map((s) => DropdownMenuItem(
                                value: s,
                                child: Text(s
                                    .name), // Assuming crm.Status.name is not user-facing or already handled
                              ))
                          .toList(),
                      onChanged: (s) => setState(() => _status = s),
                      decoration: InputDecoration(
                          labelText: localizations
                              .insurancePolicyFormScreenLabelStatus),
                      validator: (v) => v == null
                          ? localizations
                              .insurancePolicyFormScreenValidationRequired
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _renewalStatusController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .insurancePolicyFormScreenLabelRenewalStatus),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .insurancePolicyFormScreenLabelNotes),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _savePolicy,
                        child: Text(_isEditMode
                            ? localizations
                                .insurancePolicyFormScreenButtonUpdate
                            : localizations
                                .insurancePolicyFormScreenButtonCreate),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

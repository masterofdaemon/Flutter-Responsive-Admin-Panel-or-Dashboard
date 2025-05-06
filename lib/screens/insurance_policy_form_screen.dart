import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_insurance_policy_service_mobile.dart';
import 'package:admin/utils/timestamp_helpers.dart';

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
      _loadPolicy();
    }
  }

  Future<void> _loadPolicy() async {
    setState(() => _isLoading = true);
    try {
      final policy = await _service.getInsurancePolicy(widget.policyId!);
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading policy: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _savePolicy() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Policy updated successfully')),
        );
      } else {
        await _service.createInsurancePolicy(policy);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Policy created successfully')),
        );
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving policy: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
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
    final initialDate =
        isStart ? _startDate ?? DateTime.now() : _expiryDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Policy' : 'Add Policy'),
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
                      controller: _policyNumberController,
                      decoration:
                          const InputDecoration(labelText: 'Policy Number'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
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
                      controller: _amountController,
                      decoration: const InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(_startDate != null
                              ? 'Start: ${formatDate(_startDate!)}'
                              : 'Start Date'),
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
                          child: Text(_expiryDate != null
                              ? 'Expiry: ${formatDate(_expiryDate!)}'
                              : 'Expiry Date'),
                        ),
                        TextButton(
                          onPressed: () => _pickDate(context, false),
                          child: const Text('Pick'),
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
                                child: Text(s.name),
                              ))
                          .toList(),
                      onChanged: (s) => setState(() => _status = s),
                      decoration: const InputDecoration(labelText: 'Status'),
                      validator: (v) => v == null ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _renewalStatusController,
                      decoration:
                          const InputDecoration(labelText: 'Renewal Status'),
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
                        onPressed: _isLoading ? null : _savePolicy,
                        child: Text(
                            _isEditMode ? 'Update Policy' : 'Create Policy'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

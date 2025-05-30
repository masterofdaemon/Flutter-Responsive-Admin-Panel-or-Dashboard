import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_legal_case_service_mobile.dart';
import 'package:admin/screens/main/main_screen.dart';

class LegalCaseFormScreen extends StatefulWidget {
  final int? caseId;

  const LegalCaseFormScreen({super.key, this.caseId});

  @override
  State<LegalCaseFormScreen> createState() => _LegalCaseFormScreenState();
}

class _LegalCaseFormScreenState extends State<LegalCaseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcLegalCaseService _service = GrpcLegalCaseService();

  late TextEditingController _clientIdController;
  late TextEditingController _managerIdController;
  late TextEditingController _issueTypeIdController;
  late TextEditingController _partnerIdController;
  late TextEditingController _contractAmountController;
  late TextEditingController _expectedCommissionController;
  late TextEditingController _notesController;
  late TextEditingController _consultationNotesController;

  crm.Status _selectedStatus = crm.Status.DRAFT;

  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    if (widget.caseId != null) {
      _isEditing = true;
      _loadLegalCase();
    }
  }

  void _initializeControllers() {
    _clientIdController = TextEditingController();
    _managerIdController = TextEditingController();
    _issueTypeIdController = TextEditingController();
    _partnerIdController = TextEditingController();
    _contractAmountController = TextEditingController();
    _expectedCommissionController = TextEditingController();
    _notesController = TextEditingController();
    _consultationNotesController = TextEditingController();
  }

  Future<void> _loadLegalCase() async {
    if (widget.caseId == null) return;

    setState(() => _isLoading = true);
    try {
      final legalCase = await _service.getLegalCase(widget.caseId!);
      _populateForm(legalCase);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading legal case: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _populateForm(crm.LegalCase legalCase) {
    _clientIdController.text = legalCase.clientId.toString();
    _managerIdController.text = legalCase.managerId.toString();
    _issueTypeIdController.text = legalCase.issueTypeId.toString();
    _partnerIdController.text =
        legalCase.hasPartnerId() ? legalCase.partnerId.toString() : '';
    _contractAmountController.text = legalCase.contractAmount.toString();
    _expectedCommissionController.text =
        legalCase.expectedCommission.toString();
    _notesController.text = legalCase.hasNotes() ? legalCase.notes : '';
    _consultationNotesController.text =
        legalCase.hasConsultationNotes() ? legalCase.consultationNotes : '';

    _selectedStatus = legalCase.status;
  }

  Future<void> _saveLegalCase() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final legalCase = _buildLegalCase();

      if (_isEditing) {
        await _service.updateLegalCase(widget.caseId!, legalCase);
      } else {
        await _service.createLegalCase(legalCase);
      }

      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving legal case: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  crm.LegalCase _buildLegalCase() {
    final legalCase = crm.LegalCase()
      ..clientId = int.parse(_clientIdController.text)
      ..managerId = int.parse(_managerIdController.text)
      ..issueTypeId = int.parse(_issueTypeIdController.text)
      ..contractAmount = double.parse(_contractAmountController.text)
      ..expectedCommission = double.parse(_expectedCommissionController.text)
      ..status = _selectedStatus;

    if (widget.caseId != null) {
      legalCase.caseId = widget.caseId!;
    }

    if (_partnerIdController.text.isNotEmpty) {
      legalCase.partnerId = int.parse(_partnerIdController.text);
    }

    if (_notesController.text.isNotEmpty) {
      legalCase.notes = _notesController.text;
    }

    if (_consultationNotesController.text.isNotEmpty) {
      legalCase.consultationNotes = _consultationNotesController.text;
    }

    // Add timestamp conversions when needed

    return legalCase;
  }

  @override
  void dispose() {
    _clientIdController.dispose();
    _managerIdController.dispose();
    _issueTypeIdController.dispose();
    _partnerIdController.dispose();
    _contractAmountController.dispose();
    _expectedCommissionController.dispose();
    _notesController.dispose();
    _consultationNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Legal Case' : 'New Legal Case'),
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
        ),
        actions: [
          if (!_isLoading)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveLegalCase,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Basic Information',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _clientIdController,
                              decoration: const InputDecoration(
                                labelText: 'Client ID *',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Client ID is required';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _managerIdController,
                              decoration: const InputDecoration(
                                labelText: 'Manager ID *',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Manager ID is required';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _issueTypeIdController,
                              decoration: const InputDecoration(
                                labelText: 'Issue Type ID *',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Issue Type ID is required';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _partnerIdController,
                              decoration: const InputDecoration(
                                labelText: 'Partner ID (Optional)',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value != null &&
                                    value.isNotEmpty &&
                                    int.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Financial Information',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _contractAmountController,
                              decoration: const InputDecoration(
                                labelText: 'Contract Amount *',
                                border: OutlineInputBorder(),
                                prefixText: '\$ ',
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Contract amount is required';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid amount';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _expectedCommissionController,
                              decoration: const InputDecoration(
                                labelText: 'Expected Commission *',
                                border: OutlineInputBorder(),
                                prefixText: '\$ ',
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Expected commission is required';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid amount';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<crm.Status>(
                              value: _selectedStatus,
                              decoration: const InputDecoration(
                                labelText: 'Status *',
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: crm.Status.DRAFT,
                                    child: Text('Draft')),
                                DropdownMenuItem(
                                    value: crm.Status.ACTIVE,
                                    child: Text('Active')),
                                DropdownMenuItem(
                                    value: crm.Status.COMPLETED,
                                    child: Text('Completed')),
                                DropdownMenuItem(
                                    value: crm.Status.CANCELLED,
                                    child: Text('Cancelled')),
                                DropdownMenuItem(
                                    value: crm.Status.PENDING,
                                    child: Text('Pending')),
                              ],
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() => _selectedStatus = value);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Additional Information',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _notesController,
                              decoration: const InputDecoration(
                                labelText: 'Notes',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _consultationNotesController,
                              decoration: const InputDecoration(
                                labelText: 'Consultation Notes',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveLegalCase,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(_isEditing
                              ? 'Update Legal Case'
                              : 'Create Legal Case'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_bank_service_mobile.dart';
import 'package:admin/screens/main/main_screen.dart';

class BankFormScreen extends StatefulWidget {
  final String? bankId;
  const BankFormScreen({super.key, this.bankId});

  @override
  State<BankFormScreen> createState() => _BankFormScreenState();
}

class _BankFormScreenState extends State<BankFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcBankService _service = GrpcBankService();
  bool _isLoading = false;
  bool _isEditMode = false;

  final _nameController = TextEditingController();
  final _bicController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _accountOpeningCommissionController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.bankId != null;
    if (_isEditMode) {
      _loadBank();
    }
  }

  Future<void> _loadBank() async {
    setState(() => _isLoading = true);
    try {
      final bank = await _service.getBank(widget.bankId!);

      _nameController.text = bank.name;
      _bicController.text = bank.bic;
      _addressController.text = bank.address;
      _contactPersonController.text = bank.contactPerson;
      _accountOpeningCommissionController.text =
          bank.hasAccountOpeningCommission()
              ? bank.accountOpeningCommission.toString()
              : '';
      _notesController.text = bank.notes;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading bank: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveBank() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final bank = crm.Bank(
        bankId: _isEditMode ? int.tryParse(widget.bankId!) ?? 0 : 0,
        name: _nameController.text.trim(),
        bic: _bicController.text.trim(),
        address: _addressController.text.trim(),
        contactPerson: _contactPersonController.text.trim(),
        accountOpeningCommission: _accountOpeningCommissionController
                .text.isNotEmpty
            ? double.tryParse(_accountOpeningCommissionController.text.trim())
            : null,
        notes: _notesController.text.trim(),
      );

      if (_isEditMode) {
        await _service.updateBank(widget.bankId!, bank);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Bank updated successfully')),
          );
        }
      } else {
        await _service.createBank(bank);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Bank created successfully')),
          );
        }
      }

      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving bank: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bicController.dispose();
    _addressController.dispose();
    _contactPersonController.dispose();
    _accountOpeningCommissionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Bank' : 'Create Bank'),
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
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bank Information',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),

                            // Bank Name
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Bank Name *',
                                border: OutlineInputBorder(),
                                hintText: 'Enter bank name',
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Bank name is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // BIC
                            TextFormField(
                              controller: _bicController,
                              decoration: const InputDecoration(
                                labelText: 'BIC (Bank Identifier Code) *',
                                border: OutlineInputBorder(),
                                hintText: 'Enter BIC code',
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'BIC is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Address
                            TextFormField(
                              controller: _addressController,
                              decoration: const InputDecoration(
                                labelText: 'Address',
                                border: OutlineInputBorder(),
                                hintText: 'Enter bank address',
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(height: 16),

                            // Contact Person
                            TextFormField(
                              controller: _contactPersonController,
                              decoration: const InputDecoration(
                                labelText: 'Contact Person',
                                border: OutlineInputBorder(),
                                hintText: 'Enter contact person name',
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Account Opening Commission
                            TextFormField(
                              controller: _accountOpeningCommissionController,
                              decoration: const InputDecoration(
                                labelText: 'Account Opening Commission',
                                border: OutlineInputBorder(),
                                hintText: 'Enter commission amount',
                                prefixText: '\$ ',
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              validator: (value) {
                                if (value != null && value.trim().isNotEmpty) {
                                  if (double.tryParse(value.trim()) == null) {
                                    return 'Please enter a valid number';
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Notes
                            TextFormField(
                              controller: _notesController,
                              decoration: const InputDecoration(
                                labelText: 'Notes',
                                border: OutlineInputBorder(),
                                hintText: 'Enter additional notes',
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Save Button
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _saveBank,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                )
                              : Text(
                                  _isEditMode ? 'Update Bank' : 'Create Bank',
                                  style: const TextStyle(fontSize: 16),
                                ),
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

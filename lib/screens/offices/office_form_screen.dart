import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_office_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart'; // For defaultPadding
import 'package:admin/l10n/app_localizations.dart';

class OfficeFormScreen extends StatefulWidget {
  final String? officeId;
  const OfficeFormScreen({super.key, this.officeId});

  @override
  State<OfficeFormScreen> createState() => _OfficeFormScreenState();
}

class _OfficeFormScreenState extends State<OfficeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcOfficeService _service = GrpcOfficeService();
  bool _isLoading = false;
  bool _isEditMode = false;

  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.officeId != null;
    if (_isEditMode) {
      _loadOfficeData();
    }
  }

  Future<void> _loadOfficeData() async {
    setState(() => _isLoading = true);
    try {
      final office = await _service.getOffice(widget.officeId!);
      _cityController.text = office.city;
      _addressController.text = office.address;
      _phoneController.text = office.phone;
      _notesController.text = office.notes;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)
                .officeFormScreenErrorLoading(e.toString()))),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveOffice() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    final office = crm.Office(
      officeId: _isEditMode ? int.tryParse(widget.officeId!) ?? 0 : 0,
      city: _cityController.text.trim(),
      address: _addressController.text.trim(),
      phone: _phoneController.text.trim(),
      notes: _notesController.text.trim(),
    );

    try {
      if (_isEditMode) {
        await _service.updateOffice(widget.officeId!, office);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  AppLocalizations.of(context).officeFormScreenSuccessUpdated)),
        );
      } else {
        await _service.createOffice(office);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  AppLocalizations.of(context).officeFormScreenSuccessCreated)),
        );
      }
      if (mounted)
        Navigator.of(context).pop(true); // Return true to indicate success
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)
                .officeFormScreenErrorSaving(e.toString()))),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode
            ? localizations.officeFormScreenTitleEdit
            : localizations.officeFormScreenTitleAdd),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: localizations.officeFormScreenLabelCity,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return localizations
                              .officeFormScreenValidationCityRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: defaultPadding),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: localizations.officeFormScreenLabelAddress,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: localizations.officeFormScreenLabelPhone,
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: defaultPadding),
                    TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                        labelText: localizations.officeFormScreenLabelNotes,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveOffice,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: Text(_isEditMode
                            ? localizations.officeFormScreenButtonUpdate
                            : localizations.officeFormScreenButtonCreate),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

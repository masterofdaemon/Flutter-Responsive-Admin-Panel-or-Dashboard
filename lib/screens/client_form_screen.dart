import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/generated/google/protobuf/struct.pb.dart' as pb_struct;
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:admin/screens/main/main_screen.dart'; // Added
import 'package:admin/l10n/app_localizations.dart'; // Added

class ClientFormScreen extends StatefulWidget {
  final String? clientId; // Null for Add mode, non-null for Edit mode

  const ClientFormScreen({super.key, this.clientId});

  @override
  State<ClientFormScreen> createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends State<ClientFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcClientService _grpcService = GrpcClientService();
  bool _isLoading = false;
  bool _isEditMode = false;

  // Text Editing Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _telegramIdController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  final _passportDataController = TextEditingController();
  final _notesController = TextEditingController();

  // Enum state variable
  crm.ClientSource? _selectedSource;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.clientId != null;
    if (_isEditMode) {
      _loadClientData();
    } else {
      // For new clients, explicitly set _selectedSource to null or a valid default
      // if CLIENT_SOURCE_UNSPECIFIED is not a valid user choice.
      _selectedSource = null;
    }
  }

  Future<void> _loadClientData() async {
    final localizations = AppLocalizations.of(context);
    setState(() {
      _isLoading = true;
    });
    try {
      final client = await _grpcService.getClient(widget.clientId!);
      setState(() {
        _firstNameController.text = client.firstName;
        _lastNameController.text = client.lastName;
        _emailController.text = client.email;
        _phoneController.text = client.phone;
        _telegramIdController.text = client.telegramId;
        _whatsappNumberController.text = client.whatsappNumber;
        _selectedSource =
            client.source == crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED
                ? null
                : client.source;
        _passportDataController.text = client.hasPassportData()
            ? client.passportData.writeToJson()
            : ''; // Changed here
        _notesController.text = client.notes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .clientFormScreenFeedbackErrorLoading(e.toString()))),
      );
    }
  }

  Future<void> _saveClient() async {
    final localizations = AppLocalizations.of(context);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Trigger onSaved callbacks

      setState(() {
        _isLoading = true;
      });

      // Validate passportData JSON if provided
      pb_struct.Value? parsedPassportData;
      final passportText = _passportDataController.text.trim();
      if (passportText.isNotEmpty) {
        try {
          parsedPassportData = pb_struct.Value.fromJson(passportText);
        } catch (e) {
          // Invalid JSON: show error and abort save
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(localizations
                    .clientFormScreenFeedbackErrorInvalidJson(e.toString()))),
          );
          return;
        }
      }

      // Prepare client data from controllers
      final clientToSave = crm.Client(
        clientId: _isEditMode ? widget.clientId : null,
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        telegramId: _telegramIdController.text.trim(),
        whatsappNumber: _whatsappNumberController.text.trim(),
        source: _selectedSource ??
            crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED, // Use selected enum
        passportData: parsedPassportData, // Use validated JSON
        notes: _notesController.text.trim(),
      );

      try {
        if (_isEditMode) {
          await _grpcService.updateClient(widget.clientId!, clientToSave);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(localizations.clientFormScreenFeedbackSuccessUpdate)),
          );
        } else {
          await _grpcService.createClient(clientToSave);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(localizations.clientFormScreenFeedbackSuccessCreate)),
          );
        }
        Navigator.of(context).pop(true); // Pop screen and indicate success
      } on GrpcError catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations.clientFormScreenFeedbackErrorGrpc(
                  e.message ?? 'Unknown error'))),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .clientFormScreenFeedbackErrorGeneric(e.toString()))),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } else {}
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _telegramIdController.dispose();
    _whatsappNumberController.dispose();
    _passportDataController.dispose();
    _notesController.dispose();
    // Dispose other controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode
            ? localizations.clientFormScreenTitleEdit
            : localizations.clientFormScreenTitleAdd),
        leading: IconButton(
          // Added leading IconButton
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
            tooltip: localizations.clientFormScreenSaveTooltip,
            onPressed: _isLoading ? null : _saveClient,
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
                  children: <Widget>[
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          labelText:
                              localizations.clientFormScreenLabelFirstName),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return localizations
                              .clientFormScreenValidationFirstNameRequired;
                        }
                        if (value.trim().length < 2) {
                          return localizations
                              .clientFormScreenValidationFirstNameMinLength;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                          labelText:
                              localizations.clientFormScreenLabelLastName),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return localizations
                              .clientFormScreenValidationLastNameRequired;
                        }
                        if (value.trim().length < 2) {
                          return localizations
                              .clientFormScreenValidationLastNameMinLength;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: localizations.clientFormScreenLabelEmail),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return localizations
                              .clientFormScreenValidationEmailRequired;
                        }
                        // Basic email validation regex
                        final emailRegex =
                            RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return localizations
                              .clientFormScreenValidationEmailInvalid;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          labelText: localizations.clientFormScreenLabelPhone),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return localizations
                              .clientFormScreenValidationPhoneRequired;
                        }
                        // Add more specific phone validation if needed (e.g., E.164 format)
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _telegramIdController,
                      decoration: InputDecoration(
                          labelText:
                              localizations.clientFormScreenLabelTelegramId),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _whatsappNumberController,
                      decoration: InputDecoration(
                          labelText: localizations
                              .clientFormScreenLabelWhatsappNumber),
                    ),
                    const SizedBox(height: 16),
                    // Dropdown for ClientSource
                    DropdownButtonFormField<crm.ClientSource>(
                      value:
                          _selectedSource, // This will now be null if the original was UNSPECIFIED
                      decoration: InputDecoration(
                          labelText: localizations.clientFormScreenLabelSource),
                      hint: Text(localizations.clientFormScreenHintSource),
                      items: crm.ClientSource.values
                          .where((source) =>
                              source !=
                              crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED)
                          .map((crm.ClientSource source) {
                        return DropdownMenuItem<crm.ClientSource>(
                          value: source,
                          child: Text(source.name
                              .replaceFirst('CLIENT_SOURCE_', '')
                              .replaceAll('_', ' ')), // User-friendly name
                        );
                      }).toList(),
                      onChanged: (crm.ClientSource? newValue) {
                        setState(() {
                          _selectedSource = newValue;
                        });
                      },
                      validator: (value) => value ==
                              null // Simplified validator: null means no valid selection
                          ? localizations
                              .clientFormScreenValidationSourceRequired
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passportDataController,
                      decoration: InputDecoration(
                          labelText:
                              localizations.clientFormScreenLabelPassportData),
                      maxLines: 3,
                      // Add JSON validation if needed
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                          labelText: localizations.clientFormScreenLabelNotes),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveClient,
                        child: Text(_isEditMode
                            ? localizations.clientFormScreenButtonUpdate
                            : localizations.clientFormScreenButtonCreate),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

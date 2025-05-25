import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client_service.dart';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:admin/l10n/app_localizations.dart';

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
  final _middleNameController = TextEditingController(); // Added middle name
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _telegramIdController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  final _passportDataController = TextEditingController();
  final _notesController = TextEditingController();

  // Enum state variable
  crm.ClientSource? _selectedSource;

  // Checkbox states for Telegram/WhatsApp same as phone
  bool _telegramSameAsPhone = false;
  bool _whatsappSameAsPhone = false;

  // (Removed unused _clientIdInt)
  bool _didLoadInitialData = false; // Add this flag

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.clientId != null;
    // DO NOT call _loadClientData here
    if (!_isEditMode) {
      // For new clients, explicitly set _selectedSource to null or a valid default
      // if CLIENT_SOURCE_UNSPECIFIED is not a valid user choice.
      _selectedSource = null;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didLoadInitialData) {
      _didLoadInitialData = true;
      if (_isEditMode) {
        _loadClientData();
      }
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
        _middleNameController.text = client.hasMiddleName()
            ? client.middleName
            : ''; // Handle optional middle name
        _emailController.text =
            client.hasEmail() ? client.email : ''; // Handle optional email
        _phoneController.text = client.phone;
        _telegramIdController.text =
            client.hasTelegramId() ? client.telegramId.toString() : '';
        _whatsappNumberController.text =
            client.hasWhatsappNumber() ? client.whatsappNumber : '';

        // Update checkbox states based on loaded data
        _telegramSameAsPhone = client.hasTelegramId() &&
            client.telegramId.toString() == client.phone;
        _whatsappSameAsPhone =
            client.hasWhatsappNumber() && client.whatsappNumber == client.phone;
        // _selectedSource =
        //     client.source == crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED
        //         ? null
        //         : client.source;
        _passportDataController.text =
            client.hasPassportData() ? client.passportData.writeToJson() : '';
        _notesController.text = client.notes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            localizations.clientFormScreenFeedbackErrorLoading(e.toString()),
          ),
        ),
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

      // Prepare client data from controllers
      final clientToSave = crm.Client(
        clientId: _isEditMode ? int.tryParse(widget.clientId ?? '') ?? 0 : 0,
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        middleName: _middleNameController.text.trim().isNotEmpty
            ? _middleNameController.text.trim()
            : null, // Add middle name field
        email: _emailController.text.trim().isNotEmpty
            ? _emailController.text.trim()
            : null, // Make email optional
        phone: _phoneController.text.trim(),
        telegramId: _telegramIdController.text.trim().isNotEmpty
            ? Int64.parseInt(_telegramIdController.text.trim())
            : Int64(0),
        whatsappNumber: _whatsappNumberController.text.trim().isNotEmpty
            ? _whatsappNumberController.text.trim()
            : null, // Make WhatsApp optional when empty
        // source: _selectedSource ??
        //     crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED, // Use selected enum
        // passportData: For now, keep as null until we implement proper Value type support
        notes: _notesController.text.trim().isNotEmpty
            ? _notesController.text.trim()
            : null, // Make notes optional when empty
      );

      try {
        if (_isEditMode) {
          await _grpcService.updateClient(widget.clientId!, clientToSave);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                localizations.clientFormScreenFeedbackSuccessUpdate,
              ),
            ),
          );
        } else {
          await _grpcService.createClient(clientToSave);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                localizations.clientFormScreenFeedbackSuccessCreate,
              ),
            ),
          );
        }
        Navigator.of(context).pop(true); // Pop screen and indicate success
      } on GrpcError catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              localizations.clientFormScreenFeedbackErrorGrpc(
                e.message ?? 'Unknown error',
              ),
            ),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              localizations.clientFormScreenFeedbackErrorGeneric(e.toString()),
            ),
          ),
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
    _middleNameController.dispose(); // Dispose middle name controller
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
    return Dialog(
      child: Container(
        width: 600,
        constraints: const BoxConstraints(maxHeight: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dialog Header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _isEditMode
                          ? localizations.clientFormScreenTitleEdit
                          : localizations.clientFormScreenTitleAdd,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: MaterialLocalizations.of(
                      context,
                    ).closeButtonTooltip,
                  ),
                ],
              ),
            ),
            // Dialog Body
            Expanded(
              child: _isLoading
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
                                labelText: localizations
                                    .clientFormScreenLabelFirstName,
                              ),
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
                                    localizations.clientFormScreenLabelLastName,
                              ),
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
                            // Middle Name Field (Optional)
                            TextFormField(
                              controller: _middleNameController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .clientFormScreenLabelMiddleName,
                              ),
                              validator: (value) {
                                // Middle name is optional, so no required validation
                                if (value != null &&
                                    value.trim().isNotEmpty &&
                                    value.trim().length < 2) {
                                  return 'Middle name must be at least 2 characters if provided';
                                }
                                return null;
                              },
                            ),
                            // const SizedBox(height: 16),
                            // TextFormField(
                            //   controller: _middleNameController,
                            //   decoration: InputDecoration(
                            //     labelText: localizations
                            //         .clientFormScreenLabelMiddleName,
                            //   ),
                            //   // Middle name is optional, so no validator required
                            // ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.clientFormScreenLabelEmail,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                // Email is optional but should be valid if provided
                                if (value != null && value.trim().isNotEmpty) {
                                  final emailRegex = RegExp(
                                    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                  );
                                  if (!emailRegex.hasMatch(value.trim())) {
                                    return localizations
                                        .clientFormScreenValidationEmailInvalid;
                                  }
                                }
                                return null; // No required validation for email
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.clientFormScreenLabelPhone,
                                hintText: '+7XXXXXXXXXX',
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return localizations
                                      .clientFormScreenValidationPhoneRequired;
                                }
                                // Russian phone number validation: must start with +7 and be 12 digits long
                                final phoneRegex = RegExp(r'^\+7\d{10}$');
                                if (!phoneRegex.hasMatch(value.trim())) {
                                  return localizations
                                      .clientFormScreenValidationPhoneInvalid;
                                }
                                return null;
                              },
                              onChanged: (value) {
                                // Auto-update Telegram and WhatsApp if checkboxes are checked
                                if (_telegramSameAsPhone) {
                                  _telegramIdController.text = value;
                                }
                                if (_whatsappSameAsPhone) {
                                  _whatsappNumberController.text = value;
                                }
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _telegramIdController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .clientFormScreenLabelTelegramId,
                              ),
                              enabled: !_telegramSameAsPhone,
                            ),
                            CheckboxListTile(
                              title: const Text('Same as phone number'),
                              value: _telegramSameAsPhone,
                              onChanged: (value) {
                                setState(() {
                                  _telegramSameAsPhone = value ?? false;
                                  if (_telegramSameAsPhone) {
                                    _telegramIdController.text =
                                        _phoneController.text;
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _whatsappNumberController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .clientFormScreenLabelWhatsappNumber,
                              ),
                              enabled: !_whatsappSameAsPhone,
                            ),
                            CheckboxListTile(
                              title: const Text('Same as phone number'),
                              value: _whatsappSameAsPhone,
                              onChanged: (value) {
                                setState(() {
                                  _whatsappSameAsPhone = value ?? false;
                                  if (_whatsappSameAsPhone) {
                                    _whatsappNumberController.text =
                                        _phoneController.text;
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 16),
                            // Dropdown for ClientSource
                            DropdownButtonFormField<crm.ClientSource>(
                              value:
                                  _selectedSource, // This will now be null if the original was UNSPECIFIED
                              decoration: InputDecoration(
                                labelText:
                                    localizations.clientFormScreenLabelSource,
                              ),
                              hint: Text(
                                localizations.clientFormScreenHintSource,
                              ),
                              items: crm.ClientSource.values
                                  .where(
                                (source) =>
                                    source !=
                                    crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED,
                              )
                                  .map((crm.ClientSource source) {
                                return DropdownMenuItem<crm.ClientSource>(
                                  value: source,
                                  child: Text(
                                    source.name
                                        .replaceFirst('CLIENT_SOURCE_', '')
                                        .replaceAll('_', ' '),
                                  ), // User-friendly name
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
                                labelText: localizations
                                    .clientFormScreenLabelPassportData,
                              ),
                              maxLines: 3,
                              // Add JSON validation if needed
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _notesController,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.clientFormScreenLabelNotes,
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            // Dialog Footer with action buttons
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      MaterialLocalizations.of(context).cancelButtonLabel,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _saveClient,
                    child: Text(
                      _isEditMode
                          ? localizations.clientFormScreenButtonUpdate
                          : localizations.clientFormScreenButtonCreate,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

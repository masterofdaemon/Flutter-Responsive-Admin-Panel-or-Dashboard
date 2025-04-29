import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/generated/google/protobuf/struct.pb.dart' as pb_struct;
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

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
    }
  }

  Future<void> _loadClientData() async {
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
        _selectedSource = client.source; // Use enum value
        _passportDataController.text =
            client.hasPassportData() ? client.passportData.toString() : '';
        _notesController.text = client.notes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading client data: $e')),
      );
    }
  }

  Future<void> _saveClient() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Trigger onSaved callbacks

      setState(() {
        _isLoading = true;
      });

      // Prepare client data from controllers
      // Create a new Client instance instead of rebuilding
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
        passportData: _passportDataController.text.isNotEmpty
            ? pb_struct.Value.fromJson(_passportDataController.text)
            : null,
        notes: _notesController.text.trim(),
      );

      try {
        if (_isEditMode) {
          // Update existing client
          await _grpcService.updateClient(widget.clientId!, clientToSave);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Client updated successfully')),
          );
        } else {
          // Create new client
          await _grpcService.createClient(clientToSave);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Client created successfully')),
          );
        }
        Navigator.of(context).pop(true); // Pop screen and indicate success
      } on GrpcError catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('gRPC Error saving client: ${e.message}')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving client: $e')),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
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
    _grpcService
        .shutdown(); // Shutdown channel if service instance is unique to this screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Client' : 'Add Client'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Save Client',
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
                      decoration:
                          const InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a first name';
                        }
                        if (value.trim().length < 2) {
                          return 'First name must be at least 2 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a last name';
                        }
                        if (value.trim().length < 2) {
                          return 'Last name must be at least 2 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter an email address';
                        }
                        // Basic email validation regex
                        final emailRegex =
                            RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a phone number';
                        }
                        // Add more specific phone validation if needed (e.g., E.164 format)
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _telegramIdController,
                      decoration:
                          const InputDecoration(labelText: 'Telegram ID'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _whatsappNumberController,
                      decoration:
                          const InputDecoration(labelText: 'WhatsApp Number'),
                    ),
                    const SizedBox(height: 16),
                    // Dropdown for ClientSource
                    DropdownButtonFormField<crm.ClientSource>(
                      value: _selectedSource,
                      decoration: const InputDecoration(labelText: 'Source'),
                      items: crm.ClientSource.values
                          .where((source) =>
                              source !=
                              crm.ClientSource
                                  .CLIENT_SOURCE_UNSPECIFIED) // Exclude UNSPECIFIED
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
                      validator: (value) => value == null ||
                              value ==
                                  crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED
                          ? 'Please select a source'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passportDataController,
                      decoration: const InputDecoration(
                          labelText: 'Passport Data (JSON)'),
                      maxLines: 3,
                      // Add JSON validation if needed
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'Notes'),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveClient,
                        child: Text(
                            _isEditMode ? 'Update Client' : 'Create Client'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

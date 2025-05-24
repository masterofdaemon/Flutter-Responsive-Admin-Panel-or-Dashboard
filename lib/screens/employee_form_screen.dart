import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client_service.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';

class EmployeeFormScreen extends StatefulWidget {
  final String? employeeId; // Null for Add mode, non-null for Edit mode

  EmployeeFormScreen({super.key, this.employeeId});

  @override
  State<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcClientService _grpcService = GrpcClientService();
  bool _isLoading = false;
  bool _isEditMode = false;
  Int64? _originalTelegramId; // Added to store original telegramId

  // Text Editing Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _telegramIdController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  final _notesController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  // Dropdown selections
  crm.User? _selectedUser;
  crm.EmployeeRole? _selectedRole;
  crm.Office? _selectedOffice;
  bool _isActive = true;

  // Removed unused _employeeIdInt

  // Data for dropdowns
  List<crm.User> _users = [];
  List<crm.Office> _offices = [];
  final List<crm.EmployeeRole> _roles = crm.EmployeeRole.values
      .where((role) => role != crm.EmployeeRole.EMPLOYEE_ROLE_UNSPECIFIED)
      .toList(); // Exclude unspecified

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.employeeId != null;

    // _roles is already initialized with crm.EmployeeRole.values (excluding UNSPECIFIED)
    // Set initial _selectedRole.
    // For new employees, it defaults to null (prompting "Select Role")
    // or you could default to a specific role if desired, e.g., _roles.first if _roles is not empty.
    // For existing employees, _selectedRole will be set in _loadEmployeeData.
    if (!_isEditMode) {
      // If you want a default selection for new employees, uncomment and adjust:
      // _selectedRole = _roles.isNotEmpty ? _roles.first : null;
      // Or, to keep the "Select Role" hint, ensure _selectedRole is null.
      _selectedRole = null;
    }

    _loadDropdownData(); // Loads users and offices
    if (_isEditMode) {
      _loadEmployeeData(); // Loads employee data, including their role for _selectedRole
    }
  }

  Future<void> _loadDropdownData() async {
    // Don't set isLoading true here if _loadEmployeeData will also run
    if (!_isEditMode) {
      setState(() {
        _isLoading = true;
      });
    }
    try {
      final usersFuture = _grpcService.listUsers();
      final officesFuture = _grpcService.listOffices();

      final results = await Future.wait([usersFuture, officesFuture]);
      _users = results[0] as List<crm.User>;
      _offices = results[1] as List<crm.Office>;

      // If editing, might need to re-run _loadEmployeeData if it finished before dropdowns
      if (_isEditMode && _nameController.text.isEmpty) {
        // Check if employee data needs to be (re)loaded after dropdowns are ready
        // This handles race condition if getEmployee finishes before listUsers/listOffices
        await _loadEmployeeData();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading dropdown data: $e')),
        );
      }
    } finally {
      // Only set loading false if not editing or if employee data also loaded
      if (mounted && (!_isEditMode || _nameController.text.isNotEmpty)) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadEmployeeData() async {
    // Ensure dropdown data is loaded first if needed, or handle loading state
    // Wait for dropdowns only if they haven't loaded yet
    while (_users.isEmpty || _offices.isEmpty) {
      if (!mounted) return; // Exit if widget is disposed
      await Future.delayed(const Duration(milliseconds: 100)); // Wait briefly
    }

    setState(() {
      _isLoading = true; // Ensure loading is true while fetching employee
    });
    try {
      final employee = await _grpcService.getEmployee(widget.employeeId!);
      if (!mounted) return; // Check again after await

      // Safely find User and Office, allowing null if not found
      crm.User? foundUser;
      try {
        foundUser = _users.firstWhere((u) => u.userId == employee.userId);
      } catch (e) {
        // User not found in the list, keep foundUser as null
        print('Warning: User ID ${employee.userId} not found in loaded users.');
      }

      crm.Office? foundOffice;
      try {
        foundOffice =
            _offices.firstWhere((o) => o.officeId == employee.officeId);
      } catch (e) {
        // Office not found in the list, keep foundOffice as null
        print(
            'Warning: Office ID ${employee.officeId} not found in loaded offices.');
      }

      setState(() {
        // _employeeIdInt = employee.employeeId; // Removed, not needed
        _nameController.text = employee.name;
        _emailController.text = employee.email;

        // Store original telegramId and set controller
        _originalTelegramId = employee.telegramId;
        _telegramIdController.text = employee.telegramId.toString();

        _whatsappNumberController.text = employee.whatsappNumber;
        _notesController.text = employee.notes;
        _selectedRole =
            (employee.role == crm.EmployeeRole.EMPLOYEE_ROLE_UNSPECIFIED)
                ? null
                : employee.role;
        _isActive = employee.isActive;

        // Assign the potentially null found user/office
        _selectedUser = foundUser;
        _selectedOffice = foundOffice;

        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading employee data: $e')),
        );
      }
    }
  }

  Future<void> _saveEmployee() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    // Re-validate dropdowns just in case
    if (_selectedUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a User.')),
      );
      return;
    }
    if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a Role.')),
      );
      return;
    }
    if (_selectedOffice == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an Office.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Int64 finalTelegramId;
    final String telegramIdText = _telegramIdController.text.trim();

    if (telegramIdText.isNotEmpty) {
      try {
        finalTelegramId = Int64.parseInt(telegramIdText);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content:
                    Text('Invalid Telegram ID format. Please enter a number.')),
          );
        }
        setState(() => _isLoading = false);
        return; // Stop saving
      }
    } else {
      // Text field is empty
      if (_isEditMode) {
        // In edit mode, if field is cleared, use the original loaded value.
        // _originalTelegramId should have been set in _loadEmployeeData.
        finalTelegramId = _originalTelegramId ??
            Int64(0); // Use original, fallback to 0 if somehow null
      } else {
        // In add mode, if field is empty, default to 0.
        finalTelegramId = Int64(0);
      }
    }

    final employeeData = crm.Employee(
      // employeeId is set by server on create, included for update
      employeeId: _isEditMode ? int.tryParse(widget.employeeId ?? '') ?? 0 : 0,
      userId: _selectedUser!.userId,
      name: _nameController.text.trim(),
      role: _selectedRole!,
      officeId: _selectedOffice!.officeId,
      login: _loginController.text.trim(),
      email: _emailController.text.trim(),
      telegramId: finalTelegramId, // Use the determined telegramId
      whatsappNumber: _whatsappNumberController.text.trim(),
      isActive: _isActive,
      notes: _notesController.text.trim(),
    );

    try {
      if (_isEditMode) {
        await _grpcService.updateEmployee(widget.employeeId!, employeeData);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Employee updated successfully')),
        );
      } else {
        // Call createEmployee with all required named arguments.
        // Passing an empty string for userPassword, assuming backend handles
        // linking to an existing user where password is not newly set.
        await _grpcService.createEmployee(
            employee: employeeData,
            userLogin:
                _loginController.text, // Login of the selected existing user
            userPassword: _passwordController.text
                .trim(), // Assumption: Backend handles empty password for existing user linking
            telegramId:
                employeeData.telegramId // Use the telegramId from the form
            );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Employee created successfully')),
        );
      }
      if (mounted) {
        Navigator.of(context).pop(true); // Pop screen and indicate success
      }
    } on GrpcError catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('gRPC Error saving employee: ${e.message}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving employee: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _telegramIdController.dispose();
    _whatsappNumberController.dispose();
    _notesController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Helper to display role names nicely
  String _getRoleDisplayName(crm.EmployeeRole role) {
    return role.name.replaceFirst('EMPLOYEE_ROLE_', '').replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Dialog(
      child: Container(
        width: 700,
        constraints: const BoxConstraints(maxHeight: 800),
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
                          ? localizations.employeeFormScreenTitleEdit
                          : localizations.employeeFormScreenTitleAdd,
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
                    tooltip:
                        MaterialLocalizations.of(context).closeButtonTooltip,
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
                            // User Dropdown (Customer account)
                            DropdownButtonFormField<crm.User>(
                              value: _selectedUser,
                              hint: Text(localizations
                                  .employeeFormScreenLabelSelectUser),
                              isExpanded: true, // Allow long names
                              items: _users.map((crm.User user) {
                                return DropdownMenuItem<crm.User>(
                                  value: user,
                                  child: Text(user.login,
                                      overflow: TextOverflow.ellipsis),
                                );
                              }).toList(),
                              onChanged: (crm.User? newValue) {
                                setState(() {
                                  _selectedUser = newValue;
                                });
                              },
                              validator: (value) => value == null
                                  ? localizations
                                      .employeeFormScreenValidationUserRequired
                                  : null,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .employeeFormScreenLabelUserAccount,
                                border: const OutlineInputBorder(),
                              ),
                              // Disable if editing (can't change linked user)
                              disabledHint: _selectedUser != null
                                  ? Text(_selectedUser!.login)
                                  : null,
                              onTap: _isEditMode
                                  ? () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(localizations
                                                .employeeFormScreenErrorCannotChangeUser)),
                                      );
                                    }
                                  : null,
                              // Read only visually if editing
                              style: _isEditMode
                                  ? TextStyle(
                                      color: Theme.of(context).disabledColor)
                                  : null,
                            ),
                            const SizedBox(height: 16.0),
                            // Employee Login field
                            TextFormField(
                              controller: _loginController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .employeeFormScreenLabelEmployeeLogin,
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return localizations
                                      .employeeFormScreenValidationLoginRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),
                            // Employee Password field
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .employeeFormScreenLabelEmployeePassword,
                                border: const OutlineInputBorder(),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return localizations
                                      .employeeFormScreenValidationPasswordRequired;
                                }
                                if (value.length < 6) {
                                  return localizations
                                      .employeeFormScreenValidationPasswordMinLength;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),

                            // Name Field
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .employeeFormScreenLabelFullName,
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return localizations
                                      .employeeFormScreenValidationNameRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),

                            // Email Field
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.employeeFormScreenLabelEmail,
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return localizations
                                      .employeeFormScreenValidationEmailRequired;
                                }
                                // Basic email validation
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return localizations
                                      .employeeFormScreenValidationEmailInvalid;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),

                            // Role Dropdown
                            DropdownButtonFormField<crm.EmployeeRole>(
                              value: _selectedRole,
                              hint: Text(localizations
                                  .employeeFormScreenLabelSelectRole),
                              isExpanded: true,
                              items: _roles.map((crm.EmployeeRole role) {
                                return DropdownMenuItem<crm.EmployeeRole>(
                                  value: role,
                                  child: Text(_getRoleDisplayName(role)),
                                );
                              }).toList(),
                              onChanged: (crm.EmployeeRole? newValue) {
                                setState(() {
                                  _selectedRole = newValue;
                                });
                              },
                              validator: (value) => value == null
                                  ? localizations
                                      .employeeFormScreenValidationRoleRequired
                                  : null,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.employeeFormScreenLabelRole,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16.0),

                            // Office Dropdown
                            DropdownButtonFormField<crm.Office>(
                              value: _selectedOffice,
                              hint: Text(localizations
                                  .employeeFormScreenLabelSelectOffice),
                              isExpanded: true,
                              items: _offices.map((crm.Office office) {
                                return DropdownMenuItem<crm.Office>(
                                  value: office,
                                  child: Text(office.city,
                                      overflow: TextOverflow.ellipsis),
                                );
                              }).toList(),
                              onChanged: (crm.Office? newValue) {
                                setState(() {
                                  _selectedOffice = newValue;
                                });
                              },
                              validator: (value) => value == null
                                  ? localizations
                                      .employeeFormScreenValidationOfficeRequired
                                  : null,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.employeeFormScreenLabelOffice,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16.0),

                            // Telegram ID Field
                            TextFormField(
                              controller: _telegramIdController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .employeeFormScreenLabelTelegramId,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16.0),

                            // WhatsApp Number Field
                            TextFormField(
                              controller: _whatsappNumberController,
                              decoration: InputDecoration(
                                labelText: localizations
                                    .employeeFormScreenLabelWhatsappNumber,
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.phone,
                              // Add validator if E.164 format is strict
                            ),
                            const SizedBox(height: 16.0),

                            // Is Active Switch
                            SwitchListTile(
                              title: Text(
                                  localizations.employeeFormScreenLabelActive),
                              value: _isActive,
                              onChanged: (bool value) {
                                setState(() {
                                  _isActive = value;
                                });
                              },
                              secondary: Icon(
                                  _isActive ? Icons.check_circle : Icons.cancel,
                                  color:
                                      _isActive ? Colors.green : Colors.grey),
                            ),
                            const SizedBox(height: 16.0),

                            // Notes Field
                            TextFormField(
                              controller: _notesController,
                              decoration: InputDecoration(
                                labelText:
                                    localizations.employeeFormScreenLabelNotes,
                                border: const OutlineInputBorder(),
                                alignLabelWithHint: true,
                              ),
                              maxLines: 3,
                              textAlignVertical: TextAlignVertical.top,
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
                        MaterialLocalizations.of(context).cancelButtonLabel),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    icon: Icon(_isEditMode
                        ? Icons.save_alt
                        : Icons.add_circle_outline),
                    label: Text(_isEditMode
                        ? localizations.employeeFormScreenButtonUpdate
                        : localizations.employeeFormScreenButtonCreate),
                    onPressed: _isLoading ? null : _saveEmployee,
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

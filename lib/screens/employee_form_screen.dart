import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';

class EmployeeFormScreen extends StatefulWidget {
  final String? employeeId; // Null for Add mode, non-null for Edit mode

  // Remove const from the constructor
  EmployeeFormScreen({super.key, this.employeeId});

  @override
  State<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcClientService _grpcService = GrpcClientService();
  bool _isLoading = false;
  bool _isEditMode = false;

  // Text Editing Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _telegramIdController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  final _notesController = TextEditingController();

  // Dropdown selections
  crm.User? _selectedUser;
  crm.EmployeeRole? _selectedRole;
  crm.Office? _selectedOffice;
  bool _isActive = true;

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
    _loadDropdownData(); // Start loading dropdown data
    if (_isEditMode) {
      // Don't await here, let dropdowns load in parallel
      _loadEmployeeData();
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
        _nameController.text = employee.name;
        _emailController.text = employee.email;
        _telegramIdController.text = employee.telegramId.toString();
        _whatsappNumberController.text = employee.whatsappNumber;
        _notesController.text = employee.notes;
        _selectedRole = employee.role;
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

    final employeeData = crm.Employee(
      // employeeId is set by server on create, included for update
      employeeId: _isEditMode ? widget.employeeId : null,
      userId: _selectedUser!.userId,
      name: _nameController.text.trim(),
      role: _selectedRole!,
      officeId: _selectedOffice!.officeId,
      email: _emailController.text.trim(),
      telegramId: _telegramIdController.text.trim().isNotEmpty
          ? Int64.parseInt(_telegramIdController.text.trim())
          : Int64(0),
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
        // CreateEmployeeRequest in proto includes user_login/password, but our service
        // method createEmployee only takes Employee object. Assuming backend links
        // the selected User ID correctly when creating the Employee record.
        await _grpcService.createEmployee(employeeData);
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
    super.dispose();
  }

  // Helper to display role names nicely
  String _getRoleDisplayName(crm.EmployeeRole role) {
    return role.name.replaceFirst('EMPLOYEE_ROLE_', '').replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Employee' : 'Add Employee'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              // Added Center widget
              child: ConstrainedBox(
                // Added ConstrainedBox widget
                constraints:
                    const BoxConstraints(maxWidth: 800), // Set max width
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // User Dropdown
                        DropdownButtonFormField<crm.User>(
                          value: _selectedUser,
                          hint: const Text('Select User'),
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
                          validator: (value) =>
                              value == null ? 'User is required' : null,
                          decoration: const InputDecoration(
                            labelText: 'User Account',
                            border: OutlineInputBorder(),
                          ),
                          // Disable if editing (can't change linked user)
                          disabledHint: _selectedUser != null
                              ? Text(_selectedUser!.login)
                              : null,
                          onTap: _isEditMode
                              ? () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Cannot change user for existing employee.')),
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

                        // Name Field
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter employee name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter an email';
                            }
                            // Basic email validation
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Role Dropdown
                        DropdownButtonFormField<crm.EmployeeRole>(
                          value: _selectedRole,
                          hint: const Text('Select Role'),
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
                          validator: (value) =>
                              value == null ? 'Role is required' : null,
                          decoration: const InputDecoration(
                            labelText: 'Role',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        // Office Dropdown
                        DropdownButtonFormField<crm.Office>(
                          value: _selectedOffice,
                          hint: const Text('Select Office'),
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
                          validator: (value) =>
                              value == null ? 'Office is required' : null,
                          decoration: const InputDecoration(
                            labelText: 'Office',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        // Telegram ID Field
                        TextFormField(
                          controller: _telegramIdController,
                          decoration: const InputDecoration(
                            labelText: 'Telegram ID (Optional)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        // WhatsApp Number Field
                        TextFormField(
                          controller: _whatsappNumberController,
                          decoration: const InputDecoration(
                            labelText:
                                'WhatsApp Number (Optional, E.164 format)',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          // Add validator if E.164 format is strict
                        ),
                        const SizedBox(height: 16.0),

                        // Is Active Switch
                        SwitchListTile(
                          title: const Text('Is Active'),
                          value: _isActive,
                          onChanged: (bool value) {
                            setState(() {
                              _isActive = value;
                            });
                          },
                          secondary: Icon(
                              _isActive ? Icons.check_circle : Icons.cancel,
                              color: _isActive ? Colors.green : Colors.grey),
                        ),
                        const SizedBox(height: 16.0),

                        // Notes Field
                        TextFormField(
                          controller: _notesController,
                          decoration: const InputDecoration(
                            labelText: 'Notes (Optional)',
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 3,
                          textAlignVertical: TextAlignVertical.top,
                        ),
                        const SizedBox(height: 24.0),

                        // Save Button
                        Center(
                          child: ElevatedButton.icon(
                            icon: Icon(_isEditMode
                                ? Icons.save_alt
                                : Icons.add_circle_outline),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              child: Text(_isEditMode
                                  ? 'Update Employee'
                                  : 'Create Employee'),
                            ),
                            onPressed: _isLoading ? null : _saveEmployee,
                            style: ElevatedButton.styleFrom(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0), // Add some bottom padding
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

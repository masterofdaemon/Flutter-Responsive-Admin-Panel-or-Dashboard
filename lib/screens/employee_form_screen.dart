import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_employee_service.dart';
import 'package:grpc/grpc.dart';
import 'package:admin/utils/enum_helpers.dart'; // Import enum helpers

class EmployeeFormScreen extends StatefulWidget {
  final String? employeeId;
  const EmployeeFormScreen({Key? key, this.employeeId}) : super(key: key);
  @override
  _EmployeeFormScreenState createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = getGrpcEmployeeService();
  bool _isEdit = false;
  bool _loading = false;

  final _userIdCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _officeIdCtrl = TextEditingController();
  final _telegramCtrl = TextEditingController();
  final _whatsappCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  bool _active = true;

  // Enum state variable
  crm.EmployeeRole? _selectedRole;

  @override
  void initState() {
    super.initState();
    _isEdit = widget.employeeId != null;
    if (_isEdit) _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);
    try {
      final e = await _service.getEmployee(widget.employeeId!);
      _userIdCtrl.text = e.userId;
      _nameCtrl.text = e.name;
      _selectedRole = e.role; // Use enum value
      _officeIdCtrl.text = e.officeId;
      _telegramCtrl.text = e.telegramId;
      _whatsappCtrl.text = e.whatsappNumber;
      _emailCtrl.text = e.email;
      _active = e.isActive;
      _notesCtrl.text = e.notes;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error loading: $e')));
      Navigator.pop(context);
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final emp = crm.Employee(
      employeeId: _isEdit ? widget.employeeId : null,
      userId: _userIdCtrl.text.trim(),
      name: _nameCtrl.text.trim(),
      role: _selectedRole ??
          crm.EmployeeRole.EMPLOYEE_ROLE_UNSPECIFIED, // Use selected enum
      officeId: _officeIdCtrl.text.trim(),
      telegramId: _telegramCtrl.text.trim(),
      whatsappNumber: _whatsappCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      isActive: _active,
      notes: _notesCtrl.text.trim(),
    );
    try {
      if (_isEdit) {
        await _service.updateEmployee(widget.employeeId!, emp);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Updated')));
      } else {
        await _service.createEmployee(emp);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Created')));
      }
      Navigator.pop(context, true);
    } on GrpcError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('gRPC error: ${e.message}')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _userIdCtrl.dispose();
    _nameCtrl.dispose();
    _officeIdCtrl.dispose();
    _telegramCtrl.dispose();
    _whatsappCtrl.dispose();
    _emailCtrl.dispose();
    _notesCtrl.dispose();
    _service.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Employee' : 'Add Employee'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _loading ? null : _save,
          )
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _userIdCtrl,
                      decoration: InputDecoration(labelText: 'User ID'),
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    SizedBox(height: 8),
                    // Dropdown for EmployeeRole
                    DropdownButtonFormField<crm.EmployeeRole>(
                      value: _selectedRole,
                      decoration: const InputDecoration(labelText: 'Role'),
                      items: crm.EmployeeRole.values
                          .where((role) =>
                              role !=
                              crm.EmployeeRole
                                  .EMPLOYEE_ROLE_UNSPECIFIED) // Exclude UNSPECIFIED
                          .map((crm.EmployeeRole role) {
                        return DropdownMenuItem<crm.EmployeeRole>(
                          value: role,
                          child: Text(getEmployeeRoleName(
                              role)), // Use helper for display name
                        );
                      }).toList(),
                      onChanged: (crm.EmployeeRole? newValue) {
                        setState(() {
                          _selectedRole = newValue;
                        });
                      },
                      validator: (value) => value == null ||
                              value ==
                                  crm.EmployeeRole.EMPLOYEE_ROLE_UNSPECIFIED
                          ? 'Please select a role'
                          : null,
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _officeIdCtrl,
                      decoration: InputDecoration(labelText: 'Office ID'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _telegramCtrl,
                      decoration: InputDecoration(labelText: 'Telegram ID'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _whatsappCtrl,
                      decoration: InputDecoration(labelText: 'WhatsApp Number'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _notesCtrl,
                      decoration: InputDecoration(labelText: 'Notes'),
                      maxLines: 2,
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: _active,
                          onChanged: (v) => setState(() => _active = v!),
                        ),
                        Text('Active')
                      ],
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _loading ? null : _save,
                        child: Text(_isEdit ? 'Update' : 'Create'),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:admin/services/grpc_employee_service.dart';
import 'package:admin/screens/employee_form_screen.dart';
import 'package:admin/generated/crm.pb.dart' as crm;

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final _service = getGrpcEmployeeService();
  late Future<List<crm.Employee>> _future;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    setState(() {
      _future = _service.listEmployees();
    });
  }

  Future<void> _delete(String id, String name) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text('Delete employee "$name"?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete')),
        ],
      ),
    );
    if (confirm == true) {
      try {
        await _service.deleteEmployee(id);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Deleted $name')));
        _load();
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error deleting: $e')));
      }
    }
  }

  Future<void> _navForm({String? id}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EmployeeFormScreen(employeeId: id)),
    );
    if (result == true) _load();
  }

  @override
  void dispose() {
    _service.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () => _navForm())
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _load(),
        child: FutureBuilder<List<crm.Employee>>(
          future: _future,
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(child: Text('Error: ${snap.error}'));
            }
            final List<crm.Employee> list = snap.data ?? <crm.Employee>[];
            if (list.isEmpty) {
              return const Center(child: Text('No employees found.'));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Role')),
                    DataColumn(label: Text('Office')),
                    DataColumn(label: Text('Telegram')),
                    DataColumn(label: Text('WhatsApp')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Active')),
                    DataColumn(label: Text('Notes')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: list.map((e) {
                    return DataRow(cells: [
                      DataCell(Text(e.employeeId)),
                      DataCell(Text(e.name)),
                      DataCell(Text(e.role)),
                      DataCell(Text(e.officeId)),
                      DataCell(Text(e.telegramId)),
                      DataCell(Text(e.whatsappNumber)),
                      DataCell(Text(e.email)),
                      DataCell(Text(e.isActive ? 'Yes' : 'No')),
                      DataCell(Text(e.notes)),
                      DataCell(Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _navForm(id: e.employeeId),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _delete(e.employeeId, e.name),
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

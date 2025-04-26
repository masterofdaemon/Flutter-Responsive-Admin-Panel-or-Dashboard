import 'package:flutter/material.dart';
import 'package:admin/services/grpc_interaction_service.dart';
import 'package:admin/screens/interaction_form_screen.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:intl/intl.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:admin/services/grpc_employee_service.dart';

// Helper function to format date from crm.Interaction
String formatInteractionDate(crm.Interaction interaction) {
  if (!interaction.hasDate()) return '';
  final seconds = interaction.date.seconds.toInt();
  final date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('yyyy-MM-dd').format(date);
}

class InteractionListScreen extends StatefulWidget {
  const InteractionListScreen({Key? key}) : super(key: key);
  @override
  _InteractionListScreenState createState() => _InteractionListScreenState();
}

class _InteractionListScreenState extends State<InteractionListScreen> {
  final _service = getGrpcInteractionService();
  late Future<List<crm.Interaction>> _future;
  Map<String, String> _clientNames = {};
  Map<String, String> _employeeNames = {};

  @override
  void initState() {
    super.initState();
    _load();
    _fetchNames();
  }

  void _load() {
    setState(() {
      _future = _service.listInteractions();
    });
  }

  Future<void> _fetchNames() async {
    final clients = await getGrpcClientService().listClients();
    final employees = await getGrpcEmployeeService().listEmployees();
    setState(() {
      _clientNames = {
        for (var c in clients) c.clientId: "${c.firstName} ${c.lastName}"
      };
      _employeeNames = {for (var e in employees) e.employeeId: e.name};
    });
  }

  Future<void> _delete(String id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Delete this interaction?'),
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
        await _service.deleteInteraction(id);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Deleted')));
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
      MaterialPageRoute(
          builder: (_) => InteractionFormScreen(interactionId: id)),
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
        title: const Text('Interactions'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () => _navForm())
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _load();
          await _fetchNames();
        },
        child: FutureBuilder<List<crm.Interaction>>(
          future: _future,
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(child: Text('Error: ${snap.error}'));
            }
            final List<crm.Interaction> list = snap.data ?? <crm.Interaction>[];
            if (list.isEmpty) {
              return const Center(child: Text('No interactions found.'));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Client')),
                    DataColumn(label: Text('Employee')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Subject')),
                    DataColumn(label: Text('End Time')),
                    DataColumn(label: Text('Scheduled')),
                    DataColumn(label: Text('Completed')),
                    DataColumn(label: Text('Notes')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: list.map((i) {
                    final clientName = _clientNames[i.clientId] ?? i.clientId;
                    final employeeName =
                        _employeeNames[i.employeeId] ?? i.employeeId;
                    return DataRow(
                      cells: [
                        DataCell(Text(i.interactionId)),
                        DataCell(Text(clientName)),
                        DataCell(Text(employeeName)),
                        DataCell(Text(formatInteractionDate(i))),
                        DataCell(Text(i.type)),
                        DataCell(Text(
                            i.description.isNotEmpty ? i.description : '-')),
                        DataCell(Text(i.subject.isNotEmpty ? i.subject : '-')),
                        DataCell(Text(i.hasEndTime()
                            ? DateFormat('yyyy-MM-dd HH:mm').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    i.endTime.seconds.toInt() * 1000))
                            : '-')),
                        DataCell(Text(i.isScheduled ? 'Yes' : 'No')),
                        DataCell(Text(i.isCompleted ? 'Yes' : 'No')),
                        DataCell(Text(i.notes.isNotEmpty ? i.notes : '-')),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _navForm(id: i.interactionId),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _delete(i.interactionId),
                            ),
                          ],
                        )),
                      ],
                      onSelectChanged: (_) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Interaction Details'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID: ${i.interactionId}'),
                                Text('Client: $clientName'),
                                Text('Employee: $employeeName'),
                                Text('Date: ${formatInteractionDate(i)}'),
                                Text('Type: ${i.type}'),
                                Text(
                                    'Description: ${i.description.isNotEmpty ? i.description : '-'}'),
                                Text(
                                    'Subject: ${i.subject.isNotEmpty ? i.subject : '-'}'),
                                Text(
                                    'End Time: ${i.hasEndTime() ? DateFormat('yyyy-MM-dd HH:mm').format(DateTime.fromMillisecondsSinceEpoch(i.endTime.seconds.toInt() * 1000)) : '-'}'),
                                Text(
                                    'Scheduled: ${i.isScheduled ? 'Yes' : 'No'}'),
                                Text(
                                    'Completed: ${i.isCompleted ? 'Yes' : 'No'}'),
                                Text(
                                    'Notes: ${i.notes.isNotEmpty ? i.notes : '-'}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
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

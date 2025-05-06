import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_lending_application_service_mobile.dart';
import 'lending_application_form_screen.dart';

class LendingApplicationListScreen extends StatefulWidget {
  const LendingApplicationListScreen({super.key});

  @override
  State<LendingApplicationListScreen> createState() =>
      _LendingApplicationListScreenState();
}

class _LendingApplicationListScreenState
    extends State<LendingApplicationListScreen> {
  final GrpcLendingApplicationService _service =
      GrpcLendingApplicationService();
  late Future<List<crm.LendingApplication>> _applicationsFuture;

  @override
  void initState() {
    super.initState();
    _loadApplications();
  }

  void _loadApplications() {
    setState(() {
      _applicationsFuture = _service.listLendingApplications(pageSize: 100);
    });
  }

  void _navigateToForm({String? requestId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LendingApplicationFormScreen(requestId: requestId),
      ),
    );
    if (result == true) {
      _loadApplications();
    }
  }

  Future<void> _deleteApplication(String requestId) async {
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Application?'),
          content:
              const Text('Are you sure you want to delete this application?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );
      if (confirm == true) {
        await _service.deleteLendingApplication(requestId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Application deleted successfully')),
        );
        _loadApplications();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting application: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lending Applications'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Application',
            onPressed: () => _navigateToForm(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadApplications(),
        child: FutureBuilder<List<crm.LendingApplication>>(
          future: _applicationsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No lending applications found.'));
            }
            final applications = snapshot.data!;
            return ListView.builder(
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final app = applications[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(
                        app.requestId.isNotEmpty ? app.requestId : 'No ID'),
                    subtitle: Text(
                        'Client: ${app.clientId}\nManager: ${app.managerId}\nBank: ${app.bankId}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: 'Edit Application',
                          onPressed: () =>
                              _navigateToForm(requestId: app.requestId),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete Application',
                          onPressed: () => _deleteApplication(app.requestId),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

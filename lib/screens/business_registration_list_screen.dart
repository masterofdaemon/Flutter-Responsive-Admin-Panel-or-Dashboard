import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_business_registration_service_mobile.dart';
import 'business_registration_form_screen.dart';
import 'package:admin/screens/main/main_screen.dart'; // Added

class BusinessRegistrationListScreen extends StatefulWidget {
  const BusinessRegistrationListScreen({super.key});

  @override
  State<BusinessRegistrationListScreen> createState() =>
      _BusinessRegistrationListScreenState();
}

class _BusinessRegistrationListScreenState
    extends State<BusinessRegistrationListScreen> {
  final GrpcBusinessRegistrationService _service =
      GrpcBusinessRegistrationService();
  late Future<List<crm.BusinessRegistration>> _registrationsFuture;

  @override
  void initState() {
    super.initState();
    _loadRegistrations();
  }

  void _loadRegistrations() {
    setState(() {
      _registrationsFuture = _service.listBusinessRegistrations(pageSize: 100);
    });
  }

  void _navigateToForm({String? requestId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BusinessRegistrationFormScreen(requestId: requestId),
      ),
    );
    if (result == true) {
      _loadRegistrations();
    }
  }

  Future<void> _deleteRegistration(String requestId) async {
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Registration?'),
          content:
              const Text('Are you sure you want to delete this registration?'),
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
        await _service.deleteBusinessRegistration(requestId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration deleted successfully')),
        );
        _loadRegistrations();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting registration: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Registrations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).maybePop();
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainScreen()), // Changed to MainScreen
              );
            }
          },
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Registration',
            onPressed: () => _navigateToForm(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadRegistrations(),
        child: FutureBuilder<List<crm.BusinessRegistration>>(
          future: _registrationsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No business registrations found.'));
            }
            final registrations = snapshot.data!;
            return ListView.builder(
              itemCount: registrations.length,
              itemBuilder: (context, index) {
                final reg = registrations[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(reg.requestId != 0
                        ? reg.requestId.toString()
                        : 'No ID'),
                    subtitle: Text(
                        'Client: ${reg.clientId}\nManager: ${reg.managerId}\nBank: ${reg.bankId}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: 'Edit Registration',
                          onPressed: () => _navigateToForm(
                              requestId: reg.requestId.toString()),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete Registration',
                          onPressed: () =>
                              _deleteRegistration(reg.requestId.toString()),
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

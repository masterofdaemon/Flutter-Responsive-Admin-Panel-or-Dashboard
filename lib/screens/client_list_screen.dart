import 'package:admin/generated/crm.pb.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';

import 'package:admin/screens/client_form_screen.dart'; // Import the new form screen

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  final GrpcClientService _grpcService =
      GrpcClientService(); // Instantiate the service
  late Future<List<Client>> _clientsFuture;

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  void _loadClients() {
    setState(() {
      // Fetch clients using the gRPC service
      _clientsFuture = _grpcService.listClients();
    });
  }

  // Method to navigate to the form screen for adding or editing
  Future<void> _navigateAndRefresh(Widget screen) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );

    // If the form screen returned true (indicating success), refresh the list
    if (result == true && mounted) {
      _loadClients();
    }
  }

  // Method to handle client deletion
  Future<void> _deleteClient(String clientId, String clientName) async {
    // Show confirmation dialog
    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete client $clientName?'),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pop(false), // Dismiss and return false
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pop(true), // Dismiss and return true
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    // If confirmed, proceed with deletion
    if (confirm == true) {
      try {
        // Call the gRPC delete method
        await _grpcService.deleteClient(clientId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Client $clientName deleted successfully')),
        );
        // Refresh the list
        _loadClients();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting client $clientId: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _grpcService.shutdown(); // Clean up the channel when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Client',
            onPressed: () {
              // Navigate to Add Client Screen
              _navigateAndRefresh(const ClientFormScreen());
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadClients(),
        child: FutureBuilder<List<Client>>(
          future: _clientsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Display error message and a retry button
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error loading clients: ${snapshot.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadClients,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No clients found.'));
            } else {
              final clients = snapshot.data!;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Keep horizontal scroll
                child: SingleChildScrollView(
                  // Add vertical scroll for the table itself if needed
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('First Name')),
                      DataColumn(label: Text('Last Name')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Telegram ID')),
                      DataColumn(label: Text('WhatsApp')),
                      DataColumn(label: Text('Source')),
                      DataColumn(label: Text('Passport Data')),
                      DataColumn(label: Text('Notes')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: clients.map((client) {
                      final clientName =
                          '${client.firstName} ${client.lastName}';
                      return DataRow(cells: [
                        DataCell(Text(client.clientId)),
                        DataCell(Text(client.firstName)),
                        DataCell(Text(client.lastName)),
                        DataCell(Text(client.phone)),
                        DataCell(Text(client.email)),
                        DataCell(Text(client.telegramId)),
                        DataCell(Text(client.whatsappNumber)),
                        DataCell(Text(client.source)),
                        DataCell(Text(client.hasPassportData()
                            ? client.passportData.toString()
                            : '-')),
                        DataCell(Text(client.notes)),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize
                              .min, // Prevent row expanding unnecessarily
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              tooltip: 'Edit Client',
                              onPressed: () {
                                // Navigate to Edit Client Screen
                                _navigateAndRefresh(ClientFormScreen(
                                    clientId: client.clientId));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              tooltip: 'Delete Client',
                              onPressed: () => _deleteClient(client.clientId,
                                  clientName), // Call the delete handler
                            ),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

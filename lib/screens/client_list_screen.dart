import 'package:admin/generated/crm.pb.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart'; // Import PlutoGrid
import 'package:admin/l10n/app_localizations.dart'; // Added

import 'package:admin/screens/client_form_screen.dart'; // Import the new form screen

// Helper function to get user-friendly source name
String getClientSourceName(
    ClientSource source, AppLocalizations localizations) {
  // Added localizations
  if (source == ClientSource.CLIENT_SOURCE_UNSPECIFIED) {
    return localizations.clientListScreenSourceUnspecified; // Changed
  }
  return source.name.replaceFirst('CLIENT_SOURCE_', '').replaceAll('_', ' ');
}

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  final GrpcClientService _grpcService =
      GrpcClientService(); // Instantiate the service
  late Future<List<Client>> _clientsFuture;
  List<Client> _clients = []; // Store clients for PlutoGrid
  PlutoGridStateManager? _plutoGridStateManager;

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  void _loadClients() {
    setState(() {
      print('Attempting to load clients...'); // Added log
      _clientsFuture = _grpcService.listClients().then((clients) {
        print(
            'Successfully loaded ${clients.length} clients.'); // Corrected log
        // Removed debug print loop; variable 'c' was unused
        _clients = clients; // Update local list
        if (_plutoGridStateManager != null) {
          _updatePlutoGridRows();
        }
        return clients;
      }).catchError((error) {
        // Added error logging
        print('Error loading clients: \$error'); // Added log
        // Optionally, rethrow the error if you want the FutureBuilder to handle it
        // throw error;
        return <Client>[]; // Return an empty list or handle as appropriate
      });
    });
  }

  void _updatePlutoGridRows() {
    if (_plutoGridStateManager == null) return;
    // final localizations = AppLocalizations.of(context); // No longer needed here

    final rows = _clients.map((client) {
      return PlutoRow(
        cells: {
          'id': PlutoCell(value: client.clientId),
          'firstName': PlutoCell(value: client.firstName),
          'lastName': PlutoCell(value: client.lastName),
          'phone': PlutoCell(value: client.phone),
          'email': PlutoCell(value: client.email),
          'telegramId': PlutoCell(value: client.telegramId),
          'whatsappNumber': PlutoCell(value: client.whatsappNumber),
          // 'source': PlutoCell( // Removed source as it's not part of Client model
          //     value: getClientSourceName(client.source, localizations)),
          'passportData': PlutoCell(
              value: client.hasPassportData()
                  ? client.passportData.toString()
                  : '-'),
          'notes': PlutoCell(value: client.notes),
          'actions': PlutoCell(value: client.clientId),
        },
      );
    }).toList();

    _plutoGridStateManager!.removeAllRows();
    _plutoGridStateManager!.appendRows(rows);
  }

  // Method to show the form modal for adding or editing
  Future<void> _showClientFormModal({String? clientId}) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ClientFormScreen(clientId: clientId),
    );

    if (result == true && mounted) {
      _loadClients();
    }
  }

  // Method to handle client deletion
  Future<void> _deleteClient(String clientId, String clientName) async {
    final localizations = AppLocalizations.of(context); // Added
    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(localizations.clientListScreenConfirmDeleteTitle), // Changed
          content: Text(localizations
              .clientListScreenConfirmDeleteContent(clientName)), // Changed
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(localizations
                  .clientListScreenConfirmDeleteActionCancel), // Changed
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(localizations
                  .clientListScreenConfirmDeleteActionDelete), // Changed
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      try {
        await _grpcService.deleteClient(clientId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations.clientListScreenFeedbackSuccessDelete(
                  clientName))), // Changed
        );
        _loadClients();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations.clientListScreenFeedbackErrorDelete(
                  clientId, e.toString()))), // Changed
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<PlutoColumn> _getPlutoColumns() {
    final localizations = AppLocalizations.of(context);
    return [
      PlutoColumn(
        title: localizations.clientListScreenColumnId,
        field: 'id',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnFirstName,
        field: 'firstName',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnLastName,
        field: 'lastName',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnPhone,
        field: 'phone',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnEmail,
        field: 'email',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 200,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnTelegramId,
        field: 'telegramId',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnWhatsapp,
        field: 'whatsappNumber',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      // PlutoColumn( // Removed source column
      //   title: localizations.clientListScreenColumnSource,
      //   field: 'source',
      //   type: PlutoColumnType.text(),
      //   enableEditingMode: false,
      //   width: 150,
      //   readOnly: true,
      // ),
      PlutoColumn(
        title: localizations.clientListScreenColumnPassportData,
        field: 'passportData',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 200,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnNotes,
        field: 'notes',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 200,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnActions, // Changed
        field: 'actions',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 120,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.center,
        renderer: (rendererContext) {
          final int clientIdInt =
              rendererContext.cell.value as int; // Changed to int
          final String clientIdString =
              clientIdInt.toString(); // Convert to String for usage
          final client = _clients.firstWhere(
              (c) => c.clientId == clientIdInt, // Use int for comparison
              orElse: () => Client()
                ..firstName = ''
                ..lastName = '');
          final clientName = '${client.firstName} ${client.lastName}'.trim();

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                padding: EdgeInsets.zero, // Reduce padding
                constraints: const BoxConstraints(), // Remove default min size
                tooltip: localizations.clientListScreenTooltipEdit, // Changed
                onPressed: () {
                  _showClientFormModal(
                      clientId: clientIdString); // Use String ID here
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                padding: EdgeInsets.zero, // Reduce padding
                constraints: const BoxConstraints(), // Remove default min size
                tooltip: localizations.clientListScreenTooltipDelete, // Changed
                onPressed: () => _deleteClient(
                    clientIdString, // Use String ID here
                    clientName.isNotEmpty
                        ? clientName
                        : localizations
                            .clientListScreenDefaultClientName), // Changed
              ),
            ],
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context); // Added
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section with title and add button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.clientListScreenTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _showClientFormModal(); // No clientId for adding new client
                  },
                  icon: const Icon(Icons.add),
                  label: Text(localizations.clientListScreenTooltipAdd),
                ),
              ],
            ),
          ),
          // Content section
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => _loadClients(),
              child: FutureBuilder<List<Client>>(
                future: _clientsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      _clients.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError && _clients.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(localizations.clientListScreenErrorLoading(
                              snapshot.error.toString())), // Changed
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadClients,
                            child: Text(localizations
                                .clientListScreenButtonRetry), // Changed
                          ),
                        ],
                      ),
                    );
                  } else if (_clients.isEmpty &&
                      snapshot.connectionState != ConnectionState.waiting) {
                    return Center(
                        child: Text(localizations
                            .clientListScreenNoClientsFound)); // Changed
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlutoGrid(
                      columns: _getPlutoColumns(),
                      rows: [], // Changed from const [] to a mutable empty list
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        _plutoGridStateManager = event.stateManager;
                        _updatePlutoGridRows();
                      },
                      configuration: const PlutoGridConfiguration(
                          style: PlutoGridStyleConfig(
                            gridBorderColor: Colors.grey,
                            rowHeight: 45,
                            columnHeight: 45,
                            borderColor: Colors.black38,
                            gridBackgroundColor: Colors.white,
                          ),
                          columnSize: PlutoGridColumnSizeConfig(
                            autoSizeMode: PlutoAutoSizeMode.scale,
                          ),
                          scrollbar: PlutoGridScrollbarConfig(
                            isAlwaysShown: true,
                            draggableScrollbar: true,
                          )),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

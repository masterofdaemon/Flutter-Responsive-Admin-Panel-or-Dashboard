import 'package:admin/generated/crm.pb.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart'; // Import PlutoGrid
import 'package:admin/screens/main/main_screen.dart'; // Added
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
      _clientsFuture = _grpcService.listClients().then((clients) {
        print('ClientListScreen: clients received:');
        for (final c in clients) {
          print(
              '  id: ${c.clientId}, firstName: ${c.firstName}, lastName: ${c.lastName}, phone: ${c.phone}, email: ${c.email}, source: ${c.source}');
        }
        _clients = clients; // Update local list
        if (_plutoGridStateManager != null) {
          _updatePlutoGridRows();
        }
        return clients;
      });
    });
  }

  void _updatePlutoGridRows() {
    if (_plutoGridStateManager == null) return;
    final localizations = AppLocalizations.of(context); // Added

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
          'source': PlutoCell(
              value:
                  getClientSourceName(client.source, localizations)), // Changed
          'passportData': PlutoCell(
              value: client.hasPassportData()
                  ? client.passportData.toString()
                  : '-'),
          'notes': PlutoCell(value: client.notes),
          'actions': PlutoCell(value: client.clientId), // Store ID for actions
        },
      );
    }).toList();

    _plutoGridStateManager!
        .removeAllRows(); // Corrected: Remove all existing rows
    _plutoGridStateManager!.appendRows(rows); // Append new rows
  }

  // Method to navigate to the form screen for adding or editing
  Future<void> _navigateAndRefresh(Widget screen) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
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
    final localizations = AppLocalizations.of(context); // Added
    return [
      PlutoColumn(
        title: localizations.clientListScreenColumnId, // Changed
        field: 'id',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnFirstName, // Changed
        field: 'firstName',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnLastName, // Changed
        field: 'lastName',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnPhone, // Changed
        field: 'phone',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnEmail, // Changed
        field: 'email',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 200,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnTelegramId, // Changed
        field: 'telegramId',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnWhatsapp, // Changed
        field: 'whatsappNumber',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnSource, // Changed
        field: 'source',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnPassportData, // Changed
        field: 'passportData',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 200,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnNotes, // Changed
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
          final String clientId = rendererContext.cell.value as String;
          final client = _clients.firstWhere((c) => c.clientId == clientId,
              orElse: () => Client()
                ..firstName = ''
                ..lastName = '');
          final clientName = '${client.firstName} ${client.lastName}'.trim();

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: localizations.clientListScreenTooltipEdit, // Changed
                onPressed: () {
                  _navigateAndRefresh(ClientFormScreen(clientId: clientId));
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: localizations.clientListScreenTooltipDelete, // Changed
                onPressed: () => _deleteClient(
                    clientId,
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
      appBar: AppBar(
        title: Text(localizations.clientListScreenTitle), // Changed
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          // onPressed: () => Navigator.of(context).maybePop(), // Original
          onPressed: () {
            // Changed
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).maybePop();
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }
          },
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: localizations.clientListScreenTooltipAdd, // Changed
            onPressed: () {
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
                      child: Text(
                          localizations.clientListScreenButtonRetry), // Changed
                    ),
                  ],
                ),
              );
            } else if (_clients.isEmpty &&
                snapshot.connectionState != ConnectionState.waiting) {
              return Center(
                  child: Text(
                      localizations.clientListScreenNoClientsFound)); // Changed
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
                      borderColor: Colors.transparent,
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
    );
  }
}

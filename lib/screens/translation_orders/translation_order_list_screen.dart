import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_translation_order_service_mobile.dart';
import 'package:admin/screens/translation_orders/translation_order_form_screen.dart';
import 'package:admin/widgets/loading_indicator.dart';
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:admin/services/grpc_client_service.dart';

class TranslationOrderListScreen extends StatefulWidget {
  const TranslationOrderListScreen({super.key});

  @override
  State<TranslationOrderListScreen> createState() =>
      _TranslationOrderListScreenState();
}

class _TranslationOrderListScreenState
    extends State<TranslationOrderListScreen> {
  final GrpcTranslationOrderService _service = GrpcTranslationOrderService();
  final GrpcClientService _clientService =
      GrpcClientService(); // Added client service
  late Future<List<crm.TranslationOrder>> _ordersFuture;
  List<crm.TranslationOrder> _orders = [];
  Map<String, crm.Client> _clientsMap = {}; // Added map to store clients
  PlutoGridStateManager? _plutoGridStateManager;

  @override
  void initState() {
    super.initState();
    _ordersFuture = _loadInitialData();
  }

  Future<List<crm.TranslationOrder>> _loadInitialData() async {
    try {
      // Fetch orders and clients in parallel
      final ordersFuture = _service.listTranslationOrders();
      // Assuming GrpcClientService has a listClients method
      final clientsFuture = _clientService.listClients(pageSize: 500);

      final results = await Future.wait([ordersFuture, clientsFuture]);

      final orders = results[0] as List<crm.TranslationOrder>;
      final clients = results[1] as List<crm.Client>;

      if (mounted) {
        _orders = orders;
        _clientsMap = {
          for (var client in clients) client.clientId.toString(): client
        };
        if (_plutoGridStateManager != null) {
          _updatePlutoGridRows();
        }
      }
      return orders;
    } catch (error) {
      if (mounted) {
        print('Error loading initial data: $error');
        _orders = [];
        _clientsMap = {};
        if (_plutoGridStateManager != null) {
          _updatePlutoGridRows(); // Update with empty or error state
        }
      }
      throw error; // Rethrow for FutureBuilder
    }
  }

  Future<void> _loadOrders() async {
    if (!mounted) return;

    // Create a future that completes with the orders list or throws an error
    final newCombinedFuture = () async {
      try {
        // Fetch orders and clients in parallel
        final ordersFuture = _service.listTranslationOrders();
        final clientsFuture = _clientService.listClients(pageSize: 500);

        final results = await Future.wait([ordersFuture, clientsFuture]);

        final orders = results[0] as List<crm.TranslationOrder>;
        final clients = results[1] as List<crm.Client>;

        if (mounted) {
          _orders = orders;
          _clientsMap = {
            for (var client in clients) client.clientId.toString(): client
          };
          if (_plutoGridStateManager != null) {
            _updatePlutoGridRows();
          }
        }
        return orders; // Return the fetched orders
      } catch (error) {
        if (mounted) {
          print('Error loading data in _loadOrders: $error');
          _orders = [];
          _clientsMap = {};
          if (_plutoGridStateManager != null) {
            _updatePlutoGridRows();
          }
        }
        throw error; // Rethrow to be caught by the awaiter or FutureBuilder
      }
    }();

    if (mounted) {
      setState(() {
        // Assign the new future to _ordersFuture so FutureBuilder can react
        _ordersFuture = newCombinedFuture;
      });
    }

    try {
      await _ordersFuture; // Await for RefreshIndicator or other callers
    } catch (e) {
      // Error is handled by FutureBuilder via _ordersFuture.
      // This catch is to prevent unhandled exceptions from `await _ordersFuture` if not handled by FutureBuilder.
      print("Error awaited in _loadOrders: $e");
    }
  }

  String _getClientFullName(String clientId) {
    final client = _clientsMap[clientId];
    if (client != null) {
      List<String> nameParts = [];
      if (client.hasFirstName() && client.firstName.isNotEmpty) {
        nameParts.add(client.firstName);
      }
      if (client.hasLastName() && client.lastName.isNotEmpty) {
        nameParts.add(client.lastName);
      }
      if (nameParts.isNotEmpty) {
        return nameParts.join(' ');
      }
    }
    return 'N/A'; // Default if no client or name parts found
  }

  Future<void> _updatePlutoGridRows() async {
    if (_plutoGridStateManager == null) return;
    final stateManager = _plutoGridStateManager!;
    final rows = <PlutoRow>[];

    for (var order in _orders) {
      String customerNameValue = _getClientFullName(order.clientId.toString());
      final client = await _fetchClient(
          order.clientId.toString()); // Convert clientId to String
      String clientPhoneNumberValue = client?.phone ?? 'N/A';
      String clientSourceValue = _getClientSourceDisplayName(order.source);

      String blankNumberValue = 'N/A';
      if (order.blanks.isNotEmpty) {
        blankNumberValue = order.blanks[0].blankNumber;
      }

      String incorrectBlankValue = 'N/A';
      if (order.blanks.length > 1) {
        final secondBlank = order.blanks[1];
        incorrectBlankValue = secondBlank.isSpoiled
            ? secondBlank.replacementBlankNumber
            : secondBlank.blankNumber;
      }
      String documentTypeValue =
          order.hasDocumentTypeKey() ? order.documentTypeKey : 'N/A';
      String totalSumValue =
          order.hasTotalSum() ? order.totalSum.toStringAsFixed(2) : 'N/A';

      rows.add(PlutoRow(cells: {
        'blankNumber': PlutoCell(value: blankNumberValue),
        'incorrectBlank': PlutoCell(value: incorrectBlankValue),
        'orderId': PlutoCell(value: order.orderId.toString()),
        'title': PlutoCell(value: order.title),
        'customerName': PlutoCell(value: customerNameValue),
        'clientPhoneNumber': PlutoCell(value: clientPhoneNumberValue),
        'clientSource': PlutoCell(value: clientSourceValue),
        'documentTypeKey': PlutoCell(value: documentTypeValue),
        'totalSum': PlutoCell(value: totalSumValue),
        'status': PlutoCell(
            value: order.hasTranslationProgress()
                ? order.translationProgress.name
                : 'N/A'),
        'createdAt': PlutoCell(
            value:
                formatTimestamp(order.hasCreatedAt() ? order.createdAt : null)),
        'doneAt': PlutoCell(
            value: formatTimestamp(order.hasDoneAt() ? order.doneAt : null)),
        'actions': PlutoCell(
            value: order.orderId
                .toString()), // Keep actions for now, or decide if it should be removed
      }));
    }

    stateManager.removeAllRows();
    stateManager.appendRows(rows);
  }

  String _getClientSourceDisplayName(crm.ClientSource source) {
    final localizations = AppLocalizations.of(context);
    switch (source) {
      case crm.ClientSource.CLIENT_SOURCE_REFERRAL:
        return localizations.clientSourceReferral;
      case crm.ClientSource.CLIENT_SOURCE_ONLINE:
        return localizations.clientSourceOnline;
      case crm.ClientSource.CLIENT_SOURCE_WALK_IN:
        return localizations.clientSourceWalkIn;
      case crm.ClientSource.CLIENT_SOURCE_PARTNER:
        return localizations.clientSourcePartner;
      case crm.ClientSource.CLIENT_SOURCE_OTHER:
        return localizations.clientSourceOther;
      case crm.ClientSource.CLIENT_SOURCE_UNSPECIFIED:
        return localizations.clientSourceUnspecified;
      default:
        return localizations.clientSourceUnspecified;
    }
  }

  List<PlutoColumn> _getPlutoColumns(AppLocalizations localizations) {
    return [
      PlutoColumn(
        // TODO: Add to l10n: "translationOrderListScreenColumnBlank": "Blank"
        title: localizations.translationOrderListScreenColumnBlank,
        field: 'blankNumber',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 40,
        readOnly: true,
      ),
      PlutoColumn(
        // TODO: Add to l10n: "translationOrderListScreenColumnIncorrectBlank": "Incorrect Blank"
        title: localizations.translationOrderListScreenColumnIncorrectBlank,
        field: 'incorrectBlank',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 90,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientLabelText, // 'Client'
        field: 'customerName',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 180,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnPhone, // 'Phone'
        field: 'clientPhoneNumber',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        // TODO: Add to l10n: "clientSourceColumnTitle": "Source"
        title: localizations.clientSourceColumnTitle,
        field: 'clientSource',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 120,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations
            .translationOrderFormScreenFieldDocumentTypeLabel, // 'Document Type'
        field: 'documentTypeKey',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 150,
        readOnly: true,
      ),
      PlutoColumn(
        // TODO: Add to l10n: "translationOrderListScreenColumnTotalSum": "Total Sum"
        title: localizations.translationOrderListScreenColumnTotalSum,
        field: 'totalSum',
        type: PlutoColumnType.number(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.right,
        formatter: (dynamic value) {
          if (value == 'N/A') return 'N/A';
          try {
            return double.parse(value.toString()).toStringAsFixed(2);
          } catch (e) {
            return 'N/A';
          }
        },
      ),
      PlutoColumn(
        title: localizations.statusLabelText, // 'Status'
        field: 'status',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 120,
        readOnly: true,
      ),
      PlutoColumn(
        // TODO: Add to l10n: "translationOrderListScreenColumnCreatedAt": "Created At"
        title: localizations.translationOrderListScreenColumnCreatedAt,
        field: 'createdAt',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 140,
        readOnly: true,
      ),
      PlutoColumn(
        // TODO: Add to l10n: "translationOrderListScreenColumnDoneAt": "Done At"
        title: localizations.translationOrderListScreenColumnDoneAt,
        field: 'doneAt',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 80,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenColumnActions,
        field: 'actions',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.center,
        renderer: (rendererContext) {
          final String orderIdStr = rendererContext.cell.value as String;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                iconSize: 20.0,
                padding: const EdgeInsets.all(4.0),
                constraints: const BoxConstraints(
                    minWidth: 30, minHeight: 30, maxWidth: 30, maxHeight: 30),
                splashRadius: 18.0,
                tooltip: localizations.translationOrderListScreenTooltipEdit,
                onPressed: () => _navigateAndRefresh(orderId: orderIdStr),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                iconSize: 20.0,
                padding: const EdgeInsets.all(4.0),
                constraints: const BoxConstraints(
                    minWidth: 30, minHeight: 30, maxWidth: 30, maxHeight: 30),
                splashRadius: 18.0,
                tooltip: localizations.translationOrderListScreenTooltipDelete,
                onPressed: () => _deleteOrder(orderIdStr),
              ),
            ],
          );
        },
      ),
    ];
  }

  Future<crm.Client?> _fetchClient(String clientId) async {
    // Fetch client details by ID, handle errors, and return null if not found
    try {
      final client = await _clientService.getClient(clientId);
      return client;
    } catch (e) {
      print('Error fetching client $clientId: $e');
      return null;
    }
  }

  Future<void> _navigateAndRefresh({String? orderId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TranslationOrderFormScreen(orderId: orderId),
      ),
    );
    if (result == true && mounted) {
      Future.microtask(() {
        if (mounted) {
          _loadOrders();
        }
      });
    }
  }

  Future<void> _deleteOrder(String orderId) async {
    final localizations = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            localizations.translationOrderListScreenDeleteOrderDialogTitle),
        content: Text(
            localizations.translationOrderListScreenDeleteOrderDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(localizations
                .translationOrderListScreenDeleteOrderDialogCancelButton),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(localizations
                .translationOrderListScreenDeleteOrderDialogDeleteButton),
          ),
        ],
      ),
    );
    if (confirm == true) {
      try {
        await _service.deleteTranslationOrder(orderId);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(localizations
                    .translationOrderListScreenOrderDeletedSuccess)),
          );
          Future.microtask(() {
            if (mounted) {
              _loadOrders();
            }
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    localizations.translationOrderListScreenErrorDeletingOrder(
                        e.toString()))),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              localizations.translationOrderListScreenTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Content section
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => _loadOrders(),
              child: FutureBuilder<List<crm.TranslationOrder>>(
                future: _ordersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      _orders.isEmpty) {
                    return const LoadingIndicator();
                  } else if (snapshot.hasError && _orders.isEmpty) {
                    return Center(
                      child: Text(
                          localizations.translationOrderListScreenErrorLoading(
                              snapshot.error.toString())),
                    );
                  } else if (_orders.isEmpty &&
                      snapshot.connectionState != ConnectionState.waiting) {
                    return Center(
                      child: Text(localizations
                          .translationOrderListScreenNoOrdersFound),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlutoGrid(
                      columns: _getPlutoColumns(localizations),
                      rows: [],
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
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateAndRefresh(),
        tooltip: localizations.translationOrderListScreenCreateNewOrderTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}

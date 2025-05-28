import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_translation_order_service_mobile.dart';
import 'package:admin/screens/translation_orders/translation_order_form_screen.dart';
import 'package:admin/widgets/loading_indicator.dart';
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:admin/services/auth_service.dart';
import 'package:provider/provider.dart';

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
    final localizations = AppLocalizations.of(context);

    for (var order in _orders) {
      String customerNameValue = _getClientFullName(order.clientId.toString());
      final client = await _fetchClient(
          order.clientId.toString()); // Convert clientId to String
      String clientPhoneNumberValue = client?.phone ?? 'N/A';
      String clientSourceValue = _getClientSourceDisplayName(order.source);

      // Get client name from order
      String clientNameValue =
          order.hasClientName() && order.clientName.isNotEmpty
              ? order.clientName
              : 'N/A';

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
      String documentTypeValue = order.hasDocumentTypeKey()
          ? _getDocumentTypeDisplayName(order.documentTypeKey)
          : 'N/A';
      String totalSumValue =
          order.hasTotalSum() ? order.totalSum.toStringAsFixed(2) : 'N/A';
      String pageCountValue =
          order.hasPageCount() ? order.pageCount.toString() : 'N/A';
      String notesValue =
          order.hasNotes() && order.notes.isNotEmpty ? order.notes : 'N/A';
      String notariallyCertifiedValue =
          order.hasTranslationProgress() && order.notarialSum > 0
              ? localizations.translationOrderListScreenValueYes
              : localizations.translationOrderListScreenValueNo;

      rows.add(PlutoRow(cells: {
        'blankNumber': PlutoCell(value: blankNumberValue),
        'incorrectBlank': PlutoCell(value: incorrectBlankValue),
        'orderId': PlutoCell(value: order.orderId.toString()),
        'title': PlutoCell(value: order.title),
        'customerName': PlutoCell(value: customerNameValue),
        'clientName': PlutoCell(value: clientNameValue),
        'clientPhoneNumber': PlutoCell(value: clientPhoneNumberValue),
        'clientSource': PlutoCell(value: clientSourceValue),
        'documentTypeKey': PlutoCell(value: documentTypeValue),
        'pageCount': PlutoCell(value: pageCountValue),
        'notes': PlutoCell(value: notesValue),
        'notariallyCertified': PlutoCell(value: notariallyCertifiedValue),
        'totalSum': PlutoCell(value: totalSumValue),
        'status': PlutoCell(
            value: order.hasTranslationProgress()
                ? _getTranslationProgressStatusDisplayName(
                    order.translationProgress)
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

  String _getDocumentTypeDisplayName(String documentTypeKey) {
    final localizations = AppLocalizations.of(context);
    switch (documentTypeKey.toLowerCase()) {
      case 'passport':
        return localizations.documentTypePassport;
      case 'diploma':
        return localizations.documentTypeDiploma;
      case 'birth_certificate':
        return localizations.documentTypeBirthCertificate;
      case 'contract':
        return localizations.documentTypeContract;
      case 'other':
        return localizations.documentTypeOther;
      default:
        return documentTypeKey; // Return the original key if no match found
    }
  }

  String _getTranslationProgressStatusDisplayName(
      crm.TranslationProgressStatus? status) {
    final localizations = AppLocalizations.of(context);
    switch (status) {
      case crm.TranslationProgressStatus.PENDING_ASSIGNMENT:
        return localizations.translationProgressStatusPendingAssignment;
      case crm.TranslationProgressStatus.IN_PROGRESS:
        return localizations.translationProgressStatusInProgress;
      case crm.TranslationProgressStatus.TRANSLATED:
        return localizations.translationProgressStatusTranslated;
      case crm.TranslationProgressStatus.CHECKED_BY_MANAGER:
        return localizations.translationProgressStatusCheckedByManager;
      case crm.TranslationProgressStatus.CLIENT_NOTIFIED:
        return localizations.translationProgressStatusClientNotified;
      case crm.TranslationProgressStatus.DELIVERED:
        return localizations.translationProgressStatusDelivered;
      case crm
            .TranslationProgressStatus.TRANSLATION_PROGRESS_STATUS_UNSPECIFIED:
      default:
        return 'N/A';
    }
  }

  // Helper function to create multiline TextSpan for column headers
  TextSpan _createMultilineTextSpan(String text) {
    print('DEBUG _createMultilineTextSpan: Input text = "$text"');
    print('DEBUG _createMultilineTextSpan: Text length = ${text.length}');
    print(
        'DEBUG _createMultilineTextSpan: Text contains \\\\n: ${text.contains('\\n')}');
    print(
        'DEBUG _createMultilineTextSpan: Text contains actual newline: ${text.contains('\n')}');

    // Split on actual newline characters since that's what's in the ARB file
    final lines = text.split('\n');
    print('DEBUG _createMultilineTextSpan: Split result = $lines');
    print('DEBUG _createMultilineTextSpan: Number of lines = ${lines.length}');

    if (lines.length == 1) {
      print(
          'DEBUG _createMultilineTextSpan: Single line, returning simple TextSpan');
      return TextSpan(text: text);
    }

    List<TextSpan> spans = [];
    for (int i = 0; i < lines.length; i++) {
      print('DEBUG _createMultilineTextSpan: Adding line $i: "${lines[i]}"');
      spans.add(TextSpan(text: lines[i]));
      if (i < lines.length - 1) {
        print('DEBUG _createMultilineTextSpan: Adding newline after line $i');
        spans.add(const TextSpan(text: '\n'));
      }
    }

    print(
        'DEBUG _createMultilineTextSpan: Final spans count = ${spans.length}');
    return TextSpan(children: spans);
  }

  List<PlutoColumn> _getPlutoColumns(AppLocalizations localizations) {
    return [
      PlutoColumn(
        title: localizations.translationOrderListScreenColumnCreatedAt,
        field: 'createdAt',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 60,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenColumnDoneAt,
        field: 'doneAt',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 60,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientLabelText, // 'Client'
        field: 'customerName',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.clientListScreenColumnPhone, // 'Phone'
        field: 'clientPhoneNumber',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 70,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenColumnTotalSum,
        field: 'totalSum',
        type: PlutoColumnType.number(),
        enableEditingMode: false,
        width: 50,
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
        title: localizations.translationOrderListScreenColumnBlank,
        field: 'blankNumber',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 40,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenColumnIncorrectBlank,
        field: 'incorrectBlank',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 90,
        readOnly: true,
      ),
      PlutoColumn(
        title: '', // Required parameter, but will be overridden by titleSpan
        titleSpan: _createMultilineTextSpan(localizations
            .translationOrderFormScreenFieldClientNameLabel), // 'Client Name' with line breaks
        field: 'clientName',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations
            .translationOrderListScreenColumnDocumentType, // 'Document Type'
        field: 'documentTypeKey',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 100,
        readOnly: true,
      ),
      PlutoColumn(
        title: '', // Required parameter, but will be overridden by titleSpan
        titleSpan: _createMultilineTextSpan(localizations
            .translationOrderFormScreenFieldPageCountLabel), // 'Page Count' with line breaks
        field: 'pageCount',
        type: PlutoColumnType.number(),
        enableEditingMode: false,
        width: 60,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.right,
      ),
      PlutoColumn(
        title: localizations
            .translationOrderListScreenColumnNotariallyCertified, // 'Notarially Certified'
        field: 'notariallyCertified',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 40,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: localizations.clientSourceColumnTitle,
        field: 'clientSource',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 70,
        readOnly: true,
      ),
      PlutoColumn(
        title:
            localizations.translationOrderFormScreenFieldNotesLabel, // 'Notes'
        field: 'notes',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 70,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.statusLabelText, // 'Status'
        field: 'status',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 60,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenColumnActions,
        field: 'actions',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 40,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.center,
        renderer: (rendererContext) {
          final String orderIdStr = rendererContext.cell.value as String;
          return Consumer<AuthService>(
            builder: (context, authService, child) {
              final List<Widget> actionButtons = [];

              // Edit button - visible if user can manage translation orders
              if (authService.canManageTranslationOrders()) {
                actionButtons.add(
                  IconButton(
                    icon: const Icon(Icons.edit),
                    iconSize: 20.0,
                    padding: const EdgeInsets.all(4.0),
                    constraints: const BoxConstraints(
                        minWidth: 30,
                        minHeight: 30,
                        maxWidth: 30,
                        maxHeight: 30),
                    splashRadius: 18.0,
                    tooltip:
                        localizations.translationOrderListScreenTooltipEdit,
                    onPressed: () => _navigateAndRefresh(orderId: orderIdStr),
                  ),
                );
              }

              // Delete button - visible only if user can delete records (Directors only)
              if (authService.canDeleteRecords()) {
                actionButtons.add(
                  IconButton(
                    icon: const Icon(Icons.delete),
                    iconSize: 20.0,
                    padding: const EdgeInsets.all(4.0),
                    constraints: const BoxConstraints(
                        minWidth: 30,
                        minHeight: 30,
                        maxWidth: 30,
                        maxHeight: 30),
                    splashRadius: 18.0,
                    tooltip:
                        localizations.translationOrderListScreenTooltipDelete,
                    onPressed: () => _deleteOrder(orderIdStr),
                  ),
                );
              }

              // If no actions available, show view-only indicator
              if (actionButtons.isEmpty) {
                return const Text(
                  'View Only',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: actionButtons,
              );
            },
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
                          columnHeight: 90,
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
      floatingActionButton: Consumer<AuthService>(
        builder: (context, authService, child) {
          if (!authService.canManageTranslationOrders()) {
            return const SizedBox.shrink(); // Hide if no permission
          }
          return FloatingActionButton(
            onPressed: () => _navigateAndRefresh(),
            tooltip:
                localizations.translationOrderListScreenCreateNewOrderTooltip,
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

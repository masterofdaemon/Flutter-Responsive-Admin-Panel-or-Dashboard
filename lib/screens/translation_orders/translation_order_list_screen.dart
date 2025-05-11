import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_translation_order_service_mobile.dart';
import 'package:admin/screens/translation_orders/translation_order_form_screen.dart';
import 'package:admin/widgets/loading_indicator.dart';
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TranslationOrderListScreen extends StatefulWidget {
  const TranslationOrderListScreen({super.key});

  @override
  State<TranslationOrderListScreen> createState() =>
      _TranslationOrderListScreenState();
}

class _TranslationOrderListScreenState
    extends State<TranslationOrderListScreen> {
  final GrpcTranslationOrderService _service = GrpcTranslationOrderService();
  late Future<List<crm.TranslationOrder>> _ordersFuture;
  List<crm.TranslationOrder> _orders = [];
  PlutoGridStateManager? _plutoGridStateManager;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() {
    setState(() {
      _ordersFuture = _service.listTranslationOrders().then((orders) {
        _orders = orders;
        if (_plutoGridStateManager != null) {
          _updatePlutoGridRows();
        }
        return orders;
      });
    });
  }

  void _updatePlutoGridRows() {
    if (_plutoGridStateManager == null) return;
    // final localizations = AppLocalizations.of(context);
    final rows = _orders.map((order) {
      return PlutoRow(cells: {
        'orderId': PlutoCell(value: order.orderId),
        'title': PlutoCell(value: order.title),
        'status': PlutoCell(value: order.status.name),
        'createdAt': PlutoCell(
            value:
                formatTimestamp(order.hasCreatedAt() ? order.createdAt : null)),
        'doneAt': PlutoCell(
            value: formatTimestamp(order.hasDoneAt() ? order.doneAt : null)),
        'actions': PlutoCell(value: order.orderId),
      });
    }).toList();
    _plutoGridStateManager!.removeAllRows();
    _plutoGridStateManager!.appendRows(rows);
  }

  Future<void> _navigateAndRefresh({String? orderId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TranslationOrderFormScreen(orderId: orderId),
      ),
    );
    if (result == true && mounted) {
      _loadOrders();
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  localizations.translationOrderListScreenOrderDeletedSuccess)),
        );
        _loadOrders();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .translationOrderListScreenErrorDeletingOrder(e.toString()))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translationOrderListScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
      body: RefreshIndicator(
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
                child:
                    Text(localizations.translationOrderListScreenNoOrdersFound),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlutoGrid(
                columns: _getPlutoColumns(),
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
                    borderColor: Colors.transparent,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateAndRefresh(),
        tooltip: localizations.translationOrderListScreenCreateNewOrderTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }

  List<PlutoColumn> _getPlutoColumns() {
    final localizations = AppLocalizations.of(context);
    return [
      PlutoColumn(
        title: localizations.translationOrderListScreenOrderIdLabel(''),
        field: 'orderId',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 120,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenOrderTitleLabel(''),
        field: 'title',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 200,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenOrderStatusLabel(''),
        field: 'status',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 120,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenOrderCreatedLabel(''),
        field: 'createdAt',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 160,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenOrderDoneLabel(''),
        field: 'doneAt',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 160,
        readOnly: true,
      ),
      PlutoColumn(
        title: localizations.translationOrderListScreenColumnActions,
        field: 'actions',
        type: PlutoColumnType.text(),
        enableEditingMode: false,
        width: 120,
        readOnly: true,
        textAlign: PlutoColumnTextAlign.center,
        renderer: (rendererContext) {
          final String orderId = rendererContext.cell.value as String;
          // final order = _orders.firstWhere((o) => o.orderId == orderId, orElse: () => crm.TranslationOrder());
          // final orderTitle = order.title.isNotEmpty ? order.title : localizations.translationOrderListScreenUntitledOrder;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: localizations.translationOrderListScreenTooltipEdit,
                onPressed: () => _navigateAndRefresh(orderId: orderId),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: localizations.translationOrderListScreenTooltipDelete,
                onPressed: () => _deleteOrder(orderId),
              ),
            ],
          );
        },
      ),
    ];
  }
}

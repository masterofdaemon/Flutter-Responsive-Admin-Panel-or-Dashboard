import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_translation_order_service_mobile.dart'; // Adjust import if needed
import 'package:admin/screens/translation_orders/translation_order_form_screen.dart';
import 'package:admin/widgets/loading_indicator.dart'; // Assuming you have a loading widget
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/l10n/app_localizations.dart';

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

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() {
    setState(() {
      _ordersFuture = _service.listTranslationOrders();
    });
  }

  void _navigateToForm({String? orderId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TranslationOrderFormScreen(orderId: orderId),
      ),
    );
    // Reload list if an order was created or updated
    if (result == true) {
      _loadOrders();
    }
  }

  Future<void> _deleteOrder(String orderId) async {
    final localizations = AppLocalizations.of(context);
    try {
      // Optional: Show confirmation dialog
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
        await _service.deleteTranslationOrder(orderId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  localizations.translationOrderListScreenOrderDeletedSuccess)),
        );
        _loadOrders(); // Refresh the list
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .translationOrderListScreenErrorDeletingOrder(e.toString()))),
      );
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
          onPressed: () =>
              Navigator.of(context).maybePop(), // Changed to maybePop
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          // Add any action buttons here if needed
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadOrders(),
        child: FutureBuilder<List<crm.TranslationOrder>>(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator(); // Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                      localizations.translationOrderListScreenErrorLoading(
                          snapshot.error.toString())));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                      localizations.translationOrderListScreenNoOrdersFound));
            }

            final orders = snapshot.data!;

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(
                      order.title.isNotEmpty
                          ? order.title
                          : localizations
                              .translationOrderListScreenUntitledOrder,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(localizations
                            .translationOrderListScreenOrderIdLabel(
                                order.orderId)),
                        Text(localizations
                            .translationOrderListScreenOrderTitleLabel(
                                order.title.isNotEmpty ? order.title : '-')),
                        Text(localizations
                            .translationOrderListScreenOrderStatusLabel(
                                order.status.toString())),
                        Text(localizations
                            .translationOrderListScreenOrderCreatedLabel(
                                formatTimestamp(order.hasCreatedAt()
                                    ? order.createdAt
                                    : null))),
                        Text(localizations
                            .translationOrderListScreenOrderDoneLabel(
                                formatTimestamp(
                                    order.hasDoneAt() ? order.doneAt : null))),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteOrder(order.orderId),
                    ),
                    onTap: () => _navigateToForm(orderId: order.orderId),
                    isThreeLine: true,
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToForm(),
        tooltip: localizations.translationOrderListScreenCreateNewOrderTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}

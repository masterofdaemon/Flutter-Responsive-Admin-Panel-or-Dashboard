import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcTranslationOrderService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.TranslationOrder>> listTranslationOrders(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListTranslationOrdersRequest(
        pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listTranslationOrders(request,
          options: GrpcClient().getCallOptions());
      return response.translationOrders;
    } on GrpcError catch (e) {
      print('gRPC error during listTranslationOrders: $e');
      rethrow;
    }
  }

  Future<crm.TranslationOrder> createTranslationOrder(
      crm.TranslationOrder order) async {
    final request = crm.CreateTranslationOrderRequest(translationOrder: order);
    final response = await _client.createTranslationOrder(request,
        options: GrpcClient().getCallOptions());
    return await getTranslationOrder(response.orderId.toString());
  }

  Future<crm.TranslationOrder> getTranslationOrder(String orderId) async {
    final request =
        crm.GetTranslationOrderRequest(orderId: int.tryParse(orderId) ?? 0);
    final response = await _client.getTranslationOrder(request,
        options: GrpcClient().getCallOptions());
    return response.translationOrder;
  }

  Future<crm.TranslationOrder> updateTranslationOrder(
      String orderId, crm.TranslationOrder data) async {
    final request = crm.UpdateTranslationOrderRequest(
        orderId: int.tryParse(orderId) ?? 0, orderData: data);
    final response = await _client.updateTranslationOrder(request,
        options: GrpcClient().getCallOptions());
    return response.translationOrder;
  }

  Future<void> deleteTranslationOrder(String orderId) async {
    final request =
        crm.DeleteTranslationOrderRequest(orderId: int.tryParse(orderId) ?? 0);
    await _client.deleteTranslationOrder(request,
        options: GrpcClient().getCallOptions());
  }
}

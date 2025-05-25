// filepath: lib/services/grpc_interaction_service_mobile.dart
// Real gRPC implementation for Interaction service
// import 'package:grpc/grpc.dart'; // Removed unused import
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart'; // Import the shared GrpcClient

class GrpcInteractionService {
  // Use the shared GrpcClient instance
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.Interaction>> listInteractions(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListInteractionsRequest(
      pageSize: pageSize,
      pageToken: pageToken,
    );
    // Use shared call options
    final response = await _client.listInteractions(request,
        options: GrpcClient().getCallOptions());
    return response.interactions;
  }

  Future<crm.Interaction> createInteraction(crm.Interaction interaction) async {
    final request = crm.CreateInteractionRequest(interaction: interaction);
    final response = await _client.createInteraction(request,
        options: GrpcClient().getCallOptions());
    return await getInteraction(response.interactionId);
  }

  Future<crm.Interaction> getInteraction(int interactionId) async {
    final request = crm.GetInteractionRequest(interactionId: interactionId);
    final response = await _client.getInteraction(request,
        options: GrpcClient().getCallOptions());
    return response.interaction;
  }

  Future<crm.Interaction> updateInteraction(
      int interactionId, crm.Interaction data) async {
    final request = crm.UpdateInteractionRequest(
      interactionId: interactionId,
      interactionData: data,
    );
    final response = await _client.updateInteraction(request,
        options: GrpcClient().getCallOptions());
    return response.interaction;
  }

  Future<void> deleteInteraction(int interactionId) async {
    final request = crm.DeleteInteractionRequest(interactionId: interactionId);
    await _client.deleteInteraction(request,
        options: GrpcClient().getCallOptions());
  }
}

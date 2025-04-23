// filepath: lib/services/grpc_interaction_service_mobile.dart
// Real gRPC implementation for Interaction service
import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;

class GrpcInteractionService {
  late final ClientChannel _channel;
  late final CrmServiceClient _client;

  GrpcInteractionService({
    String host = 'localhost',
    int grpcPort = 50051,
    bool useTls = false,
  }) {
    _channel = ClientChannel(
      host,
      port: grpcPort,
      options: ChannelOptions(
        credentials: useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );
    _client = CrmServiceClient(_channel);
  }

  Future<List<crm.Interaction>> listInteractions(
      {int pageSize = 20, String pageToken = ''}) async {
    final request = crm.ListInteractionsRequest(
      pageSize: pageSize,
      pageToken: pageToken,
    );
    final response = await _client.listInteractions(request);
    return response.interactions;
  }

  Future<crm.Interaction> createInteraction(crm.Interaction interaction) async {
    final request = crm.CreateInteractionRequest(interaction: interaction);
    final response = await _client.createInteraction(request);
    return await getInteraction(response.interactionId);
  }

  Future<crm.Interaction> getInteraction(String interactionId) async {
    final request = crm.GetInteractionRequest(interactionId: interactionId);
    final response = await _client.getInteraction(request);
    return response.interaction;
  }

  Future<crm.Interaction> updateInteraction(
      String interactionId, crm.Interaction data) async {
    final request = crm.UpdateInteractionRequest(
      interactionId: interactionId,
      interactionData: data,
    );
    final response = await _client.updateInteraction(request);
    return response.interaction;
  }

  Future<void> deleteInteraction(String interactionId) async {
    final request = crm.DeleteInteractionRequest(interactionId: interactionId);
    await _client.deleteInteraction(request);
  }

  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}

GrpcInteractionService getGrpcInteractionService({
  String host = 'localhost',
  int grpcPort = 50051,
  bool useTls = false,
}) =>
    GrpcInteractionService(host: host, grpcPort: grpcPort, useTls: useTls);

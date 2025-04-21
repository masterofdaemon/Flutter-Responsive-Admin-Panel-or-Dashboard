import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;

class GrpcClientService {
  late final ClientChannel _channel;
  late final CrmServiceClient _client;

  GrpcClientService({
    String host = 'localhost',
    int grpcPort = 50051,
    bool useTls = false,
  }) {
    print('secure connection: $useTls');
    _channel = ClientChannel(
      host,
      port: grpcPort,
      options: ChannelOptions(
        credentials: useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );
    print('Connecting to gRPC server at: $host:$grpcPort');
    _client = CrmServiceClient(_channel);
  }

  Future<List<crm.Client>> listClients(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListClientsRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      print(
          'Requesting clients with pageSize: $pageSize, pageToken: $pageToken');
      final crm.ListClientsResponse response =
          await _client.listClients(request);
      return response.clients;
    } on GrpcError catch (e) {
      print('Caught gRPC error during listClients: $e');
      return [];
    } catch (e) {
      print('Caught other error during listClients: $e');
      return [];
    }
  }

  Future<crm.Client> createClient(crm.Client client) async {
    final request = crm.CreateClientRequest(client: client);
    try {
      print('Creating client: ${client.firstName} ${client.lastName}');
      final crm.CreateClientResponse response =
          await _client.createClient(request);
      return await getClient(response.clientId);
    } on GrpcError catch (e) {
      print('Caught gRPC error during createClient: $e');
      rethrow;
    } catch (e) {
      print('Caught other error during createClient: $e');
      rethrow;
    }
  }

  Future<crm.Client> getClient(String clientId) async {
    final request = crm.GetClientRequest(clientId: clientId);
    try {
      print('Fetching client with ID: $clientId');
      final crm.GetClientResponse response = await _client.getClient(request);
      return response.client;
    } on GrpcError catch (e) {
      print('Caught gRPC error during getClient: $e');
      rethrow;
    } catch (e) {
      print('Caught other error during getClient: $e');
      rethrow;
    }
  }

  Future<crm.Client> updateClient(
      String clientId, crm.Client clientData) async {
    final request =
        crm.UpdateClientRequest(clientId: clientId, clientData: clientData);
    try {
      print('Updating client with ID: $clientId');
      final crm.UpdateClientResponse response =
          await _client.updateClient(request);
      return response.client;
    } on GrpcError catch (e) {
      print('Caught gRPC error during updateClient: $e');
      rethrow;
    } catch (e) {
      print('Caught other error during updateClient: $e');
      rethrow;
    }
  }

  Future<void> deleteClient(String clientId) async {
    final request = crm.DeleteClientRequest(clientId: clientId);
    try {
      print('Deleting client with ID: $clientId');
      await _client.deleteClient(request);
      print('Client $clientId deleted successfully via mobile service.');
    } on GrpcError catch (e) {
      print('Caught gRPC error during deleteClient: $e');
      rethrow;
    } catch (e) {
      print('Caught other error during deleteClient: $e');
      rethrow;
    }
  }

  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}

GrpcClientService getGrpcClientService({
  String host = 'localhost',
  int grpcPort = 50051,
  int grpcWebPort = 50051, // Keep signature consistent, but not used here
  bool useTls = false,
}) =>
    GrpcClientService(host: host, grpcPort: grpcPort, useTls: useTls);

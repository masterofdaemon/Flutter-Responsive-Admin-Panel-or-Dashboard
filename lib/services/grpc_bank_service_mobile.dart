import 'package:grpc/grpc.dart';
import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_client.dart';

class GrpcBankService {
  final CrmServiceClient _client = CrmServiceClient(GrpcClient().channel);

  Future<List<crm.Bank>> listBanks(
      {int pageSize = 20, String pageToken = ''}) async {
    final request =
        crm.ListBanksRequest(pageSize: pageSize, pageToken: pageToken);
    try {
      final response = await _client.listBanks(request,
          options: GrpcClient().getCallOptions());
      return response.banks;
    } on GrpcError catch (e) {
      print('gRPC error during listBanks: $e');
      rethrow;
    }
  }

  Future<crm.Bank> createBank(crm.Bank bank) async {
    final request = crm.CreateBankRequest(bank: bank);
    final response = await _client.createBank(request,
        options: GrpcClient().getCallOptions());
    return await getBank(response.bankId);
  }

  Future<crm.Bank> getBank(String bankId) async {
    final request = crm.GetBankRequest(bankId: bankId);
    final response =
        await _client.getBank(request, options: GrpcClient().getCallOptions());
    return response.bank;
  }

  Future<crm.Bank> updateBank(String bankId, crm.Bank data) async {
    final request = crm.UpdateBankRequest(bankId: bankId, bankData: data);
    final response = await _client.updateBank(request,
        options: GrpcClient().getCallOptions());
    return response.bank;
  }

  Future<void> deleteBank(String bankId) async {
    final request = crm.DeleteBankRequest(bankId: bankId);
    await _client.deleteBank(request, options: GrpcClient().getCallOptions());
  }
}

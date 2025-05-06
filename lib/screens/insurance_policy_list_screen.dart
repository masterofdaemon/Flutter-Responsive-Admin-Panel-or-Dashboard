import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_insurance_policy_service_mobile.dart';
import 'insurance_policy_form_screen.dart';

class InsurancePolicyListScreen extends StatefulWidget {
  const InsurancePolicyListScreen({super.key});

  @override
  State<InsurancePolicyListScreen> createState() =>
      _InsurancePolicyListScreenState();
}

class _InsurancePolicyListScreenState extends State<InsurancePolicyListScreen> {
  final GrpcInsurancePolicyService _service = GrpcInsurancePolicyService();
  late Future<List<crm.InsurancePolicy>> _policiesFuture;

  @override
  void initState() {
    super.initState();
    _loadPolicies();
  }

  void _loadPolicies() {
    setState(() {
      _policiesFuture = _service.listInsurancePolicies(pageSize: 100);
    });
  }

  void _navigateToForm({String? policyId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InsurancePolicyFormScreen(policyId: policyId),
      ),
    );
    if (result == true) {
      _loadPolicies();
    }
  }

  Future<void> _deletePolicy(String policyId) async {
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Policy?'),
          content: const Text('Are you sure you want to delete this policy?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );
      if (confirm == true) {
        await _service.deleteInsurancePolicy(policyId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Policy deleted successfully')),
        );
        _loadPolicies();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting policy: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Policies'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Policy',
            onPressed: () => _navigateToForm(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadPolicies(),
        child: FutureBuilder<List<crm.InsurancePolicy>>(
          future: _policiesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No insurance policies found.'));
            }
            final policies = snapshot.data!;
            return ListView.builder(
              itemCount: policies.length,
              itemBuilder: (context, index) {
                final policy = policies[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(policy.policyNumber.isNotEmpty
                        ? policy.policyNumber
                        : 'No Policy Number'),
                    subtitle: Text(
                        'Client: ${policy.clientId}\nManager: ${policy.managerId}\nAmount: ${policy.amount}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: 'Edit Policy',
                          onPressed: () =>
                              _navigateToForm(policyId: policy.policyId),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete Policy',
                          onPressed: () => _deletePolicy(policy.policyId),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

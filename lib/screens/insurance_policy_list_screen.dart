import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_insurance_policy_service_mobile.dart';
import 'insurance_policy_form_screen.dart';
import 'package:admin/screens/main/main_screen.dart'; // Added
import 'package:admin/l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context);
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(localizations.insurancePolicyListScreenDeleteDialogTitle),
          content:
              Text(localizations.insurancePolicyListScreenDeleteDialogContent),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(localizations
                  .insurancePolicyListScreenDeleteDialogCancelButton),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(localizations
                  .insurancePolicyListScreenDeleteDialogDeleteButton),
            ),
          ],
        ),
      );
      if (confirm == true) {
        await _service.deleteInsurancePolicy(policyId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  localizations.insurancePolicyListScreenPolicyDeletedSuccess)),
        );
        _loadPolicies();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .insurancePolicyListScreenErrorDeletingPolicy(e.toString()))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.insurancePolicyListScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          // onPressed: () => Navigator.of(context).maybePop(), // Original
          onPressed: () {
            // Changed
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).maybePop();
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }
          },
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: localizations.insurancePolicyListScreenAddPolicyTooltip,
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
              return Center(
                  child: Text(
                      localizations.insurancePolicyListScreenErrorLoading(
                          snapshot.error.toString())));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                      localizations.insurancePolicyListScreenNoPoliciesFound));
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
                        : localizations
                            .insurancePolicyListScreenNoPolicyNumber),
                    subtitle: Text(
                        localizations.insurancePolicyListScreenListItemSubtitle(
                            policy.clientId.toString(),
                            policy.managerId.toString(),
                            policy.amount.toString())),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: localizations
                              .insurancePolicyListScreenEditPolicyTooltip,
                          onPressed: () => _navigateToForm(
                              policyId: policy.policyId.toString()),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: localizations
                              .insurancePolicyListScreenDeletePolicyTooltip,
                          onPressed: () =>
                              _deletePolicy(policy.policyId.toString()),
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

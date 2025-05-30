import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_legal_case_service_mobile.dart';
import 'legal_case_form_screen.dart';
import 'package:admin/screens/main/main_screen.dart';

class LegalCaseListScreen extends StatefulWidget {
  const LegalCaseListScreen({super.key});

  @override
  State<LegalCaseListScreen> createState() => _LegalCaseListScreenState();
}

class _LegalCaseListScreenState extends State<LegalCaseListScreen> {
  final GrpcLegalCaseService _service = GrpcLegalCaseService();
  late Future<List<crm.LegalCase>> _casesFuture;

  @override
  void initState() {
    super.initState();
    _loadCases();
  }

  void _loadCases() {
    setState(() {
      _casesFuture = _service.listLegalCases(pageSize: 100);
    });
  }

  void _navigateToForm({int? caseId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LegalCaseFormScreen(caseId: caseId),
      ),
    );
    if (result == true) {
      _loadCases();
    }
  }

  Future<void> _deleteCase(int caseId) async {
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Delete'),
          content:
              const Text('Are you sure you want to delete this legal case?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );

      if (confirm == true) {
        await _service.deleteLegalCase(caseId);
        _loadCases();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Legal case deleted successfully')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting legal case: $e')),
        );
      }
    }
  }

  String _formatStatus(crm.Status status) {
    switch (status) {
      case crm.Status.ACTIVE:
        return 'Active';
      case crm.Status.COMPLETED:
        return 'Completed';
      case crm.Status.CANCELLED:
        return 'Cancelled';
      case crm.Status.DRAFT:
        return 'Draft';
      case crm.Status.PENDING:
        return 'Pending';
      default:
        return 'Unknown';
    }
  }

  Color _getStatusColor(crm.Status status) {
    switch (status) {
      case crm.Status.ACTIVE:
        return Colors.orange;
      case crm.Status.COMPLETED:
        return Colors.green;
      case crm.Status.CANCELLED:
        return Colors.red;
      case crm.Status.DRAFT:
        return Colors.blue;
      case crm.Status.PENDING:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legal Cases'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
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
            onPressed: () => _navigateToForm(),
            tooltip: 'Add New Legal Case',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<crm.LegalCase>>(
                future: _casesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, size: 64, color: Colors.red),
                          const SizedBox(height: 16),
                          Text('Error: ${snapshot.error}'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadCases,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  final cases = snapshot.data ?? [];

                  if (cases.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.gavel, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No legal cases found',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Create your first legal case to get started',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Case ID')),
                        DataColumn(label: Text('Client ID')),
                        DataColumn(label: Text('Manager ID')),
                        DataColumn(label: Text('Issue Type')),
                        DataColumn(label: Text('Contract Amount')),
                        DataColumn(label: Text('Expected Commission')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Consultation Date')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: cases.map((legalCase) {
                        return DataRow(
                          cells: [
                            DataCell(Text(legalCase.caseId.toString())),
                            DataCell(Text(legalCase.clientId.toString())),
                            DataCell(Text(legalCase.managerId.toString())),
                            DataCell(Text(legalCase.issueTypeId.toString())),
                            DataCell(Text(
                                '\$${legalCase.contractAmount.toStringAsFixed(2)}')),
                            DataCell(Text(
                                '\$${legalCase.expectedCommission.toStringAsFixed(2)}')),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(legalCase.status),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  _formatStatus(legalCase.status),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                legalCase.hasConsultationDate()
                                    ? '${legalCase.consultationDate.toDateTime().day}/${legalCase.consultationDate.toDateTime().month}/${legalCase.consultationDate.toDateTime().year}'
                                    : 'Not scheduled',
                              ),
                            ),
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 18),
                                    onPressed: () => _navigateToForm(
                                        caseId: legalCase.caseId),
                                    tooltip: 'Edit',
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, size: 18),
                                    onPressed: () =>
                                        _deleteCase(legalCase.caseId),
                                    tooltip: 'Delete',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

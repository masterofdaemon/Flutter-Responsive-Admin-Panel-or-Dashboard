import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/grpc_lending_application_service_mobile.dart';
import 'lending_application_form_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/l10n/app_localizations.dart';

class LendingApplicationListScreen extends StatefulWidget {
  const LendingApplicationListScreen({super.key});

  @override
  State<LendingApplicationListScreen> createState() =>
      _LendingApplicationListScreenState();
}

class _LendingApplicationListScreenState
    extends State<LendingApplicationListScreen> {
  final GrpcLendingApplicationService _service =
      GrpcLendingApplicationService();
  late Future<List<crm.LendingApplication>> _applicationsFuture;

  @override
  void initState() {
    super.initState();
    _loadApplications();
  }

  void _loadApplications() {
    setState(() {
      _applicationsFuture = _service.listLendingApplications(pageSize: 100);
    });
  }

  void _navigateToForm({String? requestId}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LendingApplicationFormScreen(requestId: requestId),
      ),
    );
    if (result == true) {
      _loadApplications();
    }
  }

  Future<void> _deleteApplication(String requestId) async {
    final localizations = AppLocalizations.of(context);
    try {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
              localizations.lendingApplicationListScreenConfirmDeleteTitle),
          content: Text(
              localizations.lendingApplicationListScreenConfirmDeleteContent),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child:
                  Text(localizations.lendingApplicationListScreenActionCancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child:
                  Text(localizations.lendingApplicationListScreenActionDelete),
            ),
          ],
        ),
      );
      if (confirm == true) {
        await _service.deleteLendingApplication(requestId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .lendingApplicationListScreenFeedbackSuccessDelete)),
        );
        _loadApplications();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                localizations.lendingApplicationListScreenFeedbackErrorDelete(
                    e.toString()))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.lendingApplicationListScreenTitle),
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
            tooltip: localizations.lendingApplicationListScreenTooltipAdd,
            onPressed: () => _navigateToForm(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadApplications(),
        child: FutureBuilder<List<crm.LendingApplication>>(
          future: _applicationsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                      localizations.lendingApplicationListScreenErrorLoading(
                          snapshot.error.toString())));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text(localizations
                      .lendingApplicationListScreenNoApplicationsFound));
            }
            final applications = snapshot.data!;
            return ListView.builder(
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final app = applications[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(app.requestId != 0
                        ? app.requestId.toString()
                        : localizations
                            .lendingApplicationListScreenListItemNoId),
                    subtitle: Text(localizations
                        .lendingApplicationListScreenListItemSubtitle(
                      app.clientId.toString(),
                      app.managerId.toString(),
                      app.bankId.toString(),
                    )),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: localizations
                              .lendingApplicationListScreenTooltipEdit,
                          onPressed: () => _navigateToForm(
                              requestId: app.requestId.toString()),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: localizations
                              .lendingApplicationListScreenTooltipDelete,
                          onPressed: () =>
                              _deleteApplication(app.requestId.toString()),
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

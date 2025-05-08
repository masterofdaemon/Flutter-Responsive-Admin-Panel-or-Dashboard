import 'package:flutter/material.dart';
import 'package:admin/services/grpc_interaction_service_mobile.dart'; // Correct import
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/screens/interaction_form_screen.dart';
import 'package:intl/intl.dart'; // Added for DateFormat
import 'package:grpc/grpc.dart'
    hide ConnectionState; // Added hide for ConnectionState
import 'package:admin/screens/main/main_screen.dart'; // Added
import 'package:admin/l10n/app_localizations.dart'; // Added

// Helper function to format date from crm.Interaction
String formatInteractionDate(crm.Interaction interaction) {
  if (!interaction.hasDate()) return '-';
  final seconds = interaction.date.seconds.toInt();
  final date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('yyyy-MM-dd').format(date);
}

// Helper function to format end time from crm.Interaction
String formatInteractionEndTime(crm.Interaction interaction) {
  if (!interaction.hasEndTime()) return '-';
  final seconds = interaction.endTime.seconds.toInt();
  final date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('yyyy-MM-dd HH:mm').format(date);
}

// Helper function to get user-friendly interaction type name (can be reused or imported)
String getInteractionTypeName(
    crm.InteractionType type, AppLocalizations localizations) {
  if (type == crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED) {
    return localizations.interactionListUnspecifiedType;
  }
  return type.name.replaceFirst('INTERACTION_TYPE_', '').replaceAll('_', ' ');
}

class InteractionListScreen extends StatefulWidget {
  const InteractionListScreen({Key? key}) : super(key: key);
  @override
  _InteractionListScreenState createState() => _InteractionListScreenState();
}

class _InteractionListScreenState extends State<InteractionListScreen> {
  // Instantiate service directly
  final GrpcInteractionService _interactionService = GrpcInteractionService();
  late Future<List<crm.Interaction>> _future;
  Map<String, String> _clientNames = {};
  Map<String, String> _employeeNames = {};
  bool _namesLoading = false;
  bool _isLoading = false; // Re-add _isLoading state variable

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    setState(() {
      _isLoading = true; // Set loading true when starting load
      _future = _interactionService.listInteractions();
      // Fetching client/employee names needs a separate implementation
      // E.g., fetch interactions first, then fetch related client/employee data based on IDs
      _future.then((_) => _fetchNames()).whenComplete(() {
        if (mounted) {
          setState(() {
            _isLoading = false;
          }); // Set loading false when done
        }
      });
    });
  }

  // Separate function to fetch names (implement if needed)
  Future<void> _fetchNames() async {
    // Implement logic to fetch client/employee names based on loaded interactions
    // This might involve calling client/employee services
    // Set _namesLoading = true/false around the async calls
    // Populate _clientNames and _employeeNames maps
    // Example placeholder:
    // setState(() => _namesLoading = true);
    // await Future.delayed(Duration(seconds: 1)); // Simulate network call
    // setState(() => _namesLoading = false);
    print("Placeholder: _fetchNames called, implement if needed.");
  }

  Future<void> _delete(String id) async {
    final localizations = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(localizations.interactionListConfirmDeleteTitle),
        content: Text(localizations.interactionListConfirmDeleteMessage),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(localizations.interactionListCancelButton)),
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () => Navigator.pop(context, true),
              child: Text(localizations.interactionListDeleteButton)),
        ],
      ),
    );
    if (confirm == true) {
      try {
        await _interactionService.deleteInteraction(id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(localizations.interactionListDeletedSuccess)));
        _load(); // Refresh list after delete
      } on GrpcError catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(localizations
                .interactionListErrorDeleting(e.message ?? e.toString()))));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                localizations.interactionListErrorDeleting(e.toString()))));
      }
    }
  }

  // Modify _navForm to pass the interaction object
  Future<void> _navForm({crm.Interaction? interaction}) async {
    // Accept optional interaction object
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => InteractionFormScreen(
              interaction: interaction)), // Pass the object
    );
    if (result == true) {
      _load(); // Refresh list if save was successful
    }
  }

  @override
  void dispose() {
    // No need to shutdown service if using shared channel
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.interactionListTitle), // Simplified title
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
          IconButton(icon: const Icon(Icons.add), onPressed: () => _navForm())
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _load();
        },
        child: FutureBuilder<List<crm.Interaction>>(
          future: _future,
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done ||
                _namesLoading ||
                _isLoading) {
              // Check _isLoading as well
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(
                  child: Text(localizations
                      .interactionListErrorLoading(snap.error.toString())));
            }
            final List<crm.Interaction> list = snap.data ?? <crm.Interaction>[];
            if (list.isEmpty) {
              return Center(
                  child:
                      Text(localizations.interactionListNoInteractionsFound));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Text(localizations.interactionListIdHeader)),
                    DataColumn(
                        label: Text(localizations.interactionListClientHeader)),
                    DataColumn(
                        label:
                            Text(localizations.interactionListEmployeeHeader)),
                    DataColumn(
                        label: Text(localizations.interactionListDateHeader)),
                    DataColumn(
                        label: Text(localizations
                            .interactionListTypeHeader)), // Updated header
                    DataColumn(
                        label: Text(
                            localizations.interactionListDescriptionHeader)),
                    DataColumn(
                        label:
                            Text(localizations.interactionListSubjectHeader)),
                    DataColumn(
                        label:
                            Text(localizations.interactionListEndTimeHeader)),
                    DataColumn(
                        label:
                            Text(localizations.interactionListScheduledHeader)),
                    DataColumn(
                        label:
                            Text(localizations.interactionListCompletedHeader)),
                    DataColumn(
                        label: Text(localizations.interactionListNotesHeader)),
                    DataColumn(
                        label:
                            Text(localizations.interactionListActionsHeader)),
                  ],
                  rows: list.map((i) {
                    final clientName = _clientNames[i.clientId] ??
                        i.clientId; // Fallback to ID
                    final employeeName = _employeeNames[i.employeeId] ??
                        i.employeeId; // Fallback to ID
                    return DataRow(
                      cells: [
                        DataCell(Text(i.interactionId)),
                        DataCell(Text(clientName)),
                        DataCell(Text(employeeName)),
                        DataCell(Text(formatInteractionDate(i))),
                        DataCell(Text(getInteractionTypeName(i.type,
                            localizations))), // Use helper for enum display
                        DataCell(Text(
                            i.description.isNotEmpty ? i.description : '-')),
                        DataCell(Text(i.subject.isNotEmpty ? i.subject : '-')),
                        DataCell(Text(formatInteractionEndTime(
                            i))), // Use helper for end time
                        DataCell(Text(i.isScheduled
                            ? localizations.interactionListYes
                            : localizations.interactionListNo)),
                        DataCell(Text(i.isCompleted
                            ? localizations.interactionListYes
                            : localizations.interactionListNo)),
                        DataCell(Text(i.notes.isNotEmpty ? i.notes : '-')),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              tooltip: localizations
                                  .interactionListEditInteractionTooltip,
                              onPressed: () => _navForm(
                                  interaction: i), // Pass interaction object
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.red), // Added color
                              tooltip: localizations
                                  .interactionListDeleteInteractionTooltip,
                              onPressed: () => _delete(i.interactionId),
                            ),
                          ],
                        )),
                      ],
                      // Optional: Add onSelectChanged for details view if needed
                      /*
                      onSelectChanged: (_) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(localizations.interactionListDetailsDialogTitle),
                            content: SingleChildScrollView( // Make content scrollable
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${localizations.interactionListIdHeader}: ${i.interactionId}'),
                                  Text('${localizations.interactionListClientHeader}: $clientName'),
                                  Text('${localizations.interactionListEmployeeHeader}: $employeeName'),
                                  Text('${localizations.interactionListDateHeader}: ${formatInteractionDate(i)}'),
                                  Text('${localizations.interactionListTypeHeader}: ${getInteractionTypeName(i.type, localizations)}'),
                                  Text(
                                      '${localizations.interactionListDescriptionHeader}: ${i.description.isNotEmpty ? i.description : '-'}'),
                                  Text(
                                      '${localizations.interactionListSubjectHeader}: ${i.subject.isNotEmpty ? i.subject : '-'}'),
                                  Text(
                                      '${localizations.interactionListEndTimeHeader}: ${formatInteractionEndTime(i)}'),
                                  Text(
                                      '${localizations.interactionListScheduledHeader}: ${i.isScheduled ? localizations.interactionListYes : localizations.interactionListNo}'),
                                  Text(
                                      '${localizations.interactionListCompletedHeader}: ${i.isCompleted ? localizations.interactionListYes : localizations.interactionListNo}'),
                                  Text('${localizations.interactionListNotesHeader}: ${i.notes.isNotEmpty ? i.notes : '-'}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(localizations.interactionListCloseButton),
                              )
                            ],
                          ),
                        );
                      },
                      */
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Helper extension (move to utils if used elsewhere)
// ...existing code...

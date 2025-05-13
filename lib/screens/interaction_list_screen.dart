import 'package:flutter/material.dart';
import 'package:admin/services/grpc_interaction_service_mobile.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/screens/interaction_form_screen.dart';
import 'package:intl/intl.dart';
import 'package:grpc/grpc.dart' hide ConnectionState;
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/l10n/app_localizations.dart';

// Helper function to format date from crm.Interaction
String formatInteractionDateHelper(
    crm.Interaction interaction, AppLocalizations localizations) {
  if (!interaction.hasInteractionDate()) {
    try {
      return localizations
          .interactionFormScreenLabelDateNotSet; // Re-use existing key
    } catch (_) {
      return 'Date not set'; // Fallback
    }
  }
  final seconds = interaction.interactionDate.seconds.toInt();
  final date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('yyyy-MM-dd').format(date);
}

// Helper function to get user-friendly interaction type name
String getInteractionTypeNameHelper(
    crm.InteractionType type, AppLocalizations localizations) {
  try {
    switch (type) {
      case crm.InteractionType.INTERACTION_TYPE_CALL:
        return localizations.interactionTypeCall;
      case crm.InteractionType.INTERACTION_TYPE_EMAIL:
        return localizations.interactionTypeEmail;
      case crm.InteractionType.INTERACTION_TYPE_MEETING:
        return localizations.interactionTypeMeeting;
      case crm.InteractionType.INTERACTION_TYPE_UNSPECIFIED:
      default:
        return localizations.interactionListUnspecifiedType;
    }
  } catch (_) {
    // Fallback if specific keys are missing
    String formattedName = type.name
        .replaceFirst('INTERACTION_TYPE_', '')
        .replaceAll('_', ' ')
        .toLowerCase();
    if (formattedName.isEmpty) return "Unspecified";
    List<String> words = formattedName.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    return words.join(' ');
  }
}

class InteractionListScreen extends StatefulWidget {
  const InteractionListScreen({Key? key}) : super(key: key);
  @override
  _InteractionListScreenState createState() => _InteractionListScreenState();
}

class _InteractionListScreenState extends State<InteractionListScreen> {
  final GrpcInteractionService _interactionService = GrpcInteractionService();
  late Future<List<crm.Interaction>> _futureInteractions;
  Map<String, String> _clientNames = {};
  Map<String, String> _managerNames = {};
  bool _namesLoading = false;
  bool _isLoadingData = true;

  @override
  void initState() {
    super.initState();
    _loadInteractions();
  }

  void _loadInteractions() {
    setState(() {
      _isLoadingData = true;
    });
    _futureInteractions = _interactionService.listInteractions();
    _futureInteractions.then((interactions) {
      _fetchAssociatedNames(interactions);
    }).catchError((error) {
      if (mounted) {
        String errorMessage = "Error loading interactions: ${error.toString()}";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }).whenComplete(() {
      if (mounted) {
        setState(() {
          _isLoadingData = false;
        });
      }
    });
  }

  Future<void> _fetchAssociatedNames(List<crm.Interaction> interactions) async {
    if (!mounted) return;
    // Placeholder for fetching names.
    // setState(() => _namesLoading = true);
    // await Future.delayed(const Duration(milliseconds: 50));
    // setState(() => _namesLoading = false);
  }

  Future<void> _deleteInteraction(String id) async {
    final localizations =
        AppLocalizations.of(context); // Removed unnecessary '!'
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
        _loadInteractions();
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

  Future<void> _navigateToForm({crm.Interaction? interaction}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => InteractionFormScreen(interaction: interaction)),
    );
    if (result == true) {
      _loadInteractions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations =
        AppLocalizations.of(context); // Removed unnecessary '!'
    String notSetDisplay;
    try {
      notSetDisplay =
          localizations.interactionFormScreenLabelDateNotSet; // Re-use
    } catch (_) {
      notSetDisplay = 'Not set'; // Fallback
    }

    // Column Headers - with fallbacks
    String managerHeader;
    try {
      managerHeader = localizations.interactionListManagerHeader;
    } catch (_) {
      managerHeader = 'Manager';
    }

    String summaryHeader;
    try {
      summaryHeader = localizations.interactionListSummaryHeader;
    } catch (_) {
      summaryHeader = 'Summary';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.interactionListTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).maybePop();
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen()), // Removed const
              );
            }
          },
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.add), onPressed: () => _navigateToForm())
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadInteractions();
        },
        child: FutureBuilder<List<crm.Interaction>>(
          future: _futureInteractions,
          builder: (context, snapshot) {
            if (_isLoadingData || _namesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.waiting &&
                (_isLoadingData || _namesLoading)) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              String errorMessage = "Error: ${snapshot.error.toString()}";
              // Removed unnecessary null check for localizations
              try {
                errorMessage = localizations
                    .interactionListErrorLoading(snapshot.error.toString());
              } catch (_) {/* use default error message */}
              return Center(child: Text(errorMessage));
            }
            final List<crm.Interaction> interactions = snapshot.data ?? [];
            if (interactions.isEmpty && !(_isLoadingData || _namesLoading)) {
              String noInteractionsMessage = "No interactions found.";
              // Removed unnecessary null check for localizations
              try {
                noInteractionsMessage =
                    localizations.interactionListNoInteractionsFound;
              } catch (_) {/* use default message */}
              return Center(child: Text(noInteractionsMessage));
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
                    DataColumn(label: Text(managerHeader)), // Use managerHeader
                    DataColumn(
                        label: Text(localizations.interactionListDateHeader)),
                    DataColumn(
                        label: Text(localizations.interactionListTypeHeader)),
                    DataColumn(label: Text(summaryHeader)), // Use summaryHeader
                    DataColumn(
                        label: Text(localizations.interactionListNotesHeader)),
                    DataColumn(
                        label:
                            Text(localizations.interactionListActionsHeader)),
                  ],
                  rows: interactions.map((interaction) {
                    final clientName = _clientNames[interaction.clientId] ??
                        interaction.clientId;
                    final managerName = _managerNames[interaction.managerId] ??
                        interaction.managerId;

                    return DataRow(
                      cells: [
                        DataCell(Text(interaction.interactionId)),
                        DataCell(Text(clientName)),
                        DataCell(Text(managerName)),
                        DataCell(Text(formatInteractionDateHelper(
                            interaction, localizations))),
                        DataCell(Text(getInteractionTypeNameHelper(
                            interaction.type, localizations))),
                        DataCell(Text(interaction.summary.isNotEmpty
                            ? interaction.summary
                            : notSetDisplay)),
                        DataCell(Text(interaction.notes.isNotEmpty
                            ? interaction.notes
                            : notSetDisplay)),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              tooltip: localizations
                                  .interactionListEditInteractionTooltip,
                              onPressed: () =>
                                  _navigateToForm(interaction: interaction),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: localizations
                                  .interactionListDeleteInteractionTooltip,
                              onPressed: () =>
                                  _deleteInteraction(interaction.interactionId),
                            ),
                          ],
                        )),
                      ],
                      onSelectChanged: (_) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(localizations
                                .interactionListDetailsDialogTitle),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${localizations.interactionListIdHeader}: ${interaction.interactionId}'),
                                  Text(
                                      '${localizations.interactionListClientHeader}: $clientName'),
                                  Text(
                                      '$managerHeader: $managerName'), // Use managerHeader
                                  Text(
                                      '${localizations.interactionListDateHeader}: ${formatInteractionDateHelper(interaction, localizations)}'),
                                  Text(
                                      '${localizations.interactionListTypeHeader}: ${getInteractionTypeNameHelper(interaction.type, localizations)}'),
                                  Text(
                                      '$summaryHeader: ${interaction.summary.isNotEmpty ? interaction.summary : notSetDisplay}'), // Use summaryHeader
                                  Text(
                                      '${localizations.interactionListNotesHeader}: ${interaction.notes.isNotEmpty ? interaction.notes : notSetDisplay}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                    localizations.interactionListCloseButton),
                              )
                            ],
                          ),
                        );
                      },
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

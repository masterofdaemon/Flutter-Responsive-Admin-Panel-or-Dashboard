import 'package:admin/models/office_view_model.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/services/grpc_office_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/screens/offices/office_form_screen.dart';
import 'package:admin/constants.dart'; // For defaultPadding
import 'package:admin/l10n/app_localizations.dart';

class OfficesScreen extends StatefulWidget {
  const OfficesScreen({super.key});

  @override
  State<OfficesScreen> createState() => _OfficesScreenState();
}

class _OfficesScreenState extends State<OfficesScreen> {
  final GrpcOfficeService _officeService = GrpcOfficeService();
  List<crm.Office> _offices = [];
  bool _isLoading = true;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _loadOffices();
  }

  Future<void> _loadOffices() async {
    setState(() {
      _isLoading = true;
    });
    try {
      // TODO: Implement pagination or load all if not too many
      final offices = await _officeService.listOffices(pageSize: 100);
      setState(() {
        _offices = offices;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)
                .officesScreenErrorLoading(e.toString()))),
      );
    }
  }

  List<crm.Office> get _filteredOffices {
    if (_searchTerm.isEmpty) {
      return _offices;
    }
    return _offices
        .where((office) =>
            office.city.toLowerCase().contains(_searchTerm.toLowerCase()) ||
            (office.address
                .toLowerCase()
                .contains(_searchTerm.toLowerCase())) ||
            (office.phone.toLowerCase().contains(_searchTerm.toLowerCase())))
        .toList();
  }

  void _navigateAndRefresh(BuildContext context, Widget screen) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
    if (result == true) {
      _loadOffices();
    }
  }

  void _deleteOffice(crm.Office office) async {
    try {
      await _officeService.deleteOffice(office.officeId.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)
                .officesScreenSuccessDeleted(office.city))),
      );
      _loadOffices(); // Refresh the list
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)
                .officesScreenErrorDeleting(e.toString()))),
      );
    }
  }

  void _showDeleteConfirmationDialog(crm.Office office) {
    final localizations = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.officesScreenConfirmDeleteTitle),
          content: Text(
              localizations.officesScreenConfirmDeleteMessage(office.city)),
          actions: <Widget>[
            TextButton(
              child: Text(localizations.officesScreenConfirmDeleteCancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(localizations.officesScreenConfirmDeleteConfirm),
              onPressed: () {
                Navigator.of(context).pop();
                _deleteOffice(office);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.officesScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: localizations.officesScreenSearchHint,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchTerm = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredOffices.length,
                    itemBuilder: (context, index) {
                      final office = _filteredOffices[index];
                      final viewModel = OfficeViewModel(office);
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding / 2),
                        child: ListTile(
                          title: Text(viewModel.cityAndAddress),
                          subtitle: Text(viewModel.phoneAndNotes),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                tooltip: localizations.officesScreenTooltipEdit,
                                onPressed: () {
                                  _navigateAndRefresh(
                                    context,
                                    OfficeFormScreen(
                                        officeId: office.officeId.toString()),
                                  );
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                tooltip:
                                    localizations.officesScreenTooltipDelete,
                                onPressed: () =>
                                    _showDeleteConfirmationDialog(office),
                              ),
                            ],
                          ),
                          onTap: () {
                            _navigateAndRefresh(
                              context,
                              OfficeFormScreen(
                                  officeId: office.officeId.toString()),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateAndRefresh(context, const OfficeFormScreen());
        },
        child: const Icon(Icons.add),
        tooltip: localizations.officesScreenTooltipAdd,
      ),
    );
  }
}

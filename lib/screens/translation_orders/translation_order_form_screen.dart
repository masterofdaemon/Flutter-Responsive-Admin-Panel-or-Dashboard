import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For TextInputFormatters
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/generated/google/protobuf/timestamp.pb.dart'
    as $timestamp; // Import Timestamp
import 'package:admin/services/grpc_translation_order_service_mobile.dart';
import 'package:admin/services/grpc_client_service.dart'; // Assuming this service fetches Employees/Offices
import 'package:admin/widgets/loading_indicator.dart';
import 'package:fixnum/fixnum.dart'; // For Int64
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/l10n/app_localizations.dart';

// Helper function to convert Timestamp to DateTime (handle null)
DateTime? timestampToDateTime($timestamp.Timestamp? ts) {
  // Use imported Timestamp
  if (ts == null) return null;
  // Convert seconds and nanos (Int64) to milliseconds since epoch
  final millis = ts.seconds.toInt() * 1000 + (ts.nanos / 1000000).round();
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
}

// Helper function to convert DateTime to Timestamp (handle null)
$timestamp.Timestamp? dateTimeToTimestamp(DateTime? dt) {
  // Use imported Timestamp
  if (dt == null) return null;
  final millis = dt.toUtc().millisecondsSinceEpoch;
  final seconds = Int64(millis ~/ 1000);
  final nanos = (millis % 1000) * 1000000;
  return $timestamp.Timestamp(
      seconds: seconds, nanos: nanos); // Use imported Timestamp constructor
}

class TranslationOrderFormScreen extends StatefulWidget {
  final String? orderId; // Null for creating, non-null for editing

  const TranslationOrderFormScreen({super.key, this.orderId});

  @override
  State<TranslationOrderFormScreen> createState() =>
      _TranslationOrderFormScreenState();
}

class _TranslationOrderFormScreenState
    extends State<TranslationOrderFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcTranslationOrderService _orderService =
      GrpcTranslationOrderService();
  // Assuming a service to fetch related data like employees/offices
  final GrpcClientService _clientService = GrpcClientService();

  bool _isLoading = false;
  bool _isFetchingInitialData = false; // Separate flag for initial load
  crm.TranslationOrder? _initialOrderData;

  // --- Controllers & State Variables ---
  final _titleController = TextEditingController();
  final _clientIdController =
      TextEditingController(); // Keep for ID, dropdown sets it
  DateTime? _doneAt;
  final _sourceLangController = TextEditingController();
  final _targetLangController = TextEditingController();
  final _pageCountController = TextEditingController();
  final _notarialSumController = TextEditingController();
  final _paymentIdController = TextEditingController();
  final _notesController = TextEditingController();
  // Controller for editable document type
  final _documentTypeController = TextEditingController();
  // Controllers for blank fields
  final TextEditingController _blankNumberController = TextEditingController();
  final TextEditingController _incorrectBlankController =
      TextEditingController();

  // Dropdown/Selection State
  crm.Client? _selectedClient; // Store the selected Client object
  crm.Employee? _selectedManager;
  crm.Employee? _selectedTranslator;
  crm.Office? _selectedOffice;
  String? _selectedDocumentTypeKey; // Document type key (string)
  // Available document types
  List<String> _documentTypeKeys = [
    'passport',
    'diploma',
    'birth_certificate',
    'contract',
    'other'
  ];
  crm.Priority? _selectedPriority;
  // TranslationProgress is read-only, store fetched value if editing
  crm.TranslationProgressStatus? _currentTranslationProgress;

  // Switches
  bool _isUrgent = false;
  bool _isSemiUrgent = false;
  bool _clientNotified = false;

  // Data for Dropdowns
  List<crm.Client> _clients = []; // Need to fetch clients for dropdown
  List<crm.Employee> _managers = [];
  List<crm.Employee> _translators = [];
  List<crm.Office> _offices = [];
  // _documentTypeKeys will be populated in _loadInitialData
  final List<crm.Priority> _priorities = crm.Priority.values
      .where((p) => p != crm.Priority.PRIORITY_UNSPECIFIED)
      .toList();
  // --- End Controllers & State Variables ---

  bool _didLoadInitialData = false;

  @override
  void initState() {
    super.initState();
    // Do not call _loadInitialData here!
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didLoadInitialData) {
      _didLoadInitialData = true;
      _loadInitialData();
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    _titleController.dispose();
    _clientIdController.dispose();
    _sourceLangController.dispose();
    _targetLangController.dispose();
    _pageCountController.dispose();
    _notarialSumController.dispose();
    _paymentIdController.dispose();
    _notesController.dispose();
    _documentTypeController.dispose();
    // Dispose any other controllers added
    _blankNumberController.dispose();
    _incorrectBlankController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    final localizations = AppLocalizations.of(context);
    setState(() => _isFetchingInitialData = true);
    try {
      // Fetch dropdown data in parallel
      final fetchClients =
          _clientService.listClients(pageSize: 500); // Adjust page size
      final fetchEmployees =
          _clientService.listEmployees(pageSize: 500); // Fetch all employees
      final fetchOffices = _clientService.listOffices(pageSize: 100);

      // Await all fetches
      final results =
          await Future.wait([fetchClients, fetchEmployees, fetchOffices]);

      if (!mounted) return;

      _clients = results[0] as List<crm.Client>;
      final allEmployees = results[1] as List<crm.Employee>;
      _offices = results[2] as List<crm.Office>;
      // Filter employees for dropdowns
      _managers = allEmployees
          .where((e) =>
              (e.role == crm.EmployeeRole.MANAGER ||
                  e.role == crm.EmployeeRole.CHIEF_MANAGER ||
                  e.role == crm.EmployeeRole.DIRECTOR ||
                  e.role ==
                      crm.EmployeeRole
                          .EMPLOYEE_ROLE_UNSPECIFIED) && // TEMPORARY
              (e.hasIsActive() ? e.isActive : true))
          .toList();

      // Debug print filtered managers
      print('Filtered managers:');
      for (final m in _managers) {
        print(
            'Manager: id=${m.employeeId}, name=${m.name}, role=${m.role}, isActive=${m.hasIsActive() ? m.isActive : 'unset'}');
      }
      _translators = allEmployees
          .where((e) => e.role == crm.EmployeeRole.TRANSLATOR)
          .toList();

      // If editing, fetch the specific order details AFTER dropdown data is loaded
      if (widget.orderId != null) {
        _initialOrderData =
            await _orderService.getTranslationOrder(widget.orderId!);
        if (!mounted) return;
        _populateFormFields();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .translationOrderFormScreenErrorLoadingData(e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isFetchingInitialData = false);
      }
    }
  }

  void _populateFormFields() {
    if (_initialOrderData == null) return;

    final order = _initialOrderData!;

    // Set dropdown selections safely using try-catch
    try {
      _selectedClient =
          _clients.firstWhere((c) => c.clientId == order.clientId);
    } catch (e) {
      _selectedClient = null; // Not found
      print(
          'Warning: Client ID ${order.clientId} not found in loaded clients.');
    }
    try {
      _selectedManager =
          _managers.firstWhere((m) => m.employeeId == order.managerId);
    } catch (e) {
      _selectedManager = null; // Not found
      print(
          'Warning: Manager ID ${order.managerId} not found in loaded managers.');
    }
    try {
      _selectedTranslator =
          _translators.firstWhere((t) => t.employeeId == order.translatorId);
    } catch (e) {
      _selectedTranslator = null; // Not found or translatorId is null/empty
      // Only warn if translatorId was actually set in the order data
      if (order.hasTranslatorId() && order.translatorId != 0) {
        print(
            'Warning: Translator ID ${order.translatorId} not found in loaded translators.');
      }
    }
    try {
      _selectedOffice =
          _offices.firstWhere((o) => o.officeId == order.officeId);
    } catch (e) {
      _selectedOffice = null; // Not found
      print(
          'Warning: Office ID ${order.officeId} not found in loaded offices.');
    }

    // Set controllers based on order data or selected objects
    _titleController.text = order.hasTitle() ? order.title : '';
    _clientIdController.text =
        order.clientId.toString(); // Convert int to string for controller
    _doneAt = order.hasDoneAt() ? timestampToDateTime(order.doneAt) : null;
    _sourceLangController.text = order.sourceLanguage;
    _targetLangController.text = order.targetLanguage;
    _pageCountController.text =
        order.hasPageCount() ? order.pageCount.toString() : '';
    _notarialSumController.text =
        order.notarialSum.toString(); // Assuming double
    _paymentIdController.text =
        order.hasPaymentId() ? order.paymentId.toString() : '';
    _notesController.text = order.hasNotes() ? order.notes : '';

    // Handle DocumentTypeKey (string)
    _selectedDocumentTypeKey =
        order.hasDocumentTypeKey() && order.documentTypeKey.isNotEmpty
            ? order.documentTypeKey
            : null;
    // Initialize document type controller display text
    if (_selectedDocumentTypeKey != null) {
      if (_selectedDocumentTypeKey == 'other' ||
          !_documentTypeKeys.contains(_selectedDocumentTypeKey)) {
        _documentTypeController.text = _selectedDocumentTypeKey!;
      } else {
        _documentTypeController.text =
            _selectedDocumentTypeKey!.replaceAll('_', ' ');
      }
    } else {
      _documentTypeController.clear();
    }

    _selectedPriority = (order.priority == crm.Priority.PRIORITY_UNSPECIFIED)
        ? null
        : order.priority;
    _currentTranslationProgress = order.translationProgress;

    // Set switches (fields removed from proto, so set to false or ignore)
    _isUrgent = false;
    _isSemiUrgent = false;
    _clientNotified = false;

    // TODO: Handle population for 'blanks' if implementing complex UI
  }

  Future<void> _saveOrder() async {
    final localizations = AppLocalizations.of(context);
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!mounted) return; // Early exit if not mounted when starting

    setState(() => _isLoading = true);
    bool success = false;
    String? successMessage;
    String? errorMessage;

    try {
      final now = DateTime.now();
      final createdAt =
          _initialOrderData?.createdAt ?? dateTimeToTimestamp(now);
      final orderData = crm.TranslationOrder(
        createdAt: createdAt,
        title: _titleController.text.trim(),
        doneAt: dateTimeToTimestamp(_doneAt),
        clientId: _selectedClient?.clientId ?? 0,
        managerId: _selectedManager?.employeeId ?? 0,
        officeId: _selectedOffice?.officeId ?? 0,
        translatorId: _selectedTranslator?.employeeId,
        documentTypeKey: _selectedDocumentTypeKey ?? '',
        sourceLanguage: _sourceLangController.text.isNotEmpty
            ? _sourceLangController.text
            : null,
        targetLanguage: _targetLangController.text.isNotEmpty
            ? _targetLangController.text
            : null,
        pageCount: int.tryParse(_pageCountController.text),
        paymentId: int.tryParse(_paymentIdController.text),
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
        notarialSum: double.tryParse(_notarialSumController.text) ?? 0.0,
        priority: _selectedPriority ?? crm.Priority.NORMAL,
        translationProgress: TranslationProgressStatus.valueOf(
            _currentTranslationProgress?.value ?? 0),
      );

      // Add blanks using TranslationOrder_BlankInfo
      orderData.blanks.add(crm.TranslationOrder_BlankInfo()
        ..blankNumber = _blankNumberController.text.trim()
        ..isSpoiled = false);
      if (_incorrectBlankController.text.trim().isNotEmpty) {
        orderData.blanks.add(crm.TranslationOrder_BlankInfo()
          ..blankNumber = _incorrectBlankController.text.trim()
          ..isSpoiled = true
          ..replacementBlankNumber = _blankNumberController.text.trim());
      }

      if (widget.orderId == null) {
        await _orderService.createTranslationOrder(orderData);
        successMessage =
            localizations.translationOrderFormScreenOrderCreatedSuccess;
      } else {
        await _orderService.updateTranslationOrder(widget.orderId!, orderData);
        successMessage =
            localizations.translationOrderFormScreenOrderUpdatedSuccess;
      }
      success = true;
    } catch (e) {
      errorMessage = localizations
          .translationOrderFormScreenErrorSavingOrder(e.toString());
      success = false;
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);

        if (success && successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(successMessage)),
          );
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              Navigator.pop(context, true);
            }
          });
        } else if (!success && errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      }
    }
  }

  // Helper to display employee names in dropdowns
  String _getEmployeeDisplayName(crm.Employee emp) {
    final localizations = AppLocalizations.of(context);
    final idString = emp.employeeId.toString();
    final shortId = idString.length > 6 ? idString.substring(0, 6) : idString;
    return localizations.translationOrderFormScreenDisplayEmployee(
        emp.name, shortId);
  }

  // Helper to display office names
  String _getOfficeDisplayName(crm.Office office) {
    final localizations = AppLocalizations.of(context);
    final idString = office.officeId.toString();
    final shortId = idString.length > 6 ? idString.substring(0, 6) : idString;
    return localizations.translationOrderFormScreenDisplayOffice(
        office.city, shortId);
  }

  // Helper to display client names
  String _getClientDisplayName(crm.Client client) {
    final localizations = AppLocalizations.of(context);
    final idString = client.clientId.toString();
    final shortId = idString.length > 6 ? idString.substring(0, 6) : idString;
    return localizations.translationOrderFormScreenDisplayClient(
        client.firstName, client.lastName, shortId);
  }

  // Helper for Priority
  String _getPriorityDisplayName(crm.Priority p) {
    return p.name.replaceFirst('PRIORITY_', '').replaceAll('_', ' ');
  }

  // Helper for Translation Progress (read-only display)
  String _getTranslationProgressDisplayName(
      crm.TranslationProgressStatus? status) {
    // For production, these strings should come from AppLocalizations
    switch (status) {
      case crm.TranslationProgressStatus.PENDING_ASSIGNMENT:
        return "Pending Assignment";
      case crm.TranslationProgressStatus.IN_PROGRESS:
        return "In Progress";
      case crm.TranslationProgressStatus.TRANSLATED:
        return "Translation Complete";
      case crm.TranslationProgressStatus.CHECKED_BY_MANAGER:
        return "Manager Approved";
      case crm.TranslationProgressStatus.CLIENT_NOTIFIED:
        return "Client Notified";
      case crm.TranslationProgressStatus.DELIVERED:
        return "Delivered";
      case crm
            .TranslationProgressStatus.TRANSLATION_PROGRESS_STATUS_UNSPECIFIED:
      default: // Handles null or UNSPECIFIED
        final localizations = AppLocalizations.of(context);
        return localizations
            .translationOrderFormScreenTranslationProgressNotAvailable;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context); // Removed ! operator
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.orderId == null
            ? localizations.translationOrderFormScreenCreateTitle
            : localizations.translationOrderFormScreenEditTitle),
        actions: [
          if (!_isLoading &&
              !_isFetchingInitialData) // Only show save when not loading
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveOrder,
              tooltip:
                  localizations.translationOrderFormScreenSaveChangesTooltip,
            ),
          if (_isLoading ||
              _isFetchingInitialData) // Show spinner during any loading
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            ),
        ],
      ),
      body: _isFetchingInitialData
          ? const LoadingIndicator() // Show loading indicator during initial fetch
          : Center(
              // Center the form content
              child: ConstrainedBox(
                // Constrain the width of the form
                constraints: const BoxConstraints(
                    maxWidth: 800), // Adjust maxWidth as needed
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // --- Core Fields Section ---
                        Card(
                          margin: EdgeInsets.only(bottom: 16.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localizations
                                      .translationOrderFormScreenSectionTitleOrderDetails,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: _titleController,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldTitleLabel),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return localizations
                                                    .translationOrderFormScreenFieldTitleValidation;
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          DropdownButtonFormField<crm.Client>(
                                            isExpanded:
                                                true, // Allow the dropdown to expand
                                            value: _selectedClient,
                                            hint: Text(localizations
                                                .translationOrderFormScreenFieldClientHint),
                                            items: _clients
                                                .map((crm.Client client) {
                                              return DropdownMenuItem<
                                                  crm.Client>(
                                                value: client,
                                                child: Text(
                                                  _getClientDisplayName(client),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle long text
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (crm.Client? newValue) {
                                              setState(() {
                                                _selectedClient = newValue;
                                                _clientIdController.text =
                                                    newValue?.clientId != null
                                                        ? newValue!.clientId
                                                            .toString()
                                                        : '';
                                              });
                                            },
                                            validator: (value) => value == null
                                                ? localizations
                                                    .translationOrderFormScreenFieldClientValidation
                                                : null,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldClientLabel),
                                          ),
                                          const SizedBox(height: 16),
                                          DropdownButtonFormField<crm.Office>(
                                            isExpanded:
                                                true, // Allow the dropdown to expand
                                            value: _selectedOffice,
                                            hint: Text(localizations
                                                .translationOrderFormScreenFieldOfficeHint),
                                            items: _offices
                                                .map((crm.Office office) {
                                              return DropdownMenuItem<
                                                  crm.Office>(
                                                value: office,
                                                child: Text(
                                                  _getOfficeDisplayName(office),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle long text
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (crm.Office? newValue) {
                                              setState(() {
                                                _selectedOffice = newValue;
                                              });
                                            },
                                            validator: (value) => value == null
                                                ? localizations
                                                    .translationOrderFormScreenFieldOfficeValidation
                                                : null,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldOfficeLabel),
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller: _blankNumberController,
                                            decoration: const InputDecoration(
                                              labelText: 'Blank Number',
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Please enter the blank number';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller:
                                                _incorrectBlankController,
                                            decoration: const InputDecoration(
                                              labelText: 'Incorrect Blank',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Right column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          if (widget.orderId != null) ...[
                                            GestureDetector(
                                              onTap: () async {
                                                final picked =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      _doneAt ?? DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2100),
                                                );
                                                if (picked != null) {
                                                  setState(() {
                                                    _doneAt = picked;
                                                  });
                                                }
                                              },
                                              child: AbsorbPointer(
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText: localizations
                                                        .translationOrderFormScreenFieldDoneAtLabel,
                                                    suffixIcon: Icon(
                                                        Icons.calendar_today),
                                                  ),
                                                  controller:
                                                      TextEditingController(
                                                    text: _doneAt != null
                                                        ? formatTimestamp(
                                                            dateTimeToTimestamp(
                                                                _doneAt))
                                                        : '',
                                                  ),
                                                  readOnly: true,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                          DropdownButtonFormField<crm.Employee>(
                                            isExpanded:
                                                true, // Allow the dropdown to expand
                                            value: _selectedManager,
                                            hint: Text(localizations
                                                .translationOrderFormScreenFieldManagerHint),
                                            items: _managers
                                                .map((crm.Employee manager) {
                                              return DropdownMenuItem<
                                                  crm.Employee>(
                                                value: manager,
                                                child: Text(
                                                  _getEmployeeDisplayName(
                                                      manager),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle long text
                                                ),
                                              );
                                            }).toList(),
                                            onChanged:
                                                (crm.Employee? newValue) {
                                              setState(() {
                                                _selectedManager = newValue;
                                              });
                                            },
                                            validator: (value) => value == null
                                                ? localizations
                                                    .translationOrderFormScreenFieldManagerValidation
                                                : null,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldManagerLabel),
                                          ),
                                          const SizedBox(height: 16),
                                          DropdownButtonFormField<crm.Employee>(
                                            isExpanded:
                                                true, // Allow the dropdown to expand
                                            value: _selectedTranslator,
                                            hint: Text(localizations
                                                .translationOrderFormScreenFieldTranslatorHint),
                                            items: _translators
                                                .map((crm.Employee translator) {
                                              return DropdownMenuItem<
                                                  crm.Employee>(
                                                value: translator,
                                                child: Text(
                                                  _getEmployeeDisplayName(
                                                      translator),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle long text
                                                ),
                                              );
                                            }).toList(),
                                            onChanged:
                                                (crm.Employee? newValue) {
                                              setState(() {
                                                _selectedTranslator = newValue;
                                              });
                                            },
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldTranslatorLabel),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // --- Document & Language Section ---
                        Card(
                          margin: EdgeInsets.only(bottom: 16.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localizations
                                      .translationOrderFormScreenSectionTitleDocumentDetails,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: _sourceLangController,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldSourceLanguageLabel),
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller: _targetLangController,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldTargetLanguageLabel),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Right column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          // Document Type: read-only field with static choices and custom entry
                                          TextFormField(
                                            controller: _documentTypeController,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              labelText: localizations
                                                  .translationOrderFormScreenFieldDocumentTypeLabel,
                                              hintText: localizations
                                                  .translationOrderFormScreenFieldDocumentTypeHint,
                                              suffixIcon: const Icon(
                                                Icons.arrow_drop_down,
                                              ),
                                            ),
                                            validator: (value) =>
                                                (_selectedDocumentTypeKey ==
                                                            null ||
                                                        _selectedDocumentTypeKey!
                                                            .trim()
                                                            .isEmpty)
                                                    ? localizations
                                                        .translationOrderFormScreenFieldDocumentTypeHint
                                                    : null,
                                            onTap: () async {
                                              // Show choice dialog
                                              final choice =
                                                  await showDialog<String>(
                                                      context: context,
                                                      builder: (context) {
                                                        return SimpleDialog(
                                                          title: Text(localizations
                                                              .translationOrderFormScreenFieldDocumentTypeLabel),
                                                          children:
                                                              _documentTypeKeys
                                                                  .map((key) =>
                                                                      SimpleDialogOption(
                                                                        onPressed: () => Navigator.pop(
                                                                            context,
                                                                            key),
                                                                        child: Text(key.replaceAll(
                                                                            '_',
                                                                            ' ')),
                                                                      ))
                                                                  .toList(),
                                                        );
                                                      });
                                              if (choice != null) {
                                                if (choice == 'other') {
                                                  // Prompt custom input
                                                  final custom =
                                                      await showDialog<String>(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  localizations
                                                                      .translationOrderFormScreenFieldDocumentTypeLabel),
                                                              content:
                                                                  TextFormField(
                                                                controller:
                                                                    _documentTypeController,
                                                                decoration: InputDecoration(
                                                                    hintText:
                                                                        localizations
                                                                            .translationOrderFormScreenFieldDocumentTypeHint),
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    child: Text(
                                                                        localizations
                                                                            .translationOrderFormScreenDeleteDialogCancelButton)),
                                                                TextButton(
                                                                    onPressed: () => Navigator.pop(
                                                                        context,
                                                                        _documentTypeController
                                                                            .text),
                                                                    child: Text(
                                                                        localizations
                                                                            .translationOrderFormScreenDeleteDialogDeleteButton)),
                                                              ],
                                                            );
                                                          });
                                                  if (custom != null &&
                                                      custom.isNotEmpty) {
                                                    setState(() {
                                                      _selectedDocumentTypeKey =
                                                          custom;
                                                      _documentTypeController
                                                          .text = custom;
                                                    });
                                                  }
                                                } else {
                                                  setState(() {
                                                    _selectedDocumentTypeKey =
                                                        choice;
                                                    _documentTypeController
                                                            .text =
                                                        choice.replaceAll(
                                                            '_', ' ');
                                                  });
                                                }
                                              }
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller: _pageCountController,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldPageCountLabel),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // --- Financial & Priority Section ---
                        Card(
                          margin: EdgeInsets.only(bottom: 16.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localizations
                                      .translationOrderFormScreenSectionTitleFinancialDetails,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: _notarialSumController,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldNotarialSumLabel),
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'^\d+\.?\d{0,2}')),
                                            ],
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return localizations
                                                    .translationOrderFormScreenFieldNotarialSumValidationRequired;
                                              }
                                              if (double.tryParse(value) ==
                                                  null) {
                                                return localizations
                                                    .translationOrderFormScreenFieldNotarialSumValidationNumber;
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          TextFormField(
                                            controller: _paymentIdController,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldPaymentIdLabel),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Right column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DropdownButtonFormField<crm.Priority>(
                                            value: _selectedPriority,
                                            hint: Text(localizations
                                                .translationOrderFormScreenFieldPriorityHint),
                                            items: _priorities
                                                .map((crm.Priority p) {
                                              return DropdownMenuItem<
                                                  crm.Priority>(
                                                value: p,
                                                child: Text(
                                                    _getPriorityDisplayName(p)),
                                              );
                                            }).toList(),
                                            onChanged:
                                                (crm.Priority? newValue) {
                                              setState(() {
                                                _selectedPriority = newValue;
                                              });
                                            },
                                            validator: (value) => value == null
                                                ? localizations
                                                    .translationOrderFormScreenFieldPriorityValidation
                                                : null,
                                            decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldPriorityLabel),
                                          ),
                                          if (widget.orderId != null) ...[
                                            const SizedBox(height: 16),
                                            DropdownButtonFormField<
                                                crm.TranslationProgressStatus>(
                                              isExpanded:
                                                  true, // Allow the dropdown to expand
                                              value: (_currentTranslationProgress ==
                                                          null ||
                                                      _currentTranslationProgress ==
                                                          crm.TranslationProgressStatus
                                                              .TRANSLATION_PROGRESS_STATUS_UNSPECIFIED)
                                                  ? null
                                                  : _currentTranslationProgress,
                                              decoration: InputDecoration(
                                                labelText: localizations
                                                    .translationOrderFormScreenFieldTranslationProgressLabel,
                                                border:
                                                    const OutlineInputBorder(),
                                              ),
                                              items: crm
                                                  .TranslationProgressStatus
                                                  .values
                                                  .where((status) =>
                                                      status !=
                                                      crm.TranslationProgressStatus
                                                          .TRANSLATION_PROGRESS_STATUS_UNSPECIFIED)
                                                  .map((status) =>
                                                      DropdownMenuItem(
                                                        value: status,
                                                        child: Text(
                                                          _getTranslationProgressDisplayName(
                                                              status),
                                                          overflow: TextOverflow
                                                              .ellipsis, // Handle long text
                                                        ),
                                                      ))
                                                  .toList(),
                                              onChanged: (newStatus) {
                                                setState(() {
                                                  _currentTranslationProgress =
                                                      newStatus;
                                                });
                                              },
                                            ),
                                          ],
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // --- Notes & Flags Section ---
                        Card(
                          margin: EdgeInsets.only(bottom: 16.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localizations
                                      .translationOrderFormScreenSectionTitleAdditionalInformation,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _notesController,
                                  decoration: InputDecoration(
                                      labelText: localizations
                                          .translationOrderFormScreenFieldNotesLabel),
                                  maxLines: 3,
                                ),
                                const SizedBox(height: 16),
                                // Flags in horizontal row for compact layout
                                Wrap(
                                  spacing: 16.0,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: SwitchListTile(
                                        title: Text(localizations
                                            .translationOrderFormScreenSwitchUrgent),
                                        value: _isUrgent,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _isUrgent = value;
                                            if (value) _isSemiUrgent = false;
                                          });
                                        },
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: SwitchListTile(
                                        title: Text(localizations
                                            .translationOrderFormScreenSwitchSemiUrgent),
                                        value: _isSemiUrgent,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _isSemiUrgent = value;
                                            if (value) _isUrgent = false;
                                          });
                                        },
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: SwitchListTile(
                                        title: Text(localizations
                                            .translationOrderFormScreenSwitchClientNotified),
                                        value: _clientNotified,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _clientNotified = value;
                                          });
                                        },
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Delete button when editing
                        if (widget.orderId != null && !_isLoading)
                          Center(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.delete),
                              label: Text(localizations
                                  .translationOrderFormScreenDeleteButton),
                              onPressed: () async {
                                final localizations =
                                    AppLocalizations.of(context);
                                try {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(localizations
                                          .translationOrderFormScreenDeleteDialogTitle),
                                      content: Text(localizations
                                          .translationOrderFormScreenDeleteDialogContent),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, false),
                                            child: Text(localizations
                                                .translationOrderFormScreenDeleteDialogCancelButton)),
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, true),
                                            child: Text(localizations
                                                .translationOrderFormScreenDeleteDialogDeleteButton)),
                                      ],
                                    ),
                                  );
                                  if (confirm == true) {
                                    setState(() => _isLoading = true);
                                    bool deleteSucceeded = false;
                                    try {
                                      await _orderService
                                          .deleteTranslationOrder(
                                              widget.orderId!);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(localizations
                                                .translationOrderFormScreenOrderDeletedSuccess)),
                                      );
                                      deleteSucceeded = true;
                                    } catch (e) {
                                      deleteSucceeded = false;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(localizations
                                                .translationOrderFormScreenErrorDeletingOrder(
                                                    e.toString()))),
                                      );
                                    } finally {
                                      if (mounted) {
                                        setState(() => _isLoading = false);
                                        if (deleteSucceeded) {
                                          Navigator.pop(context, true);
                                        }
                                      }
                                    }
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    setState(() => _isLoading = false);
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(localizations
                                            .translationOrderFormScreenErrorDeletingOrder(
                                                e.toString()))),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

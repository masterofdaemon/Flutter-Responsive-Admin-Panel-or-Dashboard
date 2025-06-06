import 'package:admin/generated/crm.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For TextInputFormatters
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/generated/google/protobuf/timestamp.pb.dart'
    as $timestamp; // Import Timestamp
import 'package:admin/services/grpc_translation_order_service_mobile.dart';
import 'package:admin/services/grpc_client_service.dart'; // Assuming this service fetches Employees/Offices
import 'package:admin/services/auth_service.dart';
import 'package:admin/widgets/loading_indicator.dart';
import 'package:fixnum/fixnum.dart'; // For Int64
import 'package:admin/utils/timestamp_helpers.dart';
import 'package:admin/l10n/app_localizations.dart';
import 'package:admin/widgets/simple_document_type_dropdown.dart';
import 'package:admin/widgets/translation_pricing_widget.dart';
import 'package:admin/widgets/blank_number_field.dart';
import 'package:admin/widgets/searchable_dropdown_form_field.dart';

// Language option class for dropdown
class LanguageOption {
  final String code;
  final String name;

  const LanguageOption({required this.code, required this.name});

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageOption &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  int get hashCode => code.hashCode;
}

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
  final AuthService _authService = AuthService.instance;

  bool _isLoading = false;
  bool _isFetchingInitialData = false; // Separate flag for initial load
  crm.TranslationOrder? _initialOrderData;

  // --- Controllers & State Variables ---
  final _clientIdController =
      TextEditingController(); // Keep for ID, dropdown sets it
  final _clientNameController =
      TextEditingController(); // Add client name controller
  DateTime? _doneAt;
  final _pageCountController = TextEditingController();
  final _notarialSumController = TextEditingController();
  final _totalSumController = TextEditingController();
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
  String? _selectedSourceLanguage; // Selected source language code
  String? _selectedTargetLanguage; // Selected target language code
  crm.Priority? _selectedPriority;
  // TranslationProgress is read-only, store fetched value if editing
  crm.TranslationProgressStatus? _currentTranslationProgress;
  crm.ClientSource? _selectedClientSource; // Added for ClientSource

  // Data for Dropdowns
  List<crm.Client> _clients = []; // Need to fetch clients for dropdown
  List<crm.Employee> _managers = [];
  List<crm.Employee> _translators = [];
  List<crm.Office> _offices = [];

  // Language options for dropdowns
  final List<LanguageOption> _languageOptions = [
    LanguageOption(code: 'ua', name: 'Ukrainian (Українська)'),
    LanguageOption(code: 'ru', name: 'Russian (Русский)'),
    LanguageOption(code: 'en', name: 'English'),
    LanguageOption(code: 'de', name: 'German (Deutsch)'),
    LanguageOption(code: 'fr', name: 'French (Français)'),
    LanguageOption(code: 'es', name: 'Spanish (Español)'),
    LanguageOption(code: 'it', name: 'Italian (Italiano)'),
    LanguageOption(code: 'pl', name: 'Polish (Polski)'),
    LanguageOption(code: 'cs', name: 'Czech (Čeština)'),
    LanguageOption(code: 'sk', name: 'Slovak (Slovenčina)'),
  ];
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
    _clientIdController.dispose();
    _clientNameController.dispose(); // Add disposal for client name controller
    _pageCountController.dispose();
    _notarialSumController.dispose();
    _totalSumController.dispose();
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
      _translators = allEmployees
          .where((e) => e.role == crm.EmployeeRole.TRANSLATOR)
          .toList();

      // If editing, fetch the specific order details AFTER dropdown data is loaded
      if (widget.orderId != null) {
        _initialOrderData =
            await _orderService.getTranslationOrder(widget.orderId!);
        if (!mounted) return;
        _populateFormFields();
      } else {
        // Auto-select current employee as manager for new orders
        _autoSelectCurrentEmployee();
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

  void _autoSelectCurrentEmployee() {
    final currentEmployee = _authService.employeeProfile;
    if (currentEmployee == null) return;

    // Try to find and select current employee as manager
    try {
      final currentAsManager = _managers.firstWhere(
        (m) => m.employeeId == currentEmployee.employeeId,
      );
      setState(() {
        _selectedManager = currentAsManager;

        // Auto-select office based on manager's office
        if (currentAsManager.hasOfficeId()) {
          try {
            _selectedOffice = _offices.firstWhere(
              (o) => o.officeId == currentAsManager.officeId,
            );
          } catch (e) {
            // Office not found, leave null
            print(
                'Warning: Manager office ID ${currentAsManager.officeId} not found in loaded offices.');
          }
        }
      });
    } catch (e) {
      // Current employee is not in managers list (might be translator, etc.)
      print('Current employee not found in managers list or is not a manager.');
    }

    // Set default values for new orders
    _setDefaultValues();
  }

  void _setDefaultValues() {
    setState(() {
      // Set default source language to Ukrainian
      _selectedSourceLanguage = 'ua';

      // Set default target language to Russian
      _selectedTargetLanguage = 'ru';

      // Set default priority to NORMAL
      _selectedPriority = crm.Priority.NORMAL;
    });
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
    } // Set controllers based on order data or selected objects
    _clientIdController.text =
        order.clientId.toString(); // Convert int to string for controller
    _clientNameController.text = order.hasClientName()
        ? order.clientName
        : ''; // Add client name population
    _doneAt = order.hasDoneAt() ? timestampToDateTime(order.doneAt) : null;
    _selectedSourceLanguage =
        order.sourceLanguage.isNotEmpty ? order.sourceLanguage : null;
    _selectedTargetLanguage =
        order.targetLanguage.isNotEmpty ? order.targetLanguage : null;
    _pageCountController.text =
        order.hasPageCount() ? order.pageCount.toString() : '';
    _notarialSumController.text =
        order.notarialSum.toString(); // Assuming double
    _totalSumController.text =
        order.hasTotalSum() ? order.totalSum.toStringAsFixed(2) : '';
    _paymentIdController.text =
        order.hasPaymentId() ? order.paymentId.toString() : '';
    _notesController.text = order.hasNotes() ? order.notes : '';

    // Handle DocumentTypeKey (string)
    _selectedDocumentTypeKey =
        order.hasDocumentTypeKey() && order.documentTypeKey.isNotEmpty
            ? order.documentTypeKey
            : null;
    // No need to set _documentTypeController or display text, handled by dropdown widget

    _selectedPriority = (order.priority == crm.Priority.PRIORITY_UNSPECIFIED)
        ? null
        : order.priority;
    _currentTranslationProgress = order.translationProgress;

    _selectedClientSource = // Added for ClientSource
        (order.source ==
                crm.ClientSource
                    .CLIENT_SOURCE_UNSPECIFIED) // Added for ClientSource
            ? null // Added for ClientSource
            : order.source; // Added for ClientSource

    // Handle population for blank numbers
    if (order.blanks.isNotEmpty) {
      // Find the main blank (not spoiled)
      crm.TranslationOrder_BlankInfo? mainBlank;
      crm.TranslationOrder_BlankInfo? spoiledBlank;

      for (final blank in order.blanks) {
        if (blank.isSpoiled) {
          spoiledBlank = blank;
        } else {
          mainBlank = blank;
        }
      }

      // Populate main blank number
      if (mainBlank != null) {
        _blankNumberController.text = mainBlank.blankNumber;
      } else if (order.blanks.isNotEmpty) {
        // Fallback to first blank if no non-spoiled blank found
        _blankNumberController.text = order.blanks.first.blankNumber;
      }

      // Populate spoiled/damaged blank number
      if (spoiledBlank != null) {
        _incorrectBlankController.text = spoiledBlank.blankNumber;
      }
    }
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
        title: "",
        doneAt: dateTimeToTimestamp(_doneAt),
        clientId: _selectedClient?.clientId ?? 0,
        managerId: _selectedManager?.employeeId ?? 0,
        officeId: _selectedOffice?.officeId ?? 0,
        translatorId: _selectedTranslator?.employeeId,
        documentTypeKey: _selectedDocumentTypeKey ?? '',
        sourceLanguage: _selectedSourceLanguage ?? '',
        targetLanguage: _selectedTargetLanguage ?? '',
        clientName: _clientNameController.text.isNotEmpty
            ? _clientNameController.text
            : null, // Add client name to save logic
        pageCount: int.tryParse(_pageCountController.text),
        paymentId: int.tryParse(_paymentIdController.text),
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
        notarialSum: double.tryParse(_notarialSumController.text) ?? 0.0,
        totalSum: double.tryParse(_totalSumController.text) ?? 0.0,
        priority: _selectedPriority ?? crm.Priority.NORMAL,
        translationProgress: TranslationProgressStatus.valueOf(
            _currentTranslationProgress?.value ?? 0),
        source: _selectedClientSource, // Added for ClientSource
      );

      // DEBUG: Print notarial sum details

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
        final _ = await _orderService.createTranslationOrder(orderData);

        successMessage =
            localizations.translationOrderFormScreenOrderCreatedSuccess;
      } else {
        final _ = await _orderService.updateTranslationOrder(
            widget.orderId!, orderData);

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

  // Helper to display priority names
  String _getPriorityDisplayName(crm.Priority priority) {
    final localizations = AppLocalizations.of(context);
    switch (priority) {
      case crm.Priority.NORMAL:
        return localizations.priorityNormal;
      case crm.Priority.URGENT:
        return localizations.priorityUrgent;
      case crm.Priority.SEMI_URGENT:
        return localizations.prioritySemiUrgent;
      default:
        return priority.toString().split('.').last;
    }
  }

  // Helper for ServiceType
  String _getTranslationProgressDisplayName(
      crm.TranslationProgressStatus? status) {
    final localizations = AppLocalizations.of(context);
    switch (status) {
      case crm.TranslationProgressStatus.PENDING_ASSIGNMENT:
        return localizations.translationProgressStatusPendingAssignment;
      case crm.TranslationProgressStatus.IN_PROGRESS:
        return localizations.translationProgressStatusInProgress;
      case crm.TranslationProgressStatus.TRANSLATED:
        return localizations.translationProgressStatusTranslated;
      case crm.TranslationProgressStatus.CHECKED_BY_MANAGER:
        return localizations.translationProgressStatusCheckedByManager;
      case crm.TranslationProgressStatus.CLIENT_NOTIFIED:
        return localizations.translationProgressStatusClientNotified;
      case crm.TranslationProgressStatus.DELIVERED:
        return localizations.translationProgressStatusDelivered;
      case crm
            .TranslationProgressStatus.TRANSLATION_PROGRESS_STATUS_UNSPECIFIED:
      default: // Handles null or UNSPECIFIED
        final localizations = AppLocalizations.of(context);
        return localizations
            .translationOrderFormScreenTranslationProgressNotAvailable;
    }
  }

  // (Removed unused _getDocumentTypeDisplayName)

  // Header Section with breadcrumb-style navigation
  Widget _buildHeaderSection(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer.withOpacity(0.3),
            colorScheme.secondaryContainer.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.description_outlined,
              color: colorScheme.onPrimary,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.orderId == null
                      ? localizations.translationOrderFormScreenCreateNewTitle
                      : localizations.translationOrderFormScreenEditTitleFull,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.orderId == null
                      ? localizations
                          .translationOrderFormScreenCreateDescription
                      : localizations.translationOrderFormScreenEditDescription,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          if (widget.orderId != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.tag,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    localizations.translationOrderFormScreenOrderIdLabel(
                        widget.orderId!),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Order Details Section
  Widget _buildOrderDetailsSection(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, AppLocalizations localizations) {
    return Card(
      elevation: 2,
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  localizations
                      .translationOrderFormScreenSectionTitleOrderDetails,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Client and Office Row
            Row(
              children: [
                Expanded(
                  child: SearchableDropdownFormField<crm.Client>(
                    value: _selectedClient,
                    items: _clients,
                    itemAsString: (client) => _getClientDisplayName(client),
                    itemBuilder: (client) => Text(
                      _getClientDisplayName(client),
                      overflow: TextOverflow.ellipsis,
                    ),
                    labelText: localizations
                        .translationOrderFormScreenFieldClientLabel,
                    hintText:
                        localizations.translationOrderFormScreenFieldClientHint,
                    prefixIcon:
                        Icon(Icons.person_outline, color: colorScheme.primary),
                    onChanged: (crm.Client? newValue) {
                      print(
                          'Client Dropdown onChanged: ${newValue?.clientId} - ${newValue?.firstName}'); // DEBUG
                      setState(() {
                        _selectedClient = newValue;
                        _clientIdController.text =
                            newValue?.clientId.toString() ?? '';
                      });
                    },
                    validator: (value) => value == null
                        ? localizations
                            .translationOrderFormScreenFieldClientValidation
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SearchableDropdownFormField<crm.Office>(
                    value: _selectedOffice,
                    items: _offices,
                    itemAsString: (office) => _getOfficeDisplayName(office),
                    itemBuilder: (office) => Text(
                      _getOfficeDisplayName(office),
                      overflow: TextOverflow.ellipsis,
                    ),
                    labelText: localizations
                        .translationOrderFormScreenFieldOfficeLabel,
                    hintText:
                        localizations.translationOrderFormScreenFieldOfficeHint,
                    prefixIcon: Icon(Icons.business_outlined,
                        color: colorScheme.primary),
                    onChanged: (crm.Office? newValue) {
                      setState(() {
                        _selectedOffice = newValue;
                      });
                    },
                    validator: (value) => value == null
                        ? localizations
                            .translationOrderFormScreenFieldOfficeValidation
                        : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Client Name Field
            TextFormField(
              controller: _clientNameController,
              decoration: InputDecoration(
                labelText: localizations
                    .translationOrderFormScreenFieldClientNameLabel,
                hintText:
                    localizations.translationOrderFormScreenFieldClientNameHint,
                prefixIcon: Icon(Icons.person, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: colorScheme.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
              maxLength: 100,
              validator: (value) {
                // Optional field, no validation required
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Manager and Translator Row
            Row(
              children: [
                Expanded(
                  child: SearchableDropdownFormField<crm.Employee>(
                    value: _selectedManager,
                    items: _managers,
                    itemAsString: (manager) => _getEmployeeDisplayName(manager),
                    labelText: localizations
                        .translationOrderFormScreenFieldManagerLabel,
                    hintText: localizations
                        .translationOrderFormScreenFieldManagerHint,
                    prefixIcon: Icon(Icons.manage_accounts_outlined,
                        color: colorScheme.primary),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: colorScheme.outline.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: colorScheme.primary, width: 2),
                      ),
                    ),
                    onChanged: (crm.Employee? newValue) {
                      setState(() {
                        _selectedManager = newValue;
                      });
                    },
                    validator: (value) => value == null
                        ? localizations
                            .translationOrderFormScreenFieldManagerValidation
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SearchableDropdownFormField<crm.Employee>(
                    value: _selectedTranslator,
                    items: _translators,
                    itemAsString: (translator) =>
                        _getEmployeeDisplayName(translator),
                    labelText: localizations
                        .translationOrderFormScreenFieldTranslatorLabel,
                    hintText: localizations
                        .translationOrderFormScreenFieldTranslatorHint,
                    prefixIcon: Icon(Icons.translate_outlined,
                        color: colorScheme.primary),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: colorScheme.outline.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: colorScheme.primary, width: 2),
                      ),
                    ),
                    onChanged: (crm.Employee? newValue) {
                      setState(() {
                        _selectedTranslator = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Blank Number Field
            BlankNumberField(
              controller: _blankNumberController,
              labelText:
                  localizations.translationOrderFormScreenFieldBlankNumberLabel,
              isRequired: true,
              onChanged: (value) {
                setState(() {
                  // Update state if needed
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Language and Document Section
  Widget _buildLanguageAndDocumentSection(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, AppLocalizations localizations) {
    return Card(
      elevation: 2,
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.language_outlined,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  localizations
                      .translationOrderFormScreenSectionTitleTranslation,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Source and Target Languages Row
            Row(
              children: [
                Expanded(
                  child: SearchableDropdownFormField<LanguageOption>(
                    value: _selectedSourceLanguage != null
                        ? _languageOptions.firstWhere(
                            (lang) => lang.code == _selectedSourceLanguage,
                            orElse: () => _languageOptions.first)
                        : null,
                    items: _languageOptions,
                    itemAsString: (languageOption) => languageOption.name,
                    itemBuilder: (languageOption) => Text(
                      languageOption.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onChanged: (LanguageOption? value) {
                      setState(() {
                        _selectedSourceLanguage = value?.code;
                      });
                    },
                    labelText: localizations
                        .translationOrderFormScreenFieldSourceLanguageLabel,
                    hintText: localizations
                        .translationOrderFormScreenFieldSourceLanguageHint,
                    prefixIcon:
                        Icon(Icons.input_outlined, color: colorScheme.primary),
                    autofocus: false,
                    validator: (LanguageOption? value) {
                      if (value == null) {
                        return localizations
                            .translationOrderFormScreenFieldSourceLanguageValidationRequired;
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.arrow_forward,
                    color: colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: SearchableDropdownFormField<LanguageOption>(
                    value: _selectedTargetLanguage != null
                        ? _languageOptions.firstWhere(
                            (lang) => lang.code == _selectedTargetLanguage,
                            orElse: () => _languageOptions.first)
                        : null,
                    items: _languageOptions,
                    itemAsString: (languageOption) => languageOption.name,
                    itemBuilder: (languageOption) => Text(
                      languageOption.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onChanged: (LanguageOption? value) {
                      setState(() {
                        _selectedTargetLanguage = value?.code;
                      });
                    },
                    labelText: localizations
                        .translationOrderFormScreenFieldTargetLanguageLabel,
                    hintText: localizations
                        .translationOrderFormScreenFieldTargetLanguageHint,
                    prefixIcon:
                        Icon(Icons.output_outlined, color: colorScheme.primary),
                    autofocus: false,
                    validator: (LanguageOption? value) {
                      if (value == null) {
                        return localizations
                            .translationOrderFormScreenFieldTargetLanguageValidationRequired;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Document Type Dropdown
            SimpleDocumentTypeDropdown(
              selectedDocumentTypeKey: _selectedDocumentTypeKey,
              onChanged: (documentType) {
                setState(() {
                  _selectedDocumentTypeKey = documentType;
                });
              },
              isRequired: true,
            ),

            const SizedBox(height: 20),

            // Page Count and Priority Row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _pageCountController,
                    decoration: InputDecoration(
                      labelText: localizations
                          .translationOrderFormScreenFieldPageCountLabel,
                      hintText: localizations
                          .translationOrderFormScreenFieldPageCountHint,
                      prefixIcon: Icon(Icons.pages_outlined,
                          color: colorScheme.primary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: colorScheme.outline.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: colorScheme.primary, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      setState(() {
                        // Trigger pricing recalculation
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<crm.Priority>(
                    value: _selectedPriority,
                    decoration: InputDecoration(
                      labelText: localizations
                          .translationOrderFormScreenFieldPriorityLabel,
                      hintText: localizations
                          .translationOrderFormScreenFieldPriorityHint,
                      prefixIcon: Icon(Icons.priority_high_outlined,
                          color: colorScheme.primary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: colorScheme.outline.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: colorScheme.primary, width: 2),
                      ),
                    ),
                    items: _priorities.map((priority) {
                      return DropdownMenuItem<crm.Priority>(
                        value: priority,
                        child: Text(_getPriorityDisplayName(priority)),
                      );
                    }).toList(),
                    onChanged: (crm.Priority? newValue) {
                      setState(() {
                        _selectedPriority = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Notes Section
  Widget _buildNotesSection(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, AppLocalizations localizations) {
    return Card(
      elevation: 2,
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
        leading: Icon(
          Icons.note_alt_outlined,
          color: colorScheme.primary,
          size: 24,
        ),
        title: Text(
          localizations
              .translationOrderFormScreenSectionTitleAdditionalInformation,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextFormField(
              controller: _notesController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText:
                    localizations.translationOrderFormScreenFieldNotesLabel,
                hintText:
                    localizations.translationOrderFormScreenFieldNotesHint,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Icon(Icons.notes, color: colorScheme.primary),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: colorScheme.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Status Section
  Widget _buildStatusSection(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, AppLocalizations localizations) {
    return Card(
      elevation: 2,
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
        leading: Icon(
          Icons.track_changes_outlined,
          color: colorScheme.primary,
          size: 24,
        ),
        title: Text(
          localizations.translationOrderFormScreenSectionTitleStatus,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.orderId != null) ...[
                  // Translation Progress
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:
                          colorScheme.surfaceContainerHighest.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: colorScheme.outline.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizations
                              .translationOrderFormScreenStatusCurrentLabel,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _getTranslationProgressDisplayName(
                                _currentTranslationProgress),
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Status Change Dropdown
                  DropdownButtonFormField<crm.TranslationProgressStatus>(
                    value: _currentTranslationProgress,
                    decoration: InputDecoration(
                      labelText: localizations
                          .translationOrderFormScreenStatusUpdateLabel,
                      prefixIcon:
                          Icon(Icons.update, color: colorScheme.primary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: colorScheme.outline.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: colorScheme.primary, width: 2),
                      ),
                    ),
                    items: crm.TranslationProgressStatus.values
                        .where((status) =>
                            status !=
                            crm.TranslationProgressStatus
                                .TRANSLATION_PROGRESS_STATUS_UNSPECIFIED)
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(
                                _getTranslationProgressDisplayName(status),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    onChanged: (newStatus) {
                      setState(() {
                        _currentTranslationProgress = newStatus;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Done At Date
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _doneAt ?? DateTime.now(),
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
                              .translationOrderFormScreenFieldCompletionDateLabel,
                          hintText: localizations
                              .translationOrderFormScreenFieldCompletionDateHint,
                          prefixIcon: Icon(Icons.calendar_today,
                              color: colorScheme.primary),
                          suffixIcon: Icon(Icons.edit_calendar,
                              color: colorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: colorScheme.outline.withOpacity(0.3)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: colorScheme.primary, width: 2),
                          ),
                        ),
                        controller: TextEditingController(
                          text: _doneAt != null
                              ? formatTimestamp(dateTimeToTimestamp(_doneAt))
                              : '',
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ] else ...[
                  // For new orders, show creation info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: colorScheme.primary.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            localizations
                                .translationOrderFormScreenNewOrderStatusInfo,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Pricing Section
  Widget _buildPricingSection(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, AppLocalizations localizations) {
    return Card(
      elevation: 2,
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  localizations
                      .translationOrderFormScreenSectionTitlePricingPayment,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Translation Pricing Widget
            TranslationPricingWidget(
              documentTypeKey: _selectedDocumentTypeKey,
              pageCount: int.tryParse(_pageCountController.text) ?? 1,
              priority: _selectedPriority ?? crm.Priority.NORMAL,
              cityName: _selectedOffice?.city ?? localizations.defaultCityName,
              managerLevel: localizations.managerLevelRegular,
              notarialSum: double.tryParse(_notarialSumController.text) ?? 0.0,
              onPricingCalculated: (translationSum, totalSum) {
                // Update the total sum controller when pricing is calculated
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    _totalSumController.text = totalSum.toStringAsFixed(2);
                  }
                });
              },
            ),

            const SizedBox(height: 20),

            // Notarial Sum Field
            TextFormField(
              controller: _notarialSumController,
              decoration: InputDecoration(
                labelText: localizations
                    .translationOrderFormScreenFieldNotarialSumLabel,
                hintText: localizations
                    .translationOrderFormScreenFieldNotarialSumHint,
                prefixIcon:
                    Icon(Icons.gavel_outlined, color: colorScheme.primary),
                suffixText: localizations.currencySymbolRuble,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: colorScheme.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
              ],
              onChanged: (value) {
                setState(() {
                  // Force rebuild to trigger pricing recalculation with new notarial sum
                });
              },
            ),

            const SizedBox(height: 20),

            // Total Sum Field (Read-only)
            TextFormField(
              controller: _totalSumController,
              decoration: InputDecoration(
                labelText:
                    localizations.translationOrderFormScreenFieldTotalSumLabel,
                hintText:
                    localizations.translationOrderFormScreenFieldTotalSumHint,
                prefixIcon: Icon(Icons.monetization_on_outlined,
                    color: colorScheme.primary),
                suffixText: localizations.currencySymbolRuble,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: colorScheme.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.3),
              ),
              readOnly: true,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),

            const SizedBox(height: 20),

            // Payment ID Field
            TextFormField(
              controller: _paymentIdController,
              decoration: InputDecoration(
                labelText:
                    localizations.translationOrderFormScreenFieldPaymentIdLabel,
                hintText:
                    localizations.translationOrderFormScreenFieldPaymentIdHint,
                prefixIcon:
                    Icon(Icons.payment_outlined, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: colorScheme.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Actions Section
  Widget _buildActionsSection(BuildContext context, ThemeData theme,
      ColorScheme colorScheme, AppLocalizations localizations) {
    return Card(
      elevation: 2,
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  localizations.translationOrderFormScreenSectionTitleActions,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _isLoading ? null : _saveOrder,
                icon: _isLoading
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimary,
                        ),
                      )
                    : Icon(Icons.save_outlined),
                label: Text(_isLoading
                    ? localizations.translationOrderFormScreenButtonSaving
                    : localizations.translationOrderFormScreenButtonSaveOrder),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            if (widget.orderId != null) ...[
              const SizedBox(height: 16),

              // Delete Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          final confirmed = await showDialog<bool>(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Row(
                                children: [
                                  Icon(Icons.warning_amber_rounded,
                                      color: Colors.orange),
                                  const SizedBox(width: 8),
                                  Text(localizations
                                      .translationOrderFormScreenDialogConfirmDeleteTitle),
                                ],
                              ),
                              content: Text(
                                localizations
                                    .translationOrderFormScreenDialogConfirmDeleteMessage,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text(localizations
                                      .translationOrderFormScreenDialogButtonCancel),
                                ),
                                FilledButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(localizations
                                      .translationOrderFormScreenDialogButtonDelete),
                                ),
                              ],
                            ),
                          );

                          if (confirmed == true) {
                            setState(() => _isLoading = true);
                            try {
                              await _orderService
                                  .deleteTranslationOrder(widget.orderId!);
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: [
                                        Icon(Icons.check_circle,
                                            color: Colors.white),
                                        const SizedBox(width: 8),
                                        Text(localizations
                                            .translationOrderFormScreenOrderDeletedSuccess),
                                      ],
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pop(context, true);
                              }
                            } catch (e) {
                              if (mounted) {
                                setState(() => _isLoading = false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: [
                                        Icon(Icons.error, color: Colors.white),
                                        const SizedBox(width: 8),
                                        Text(localizations
                                            .translationOrderFormScreenErrorGeneric(
                                                e.toString())),
                                      ],
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          }
                        },
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                  label: Text(
                      localizations.translationOrderFormScreenButtonDeleteOrder,
                      style: TextStyle(color: Colors.red)),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Colors.red.withOpacity(0.5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 2,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        title: Row(
          children: [
            Icon(
              Icons.translate_outlined,
              color: colorScheme.primary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              widget.orderId == null
                  ? localizations.translationOrderFormScreenCreateTitle
                  : localizations.translationOrderFormScreenEditTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        actions: [
          if (widget.orderId != null) // Show delete button only when editing
            IconButton(
              onPressed: _isLoading ? null : _deleteOrder,
              icon: Icon(
                Icons.delete_outline,
                color: colorScheme.error,
              ),
              tooltip:
                  localizations.translationOrderFormScreenSaveChangesTooltip,
            ),
          const SizedBox(width: 8),
          FilledButton.icon(
            onPressed: _isLoading ? null : _saveOrder,
            icon: _isLoading
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.onPrimary,
                      ),
                    ),
                  )
                : const Icon(Icons.save_outlined),
            label: Text(
              widget.orderId == null
                  ? localizations.translationOrderFormScreenAppBarTitleCreate
                  : localizations.translationOrderFormScreenAppBarTitleUpdate,
            ),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: _isFetchingInitialData
          ? const Center(child: LoadingIndicator())
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.surfaceContainerHighest.withOpacity(0.3),
                    colorScheme.surface,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Form(
                key: _formKey,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Section
                          _buildHeaderSection(
                              context, theme, colorScheme, localizations),
                          const SizedBox(height: 24),

                          // Order Details Section
                          _buildOrderDetailsSection(
                              context, theme, colorScheme, localizations),
                          const SizedBox(height: 24),

                          // Language and Document Section
                          _buildLanguageAndDocumentSection(
                              context, theme, colorScheme, localizations),
                          const SizedBox(height: 24),

                          // Pricing Section
                          _buildPricingSection(
                              context, theme, colorScheme, localizations),
                          const SizedBox(height: 24),

                          // Notes Section
                          _buildNotesSection(
                              context, theme, colorScheme, localizations),
                          const SizedBox(height: 24),

                          // Status Section (only show when editing)
                          if (widget.orderId != null) ...[
                            _buildStatusSection(
                                context, theme, colorScheme, localizations),
                            const SizedBox(height: 24),
                          ],

                          // Actions Section
                          _buildActionsSection(
                              context, theme, colorScheme, localizations),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  // Delete order method
  Future<void> _deleteOrder() async {
    if (widget.orderId == null) return;

    final localizations = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_outlined,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(width: 8),
            Text(localizations
                .translationOrderFormScreenDialogConfirmDeleteTitle),
          ],
        ),
        content: Text(
          localizations.translationOrderFormScreenDialogConfirmDeleteMessage,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
                localizations.translationOrderFormScreenDialogButtonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(
                localizations.translationOrderFormScreenDialogButtonDelete),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      setState(() => _isLoading = true);
      try {
        await _orderService.deleteTranslationOrder(widget.orderId!);
        if (mounted) {
          Navigator.pop(context, true);
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(localizations
                  .translationOrderFormScreenErrorDeletingOrder(e.toString())),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    }
  }
}

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
  // TODO: Add controller/state for 'blanks' if implementing complex UI

  // Dropdown/Selection State
  crm.Client? _selectedClient; // Store the selected Client object
  crm.Employee? _selectedManager;
  crm.Employee? _selectedTranslator;
  crm.Office? _selectedOffice;
  crm.DocumentType?
      _selectedDocumentType; // Ensure initial value is null or handled
  crm.Priority? _selectedPriority;
  // Status is read-only, store fetched value if editing
  crm.Status? _currentStatus;

  // Switches
  bool _isUrgent = false;
  bool _isSemiUrgent = false;
  bool _clientNotified = false;

  // Data for Dropdowns
  List<crm.Client> _clients = []; // Need to fetch clients for dropdown
  List<crm.Employee> _managers = [];
  List<crm.Employee> _translators = [];
  List<crm.Office> _offices = [];
  final List<crm.DocumentType> _documentTypes = crm.DocumentType.values
      .where((dt) => dt != crm.DocumentType.DOCUMENT_TYPE_UNSPECIFIED)
      .toList();
  final List<crm.Priority> _priorities = crm.Priority.values
      .where((p) => p != crm.Priority.PRIORITY_UNSPECIFIED)
      .toList();
  // --- End Controllers & State Variables ---

  @override
  void initState() {
    super.initState();
    _loadInitialData();
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
    // Dispose any other controllers added
    super.dispose();
  }

  Future<void> _loadInitialData() async {
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
              e.role == crm.EmployeeRole.MANAGER ||
              e.role == crm.EmployeeRole.CHIEF_MANAGER ||
              e.role == crm.EmployeeRole.DIRECTOR)
          .toList();
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
          SnackBar(content: Text('Error loading initial data: $e')),
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
      if (order.hasTranslatorId() && order.translatorId.isNotEmpty) {
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
        order.clientId; // Keep ID in controller for saving
    _doneAt = order.hasDoneAt() ? timestampToDateTime(order.doneAt) : null;
    _sourceLangController.text = order.sourceLanguage;
    _targetLangController.text = order.targetLanguage;
    _pageCountController.text =
        order.hasPageCount() ? order.pageCount.toString() : '';
    _notarialSumController.text =
        order.notarialSum.toString(); // Assuming double
    _paymentIdController.text = order.hasPaymentId() ? order.paymentId : '';
    _notesController.text = order.hasNotes() ? order.notes : '';

    // Handle DocumentType: Set to null if it's UNSPECIFIED
    _selectedDocumentType = (order.hasDocumentType() &&
            order.documentType != crm.DocumentType.DOCUMENT_TYPE_UNSPECIFIED)
        ? order.documentType
        : null;

    _selectedPriority = order.priority; // Priority is not optional
    _currentStatus = order.status; // Store read-only status

    // Set switches
    _isUrgent = order.isUrgent;
    _isSemiUrgent = order.isSemiUrgent;
    _clientNotified = order.clientNotified;

    // TODO: Handle population for 'blanks' if implementing complex UI
  }

  Future<void> _saveOrder() async {
    if (!_formKey.currentState!.validate()) {
      return; // Don't submit if form is invalid
    }

    setState(() => _isLoading = true);

    try {
      final now = DateTime.now();

      // Convert createdAt to a proper Timestamp, either from existing data or from now
      final createdAt =
          _initialOrderData?.createdAt ?? dateTimeToTimestamp(now);
      // Construct the TranslationOrder object from form data
      final orderData = crm.TranslationOrder(
        createdAt: createdAt,
        title: _titleController.text.trim(),
        doneAt: dateTimeToTimestamp(_doneAt),
        // IDs from dropdowns or controllers
        clientId:
            _selectedClient?.clientId ?? '', // Use ID from selected client
        managerId: _selectedManager?.employeeId ?? '', // Handle null selection
        officeId: _selectedOffice?.officeId ?? '', // Handle null selection

        // Optional fields - check if selected/entered before setting
        translatorId: _selectedTranslator?.employeeId, // Optional field
        documentType: _selectedDocumentType, // Optional enum
        sourceLanguage: _sourceLangController.text.isNotEmpty
            ? _sourceLangController.text
            : null,
        targetLanguage: _targetLangController.text.isNotEmpty
            ? _targetLangController.text
            : null,
        pageCount: int.tryParse(_pageCountController.text), // Optional int
        paymentId: _paymentIdController.text.isNotEmpty
            ? _paymentIdController.text
            : null,
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,

        // Required fields
        notarialSum: double.tryParse(_notarialSumController.text) ?? 0.0,
        priority:
            _selectedPriority ?? crm.Priority.NORMAL, // Default if somehow null

        // Booleans from switches
        isUrgent: _isUrgent,
        isSemiUrgent: _isSemiUrgent,
        clientNotified: _clientNotified,

        // --- Fields NOT set by form ---
        // orderId: is set by server on create, or used in update request
        // status: is managed by backend logic, not directly set here
        // translation_sum, total_sum: are calculated by backend
        // blanks: needs specific handling if implemented
      );

      if (widget.orderId == null) {
        // Create new order
        await _orderService.createTranslationOrder(orderData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order created successfully')),
        );
      } else {
        // Update existing order
        await _orderService.updateTranslationOrder(widget.orderId!, orderData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order updated successfully')),
        );
      }
      Navigator.pop(context, true); // Return true to indicate success
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving order: $e')),
      );
    } finally {
      if (mounted) {
        // Check if mounted before calling setState
        setState(() => _isLoading = false);
      }
    }
  }

  // Helper to display employee names in dropdowns
  String _getEmployeeDisplayName(crm.Employee emp) {
    return '${emp.name} (${emp.employeeId.substring(0, 6)}...)'; // Example display
  }

  // Helper to display office names
  String _getOfficeDisplayName(crm.Office office) {
    return '${office.city} (${office.officeId.substring(0, 6)}...)'; // Example display
  }

  // Helper to display client names
  String _getClientDisplayName(crm.Client client) {
    return '${client.firstName} ${client.lastName} (${client.clientId.substring(0, 6)}...)'; // Example display
  }

  // Helper for Document Type
  String _getDocumentTypeDisplayName(crm.DocumentType dt) {
    return dt.name.replaceFirst('DOCUMENT_TYPE_', '').replaceAll('_', ' ');
  }

  // Helper for Priority
  String _getPriorityDisplayName(crm.Priority p) {
    return p.name.replaceFirst('PRIORITY_', '').replaceAll('_', ' ');
  }

  // Helper for Status (read-only display)
  String _getStatusDisplayName(crm.Status? s) {
    if (s == null) return 'N/A';
    return s.name.replaceFirst('STATUS_', '').replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.orderId == null ? 'Create Order' : 'Edit Order'),
        actions: [
          if (!_isLoading &&
              !_isFetchingInitialData) // Only show save when not loading
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveOrder,
              tooltip: 'Save Order',
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
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // --- Core Fields ---
                    // Title
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title *'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Client Dropdown
                    // Done At (Date Picker, only in edit mode)
                    if (widget.orderId != null) ...[
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
                            decoration: const InputDecoration(
                              labelText: 'Done At (Completion Date)',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            controller: TextEditingController(
                              text: _doneAt != null
                                  ? formatTimestamp(
                                      dateTimeToTimestamp(_doneAt))
                                  : '',
                            ),
                            readOnly: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    DropdownButtonFormField<crm.Client>(
                      value: _selectedClient, // Use the selected Client object
                      hint: const Text('Select Client'),
                      items: _clients.map((crm.Client client) {
                        return DropdownMenuItem<crm.Client>(
                          value: client,
                          child: Text(_getClientDisplayName(client)),
                        );
                      }).toList(),
                      onChanged: (crm.Client? newValue) {
                        setState(() {
                          _selectedClient = newValue;
                          _clientIdController.text = newValue?.clientId ??
                              ''; // Update hidden controller if needed
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a client' : null,
                      decoration: const InputDecoration(labelText: 'Client *'),
                    ),
                    const SizedBox(height: 16),

                    DropdownButtonFormField<crm.Employee>(
                      value: _selectedManager,
                      hint: const Text('Select Manager'),
                      items: _managers.map((crm.Employee manager) {
                        return DropdownMenuItem<crm.Employee>(
                          value: manager,
                          child: Text(_getEmployeeDisplayName(manager)),
                        );
                      }).toList(),
                      onChanged: (crm.Employee? newValue) {
                        setState(() {
                          _selectedManager = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a manager' : null,
                      decoration: const InputDecoration(labelText: 'Manager *'),
                    ),
                    const SizedBox(height: 16),

                    DropdownButtonFormField<crm.Office>(
                      value: _selectedOffice,
                      hint: const Text('Select Office'),
                      items: _offices.map((crm.Office office) {
                        return DropdownMenuItem<crm.Office>(
                          value: office,
                          child: Text(_getOfficeDisplayName(office)),
                        );
                      }).toList(),
                      onChanged: (crm.Office? newValue) {
                        setState(() {
                          _selectedOffice = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select an office' : null,
                      decoration: const InputDecoration(labelText: 'Office *'),
                    ),
                    const SizedBox(height: 16),

                    // --- Language & Document ---
                    TextFormField(
                      controller: _sourceLangController,
                      decoration:
                          const InputDecoration(labelText: 'Source Language'),
                      // No validator needed for optional field unless specific format required
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _targetLangController,
                      decoration:
                          const InputDecoration(labelText: 'Target Language'),
                      // No validator needed for optional field
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<crm.DocumentType>(
                      value: _selectedDocumentType,
                      hint: const Text('Select Document Type'),
                      items: _documentTypes.map((crm.DocumentType dt) {
                        return DropdownMenuItem<crm.DocumentType>(
                          value: dt,
                          child: Text(_getDocumentTypeDisplayName(dt)),
                        );
                      }).toList(),
                      onChanged: (crm.DocumentType? newValue) {
                        setState(() {
                          _selectedDocumentType = newValue;
                        });
                      },
                      // validator: (value) => value == null ? 'Please select document type' : null, // Optional field
                      decoration:
                          const InputDecoration(labelText: 'Document Type'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _pageCountController,
                      decoration:
                          const InputDecoration(labelText: 'Page Count'),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // validator: (value) { // Optional field
                      //   if (value != null && value.isNotEmpty && int.tryParse(value) == null) {
                      //     return 'Please enter a valid number';
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 16),

                    // --- Financial & Priority ---
                    TextFormField(
                      controller: _notarialSumController,
                      decoration:
                          const InputDecoration(labelText: 'Notarial Sum *'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(
                            r'^\d+\.?\d{0,2}')), // Allow digits and decimal point
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter notarial sum';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<crm.Priority>(
                      value: _selectedPriority,
                      hint: const Text('Select Priority'),
                      items: _priorities.map((crm.Priority p) {
                        return DropdownMenuItem<crm.Priority>(
                          value: p,
                          child: Text(_getPriorityDisplayName(p)),
                        );
                      }).toList(),
                      onChanged: (crm.Priority? newValue) {
                        setState(() {
                          _selectedPriority = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select priority' : null,
                      decoration:
                          const InputDecoration(labelText: 'Priority *'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _paymentIdController,
                      decoration:
                          const InputDecoration(labelText: 'Payment ID'),
                      // Optional field
                    ),
                    const SizedBox(height: 16),

                    // --- Translator & Status (Read-Only) ---
                    DropdownButtonFormField<crm.Employee>(
                      value: _selectedTranslator,
                      hint: const Text('Select Translator (Optional)'),
                      items: _translators.map((crm.Employee translator) {
                        return DropdownMenuItem<crm.Employee>(
                          value: translator,
                          child: Text(_getEmployeeDisplayName(translator)),
                        );
                      }).toList(),
                      onChanged: (crm.Employee? newValue) {
                        setState(() {
                          _selectedTranslator = newValue;
                        });
                      },
                      // validator: (value) => value == null ? 'Please select a translator' : null, // Optional
                      decoration:
                          const InputDecoration(labelText: 'Translator'),
                    ),
                    const SizedBox(height: 16),

                    // Display Status (Read-Only) if editing
                    if (widget.orderId != null) ...[
                      InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Status (Read-Only)',
                          border: InputBorder
                              .none, // Remove border to look like text
                          contentPadding: EdgeInsets.zero, // Adjust padding
                        ),
                        child: Text(
                          _getStatusDisplayName(_currentStatus),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium, // Adjust style as needed
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // --- Notes & Flags ---
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'Notes'),
                      maxLines: 3,
                      // Optional field
                    ),
                    const SizedBox(height: 16),

                    SwitchListTile(
                      title: const Text('Urgent'),
                      value: _isUrgent,
                      onChanged: (bool value) {
                        setState(() {
                          _isUrgent = value;
                          // Optionally ensure semi-urgent is off if urgent is on
                          if (value) _isSemiUrgent = false;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Semi-Urgent'),
                      value: _isSemiUrgent,
                      onChanged: (bool value) {
                        setState(() {
                          _isSemiUrgent = value;
                          // Optionally ensure urgent is off if semi-urgent is on
                          if (value) _isUrgent = false;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Client Notified'),
                      value: _clientNotified,
                      onChanged: (bool value) {
                        setState(() {
                          _clientNotified = value;
                        });
                      },
                    ),

                    // TODO: Add UI for 'blanks' field if needed

                    const SizedBox(height: 24),
                    // Optional: Add delete button when editing (already implemented)
                    if (widget.orderId != null && !_isLoading)
                      Center(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete Order'),
                          onPressed: () async {
                            try {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Order?'),
                                  content: const Text(
                                      'Are you sure you want to delete this order?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text('Cancel')),
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: const Text('Delete')),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                setState(() => _isLoading = true);
                                await _orderService
                                    .deleteTranslationOrder(widget.orderId!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Order deleted successfully')),
                                );
                                Navigator.pop(context, true); // Indicate change
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Error deleting order: $e')),
                              );
                              if (mounted) {
                                // Check mounted before setState
                                setState(() => _isLoading = false);
                              }
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
    );
  }
}

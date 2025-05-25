import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin/services/translation_pricing_service.dart';

/// Widget for entering and validating 6-digit blank numbers
class BlankNumberField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final List<String> existingBlankNumbers;
  final Function(String)? onChanged;

  const BlankNumberField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.existingBlankNumbers = const [],
    this.onChanged,
  });

  @override
  State<BlankNumberField> createState() => _BlankNumberFieldState();
}

class _BlankNumberFieldState extends State<BlankNumberField> {
  final TranslationPricingService _pricingService = TranslationPricingService();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText ?? 'Enter 6-digit number (e.g., 123456)',
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.auto_awesome),
              tooltip: 'Generate blank number',
              onPressed: _generateBlankNumber,
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              tooltip: 'Suggest next number',
              onPressed: _suggestNextNumber,
            ),
          ],
        ),
        helperText: 'Format: 6 digits (000000-999999)',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
        _BlankNumberFormatter(),
      ],
      validator: (value) {
        if (widget.isRequired && (value == null || value.trim().isEmpty)) {
          return 'Blank number is required';
        }

        if (value != null && value.isNotEmpty) {
          if (!_pricingService.isValidBlankNumber(value)) {
            return 'Invalid format. Must be exactly 6 digits';
          }

          // Check for duplicates
          if (widget.existingBlankNumbers.contains(value)) {
            return 'This blank number is already used';
          }
        }

        return null;
      },
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {}); // Update validation state
      },
    );
  }

  void _generateBlankNumber() {
    final newNumber = _pricingService.generateBlankNumber();
    widget.controller.text = newNumber;
    widget.onChanged?.call(newNumber);
    _showGenerationDialog('Generated', newNumber);
  }

  void _suggestNextNumber() {
    final suggestedNumber =
        _pricingService.suggestNextBlankNumber(widget.existingBlankNumbers);
    widget.controller.text = suggestedNumber;
    widget.onChanged?.call(suggestedNumber);
    _showGenerationDialog('Suggested', suggestedNumber);
  }

  void _showGenerationDialog(String action, String number) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action blank number: $number'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}

/// Formatter to ensure only digits and proper formatting
class _BlankNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Only allow digits
    final filteredText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit to 6 digits
    final limitedText =
        filteredText.length > 6 ? filteredText.substring(0, 6) : filteredText;

    return TextEditingValue(
      text: limitedText,
      selection: TextSelection.collapsed(offset: limitedText.length),
    );
  }
}

/// Widget for managing multiple blank numbers (main + damaged replacements)
class BlankNumbersWidget extends StatefulWidget {
  final TextEditingController mainBlankController;
  final TextEditingController? damagedBlankController;
  final List<String> existingBlankNumbers;
  final Function(String mainBlank, String? damagedBlank)? onChanged;

  const BlankNumbersWidget({
    super.key,
    required this.mainBlankController,
    this.damagedBlankController,
    this.existingBlankNumbers = const [],
    this.onChanged,
  });

  @override
  State<BlankNumbersWidget> createState() => _BlankNumbersWidgetState();
}

class _BlankNumbersWidgetState extends State<BlankNumbersWidget> {
  bool _hasDamagedBlank = false;
  late TextEditingController _localDamagedController;

  @override
  void initState() {
    super.initState();
    _localDamagedController =
        widget.damagedBlankController ?? TextEditingController();
    _hasDamagedBlank = _localDamagedController.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.damagedBlankController == null) {
      _localDamagedController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.confirmation_number, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Blank Numbers',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Main blank number field
            BlankNumberField(
              controller: widget.mainBlankController,
              labelText: 'Main Blank Number *',
              isRequired: true,
              existingBlankNumbers: widget.existingBlankNumbers,
              onChanged: (value) => _notifyChange(),
            ),

            const SizedBox(height: 16),

            // Checkbox for damaged blank
            CheckboxListTile(
              title: const Text('Add Damaged/Spoiled Blank'),
              subtitle: const Text(
                  'Check if a blank was damaged and needs replacement'),
              value: _hasDamagedBlank,
              onChanged: (value) {
                setState(() {
                  _hasDamagedBlank = value ?? false;
                  if (!_hasDamagedBlank) {
                    _localDamagedController.clear();
                  }
                });
                _notifyChange();
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            // Damaged blank field (conditional)
            if (_hasDamagedBlank) ...[
              const SizedBox(height: 8),
              BlankNumberField(
                controller: _localDamagedController,
                labelText: 'Damaged Blank Number',
                hintText: 'Number of the damaged blank being replaced',
                existingBlankNumbers: widget.existingBlankNumbers,
                onChanged: (value) => _notifyChange(),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning_amber, color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Record the damaged blank number for tracking and audit purposes. This helps maintain blank inventory accuracy.',
                        style: TextStyle(fontSize: 12, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // Help text
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, size: 16, color: Colors.blue),
                      SizedBox(width: 4),
                      Text(
                        'Blank Number Guidelines',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• Use exactly 6 digits (e.g., 123456)\n'
                    '• Each blank number must be unique\n'
                    '• Use "Generate" for timestamp-based numbers\n'
                    '• Use "Suggest" for sequential numbering\n'
                    '• Record damaged blanks for audit trail',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _notifyChange() {
    widget.onChanged?.call(
      widget.mainBlankController.text,
      _hasDamagedBlank ? _localDamagedController.text : null,
    );
  }
}

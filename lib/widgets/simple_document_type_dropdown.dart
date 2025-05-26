import 'package:flutter/material.dart';
import 'package:admin/services/document_type_service.dart';
import 'package:admin/l10n/app_localizations.dart';

/// A simple, reliable dropdown for selecting document types
class SimpleDocumentTypeDropdown extends StatefulWidget {
  final String? selectedDocumentTypeKey;
  final Function(String?) onChanged;
  final String? errorText;
  final bool isRequired;

  const SimpleDocumentTypeDropdown({
    super.key,
    this.selectedDocumentTypeKey,
    required this.onChanged,
    this.errorText,
    this.isRequired = false,
  });

  @override
  State<SimpleDocumentTypeDropdown> createState() =>
      _SimpleDocumentTypeDropdownState();
}

class _SimpleDocumentTypeDropdownState
    extends State<SimpleDocumentTypeDropdown> {
  final DocumentTypeService _documentTypeService = DocumentTypeService();
  List<DocumentTypeInfo> _documentTypes = [];
  final TextEditingController _customTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _documentTypes = _documentTypeService.getAllDocumentTypes();
  }

  @override
  void dispose() {
    _customTypeController.dispose();
    super.dispose();
  }

  String _getDisplayName(String key) {
    if (!mounted) return key;
    final localizations = AppLocalizations.of(context);
    return _documentTypeService.getDocumentTypeDisplayName(key, localizations);
  }

  Widget _getCategoryIcon(DocumentCategory category) {
    IconData iconData;
    Color color;

    switch (category) {
      case DocumentCategory.identity:
        iconData = Icons.person;
        color = Colors.blue;
        break;
      case DocumentCategory.civil:
        iconData = Icons.family_restroom;
        color = Colors.green;
        break;
      case DocumentCategory.education:
        iconData = Icons.school;
        color = Colors.orange;
        break;
      case DocumentCategory.medical:
        iconData = Icons.local_hospital;
        color = Colors.red;
        break;
      case DocumentCategory.legal:
        iconData = Icons.gavel;
        color = Colors.purple;
        break;
      case DocumentCategory.financial:
        iconData = Icons.attach_money;
        color = Colors.teal;
        break;
      case DocumentCategory.other:
        iconData = Icons.description;
        color = Colors.grey;
        break;
    }

    return Icon(iconData, size: 20, color: color);
  }

  void _showDocumentTypeBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Select Document Type',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _documentTypes.length + 1, // +1 for custom option
                itemBuilder: (context, index) {
                  if (index == _documentTypes.length) {
                    // Custom option at the end
                    return ListTile(
                      leading: const Icon(Icons.edit, color: Colors.orange),
                      title: const Text('Other (specify)...'),
                      subtitle: const Text('Enter custom document type'),
                      onTap: () {
                        Navigator.pop(context);
                        _showCustomTypeDialog();
                      },
                    );
                  }

                  final docType = _documentTypes[index];
                  final displayName = _getDisplayName(docType.key);
                  final isSelected =
                      docType.key == widget.selectedDocumentTypeKey;

                  return ListTile(
                    leading: _getCategoryIcon(docType.category),
                    title: Text(
                      displayName,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color:
                            isSelected ? Theme.of(context).primaryColor : null,
                      ),
                    ),
                    subtitle: Text(
                        '\$${docType.basePrice.toStringAsFixed(0)} base price'),
                    trailing: isSelected
                        ? Icon(Icons.check,
                            color: Theme.of(context).primaryColor)
                        : null,
                    selected: isSelected,
                    onTap: () {
                      print('Selected document type: ${docType.key}'); // Debug
                      widget.onChanged(docType.key);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomTypeDialog() {
    _customTypeController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Custom Document Type'),
        content: TextField(
          controller: _customTypeController,
          decoration: const InputDecoration(
            labelText: 'Document Type',
            hintText: 'Enter document type name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final customType = _customTypeController.text.trim();
              if (customType.isNotEmpty) {
                print('Selected custom document type: $customType'); // Debug
                widget.onChanged(customType);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Select'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    // Find the display text for the current selection
    String displayText = '';
    if (widget.selectedDocumentTypeKey != null &&
        widget.selectedDocumentTypeKey!.isNotEmpty) {
      displayText = _getDisplayName(widget.selectedDocumentTypeKey!);
    }

    return InkWell(
      onTap: _showDocumentTypeBottomSheet,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText:
              localizations.translationOrderFormScreenFieldDocumentTypeLabel,
          hintText:
              localizations.translationOrderFormScreenFieldDocumentTypeHint,
          errorText: widget.errorText,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          border: const OutlineInputBorder(),
        ),
        child: Text(
          displayText.isEmpty
              ? localizations.translationOrderFormScreenFieldDocumentTypeHint
              : displayText,
          style: TextStyle(
            color: displayText.isEmpty ? Theme.of(context).hintColor : null,
          ),
        ),
      ),
    );
  }
}

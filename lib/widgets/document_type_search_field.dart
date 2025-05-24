import 'package:flutter/material.dart';
import 'package:admin/services/document_type_service.dart';
import 'package:admin/l10n/app_localizations.dart';

/// A searchable dropdown widget for selecting document types
class DocumentTypeSearchField extends StatefulWidget {
  final String? selectedDocumentTypeKey;
  final Function(String?) onChanged;
  final String? errorText;
  final bool isRequired;

  const DocumentTypeSearchField({
    super.key,
    this.selectedDocumentTypeKey,
    required this.onChanged,
    this.errorText,
    this.isRequired = false,
  });

  @override
  State<DocumentTypeSearchField> createState() =>
      _DocumentTypeSearchFieldState();
}

class _DocumentTypeSearchFieldState extends State<DocumentTypeSearchField> {
  final DocumentTypeService _documentTypeService = DocumentTypeService();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<DocumentTypeInfo> _filteredDocumentTypes = [];
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _filteredDocumentTypes = _documentTypeService.getAllDocumentTypes();
    _updateDisplayText();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showDropdown();
      } else {
        _hideDropdown();
      }
    });
  }

  @override
  void didUpdateWidget(DocumentTypeSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDocumentTypeKey != widget.selectedDocumentTypeKey) {
      _updateDisplayText();
    }
  }

  void _updateDisplayText() {
    if (widget.selectedDocumentTypeKey != null &&
        widget.selectedDocumentTypeKey!.isNotEmpty) {
      final localizations = AppLocalizations.of(context);
      _searchController.text = _documentTypeService.getDocumentTypeDisplayName(
        widget.selectedDocumentTypeKey!,
        localizations,
      );
    } else {
      _searchController.clear();
    }
  }

  void _showDropdown() {
    if (_isDropdownOpen) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _hideDropdown() {
    if (!_isDropdownOpen) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: _buildDropdownContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownContent() {
    final localizations = AppLocalizations.of(context);

    if (_filteredDocumentTypes.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 48, color: Colors.grey),
            const SizedBox(height: 8),
            Text(
              'No document types found',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                _selectCustomDocumentType();
              },
              child: const Text('Enter custom type...'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: _filteredDocumentTypes.length + 1, // +1 for custom option
      itemBuilder: (context, index) {
        if (index == _filteredDocumentTypes.length) {
          // Custom option at the end
          return ListTile(
            leading: const Icon(Icons.edit, size: 20),
            title: const Text('Other (specify)...'),
            subtitle: const Text('Enter custom document type'),
            onTap: () {
              _selectCustomDocumentType();
            },
          );
        }

        final docType = _filteredDocumentTypes[index];
        final displayName = _documentTypeService.getDocumentTypeDisplayName(
          docType.key,
          localizations,
        );

        return ListTile(
          title: Text(displayName),
          subtitle:
              Text('\$${docType.basePrice.toStringAsFixed(0)} base price'),
          trailing: _getCategoryIcon(docType.category),
          onTap: () {
            _selectDocumentType(docType.key);
          },
        );
      },
    );
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

  void _selectDocumentType(String key) {
    widget.onChanged(key);
    _hideDropdown();
    _focusNode.unfocus();
  }

  void _selectCustomDocumentType() {
    _hideDropdown();
    _showCustomTypeDialog();
  }

  void _showCustomTypeDialog() {
    final customController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Custom Document Type'),
        content: TextField(
          controller: customController,
          decoration: const InputDecoration(
            labelText: 'Document Type',
            hintText: 'Enter document type name',
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
              if (customController.text.trim().isNotEmpty) {
                widget.onChanged(customController.text.trim());
                Navigator.of(context).pop();
              }
            },
            child: const Text('Select'),
          ),
        ],
      ),
    );
  }

  void _onSearchChanged(String query) {
    final localizations = AppLocalizations.of(context);
    setState(() {
      _filteredDocumentTypes =
          _documentTypeService.searchDocumentTypes(query, localizations);
    });

    // Update overlay if it's open
    if (_isDropdownOpen) {
      _overlayEntry?.markNeedsBuild();
    }
  }

  @override
  void dispose() {
    _hideDropdown();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: _searchController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          labelText:
              localizations.translationOrderFormScreenFieldDocumentTypeLabel,
          hintText:
              localizations.translationOrderFormScreenFieldDocumentTypeHint,
          errorText: widget.errorText,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    widget.onChanged(null);
                    _onSearchChanged('');
                  },
                ),
              Icon(_isDropdownOpen
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down),
            ],
          ),
        ),
        onChanged: _onSearchChanged,
        onTap: () {
          if (!_focusNode.hasFocus) {
            _focusNode.requestFocus();
          }
        },
        validator: widget.isRequired
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please select a document type';
                }
                return null;
              }
            : null,
      ),
    );
  }
}

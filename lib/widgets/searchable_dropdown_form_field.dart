import 'package:flutter/material.dart';
import 'package:admin/l10n/app_localizations.dart';

/// A searchable dropdown form field that provides filtering functionality
/// for long lists of items.
class SearchableDropdownFormField<T> extends StatefulWidget {
  final T? value;
  final List<T> items;
  final String Function(T) itemAsString;
  final Widget Function(T)? itemBuilder;
  final ValueChanged<T?>? onChanged;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final FormFieldValidator<T>? validator;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? maxHeight;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final bool isRequired;
  final bool autofocus;

  const SearchableDropdownFormField({
    super.key,
    this.value,
    required this.items,
    required this.itemAsString,
    this.itemBuilder,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.errorText,
    this.validator,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.maxHeight = 200,
    this.contentPadding,
    this.decoration,
    this.isRequired = false,
    this.autofocus = false,
  });

  @override
  State<SearchableDropdownFormField<T>> createState() =>
      _SearchableDropdownFormFieldState<T>();
}

class _SearchableDropdownFormFieldState<T>
    extends State<SearchableDropdownFormField<T>> {
  late List<T> _filteredItems;
  final TextEditingController _searchController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.items);
    _updateDisplayText();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(SearchableDropdownFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filteredItems = List.from(widget.items);
      _filterItems('');
    }
    if (oldWidget.value != widget.value) {
      // Defer the text update to avoid setState during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateDisplayText();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _updateDisplayText() {
    if (widget.value != null) {
      _searchController.text = widget.itemAsString(widget.value as T);
    } else {
      _searchController.clear();
    }
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus && _isOpen) {
      _removeOverlay();
    }
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.items.where((item) {
        final itemString = widget.itemAsString(item).toLowerCase();
        return itemString.contains(query.toLowerCase());
      }).toList();
    });
    _updateOverlay();
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final localizations = AppLocalizations.of(context);
    _filterItems(''); // Reset filter when opening
    _isOpen = true;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: _getFieldWidth(),
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, _getFieldHeight()),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: widget.maxHeight ?? 200,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .outline
                      .withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search field
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: widget.autofocus,
                      decoration: InputDecoration(
                        hintText: localizations.searchableDropdownSearchHint,
                        prefixIcon: const Icon(Icons.search, size: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        isDense: true,
                      ),
                      onChanged: _filterItems,
                    ),
                  ),
                  const Divider(height: 1),
                  // Items list
                  Flexible(
                    child: _filteredItems.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              localizations.searchableDropdownNoResults,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _filteredItems.length,
                            itemBuilder: (context, index) {
                              final item = _filteredItems[index];
                              final isSelected = widget.value == item;

                              return ListTile(
                                dense: true,
                                selected: isSelected,
                                selectedColor:
                                    Theme.of(context).colorScheme.primary,
                                selectedTileColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withValues(alpha: 0.1),
                                title: widget.itemBuilder?.call(item) ??
                                    Text(widget.itemAsString(item)),
                                trailing: isSelected
                                    ? Icon(
                                        Icons.check,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 20,
                                      )
                                    : null,
                                onTap: () => _selectItem(item),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _selectItem(T item) {
    widget.onChanged?.call(item);
    _updateDisplayText();
    _removeOverlay();
    _focusNode.unfocus();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isOpen = false;
  }

  void _updateOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
    }
  }

  double _getFieldWidth() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    return renderBox?.size.width ?? 200;
  }

  double _getFieldHeight() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 56;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return FormField<T>(
      initialValue: widget.value,
      validator: widget.validator,
      enabled: widget.enabled,
      builder: (fieldState) {
        return CompositedTransformTarget(
          link: _layerLink,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: widget.enabled ? _toggleDropdown : null,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    enabled: widget.enabled,
                    readOnly: true,
                    decoration:
                        (widget.decoration ?? InputDecoration()).copyWith(
                      labelText: widget.labelText,
                      hintText: widget.hintText ??
                          localizations.searchableDropdownHint,
                      errorText: fieldState.errorText ?? widget.errorText,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.suffixIcon ??
                          Icon(
                            _isOpen
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: widget.enabled
                                ? Theme.of(context).colorScheme.onSurfaceVariant
                                : Theme.of(context).disabledColor,
                          ),
                      contentPadding: widget.contentPadding,
                    ),
                  ),
                ),
              ),
              if (fieldState.hasError && fieldState.errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                  child: Text(
                    fieldState.errorText!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// A simplified version for basic use cases
class SimpleSearchableDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String Function(T) itemAsString;
  final ValueChanged<T?>? onChanged;
  final String? labelText;
  final String? hintText;
  final bool enabled;

  const SimpleSearchableDropdown({
    super.key,
    this.value,
    required this.items,
    required this.itemAsString,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SearchableDropdownFormField<T>(
      value: value,
      items: items,
      itemAsString: itemAsString,
      onChanged: onChanged,
      labelText: labelText,
      hintText: hintText,
      enabled: enabled,
    );
  }
}

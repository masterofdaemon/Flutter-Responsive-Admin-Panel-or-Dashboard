import 'package:flutter/material.dart';

class LayoutController extends ChangeNotifier {
  bool _isRightSidebarCollapsed = false;
  Set<int> _selectedItems = {};
  String _searchQuery = '';
  Map<String, dynamic> _activeFilters = {};

  // Right Sidebar State
  bool get isRightSidebarCollapsed => _isRightSidebarCollapsed;

  void toggleRightSidebar() {
    _isRightSidebarCollapsed = !_isRightSidebarCollapsed;
    notifyListeners();
  }

  void setRightSidebarCollapsed(bool collapsed) {
    if (_isRightSidebarCollapsed != collapsed) {
      _isRightSidebarCollapsed = collapsed;
      notifyListeners();
    }
  }

  // Bulk Selection State
  Set<int> get selectedItems => Set.unmodifiable(_selectedItems);
  bool get hasSelectedItems => _selectedItems.isNotEmpty;
  int get selectedItemsCount => _selectedItems.length;

  void selectItem(int id) {
    _selectedItems.add(id);
    notifyListeners();
  }

  void deselectItem(int id) {
    _selectedItems.remove(id);
    notifyListeners();
  }

  void toggleItemSelection(int id) {
    if (_selectedItems.contains(id)) {
      _selectedItems.remove(id);
    } else {
      _selectedItems.add(id);
    }
    notifyListeners();
  }

  void selectAllItems(List<int> ids) {
    _selectedItems.addAll(ids);
    notifyListeners();
  }

  void clearSelection() {
    _selectedItems.clear();
    notifyListeners();
  }

  bool isItemSelected(int id) {
    return _selectedItems.contains(id);
  }

  // Search State
  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    if (_searchQuery != query) {
      _searchQuery = query;
      notifyListeners();
    }
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  // Filter State
  Map<String, dynamic> get activeFilters => Map.unmodifiable(_activeFilters);

  void setFilter(String key, dynamic value) {
    _activeFilters[key] = value;
    notifyListeners();
  }

  void removeFilter(String key) {
    _activeFilters.remove(key);
    notifyListeners();
  }

  void clearFilters() {
    _activeFilters.clear();
    notifyListeners();
  }

  bool hasActiveFilters() {
    return _activeFilters.isNotEmpty;
  }

  // Utility methods for bulk actions
  Future<void> performBulkAction(
      String action, Function(Set<int>) callback) async {
    if (_selectedItems.isEmpty) return;

    try {
      await callback(_selectedItems);
      clearSelection();
    } catch (e) {
      // Error handling will be done by the calling widget
      rethrow;
    }
  }
}

import 'package:admin/models/business_direction.dart';
import 'package:admin/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class DirectionService extends ChangeNotifier {
  final AuthService _authService;
  List<BusinessDirection> _directions = [];
  BusinessDirection? _selectedDirection;

  DirectionService(this._authService) {
    _initializeDirections();
  }

  List<BusinessDirection> get directions => _directions;
  BusinessDirection? get selectedDirection => _selectedDirection;

  void _initializeDirections() {
    _directions = [
      const BusinessDirection(
        id: 'translation',
        nameKey: 'directionTranslationAgency',
        iconPath: 'assets/icons/menu_doc.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
      const BusinessDirection(
        id: 'legal',
        nameKey: 'directionLegalServices',
        iconPath: 'assets/icons/menu_setting.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
      const BusinessDirection(
        id: 'insurance',
        nameKey: 'directionInsuranceServices',
        iconPath: 'assets/icons/menu_store.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
      const BusinessDirection(
        id: 'lending',
        nameKey: 'directionLending',
        iconPath: 'assets/icons/menu_store.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
      const BusinessDirection(
        id: 'accounts',
        nameKey: 'directionOpeningAccounts',
        iconPath: 'assets/icons/menu_store.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
      const BusinessDirection(
        id: 'training',
        nameKey: 'directionAdvancedTraining',
        iconPath: 'assets/icons/menu_doc.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
      const BusinessDirection(
        id: 'copyright',
        nameKey: 'directionCopyrightProtection',
        iconPath: 'assets/icons/menu_setting.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
      const BusinessDirection(
        id: 'valuation',
        nameKey: 'directionPropertyValuation',
        iconPath: 'assets/icons/menu_store.svg',
        pendingCount: 0,
        priority: DirectionPriority.none,
      ),
    ];

    // TODO: Load actual counts from API
    _refreshCounters();
  }

  void selectDirection(String directionId) {
    _directions = _directions
        .map((direction) =>
            direction.copyWith(isSelected: direction.id == directionId))
        .toList();

    _selectedDirection = _directions.firstWhere(
      (direction) => direction.id == directionId,
      orElse: () => _directions.first,
    );

    notifyListeners();
  }

  void clearDirectionSelection() {
    _directions = _directions
        .map((direction) => direction.copyWith(isSelected: false))
        .toList();

    _selectedDirection = null;
    notifyListeners();
  }

  Future<void> _refreshCounters() async {
    // TODO: Implement actual API call to get counters based on user role
    // This is a placeholder implementation

    final userRole = _authService.currentUserRole;
    if (userRole == null) return;

    // Simulate different counter logic based on role
    final counters = await _getCountersForRole(userRole);

    _directions = _directions.map((direction) {
      final counter = counters.firstWhere(
        (c) => c.directionId == direction.id,
        orElse: () => DirectionCounter(
          directionId: direction.id,
          count: 0,
          priority: DirectionPriority.none,
        ),
      );

      return direction.copyWith(
        pendingCount: counter.count,
        priority: counter.priority,
      );
    }).toList();

    notifyListeners();
  }

  Future<List<DirectionCounter>> _getCountersForRole(dynamic role) async {
    // TODO: Replace with actual API call
    // This simulates the logic described in requirements

    await Future.delayed(
        const Duration(milliseconds: 500)); // Simulate API delay

    // Placeholder counters - in real implementation, this would come from API
    return [
      const DirectionCounter(
        directionId: 'translation',
        count: 5,
        priority: DirectionPriority.attention,
      ),
      const DirectionCounter(
        directionId: 'legal',
        count: 2,
        priority: DirectionPriority.critical,
      ),
      const DirectionCounter(
        directionId: 'insurance',
        count: 0,
        priority: DirectionPriority.none,
      ),
      // ... other directions
    ];
  }

  Future<void> refreshCounters() async {
    await _refreshCounters();
  }
}

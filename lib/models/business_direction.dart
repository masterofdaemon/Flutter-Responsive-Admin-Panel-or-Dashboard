class BusinessDirection {
  final String id;
  final String nameKey; // Localization key
  final String iconPath;
  final int pendingCount;
  final DirectionPriority priority;
  final bool isSelected;

  const BusinessDirection({
    required this.id,
    required this.nameKey,
    required this.iconPath,
    required this.pendingCount,
    required this.priority,
    this.isSelected = false,
  });

  BusinessDirection copyWith({
    String? id,
    String? nameKey,
    String? iconPath,
    int? pendingCount,
    DirectionPriority? priority,
    bool? isSelected,
  }) {
    return BusinessDirection(
      id: id ?? this.id,
      nameKey: nameKey ?? this.nameKey,
      iconPath: iconPath ?? this.iconPath,
      pendingCount: pendingCount ?? this.pendingCount,
      priority: priority ?? this.priority,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

enum DirectionPriority {
  none, // Gray or no indicator
  attention, // Yellow
  critical // Red
}

class DirectionCounter {
  final String directionId;
  final int count;
  final DirectionPriority priority;

  const DirectionCounter({
    required this.directionId,
    required this.count,
    required this.priority,
  });
}

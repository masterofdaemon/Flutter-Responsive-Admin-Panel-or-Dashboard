/// Enum for different types of calendar events
enum EventType {
  call,
  meeting,
  deadline,
  reminder,
  appointment,
  followUp,
  training,
  review,
}

/// Enum for event status
enum EventStatus {
  scheduled,
  inProgress,
  completed,
  cancelled,
  rescheduled,
  postponed,
}

/// Model class for calendar events
class CalendarEvent {
  /// Unique identifier for the event
  final String id;

  /// Title of the event
  final String title;

  /// Optional detailed description
  final String? description;

  /// Start date and time of the event
  final DateTime startTime;

  /// End date and time of the event
  final DateTime endTime;

  /// Type of event for categorization and styling
  final EventType type;

  /// Current status of the event
  final EventStatus status;

  /// ID of related application if applicable
  final String? relatedApplicationId;

  /// ID of related client if applicable
  final String? relatedClientId;

  /// Physical or virtual location of the event
  final String? location;

  /// List of employee IDs attending the event
  final List<String> attendeeIds;

  /// Whether the event has a reminder set
  final bool hasReminder;

  /// When to send the reminder (minutes before event)
  final int? reminderMinutesBefore;

  /// Optional notes about the event
  final String? notes;

  /// Color for event display (hex string)
  final String? color;

  /// Whether this is an all-day event
  final bool isAllDay;

  /// Whether this is a recurring event
  final bool isRecurring;

  /// Recurrence pattern if recurring
  final String? recurrencePattern;

  /// Priority level of the event
  final EventPriority priority;

  /// Who created this event
  final String createdBy;

  /// When the event was created
  final DateTime createdAt;

  /// When the event was last updated
  final DateTime? updatedAt;

  const CalendarEvent({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.createdBy,
    required this.createdAt,
    this.description,
    this.status = EventStatus.scheduled,
    this.relatedApplicationId,
    this.relatedClientId,
    this.location,
    this.attendeeIds = const [],
    this.hasReminder = false,
    this.reminderMinutesBefore,
    this.notes,
    this.color,
    this.isAllDay = false,
    this.isRecurring = false,
    this.recurrencePattern,
    this.priority = EventPriority.medium,
    this.updatedAt,
  });

  /// Factory constructor for JSON deserialization
  factory CalendarEvent.fromJson(Map<String, dynamic> json) {
    return CalendarEvent(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      type: EventType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => EventType.meeting,
      ),
      status: EventStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => EventStatus.scheduled,
      ),
      relatedApplicationId: json['relatedApplicationId'] as String?,
      relatedClientId: json['relatedClientId'] as String?,
      location: json['location'] as String?,
      attendeeIds: List<String>.from(json['attendeeIds'] ?? []),
      hasReminder: json['hasReminder'] as bool? ?? false,
      reminderMinutesBefore: json['reminderMinutesBefore'] as int?,
      notes: json['notes'] as String?,
      color: json['color'] as String?,
      isAllDay: json['isAllDay'] as bool? ?? false,
      isRecurring: json['isRecurring'] as bool? ?? false,
      recurrencePattern: json['recurrencePattern'] as String?,
      priority: EventPriority.values.firstWhere(
        (e) => e.name == json['priority'],
        orElse: () => EventPriority.medium,
      ),
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  /// Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'type': type.name,
      'status': status.name,
      'relatedApplicationId': relatedApplicationId,
      'relatedClientId': relatedClientId,
      'location': location,
      'attendeeIds': attendeeIds,
      'hasReminder': hasReminder,
      'reminderMinutesBefore': reminderMinutesBefore,
      'notes': notes,
      'color': color,
      'isAllDay': isAllDay,
      'isRecurring': isRecurring,
      'recurrencePattern': recurrencePattern,
      'priority': priority.name,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// Create a copy of the event with updated fields
  CalendarEvent copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    EventType? type,
    EventStatus? status,
    String? relatedApplicationId,
    String? relatedClientId,
    String? location,
    List<String>? attendeeIds,
    bool? hasReminder,
    int? reminderMinutesBefore,
    String? notes,
    String? color,
    bool? isAllDay,
    bool? isRecurring,
    String? recurrencePattern,
    EventPriority? priority,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CalendarEvent(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      type: type ?? this.type,
      status: status ?? this.status,
      relatedApplicationId: relatedApplicationId ?? this.relatedApplicationId,
      relatedClientId: relatedClientId ?? this.relatedClientId,
      location: location ?? this.location,
      attendeeIds: attendeeIds ?? this.attendeeIds,
      hasReminder: hasReminder ?? this.hasReminder,
      reminderMinutesBefore:
          reminderMinutesBefore ?? this.reminderMinutesBefore,
      notes: notes ?? this.notes,
      color: color ?? this.color,
      isAllDay: isAllDay ?? this.isAllDay,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
      priority: priority ?? this.priority,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Get the duration of the event
  Duration get duration => endTime.difference(startTime);

  /// Check if the event is happening today
  bool get isToday {
    final now = DateTime.now();
    final eventDate = DateTime(startTime.year, startTime.month, startTime.day);
    final todayDate = DateTime(now.year, now.month, now.day);
    return eventDate == todayDate;
  }

  /// Check if the event is upcoming (in the future)
  bool get isUpcoming => startTime.isAfter(DateTime.now());

  /// Check if the event is currently happening
  bool get isHappening {
    final now = DateTime.now();
    return now.isAfter(startTime) && now.isBefore(endTime);
  }

  /// Check if the event is overdue (past end time but not completed)
  bool get isOverdue {
    return DateTime.now().isAfter(endTime) &&
        status != EventStatus.completed &&
        status != EventStatus.cancelled;
  }

  /// Get a formatted time range string
  String get timeRange {
    if (isAllDay) {
      return 'All day';
    }

    final startFormatted =
        '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
    final endFormatted =
        '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';

    return '$startFormatted - $endFormatted';
  }

  /// Get formatted date string
  String get dateString {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${startTime.day} ${months[startTime.month - 1]} ${startTime.year}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CalendarEvent && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'CalendarEvent(id: $id, title: $title, type: $type, startTime: $startTime, status: $status)';
  }
}

/// Enum for event priority levels
enum EventPriority {
  low,
  medium,
  high,
  critical,
}

/// Extension methods for EventType
extension EventTypeExtension on EventType {
  /// Get the display name for the event type
  String get displayName {
    switch (this) {
      case EventType.call:
        return 'Call';
      case EventType.meeting:
        return 'Meeting';
      case EventType.deadline:
        return 'Deadline';
      case EventType.reminder:
        return 'Reminder';
      case EventType.appointment:
        return 'Appointment';
      case EventType.followUp:
        return 'Follow Up';
      case EventType.training:
        return 'Training';
      case EventType.review:
        return 'Review';
    }
  }

  /// Get the default color for the event type
  String get defaultColor {
    switch (this) {
      case EventType.call:
        return '#2196F3'; // Blue
      case EventType.meeting:
        return '#4CAF50'; // Green
      case EventType.deadline:
        return '#F44336'; // Red
      case EventType.reminder:
        return '#FF9800'; // Orange
      case EventType.appointment:
        return '#9C27B0'; // Purple
      case EventType.followUp:
        return '#00BCD4'; // Cyan
      case EventType.training:
        return '#3F51B5'; // Indigo
      case EventType.review:
        return '#795548'; // Brown
    }
  }

  /// Get the default icon for the event type
  String get defaultIcon {
    switch (this) {
      case EventType.call:
        return 'phone';
      case EventType.meeting:
        return 'people';
      case EventType.deadline:
        return 'schedule';
      case EventType.reminder:
        return 'notification_important';
      case EventType.appointment:
        return 'event';
      case EventType.followUp:
        return 'follow_the_signs';
      case EventType.training:
        return 'school';
      case EventType.review:
        return 'rate_review';
    }
  }
}

/// Extension methods for EventStatus
extension EventStatusExtension on EventStatus {
  /// Get the display name for the event status
  String get displayName {
    switch (this) {
      case EventStatus.scheduled:
        return 'Scheduled';
      case EventStatus.inProgress:
        return 'In Progress';
      case EventStatus.completed:
        return 'Completed';
      case EventStatus.cancelled:
        return 'Cancelled';
      case EventStatus.rescheduled:
        return 'Rescheduled';
      case EventStatus.postponed:
        return 'Postponed';
    }
  }

  /// Get the color for the event status
  String get color {
    switch (this) {
      case EventStatus.scheduled:
        return '#2196F3'; // Blue
      case EventStatus.inProgress:
        return '#FF9800'; // Orange
      case EventStatus.completed:
        return '#4CAF50'; // Green
      case EventStatus.cancelled:
        return '#F44336'; // Red
      case EventStatus.rescheduled:
        return '#9C27B0'; // Purple
      case EventStatus.postponed:
        return '#607D8B'; // Blue Grey
    }
  }
}

/// Extension methods for EventPriority
extension EventPriorityExtension on EventPriority {
  /// Get the display name for the event priority
  String get displayName {
    switch (this) {
      case EventPriority.low:
        return 'Low';
      case EventPriority.medium:
        return 'Medium';
      case EventPriority.high:
        return 'High';
      case EventPriority.critical:
        return 'Critical';
    }
  }

  /// Get the sort order value (higher values = higher priority)
  int get sortOrder {
    switch (this) {
      case EventPriority.low:
        return 1;
      case EventPriority.medium:
        return 2;
      case EventPriority.high:
        return 3;
      case EventPriority.critical:
        return 4;
    }
  }
}

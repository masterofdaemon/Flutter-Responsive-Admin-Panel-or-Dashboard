/// Enum for different types of notifications
enum NotificationType {
  info,
  warning,
  error,
  success,
  overdue,
  newApplication,
  paymentReminder,
  taskAssigned,
  deadlineApproaching,
  statusChanged,
  documentUploaded,
  messageReceived,
}

/// Enum for notification priority levels
enum NotificationPriority {
  low,
  medium,
  high,
  critical,
}

/// Model class for application notifications
class AppNotification {
  /// Unique identifier for the notification
  final String id;

  /// Title of the notification
  final String title;

  /// Detailed message content
  final String message;

  /// Type of notification for styling and categorization
  final NotificationType type;

  /// Priority level for ordering and visual emphasis
  final NotificationPriority priority;

  /// When the notification was created
  final DateTime createdAt;

  /// Whether the notification has been read by the user
  final bool isRead;

  /// Optional route to navigate to when notification is tapped
  final String? actionRoute;

  /// Optional data to pass when navigating
  final Map<String, dynamic>? actionData;

  /// ID of related entity (application, client, etc.)
  final String? relatedEntityId;

  /// Type of related entity for context
  final String? relatedEntityType;

  /// Optional icon name for custom notification display
  final String? iconName;

  /// Optional color override for notification styling
  final String? colorOverride;

  const AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.priority,
    required this.createdAt,
    this.isRead = false,
    this.actionRoute,
    this.actionData,
    this.relatedEntityId,
    this.relatedEntityType,
    this.iconName,
    this.colorOverride,
  });

  /// Factory constructor for JSON deserialization
  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: NotificationType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => NotificationType.info,
      ),
      priority: NotificationPriority.values.firstWhere(
        (e) => e.name == json['priority'],
        orElse: () => NotificationPriority.medium,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool? ?? false,
      actionRoute: json['actionRoute'] as String?,
      actionData: json['actionData'] as Map<String, dynamic>?,
      relatedEntityId: json['relatedEntityId'] as String?,
      relatedEntityType: json['relatedEntityType'] as String?,
      iconName: json['iconName'] as String?,
      colorOverride: json['colorOverride'] as String?,
    );
  }

  /// Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type.name,
      'priority': priority.name,
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
      'actionRoute': actionRoute,
      'actionData': actionData,
      'relatedEntityId': relatedEntityId,
      'relatedEntityType': relatedEntityType,
      'iconName': iconName,
      'colorOverride': colorOverride,
    };
  }

  /// Create a copy of the notification with updated fields
  AppNotification copyWith({
    String? id,
    String? title,
    String? message,
    NotificationType? type,
    NotificationPriority? priority,
    DateTime? createdAt,
    bool? isRead,
    String? actionRoute,
    Map<String, dynamic>? actionData,
    String? relatedEntityId,
    String? relatedEntityType,
    String? iconName,
    String? colorOverride,
  }) {
    return AppNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      actionRoute: actionRoute ?? this.actionRoute,
      actionData: actionData ?? this.actionData,
      relatedEntityId: relatedEntityId ?? this.relatedEntityId,
      relatedEntityType: relatedEntityType ?? this.relatedEntityType,
      iconName: iconName ?? this.iconName,
      colorOverride: colorOverride ?? this.colorOverride,
    );
  }

  /// Check if this is a high-priority notification
  bool get isHighPriority =>
      priority == NotificationPriority.high ||
      priority == NotificationPriority.critical;

  /// Check if this notification is urgent (critical priority or overdue type)
  bool get isUrgent =>
      priority == NotificationPriority.critical ||
      type == NotificationType.overdue;

  /// Get a formatted time string for display
  String get formattedTime {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppNotification && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'AppNotification(id: $id, title: $title, type: $type, priority: $priority, isRead: $isRead)';
  }
}

/// Extension methods for NotificationType
extension NotificationTypeExtension on NotificationType {
  /// Get the display name for the notification type
  String get displayName {
    switch (this) {
      case NotificationType.info:
        return 'Information';
      case NotificationType.warning:
        return 'Warning';
      case NotificationType.error:
        return 'Error';
      case NotificationType.success:
        return 'Success';
      case NotificationType.overdue:
        return 'Overdue';
      case NotificationType.newApplication:
        return 'New Application';
      case NotificationType.paymentReminder:
        return 'Payment Reminder';
      case NotificationType.taskAssigned:
        return 'Task Assigned';
      case NotificationType.deadlineApproaching:
        return 'Deadline Approaching';
      case NotificationType.statusChanged:
        return 'Status Changed';
      case NotificationType.documentUploaded:
        return 'Document Uploaded';
      case NotificationType.messageReceived:
        return 'Message Received';
    }
  }

  /// Get the default icon name for the notification type
  String get defaultIcon {
    switch (this) {
      case NotificationType.info:
        return 'info';
      case NotificationType.warning:
        return 'warning';
      case NotificationType.error:
        return 'error';
      case NotificationType.success:
        return 'check_circle';
      case NotificationType.overdue:
        return 'schedule';
      case NotificationType.newApplication:
        return 'add_box';
      case NotificationType.paymentReminder:
        return 'payment';
      case NotificationType.taskAssigned:
        return 'assignment';
      case NotificationType.deadlineApproaching:
        return 'access_time';
      case NotificationType.statusChanged:
        return 'update';
      case NotificationType.documentUploaded:
        return 'upload_file';
      case NotificationType.messageReceived:
        return 'message';
    }
  }
}

/// Extension methods for NotificationPriority
extension NotificationPriorityExtension on NotificationPriority {
  /// Get the display name for the notification priority
  String get displayName {
    switch (this) {
      case NotificationPriority.low:
        return 'Low';
      case NotificationPriority.medium:
        return 'Medium';
      case NotificationPriority.high:
        return 'High';
      case NotificationPriority.critical:
        return 'Critical';
    }
  }

  /// Get the sort order value (higher values = higher priority)
  int get sortOrder {
    switch (this) {
      case NotificationPriority.low:
        return 1;
      case NotificationPriority.medium:
        return 2;
      case NotificationPriority.high:
        return 3;
      case NotificationPriority.critical:
        return 4;
    }
  }
}

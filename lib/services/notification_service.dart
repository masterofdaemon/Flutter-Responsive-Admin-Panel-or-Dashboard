import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:admin/models/notification_model.dart';

/// Service for managing application notifications
class NotificationService with ChangeNotifier {
  static NotificationService? _instance;

  /// Singleton instance
  static NotificationService get instance {
    _instance ??= NotificationService._internal();
    return _instance!;
  }

  NotificationService._internal() {
    _initializeService();
  }

  // Private fields
  final List<AppNotification> _notifications = [];
  final StreamController<List<AppNotification>> _notificationStreamController =
      StreamController<List<AppNotification>>.broadcast();
  Timer? _updateTimer;
  bool _isInitialized = false;

  // Getters
  /// Stream of notifications for real-time updates
  Stream<List<AppNotification>> get notificationStream =>
      _notificationStreamController.stream;

  /// Get all notifications
  List<AppNotification> get notifications => List.unmodifiable(_notifications);

  /// Get unread notifications count
  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  /// Get unread notifications
  List<AppNotification> get unreadNotifications =>
      _notifications.where((n) => !n.isRead).toList();

  /// Get recent notifications (last 24 hours)
  List<AppNotification> get recentNotifications {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return _notifications.where((n) => n.createdAt.isAfter(yesterday)).toList();
  }

  /// Get high priority notifications
  List<AppNotification> get highPriorityNotifications =>
      _notifications.where((n) => n.isHighPriority).toList();

  /// Get urgent notifications (critical or overdue)
  List<AppNotification> get urgentNotifications =>
      _notifications.where((n) => n.isUrgent).toList();

  /// Initialize the service
  Future<void> _initializeService() async {
    if (_isInitialized) return;

    // Generate some mock notifications for development
    await _generateMockNotifications();

    // Set up periodic updates (every 30 seconds)
    _updateTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      _checkForNewNotifications();
    });

    _isInitialized = true;
    _notifyListeners();
  }

  /// Generate mock notifications for development/testing
  Future<void> _generateMockNotifications() async {
    final now = DateTime.now();

    final mockNotifications = [
      AppNotification(
        id: '1',
        title: 'New Application Received',
        message: 'Application #2024001 has been submitted by John Doe',
        type: NotificationType.newApplication,
        priority: NotificationPriority.high,
        createdAt: now.subtract(const Duration(minutes: 5)),
        relatedEntityId: '2024001',
        relatedEntityType: 'application',
        actionRoute: '/applications/2024001',
      ),
      AppNotification(
        id: '2',
        title: 'Payment Overdue',
        message: 'Invoice #INV-2024-001 is overdue by 3 days',
        type: NotificationType.overdue,
        priority: NotificationPriority.critical,
        createdAt: now.subtract(const Duration(hours: 2)),
        relatedEntityId: 'INV-2024-001',
        relatedEntityType: 'invoice',
        actionRoute: '/invoices/INV-2024-001',
      ),
      AppNotification(
        id: '3',
        title: 'Task Assigned',
        message: 'You have been assigned to translate document for Client ABC',
        type: NotificationType.taskAssigned,
        priority: NotificationPriority.medium,
        createdAt: now.subtract(const Duration(hours: 4)),
        relatedEntityId: 'task-123',
        relatedEntityType: 'task',
        actionRoute: '/tasks/123',
      ),
      AppNotification(
        id: '4',
        title: 'Deadline Approaching',
        message: 'Translation deadline for Project XYZ is in 2 hours',
        type: NotificationType.deadlineApproaching,
        priority: NotificationPriority.high,
        createdAt: now.subtract(const Duration(minutes: 30)),
        relatedEntityId: 'project-xyz',
        relatedEntityType: 'project',
        actionRoute: '/projects/xyz',
      ),
      AppNotification(
        id: '5',
        title: 'Document Uploaded',
        message: 'Client has uploaded new document for review',
        type: NotificationType.documentUploaded,
        priority: NotificationPriority.medium,
        createdAt: now.subtract(const Duration(hours: 6)),
        relatedEntityId: 'doc-456',
        relatedEntityType: 'document',
        actionRoute: '/documents/456',
        isRead: true,
      ),
      AppNotification(
        id: '6',
        title: 'Status Update',
        message: 'Application #2024002 status changed to "In Review"',
        type: NotificationType.statusChanged,
        priority: NotificationPriority.low,
        createdAt: now.subtract(const Duration(hours: 8)),
        relatedEntityId: '2024002',
        relatedEntityType: 'application',
        actionRoute: '/applications/2024002',
        isRead: true,
      ),
      AppNotification(
        id: '7',
        title: 'Payment Reminder',
        message: 'Invoice #INV-2024-002 payment is due tomorrow',
        type: NotificationType.paymentReminder,
        priority: NotificationPriority.medium,
        createdAt: now.subtract(const Duration(hours: 12)),
        relatedEntityId: 'INV-2024-002',
        relatedEntityType: 'invoice',
        actionRoute: '/invoices/INV-2024-002',
        isRead: false,
      ),
    ];

    _notifications.clear();
    _notifications.addAll(mockNotifications);
    _sortNotifications();
  }

  /// Check for new notifications (mock implementation)
  Future<void> _checkForNewNotifications() async {
    final random = Random();

    // Randomly generate new notifications (10% chance every check)
    if (random.nextDouble() < 0.1) {
      await _addRandomNotification();
    }
  }

  /// Add a random notification for testing
  Future<void> _addRandomNotification() async {
    final random = Random();
    final now = DateTime.now();

    final types = NotificationType.values;
    final priorities = NotificationPriority.values;

    final mockTitles = [
      'New Application Received',
      'Payment Reminder',
      'Task Completed',
      'Deadline Approaching',
      'Document Uploaded',
      'Status Updated',
      'Message Received',
    ];

    final mockMessages = [
      'A new application has been submitted for review',
      'Payment is due for invoice #INV-${random.nextInt(9999)}',
      'Translation task has been completed',
      'Deadline is approaching for project',
      'New document has been uploaded',
      'Status has been updated for application',
      'You have received a new message',
    ];

    final notification = AppNotification(
      id: 'mock-${DateTime.now().millisecondsSinceEpoch}',
      title: mockTitles[random.nextInt(mockTitles.length)],
      message: mockMessages[random.nextInt(mockMessages.length)],
      type: types[random.nextInt(types.length)],
      priority: priorities[random.nextInt(priorities.length)],
      createdAt: now,
      relatedEntityId: 'entity-${random.nextInt(999)}',
      relatedEntityType: 'application',
    );

    await addNotification(notification);
  }

  /// Get notifications with optional filtering
  Future<List<AppNotification>> getNotifications({
    int limit = 50,
    bool unreadOnly = false,
    List<NotificationType>? types,
    NotificationPriority? minPriority,
  }) async {
    var filtered = _notifications.where((notification) {
      // Filter by read status
      if (unreadOnly && notification.isRead) {
        return false;
      }

      // Filter by types
      if (types != null && !types.contains(notification.type)) {
        return false;
      }

      // Filter by minimum priority
      if (minPriority != null &&
          notification.priority.sortOrder < minPriority.sortOrder) {
        return false;
      }

      return true;
    }).toList();

    // Apply limit
    if (limit > 0 && filtered.length > limit) {
      filtered = filtered.take(limit).toList();
    }

    return filtered;
  }

  /// Add a new notification
  Future<void> addNotification(AppNotification notification) async {
    _notifications.insert(0, notification);
    _sortNotifications();
    _notifyListeners();
  }

  /// Mark a notification as read
  Future<void> markAsRead(String notificationId) async {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      _notifyListeners();
    }
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    for (int i = 0; i < _notifications.length; i++) {
      if (!_notifications[i].isRead) {
        _notifications[i] = _notifications[i].copyWith(isRead: true);
      }
    }
    _notifyListeners();
  }

  /// Mark multiple notifications as read
  Future<void> markMultipleAsRead(List<String> notificationIds) async {
    bool hasChanges = false;
    for (int i = 0; i < _notifications.length; i++) {
      if (notificationIds.contains(_notifications[i].id) &&
          !_notifications[i].isRead) {
        _notifications[i] = _notifications[i].copyWith(isRead: true);
        hasChanges = true;
      }
    }
    if (hasChanges) {
      _notifyListeners();
    }
  }

  /// Delete a notification
  Future<void> deleteNotification(String notificationId) async {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications.removeAt(index);
      _notifyListeners();
    }
  }

  /// Delete multiple notifications
  Future<void> deleteMultipleNotifications(List<String> notificationIds) async {
    _notifications.removeWhere((n) => notificationIds.contains(n.id));
    _notifyListeners();
  }

  /// Clear all notifications
  Future<void> clearAllNotifications() async {
    _notifications.clear();
    _notifyListeners();
  }

  /// Clear read notifications
  Future<void> clearReadNotifications() async {
    _notifications.removeWhere((n) => n.isRead);
    _notifyListeners();
  }

  /// Get notifications by type
  Future<List<AppNotification>> getNotificationsByType(
      NotificationType type) async {
    return _notifications.where((n) => n.type == type).toList();
  }

  /// Get notifications by related entity
  Future<List<AppNotification>> getNotificationsByEntity(
      String entityType, String entityId) async {
    return _notifications
        .where((n) =>
            n.relatedEntityType == entityType && n.relatedEntityId == entityId)
        .toList();
  }

  /// Sort notifications by priority and creation date
  void _sortNotifications() {
    _notifications.sort((a, b) {
      // First sort by priority (higher priority first)
      final priorityComparison =
          b.priority.sortOrder.compareTo(a.priority.sortOrder);
      if (priorityComparison != 0) {
        return priorityComparison;
      }

      // Then sort by creation date (newer first)
      return b.createdAt.compareTo(a.createdAt);
    });
  }

  /// Notify listeners and update stream
  void _notifyListeners() {
    notifyListeners();
    _notificationStreamController.add(List.unmodifiable(_notifications));
  }

  /// Dispose of resources
  @override
  void dispose() {
    _updateTimer?.cancel();
    _notificationStreamController.close();
    super.dispose();
  }

  /// Check if service is initialized
  bool get isInitialized => _isInitialized;

  /// Refresh notifications (force update)
  Future<void> refresh() async {
    await _checkForNewNotifications();
  }

  /// Subscribe to real-time notifications (placeholder for actual implementation)
  void subscribeToNotifications() {
    // In a real implementation, this would set up WebSocket or Server-Sent Events
    // connection to receive real-time notifications from the server
    debugPrint('NotificationService: Subscribed to real-time notifications');
  }

  /// Unsubscribe from real-time notifications
  void unsubscribeFromNotifications() {
    // In a real implementation, this would close the WebSocket or SSE connection
    debugPrint(
        'NotificationService: Unsubscribed from real-time notifications');
  }
}

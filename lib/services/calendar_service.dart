import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:admin/models/calendar_event.dart';

/// Service for managing calendar events
class CalendarService with ChangeNotifier {
  static CalendarService? _instance;

  /// Singleton instance
  static CalendarService get instance {
    _instance ??= CalendarService._internal();
    return _instance!;
  }

  CalendarService._internal() {
    _initializeService();
  }

  // Private fields
  final List<CalendarEvent> _events = [];
  final Random _random = Random();
  bool _isLoading = false;

  // Public getters
  List<CalendarEvent> get events => List.unmodifiable(_events);
  bool get isLoading => _isLoading;

  /// Initialize the service with sample data
  void _initializeService() {
    _generateSampleEvents();
  }

  /// Get events for a specific date
  List<CalendarEvent> getEventsForDate(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return _events.where((event) {
      final eventDate = DateTime(
          event.startTime.year, event.startTime.month, event.startTime.day);
      return eventDate.isAtSameMomentAs(dateOnly);
    }).toList();
  }

  /// Get today's events
  List<CalendarEvent> getTodaysEvents() {
    return getEventsForDate(DateTime.now());
  }

  /// Get upcoming events (next 7 days)
  List<CalendarEvent> getUpcomingEvents() {
    final now = DateTime.now();
    final sevenDaysFromNow = now.add(const Duration(days: 7));

    return _events.where((event) {
      return event.startTime.isAfter(now) &&
          event.startTime.isBefore(sevenDaysFromNow);
    }).toList()
      ..sort((a, b) => a.startTime.compareTo(b.startTime));
  }

  /// Get events for a specific month
  List<CalendarEvent> getEventsForMonth(int year, int month) {
    return _events.where((event) {
      return event.startTime.year == year && event.startTime.month == month;
    }).toList();
  }

  /// Add a new event
  Future<bool> addEvent(CalendarEvent event) async {
    _setLoading(true);

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Check for conflicts
      if (_hasConflict(event)) {
        _setLoading(false);
        return false;
      }

      _events.add(event);
      _events.sort((a, b) => a.startTime.compareTo(b.startTime));

      _setLoading(false);
      notifyListeners();
      return true;
    } catch (e) {
      _setLoading(false);
      debugPrint('Error adding event: $e');
      return false;
    }
  }

  /// Update an existing event
  Future<bool> updateEvent(CalendarEvent updatedEvent) async {
    _setLoading(true);

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 500));

      final index = _events.indexWhere((event) => event.id == updatedEvent.id);
      if (index == -1) {
        _setLoading(false);
        return false;
      }

      // Check for conflicts (excluding the current event)
      final tempEvents = List<CalendarEvent>.from(_events);
      tempEvents.removeAt(index);
      if (_hasConflictInList(updatedEvent, tempEvents)) {
        _setLoading(false);
        return false;
      }

      _events[index] = updatedEvent;
      _events.sort((a, b) => a.startTime.compareTo(b.startTime));

      _setLoading(false);
      notifyListeners();
      return true;
    } catch (e) {
      _setLoading(false);
      debugPrint('Error updating event: $e');
      return false;
    }
  }

  /// Delete an event
  Future<bool> deleteEvent(String eventId) async {
    _setLoading(true);

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 300));

      final initialLength = _events.length;
      _events.removeWhere((event) => event.id == eventId);
      final removed = _events.length < initialLength;

      _setLoading(false);
      if (removed) {
        notifyListeners();
      }
      return removed;
    } catch (e) {
      _setLoading(false);
      debugPrint('Error deleting event: $e');
      return false;
    }
  }

  /// Mark event as completed
  Future<bool> markEventCompleted(String eventId) async {
    _setLoading(true);

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 300));

      final index = _events.indexWhere((event) => event.id == eventId);
      if (index == -1) {
        _setLoading(false);
        return false;
      }

      _events[index] = _events[index].copyWith(status: EventStatus.completed);

      _setLoading(false);
      notifyListeners();
      return true;
    } catch (e) {
      _setLoading(false);
      debugPrint('Error marking event as completed: $e');
      return false;
    }
  }

  /// Check if an event has conflicts with existing events
  bool _hasConflict(CalendarEvent newEvent) {
    return _hasConflictInList(newEvent, _events);
  }

  /// Check if an event has conflicts with a specific list of events
  bool _hasConflictInList(
      CalendarEvent newEvent, List<CalendarEvent> eventList) {
    return eventList.any((existingEvent) {
      // Skip if same event
      if (existingEvent.id == newEvent.id) return false;

      // Check for time overlap
      return newEvent.startTime.isBefore(existingEvent.endTime) &&
          newEvent.endTime.isAfter(existingEvent.startTime);
    });
  }

  /// Set loading state
  void _setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  /// Generate sample events for testing
  void _generateSampleEvents() {
    final now = DateTime.now();
    final currentUser =
        'system'; // In a real app, this would come from AuthService

    // Today's events
    _events.addAll([
      CalendarEvent(
        id: 'event_1',
        title: 'Client Call with John Doe',
        description: 'Discuss project requirements and timeline',
        startTime: DateTime(now.year, now.month, now.day, 10, 0),
        endTime: DateTime(now.year, now.month, now.day, 11, 0),
        type: EventType.call,
        status: EventStatus.scheduled,
        location: 'Conference Room A',
        attendeeIds: ['john.doe@example.com'],
        createdBy: currentUser,
        createdAt: now.subtract(const Duration(days: 1)),
      ),
      CalendarEvent(
        id: 'event_2',
        title: 'Team Standup',
        description: 'Daily team sync meeting',
        startTime: DateTime(now.year, now.month, now.day, 9, 0),
        endTime: DateTime(now.year, now.month, now.day, 9, 30),
        type: EventType.meeting,
        status: EventStatus.completed,
        location: 'Office',
        attendeeIds: ['team@example.com'],
        createdBy: currentUser,
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      CalendarEvent(
        id: 'event_3',
        title: 'Document Review Deadline',
        description: 'Review legal documents for Case #123',
        startTime: DateTime(now.year, now.month, now.day, 17, 0),
        endTime: DateTime(now.year, now.month, now.day, 17, 30),
        type: EventType.deadline,
        status: EventStatus.scheduled,
        priority: EventPriority.high,
        createdBy: currentUser,
        createdAt: now.subtract(const Duration(hours: 2)),
      ),
    ]);

    // Tomorrow's events
    final tomorrow = now.add(const Duration(days: 1));
    _events.addAll([
      CalendarEvent(
        id: 'event_4',
        title: 'Project Planning Meeting',
        description: 'Plan next quarter deliverables',
        startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 14, 0),
        endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 15, 30),
        type: EventType.meeting,
        status: EventStatus.scheduled,
        location: 'Conference Room B',
        attendeeIds: ['manager@example.com', 'team@example.com'],
        priority: EventPriority.medium,
        createdBy: currentUser,
        createdAt: now.subtract(const Duration(hours: 5)),
      ),
      CalendarEvent(
        id: 'event_5',
        title: 'Client Presentation',
        description: 'Present project proposal to client',
        startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 16, 0),
        endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 17, 0),
        type: EventType.appointment,
        status: EventStatus.scheduled,
        location: 'Client Office',
        attendeeIds: ['client@example.com'],
        priority: EventPriority.high,
        createdBy: currentUser,
        createdAt: now.subtract(const Duration(hours: 8)),
      ),
    ]);

    // This week's events
    for (int i = 2; i <= 6; i++) {
      final eventDay = now.add(Duration(days: i));
      _events.add(
        CalendarEvent(
          id: 'event_${i + 3}',
          title: _getRandomEventTitle(),
          description: _getRandomEventDescription(),
          startTime: DateTime(
            eventDay.year,
            eventDay.month,
            eventDay.day,
            _random.nextInt(8) + 9, // 9 AM to 4 PM
            _random.nextInt(2) * 30, // 0 or 30 minutes
          ),
          endTime: DateTime(
            eventDay.year,
            eventDay.month,
            eventDay.day,
            _random.nextInt(8) + 10, // 10 AM to 5 PM
            _random.nextInt(2) * 30, // 0 or 30 minutes
          ),
          type: EventType.values[_random.nextInt(EventType.values.length)],
          status:
              EventStatus.values[_random.nextInt(EventStatus.values.length)],
          priority: EventPriority
              .values[_random.nextInt(EventPriority.values.length)],
          createdBy: currentUser,
          createdAt: now.subtract(Duration(days: _random.nextInt(7))),
        ),
      );
    }

    // Sort events by start time
    _events.sort((a, b) => a.startTime.compareTo(b.startTime));
  }

  String _getRandomEventTitle() {
    final titles = [
      'Team Meeting',
      'Client Call',
      'Project Review',
      'Training Session',
      'Documentation Review',
      'Budget Planning',
      'Strategy Discussion',
      'Code Review',
      'User Research',
      'Product Demo',
    ];
    return titles[_random.nextInt(titles.length)];
  }

  String _getRandomEventDescription() {
    final descriptions = [
      'Important discussion about project progress',
      'Review quarterly objectives and milestones',
      'Weekly team synchronization meeting',
      'Client feedback and requirements gathering',
      'Internal process improvement session',
      'Technical architecture planning',
      'User experience evaluation',
      'Performance metrics review',
    ];
    return descriptions[_random.nextInt(descriptions.length)];
  }

  /// Clear all events (for testing)
  void clearAllEvents() {
    _events.clear();
    notifyListeners();
  }

  /// Refresh events (simulate data reload)
  Future<void> refreshEvents() async {
    _setLoading(true);

    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // In a real app, this would fetch from an API
      // For now, we'll just regenerate sample data
      _events.clear();
      _generateSampleEvents();

      _setLoading(false);
      notifyListeners();
    } catch (e) {
      _setLoading(false);
      debugPrint('Error refreshing events: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/constants.dart';
import 'package:admin/models/calendar_event.dart';
import 'package:admin/services/calendar_service.dart';
import 'package:admin/l10n/app_localizations.dart';

class CalendarPanel extends StatefulWidget {
  const CalendarPanel({super.key});

  @override
  State<CalendarPanel> createState() => _CalendarPanelState();
}

class _CalendarPanelState extends State<CalendarPanel> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime.now();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarService>(
      builder: (context, calendarService, child) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Hide content when width is too narrow to prevent overflow during animation
              if (constraints.maxWidth < 250) {
                return const SizedBox.shrink();
              }
              
              return Column(
                children: [
                  _buildHeader(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildMiniCalendar(context),
                          const Divider(height: 1),
                          _buildTodaysEvents(context),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: primaryColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            localizations.calendarTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add, size: 20),
            onPressed: () => _showAddEventDialog(context),
            tooltip: localizations.calendarAddEventTooltip,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniCalendar(BuildContext context) {
    return Consumer<CalendarService>(
      builder: (context, calendarService, child) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _buildCalendarHeader(),
              const SizedBox(height: 8),
              _buildCalendarGrid(calendarService),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCalendarHeader() {
    final monthNames = [
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, size: 20),
          onPressed: () => _changeMonth(-1),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        Text(
          '${monthNames[_currentMonth.month - 1]} ${_currentMonth.year}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, size: 20),
          onPressed: () => _changeMonth(1),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid(CalendarService calendarService) {
    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month, 1);
    final firstWeekday =
        firstDayOfMonth.weekday % 7; // 0 = Sunday, 6 = Saturday

    return Column(
      children: [
        // Weekday headers
        Row(
          children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
              .map((day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 4),
        // Calendar days
        ...List.generate(6, (weekIndex) {
          return Row(
            children: List.generate(7, (dayIndex) {
              final dayNumber = weekIndex * 7 + dayIndex - firstWeekday + 1;
              if (dayNumber <= 0 || dayNumber > daysInMonth) {
                return const Expanded(child: SizedBox(height: 28));
              }

              final date =
                  DateTime(_currentMonth.year, _currentMonth.month, dayNumber);
              final isSelected = _isSameDay(date, _selectedDate);
              final isToday = _isSameDay(date, DateTime.now());
              final hasEvents =
                  _getEventsForDate(date, calendarService).isNotEmpty;

              return Expanded(
                child: InkWell(
                  onTap: () => _selectDate(date),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: 28,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? primaryColor
                          : isToday
                              ? primaryColor.withOpacity(0.1)
                              : null,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          dayNumber.toString(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                                isToday ? FontWeight.w600 : FontWeight.normal,
                            color: isSelected
                                ? Colors.white
                                : isToday
                                    ? primaryColor
                                    : Colors.black87,
                          ),
                        ),
                        if (hasEvents && !isSelected)
                          Positioned(
                            bottom: 2,
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }).where((row) {
          // Only show rows that contain valid days
          return true;
        }).take(6),
      ],
    );
  }

  Widget _buildTodaysEvents(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Consumer<CalendarService>(
      builder: (context, calendarService, child) {
        final todaysEvents = _getEventsForDate(_selectedDate, calendarService);

        return Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _isSameDay(_selectedDate, DateTime.now())
                        ? localizations.calendarTodaysEvents
                        : "Events for ${_selectedDate.day}/${_selectedDate.month}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (todaysEvents.isNotEmpty)
                    Text(
                      '${todaysEvents.length}',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              if (todaysEvents.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.event_note,
                          size: 32,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          localizations.calendarNoEventsToday,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                ...todaysEvents.map((event) => _buildEventItem(context, event)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEventItem(BuildContext context, CalendarEvent event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _getEventColor(event.type).withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: _getEventColor(event.type).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: _getEventColor(event.type),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      _getEventIcon(event.type),
                      size: 10,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      event.timeRange,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    if (event.priority == EventPriority.high ||
                        event.priority == EventPriority.critical) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: event.priority == EventPriority.critical
                              ? Colors.red
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          event.priority == EventPriority.critical
                              ? 'CRITICAL'
                              : 'HIGH',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changeMonth(int delta) {
    setState(() {
      _currentMonth =
          DateTime(_currentMonth.year, _currentMonth.month + delta, 1);
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<CalendarEvent> _getEventsForDate(
      DateTime date, CalendarService calendarService) {
    return calendarService.getEventsForDate(date);
  }

  Color _getEventColor(EventType type) {
    switch (type) {
      case EventType.call:
        return Colors.blue;
      case EventType.meeting:
        return Colors.green;
      case EventType.deadline:
        return Colors.red;
      case EventType.reminder:
        return Colors.orange;
      case EventType.appointment:
        return Colors.purple;
      case EventType.followUp:
        return Colors.cyan;
      case EventType.training:
        return Colors.indigo;
      case EventType.review:
        return Colors.brown;
    }
  }

  IconData _getEventIcon(EventType type) {
    switch (type) {
      case EventType.call:
        return Icons.phone;
      case EventType.meeting:
        return Icons.people;
      case EventType.deadline:
        return Icons.schedule;
      case EventType.reminder:
        return Icons.notification_important;
      case EventType.appointment:
        return Icons.event;
      case EventType.followUp:
        return Icons.follow_the_signs;
      case EventType.training:
        return Icons.school;
      case EventType.review:
        return Icons.rate_review;
    }
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Event'),
        content: const Text('Event creation form will be implemented here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

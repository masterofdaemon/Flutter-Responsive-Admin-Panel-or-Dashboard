# Technical Tasks: Right Sidebar & Quick Actions Implementation

## Overview
Implementation of right sidebar with Calendar and Notifications, Quick Action buttons, and ergonomic improvements for the Flutter Admin Panel.

## 🎯 Task 1: Right Sidebar Infrastructure

### 1.1 Create Collapsible Right Sidebar Component
**File**: `/lib/widgets/right_sidebar/right_sidebar.dart`

**Requirements**:
- Collapsible/expandable sidebar on the right side
- Toggle button at the top of the panel
- Responsive design (hide on mobile, show on desktop/tablet)
- Smooth animation transitions
- Width: 320px when expanded, 0px when collapsed
- State management for collapsed/expanded state

**Implementation Details**:
```dart
class RightSidebar extends StatefulWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;
  final Widget child;
  
  const RightSidebar({
    required this.isCollapsed,
    required this.onToggle,
    required this.child,
  });
}
```

**Dependencies**:
- Animation controller for smooth transitions
- Provider/State management for sidebar state
- Responsive utilities

---

## 🎯 Task 2: Notifications Block Implementation

### 2.1 Create Notifications Service
**File**: `/lib/services/notification_service.dart`

**Requirements**:
- Fetch unread/recent notifications
- Mark notifications as read
- Real-time notification updates
- Notification types: info, warning, error, success
- Pagination support for notification history

**Methods**:
```dart
class NotificationService {
  Future<List<AppNotification>> getUnreadNotifications();
  Future<List<AppNotification>> getRecentNotifications(int limit);
  Future<void> markAsRead(int notificationId);
  Future<void> markAllAsRead();
  Stream<List<AppNotification>> getNotificationStream();
}
```

### 2.2 Create Notification Models
**File**: `/lib/models/notification.dart`

**Notification Data Structure**:
```dart
class AppNotification {
  final int id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime createdAt;
  final bool isRead;
  final String? actionUrl;
  final Map<String, dynamic>? metadata;
}

enum NotificationType { info, warning, error, success }
```

### 2.3 Create Notifications Widget
**File**: `/lib/widgets/right_sidebar/notifications_block.dart`

**Features**:
- List of unread notifications with badges
- Click to mark as read
- Action buttons for notification actions
- "Mark all as read" functionality
- Empty state when no notifications
- Loading states

---

## 🎯 Task 3: Calendar Implementation

### 3.1 Create Calendar Service
**File**: `/lib/services/calendar_service.dart`

**Requirements**:
- Fetch planned actions/events
- Create new calendar events
- Update existing events
- Delete events
- Filter by date range, client, request type

**Methods**:
```dart
class CalendarService {
  Future<List<CalendarEvent>> getEvents(DateTime start, DateTime end);
  Future<CalendarEvent> createEvent(CalendarEvent event);
  Future<void> updateEvent(CalendarEvent event);
  Future<void> deleteEvent(int eventId);
  Future<List<CalendarEvent>> getUpcomingEvents(int days);
}
```

### 3.2 Create Calendar Models
**File**: `/lib/models/calendar_event.dart`

**Event Data Structure**:
```dart
class CalendarEvent {
  final int id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final EventType type;
  final int? requestId;
  final int? clientId;
  final String? clientName;
  final EventPriority priority;
  final bool hasReminder;
}

enum EventType { call, meeting, deadline, reminder }
enum EventPriority { low, medium, high, urgent }
```

### 3.3 Create Calendar Widget
**File**: `/lib/widgets/right_sidebar/calendar_widget.dart`

**Features**:
- Monthly calendar view with event indicators
- Daily agenda view showing events for selected date
- Quick add event functionality
- Click on date to see events
- Color coding by event type and priority
- Upcoming events list (next 7 days)
- Integration with `table_calendar` package

---

## 🎯 Task 4: Quick Action Buttons System

### 4.1 Create Role-Based Action Bar Component
**File**: `/lib/widgets/action_bars/quick_action_bar.dart`

**Requirements**:
- Role-based button visibility (Administrator, Manager, Accountant)
- Horizontal layout above main content
- Responsive design (wrap to multiple rows on smaller screens)
- Icon + text buttons with consistent styling

**Role-Specific Actions**:
```dart
// Administrator & Manager
- "Create New Application" → ApplicationFormScreen
- "Add New Partner" → PartnerFormScreen  
- "Add New User" → UserFormScreen
- Bulk Actions (Select All, Delete Selected, Export)

// Manager Only
- "Create New Application"

// Accountant Only  
- Search field (by application number or full name)
- "Mark Payment" button (context-sensitive)
```

### 4.2 Create Bulk Actions Component
**File**: `/lib/widgets/action_bars/bulk_actions_bar.dart`

**Features**:
- Selection state management
- Batch operations (delete, export, status update)
- Progress indicators for bulk operations
- Confirmation dialogs for destructive actions

### 4.3 Create Search Components
**File**: `/lib/widgets/search/global_search_bar.dart`

**Accountant Search Features**:
- Search by application number
- Search by client full name
- Auto-complete suggestions
- Recent searches
- Advanced filters dropdown

---

## 🎯 Task 5: Layout Integration

### 5.1 Update Main Screen Layout
**File**: `/lib/screens/main/main_screen.dart`

**Changes Required**:
```dart
Row(
  children: [
    // Existing left sidebar
    if (Responsive.isDesktop(context)) const NewSideMenu(),
    
    // Main content area
    Expanded(
      child: Column(
        children: [
          _buildTopAppBar(context),
          // NEW: Quick Action Bar
          _buildQuickActionBar(context),
          // Existing content
          Expanded(child: _buildMainContent(context)),
        ],
      ),
    ),
    
    // NEW: Right sidebar
    if (Responsive.isDesktop(context)) 
      const RightSidebar(),
  ],
)
```

### 5.2 Update State Management
**File**: `/lib/controllers/layout_controller.dart`

**New State**:
- Right sidebar collapsed/expanded state
- Selected items for bulk actions
- Search state and filters
- Notification count and unread status

---

## 🎯 Task 6: Ergonomic Improvements

### 6.1 Create Notification Indicators
**File**: `/lib/widgets/indicators/notification_indicator.dart`

**Features**:
- Red badge for overdue items
- Blue badge for new applications
- Animated pulse for urgent notifications
- Tooltip showing details on hover

### 6.2 Implement Fast Loading Optimizations
**Files**: Various service files

**Optimizations**:
- Implement pagination for all list screens
- Add loading skeletons instead of spinners
- Cache frequently accessed data
- Lazy loading for images and heavy widgets
- Debounced search (300ms delay)

### 6.3 Create Accessible Filters Component
**File**: `/lib/widgets/filters/advanced_filter_bar.dart`

**Features**:
- Collapsible filter panel
- Quick filter chips for common filters
- Save/load filter presets
- Clear all filters button
- Filter count indicators

---

## 🎯 Task 7: Responsive Design Updates

### 7.1 Mobile Layout Adaptations
**Requirements**:
- Right sidebar becomes bottom sheet on mobile
- Quick actions become floating action menu
- Calendar shows as modal on mobile
- Notifications accessible via app bar icon

### 7.2 Tablet Layout Optimizations
**Requirements**:
- Smaller right sidebar width (280px)
- Condensed quick action bar
- Touch-friendly button sizes

---

## 🎯 Task 8: Localization & Theming

### 8.1 Add Localization Strings
**Files**: 
- `/lib/l10n/app_en.arb`
- `/lib/l10n/app_ru.arb`

**New Strings**:
```json
{
  "rightSidebarToggle": "Toggle Right Panel",
  "notificationsTitle": "Notifications",
  "calendarTitle": "Calendar",
  "quickActionsTitle": "Quick Actions",
  "createNewApplication": "Create New Application",
  "addNewPartner": "Add New Partner",
  "addNewUser": "Add New User",
  "markPayment": "Mark Payment",
  "bulkActions": "Bulk Actions",
  "searchPlaceholder": "Search applications...",
  "noNotifications": "No new notifications",
  "markAllAsRead": "Mark All as Read",
  "upcomingEvents": "Upcoming Events",
  "noEvents": "No events scheduled"
}
```

### 8.2 Create Consistent Theming
**File**: `/lib/themes/sidebar_theme.dart`

**Theme Components**:
- Right sidebar background colors
- Button styles for quick actions
- Calendar event colors by type
- Notification badge styling

---

## 🎯 Task 9: Testing & Performance

### 9.1 Unit Tests
**Files**: `/test/widgets/right_sidebar/`
- Right sidebar widget tests
- Notification service tests
- Calendar service tests
- Quick action functionality tests

### 9.2 Integration Tests
**Files**: `/integration_test/`
- End-to-end sidebar interaction
- Calendar event creation flow
- Bulk actions workflow
- Search functionality

### 9.3 Performance Monitoring
- Measure sidebar animation performance
- Monitor notification update frequency
- Optimize calendar rendering for large datasets

---

## 📋 Implementation Priority

1. **Phase 1** (Week 1): Right sidebar infrastructure + notifications
2. **Phase 2** (Week 2): Calendar implementation
3. **Phase 3** (Week 3): Quick action buttons + bulk actions
4. **Phase 4** (Week 4): Ergonomic improvements + responsive design
5. **Phase 5** (Week 5): Testing + performance optimization

## 🔧 Dependencies to Add

```yaml
dependencies:
  table_calendar: ^3.0.9
  badges: ^3.1.2
  flutter_animate: ^4.5.0
  shimmer: ^3.0.0
```

## 📱 Responsive Breakpoints

- **Mobile**: < 768px (Right sidebar → Bottom sheet)
- **Tablet**: 768px - 1024px (Compact sidebar)
- **Desktop**: > 1024px (Full sidebar)

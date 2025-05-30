# New Sidebar Implementation Plan

## Overview
This document outlines the complete implementation plan for the new sidebar with business directions, role-based access, and collapsible functionality as specified in the requirements.

## ✅ Completed Components

### 1. Data Models
- **`BusinessDirection`**: Model for business directions with counters and priority
- **`DirectionPriority`**: Enum for counter badge colors (none/gray, attention/yellow, critical/red)
- **`DirectionCounter`**: Model for request counters per direction

### 2. Services
- **`DirectionService`**: Manages business directions and request counters
  - Handles direction selection
  - Refreshes counters based on user role
  - Manages direction state

### 3. Enhanced Controllers
- **`MenuAppController`**: Extended with new functionality
  - Sidebar collapse/expand state
  - Direction filtering
  - Applications/Clients mode toggle

### 4. UI Components
- **`DirectionTile`**: Individual direction with counter badge and color coding
- **`TopActionButtons`**: Applications/Clients toggle buttons (full and collapsed modes)
- **`NewSideMenu`**: Complete new sidebar implementation

## 🔄 Implementation Status

### Phase 1: Core Structure ✅
- [x] Business direction models
- [x] Direction service with counter logic
- [x] Enhanced menu controller
- [x] Basic UI components

### Phase 2: In Progress 🚧
- [ ] Localization keys for new components
- [ ] API integration for request counters
- [ ] Role-based counter logic implementation
- [ ] Navigation integration

### Phase 3: Pending ⏳
- [ ] Main screen integration
- [ ] Filtering logic in content area
- [ ] Performance optimizations
- [ ] Testing and refinement

## 📋 Required Localization Keys

The following keys need to be added to `app_localizations.dart` and translated:

```dart
// Top action buttons
String get topActionApplications;
String get topActionClients;

// Directions section
String get sideMenuDirections;

// Direction names
String get directionTranslationAgency;
String get directionLegalServices;
String get directionInsuranceServices;
String get directionLending;
String get directionOpeningAccounts;
String get directionAdvancedTraining;
String get directionCopyrightProtection;
String get directionPropertyValuation;

// General sections
String get sideMenuAllApplications;
String get sideMenuPartners;
String get sideMenuActs;
String get sideMenuReports;
String get sideMenuAuditLog;
String get sideMenuKnowledge;

// UI elements
String get appTitle;
String get collapseTooltip;
String get expandTooltip;
```

## 🏗️ Architecture Decisions

### State Management
- Using Provider pattern for consistency with existing codebase
- `DirectionService` as separate service for business logic
- `MenuAppController` extended for UI state management

### Component Structure
- Modular design with separate components for each section
- Reusable `DirectionTile` with configurable behavior
- Responsive design supporting both collapsed and expanded states

### Performance Considerations
- Lazy loading of direction counters
- Efficient state updates with `notifyListeners()`
- Optimized rendering with conditional widgets

## 🎯 Next Steps

### Immediate (Next Session)
1. **Add missing localization keys**
   - Update `app_localizations.dart`
   - Add English translations
   - Add Russian translations

2. **Integrate new sidebar**
   - Replace old sidebar with new implementation
   - Add providers to main app
   - Test basic functionality

### Short Term
3. **Implement API integration**
   - Create request counter endpoints
   - Implement role-based counter logic
   - Add real-time updates

4. **Add filtering logic**
   - Implement direction-based filtering
   - Update main content area
   - Add filter state management

### Medium Term
5. **Polish and optimization**
   - Performance testing
   - UI/UX improvements
   - Accessibility features
   - Responsive behavior testing

## 📊 Role-Based Access Matrix

| Feature | Administrator | Manager | Specialist | Accountant | Translator |
|---------|--------------|---------|------------|------------|------------|
| Applications Button | ✅ | ✅ | ✅ | ✅ | ✅ |
| Clients Button | ✅ | ✅ | ✅ | ❌ | ❌ |
| All Directions | ✅ | ✅ | ✅ | ❌ | ✅ (limited) |
| All Applications | ✅ | ✅ | ✅ | ❌ | ✅ |
| Partners | ✅ | ✅ | ✅ | ❌ | ❌ |
| Acts | ✅ | ✅ | ❌ | ✅ | ❌ |
| User Management | ✅ | ❌ | ❌ | ❌ | ❌ |
| System Settings | ✅ | ✅ | ❌ | ❌ | ❌ |

## 🔄 Counter Logic by Role

### Administrator
- "Request created"
- "Cancelled (no response)"
- "Cancelled (partner refusal)"
- "Price verification required"
- "Critical payment delay" (day 6)
- "Call/meeting scheduled" (>24h unmarked)

### Manager
- "Price verification required" (>24h unresolved)
- "Critical payment delay" (day 6)

### Specialist
- "Responsible person assigned" (>15min)
- "Call/meeting scheduled" (>4h unfinished)
- "Client considering/contracting"

### Accountant
- "Received from client (awaiting verification)"

## 🎨 Visual Design

### Color Coding
- **Gray**: No pending requests
- **Yellow**: Attention needed (general delays, pending actions)
- **Red**: Critical issues (urgent intervention required)

### Layout
- **Expanded**: 260px width with full labels and counters
- **Collapsed**: 80px width with icons and small badges
- **Responsive**: Smooth animations between states

## 📝 Technical Notes

### Dependencies
- No new dependencies required
- Uses existing Provider, SVG, and Material packages
- Compatible with current architecture

### File Structure
```
lib/
├── models/
│   └── business_direction.dart ✅
├── services/
│   └── direction_service.dart ✅
├── controllers/
│   └── menu_app_controller.dart ✅ (updated)
├── screens/main/components/
│   ├── direction_tile.dart ✅
│   ├── top_action_buttons.dart ✅
│   ├── new_side_menu.dart ✅
│   └── side_menu.dart (legacy - to be replaced)
```

## 🚀 Integration Steps

1. **Add DirectionService provider** to main app
2. **Replace old sidebar** with NewSideMenu
3. **Add localization keys** and translations
4. **Test role-based visibility**
5. **Implement counter API** integration
6. **Add filtering** to main content area
7. **Performance testing** and optimization

This implementation provides a solid foundation for the new sidebar requirements while maintaining compatibility with the existing codebase and following Flutter best practices.

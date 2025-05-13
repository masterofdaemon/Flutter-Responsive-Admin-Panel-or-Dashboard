---
applyTo: '**'
---
# Flutter Project Guidelines

## Code Organization
- Organize code into feature-based folders rather than technical folders
- Keep files small and focused on a single responsibility
- Use meaningful and consistent naming conventions

## Component Structure
- Create reusable widgets in a `components` or `widgets` folder
- Extract common UI elements into shared components
- Ensure components are stateless when possible for better performance

## Avoid Duplication
- DRY (Don't Repeat Yourself): Extract repeated logic into reusable functions
- Create utility classes for commonly used functions
- Use inheritance or composition for widgets with similar functionality

## State Management
- Choose an appropriate state management solution (Provider, Bloc, Riverpod, etc.)
- Keep business logic separate from UI code
- Avoid using setState() for complex state management

## Responsive Design
- Use MediaQuery or LayoutBuilder for responsive layouts
- Consider using packages like flutter_screenutil
- Test on multiple screen sizes during development

## Performance
- Minimize rebuilds with const constructors when possible
- Use ListView.builder for long lists
- Consider lazy loading for data-intensive screens

## Architecture
- Follow a clean architecture pattern (MVVM, Clean Architecture, etc.)
- Separate concerns: UI, business logic, and data access
- Use dependency injection for better testability

## Testing
- Write unit tests for business logic
- Create widget tests for UI components
- Implement integration tests for critical user flows

## Documentation
- Document complex functions and classes
- Add README files to explain project structure
- Comment code when necessary for clarity

## Assets
- Organize assets in separate folders (images, fonts, etc.)
- Use asset variants for different resolutions
- Consider using SVGs for scalable icons
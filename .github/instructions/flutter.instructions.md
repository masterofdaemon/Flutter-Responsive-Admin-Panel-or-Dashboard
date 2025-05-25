---
applyTo: '**'
---
# Flutter Project Guidelines for LLM

## Code Organization
- Organize code into feature-based folders. Avoid technical folders (e.g., `widgets`, `screens`, `controllers` at the root level).
- Ensure each file has a single, clear responsibility.
- Employ meaningful and consistent naming conventions for files, classes, variables, and methods.

## Component Structure
- Place reusable widgets in a `components` or `widgets` directory, typically within a feature folder.
- Extract common UI elements into shared, reusable components.
- Prioritize creating stateless widgets. Only use stateful widgets when local state is essential.

## Avoid Duplication
- Adhere to the DRY (Don't Repeat Yourself) principle. Extract repeated logic into reusable functions or methods.
- Create utility classes or top-level functions for common, non-widget-specific helper functions.
- Utilize inheritance or composition effectively for widgets sharing similar functionality, preferring composition.

## State Management
- Select and consistently apply a state management solution (e.g., Provider, Bloc, Riverpod).
- Strictly separate business logic from UI code.
- Avoid using `setState()` for managing complex application-wide or feature-wide state. Reserve `setState()` for local widget state.

## Responsive Design
- Implement responsive layouts using `MediaQuery` or `LayoutBuilder`.
- If appropriate for the project, consider using packages like `flutter_screenutil` for responsive sizing.
- Ensure UI is tested and functional across multiple screen sizes and orientations.

## Performance
- Minimize widget rebuilds. Use `const` constructors wherever possible.
- For long or infinite lists, always use `ListView.builder` or `SliverList` with a delegate.
- Implement lazy loading for data-intensive screens or components.

## Architecture
- Follow a recognized architectural pattern (e.g., MVVM, Clean Architecture, TDD).
- Clearly separate concerns: UI (presentation), business logic (domain), and data access (data).
- Employ dependency injection to decouple components and improve testability.

## Testing
- Write unit tests for all business logic (e.g., in BLoCs, Cubits, Providers, services).
- Create widget tests for UI components to verify rendering and interaction.
- Implement integration tests for critical user flows and feature interactions.

## Documentation
- Document complex functions, classes, and algorithms with clear, concise comments.
- Maintain a `README.md` file that explains the project structure, setup, and key architectural decisions.
- Add comments to code only when the code's purpose is not immediately obvious from its structure and naming.

## Assets
- Organize assets into logical subfolders within the `assets` directory (e.g., `assets/images`, `assets/fonts`, `assets/icons`).
- Provide asset variants for different device resolutions (e.g., 1.0x, 2.0x, 3.0x).
- Prefer using SVG (Scalable Vector Graphics) for icons and simple graphics where appropriate.
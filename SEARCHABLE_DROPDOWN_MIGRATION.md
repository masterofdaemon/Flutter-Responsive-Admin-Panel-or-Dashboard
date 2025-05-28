# Searchable Dropdown Migration Guide

This guide explains how to replace standard `DropdownButtonFormField` widgets with the new `SearchableDropdownFormField` for better user experience with long lists.

## Why Use SearchableDropdownFormField?

- **Better UX**: Users can search/filter long lists instead of scrolling
- **Performance**: Only renders visible items
- **Accessibility**: Proper keyboard navigation and focus management
- **Customizable**: Support for custom item builders
- **Localized**: Multi-language support
- **Form Integration**: Works seamlessly with Flutter Form validation

## Installation

1. The widget is already created in `lib/widgets/searchable_dropdown_form_field.dart`
2. Localization strings have been added to ARB files
3. Import the widget: `import 'package:admin/widgets/searchable_dropdown_form_field.dart';`

## Basic Migration

### Before (Standard Dropdown)
```dart
DropdownButtonFormField<crm.Client>(
  value: selectedClient,
  decoration: InputDecoration(
    labelText: 'Client',
    hintText: 'Select a client',
    prefixIcon: Icon(Icons.person_outline),
  ),
  items: clients.map((client) {
    return DropdownMenuItem<crm.Client>(
      value: client,
      child: Text('${client.firstName} ${client.lastName}'),
    );
  }).toList(),
  onChanged: (crm.Client? newValue) {
    setState(() {
      selectedClient = newValue;
    });
  },
  validator: (value) => value == null ? 'Client is required' : null,
)
```

### After (Searchable Dropdown)
```dart
SearchableDropdownFormField<crm.Client>(
  value: selectedClient,
  items: clients,
  itemAsString: (client) => '${client.firstName} ${client.lastName}',
  labelText: 'Client',
  hintText: 'Search and select a client',
  prefixIcon: Icon(Icons.person_outline),
  onChanged: (crm.Client? newValue) {
    setState(() {
      selectedClient = newValue;
    });
  },
  validator: (value) => value == null ? 'Client is required' : null,
)
```

## Advanced Usage with Custom Item Builder

```dart
SearchableDropdownFormField<crm.Client>(
  value: selectedClient,
  items: clients,
  itemAsString: (client) => '${client.firstName} ${client.lastName}',
  labelText: 'Client',
  hintText: 'Search clients...',
  prefixIcon: Icon(Icons.person_outline),
  // Custom display for each item in the dropdown
  itemBuilder: (client) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${client.firstName} ${client.lastName}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(
        'ID: ${client.clientId}',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    ],
  ),
  onChanged: (client) => setState(() => selectedClient = client),
  validator: (value) => value == null ? 'Client is required' : null,
  maxHeight: 250, // Custom max height for dropdown
)
```

## Simple Usage

For basic cases, use `SimpleSearchableDropdown`:

```dart
SimpleSearchableDropdown<crm.Employee>(
  value: selectedEmployee,
  items: employees,
  itemAsString: (employee) => employee.name,
  labelText: 'Employee',
  hintText: 'Search employees...',
  onChanged: (employee) => setState(() => selectedEmployee = employee),
)
```

## Migration Checklist

When migrating existing dropdowns:

- [ ] Replace `DropdownButtonFormField<T>` with `SearchableDropdownFormField<T>`
- [ ] Replace `items` parameter with:
  - `items: List<T>` (your data list)
  - `itemAsString: (item) => String` (how to display each item as text)
- [ ] Keep all other parameters the same (`value`, `onChanged`, `validator`, etc.)
- [ ] Optional: Add `itemBuilder` for custom item display
- [ ] Optional: Set `maxHeight` for dropdown list
- [ ] Test with long lists to ensure search functionality works

## Specific Field Migrations

### Client Dropdown
```dart
// Before
items: clients.map((client) => DropdownMenuItem(
  value: client,
  child: Text('${client.firstName} ${client.lastName}'),
)).toList(),

// After
items: clients,
itemAsString: (client) => '${client.firstName} ${client.lastName}',
```

### Employee Dropdown
```dart
// Before
items: employees.map((emp) => DropdownMenuItem(
  value: emp,
  child: Text(emp.name),
)).toList(),

// After
items: employees,
itemAsString: (emp) => emp.name,
```

### Office Dropdown
```dart
// Before
items: offices.map((office) => DropdownMenuItem(
  value: office,
  child: Text(office.name),
)).toList(),

// After
items: offices,
itemAsString: (office) => office.name,
```

## Performance Considerations

- The searchable dropdown uses lazy rendering, so it performs well with large lists
- Search is case-insensitive and matches partial strings
- Consider setting a reasonable `maxHeight` for very long lists
- For extremely large datasets (1000+ items), consider implementing server-side search

## Accessibility Features

- Proper focus management
- Keyboard navigation support
- Screen reader compatible
- Clear visual indicators for selected items

## Localization

The widget uses the following localization keys:
- `searchableDropdownHint`: Default hint text
- `searchableDropdownSearchHint`: Search field placeholder
- `searchableDropdownNoResults`: No results message

These are already added to the ARB files in both English and Russian.

## Example Implementation

See `lib/widgets/searchable_dropdown_example.dart` for a complete working example showing:
- Basic migration from DropdownButtonFormField
- Advanced usage with custom item builders
- Simple usage for basic cases
- Benefits explanation

## Troubleshooting

**Q: Search not working?**
A: Ensure your `itemAsString` function returns a meaningful string representation of your objects.

**Q: Items not displaying correctly?**
A: Check that your data list is properly populated and `itemAsString` function handles all edge cases.

**Q: Validation not working?**
A: The widget works with standard FormField validation. Ensure your validator function is properly implemented.

**Q: Dropdown not opening?**
A: Check that the widget is not disabled and that the overlay can be rendered (not in a constrained container).

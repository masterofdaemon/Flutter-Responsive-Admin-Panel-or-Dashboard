import 'package:flutter/material.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/widgets/searchable_dropdown_form_field.dart';

/// Example showing how to replace DropdownButtonFormField with SearchableDropdownFormField
/// for long lists of items that need filtering.
class SearchableDropdownExample extends StatefulWidget {
  const SearchableDropdownExample({super.key});

  @override
  State<SearchableDropdownExample> createState() =>
      _SearchableDropdownExampleState();
}

class _SearchableDropdownExampleState extends State<SearchableDropdownExample> {
  crm.Client? _selectedClient;
  crm.Employee? _selectedEmployee;
  final List<crm.Client> _clients = []; // Would be populated from service
  final List<crm.Employee> _employees = []; // Would be populated from service

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Searchable Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Example 1: Replace DropdownButtonFormField with SearchableDropdownFormField
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Before (Standard Dropdown)',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Old way - gets unwieldy with long lists
                    DropdownButtonFormField<crm.Client>(
                      value: _selectedClient,
                      decoration: InputDecoration(
                        labelText: 'Client (Standard)',
                        hintText: 'Select a client',
                        prefixIcon: Icon(Icons.person_outline,
                            color: colorScheme.primary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: _clients.map((client) {
                        return DropdownMenuItem<crm.Client>(
                          value: client,
                          child: Text(
                            '${client.firstName} ${client.lastName} (${client.clientId})',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (crm.Client? newValue) {
                        setState(() {
                          _selectedClient = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Client is required' : null,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Example 2: Using SearchableDropdownFormField
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'After (Searchable Dropdown)',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // New way - searchable and filterable
                    SearchableDropdownFormField<crm.Client>(
                      value: _selectedClient,
                      items: _clients,
                      itemAsString: (client) =>
                          '${client.firstName} ${client.lastName} (${client.clientId})',
                      labelText: 'Client (Searchable)',
                      hintText: 'Search and select a client',
                      prefixIcon: Icon(Icons.person_outline,
                          color: colorScheme.primary),
                      onChanged: (crm.Client? newValue) {
                        setState(() {
                          _selectedClient = newValue;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Client is required' : null,
                      // Custom item builder for more complex display
                      itemBuilder: (client) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${client.firstName} ${client.lastName}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ID: ${client.clientId}',
                            style: TextStyle(
                              fontSize: 12,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Example 3: Simple usage for basic cases
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Simple Usage',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SimpleSearchableDropdown<crm.Employee>(
                      value: _selectedEmployee,
                      items: _employees,
                      itemAsString: (employee) => employee.name,
                      labelText: 'Employee',
                      hintText: 'Search employees...',
                      onChanged: (crm.Employee? newValue) {
                        setState(() {
                          _selectedEmployee = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Benefits explanation
            Card(
              color: colorScheme.primaryContainer.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb_outline,
                            color: colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(
                          'Benefits of SearchableDropdownFormField',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '• Searchable: Users can type to filter long lists\n'
                      '• Better UX: No need to scroll through hundreds of items\n'
                      '• Customizable: Custom item builders for complex displays\n'
                      '• Form integration: Works with Form validation\n'
                      '• Localized: Supports multiple languages\n'
                      '• Accessible: Proper focus management and keyboard navigation\n'
                      '• Performance: Only renders visible items',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// How to migrate existing DropdownButtonFormField to SearchableDropdownFormField:
/// 
/// 1. Replace DropdownButtonFormField<T> with SearchableDropdownFormField<T>
/// 2. Replace 'items' parameter with:
///    - items: List<T> (your data list)
///    - itemAsString: (item) => String (how to display each item as text)
/// 3. Optional: Add itemBuilder for custom display
/// 4. Keep all other parameters the same (value, onChanged, validator, etc.)
/// 
/// Example migration:
/// 
/// // Before:
/// DropdownButtonFormField<Client>(
///   value: selectedClient,
///   items: clients.map((client) => DropdownMenuItem(
///     value: client,
///     child: Text(client.name),
///   )).toList(),
///   onChanged: (client) => setState(() => selectedClient = client),
/// )
/// 
/// // After:
/// SearchableDropdownFormField<Client>(
///   value: selectedClient,
///   items: clients,
///   itemAsString: (client) => client.name,
///   onChanged: (client) => setState(() => selectedClient = client),
/// )

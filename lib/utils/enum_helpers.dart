import 'package:admin/generated/crm.pb.dart';

// Helper function to get user-friendly client source name
String getClientSourceName(ClientSource source) {
  if (source == ClientSource.CLIENT_SOURCE_UNSPECIFIED) {
    return 'Unspecified';
  }
  // Remove prefix and replace underscores with spaces
  return source.name.replaceFirst('CLIENT_SOURCE_', '').replaceAll('_', ' ');
}

// Helper function to get user-friendly employee role name
String getEmployeeRoleName(EmployeeRole role) {
  if (role == EmployeeRole.EMPLOYEE_ROLE_UNSPECIFIED) {
    return 'Unspecified';
  }
  // Remove prefix and replace underscores with spaces
  return role.name.replaceFirst('EMPLOYEE_ROLE_', '').replaceAll('_', ' ');
}

// Helper function to get user-friendly interaction type name
String getInteractionTypeName(InteractionType type) {
  if (type == InteractionType.INTERACTION_TYPE_UNSPECIFIED) {
    return 'Unspecified';
  }
  // Remove prefix and replace underscores with spaces
  return type.name.replaceFirst('INTERACTION_TYPE_', '').replaceAll('_', ' ');
}

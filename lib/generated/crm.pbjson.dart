//
//  Generated code. Do not modify.
//  source: crm.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use employeeRoleDescriptor instead')
const EmployeeRole$json = {
  '1': 'EmployeeRole',
  '2': [
    {'1': 'EMPLOYEE_ROLE_UNSPECIFIED', '2': 0},
    {'1': 'MANAGER', '2': 1},
    {'1': 'CHIEF_MANAGER', '2': 2},
    {'1': 'DIRECTOR', '2': 3},
    {'1': 'TRANSLATOR', '2': 4},
    {'1': 'ACCOUNTANT', '2': 5},
  ],
};

/// Descriptor for `EmployeeRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List employeeRoleDescriptor = $convert.base64Decode(
    'CgxFbXBsb3llZVJvbGUSHQoZRU1QTE9ZRUVfUk9MRV9VTlNQRUNJRklFRBAAEgsKB01BTkFHRV'
    'IQARIRCg1DSElFRl9NQU5BR0VSEAISDAoIRElSRUNUT1IQAxIOCgpUUkFOU0xBVE9SEAQSDgoK'
    'QUNDT1VOVEFOVBAF');

@$core.Deprecated('Use statusDescriptor instead')
const Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'STATUS_UNSPECIFIED', '2': 0},
    {'1': 'DRAFT', '2': 1},
    {'1': 'ACTIVE', '2': 2},
    {'1': 'COMPLETED', '2': 3},
    {'1': 'CANCELLED', '2': 4},
    {'1': 'REJECTED', '2': 5},
    {'1': 'APPROVED', '2': 6},
    {'1': 'PENDING', '2': 7},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode(
    'CgZTdGF0dXMSFgoSU1RBVFVTX1VOU1BFQ0lGSUVEEAASCQoFRFJBRlQQARIKCgZBQ1RJVkUQAh'
    'INCglDT01QTEVURUQQAxINCglDQU5DRUxMRUQQBBIMCghSRUpFQ1RFRBAFEgwKCEFQUFJPVkVE'
    'EAYSCwoHUEVORElORxAH');

@$core.Deprecated('Use priorityDescriptor instead')
const Priority$json = {
  '1': 'Priority',
  '2': [
    {'1': 'PRIORITY_UNSPECIFIED', '2': 0},
    {'1': 'NORMAL', '2': 1},
    {'1': 'URGENT', '2': 2},
    {'1': 'SEMI_URGENT', '2': 3},
  ],
};

/// Descriptor for `Priority`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List priorityDescriptor = $convert.base64Decode(
    'CghQcmlvcml0eRIYChRQUklPUklUWV9VTlNQRUNJRklFRBAAEgoKBk5PUk1BTBABEgoKBlVSR0'
    'VOVBACEg8KC1NFTUlfVVJHRU5UEAM=');

@$core.Deprecated('Use registrationTypeDescriptor instead')
const RegistrationType$json = {
  '1': 'RegistrationType',
  '2': [
    {'1': 'REGISTRATION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'IP', '2': 1},
    {'1': 'OOO', '2': 2},
  ],
};

/// Descriptor for `RegistrationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List registrationTypeDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RyYXRpb25UeXBlEiEKHVJFR0lTVFJBVElPTl9UWVBFX1VOU1BFQ0lGSUVEEAASBg'
    'oCSVAQARIHCgNPT08QAg==');

@$core.Deprecated('Use paymentMethodDescriptor instead')
const PaymentMethod$json = {
  '1': 'PaymentMethod',
  '2': [
    {'1': 'PAYMENT_METHOD_UNSPECIFIED', '2': 0},
    {'1': 'CASH', '2': 1},
    {'1': 'CARD', '2': 2},
    {'1': 'BANK_TRANSFER', '2': 3},
    {'1': 'OTHER', '2': 4},
  ],
};

/// Descriptor for `PaymentMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paymentMethodDescriptor = $convert.base64Decode(
    'Cg1QYXltZW50TWV0aG9kEh4KGlBBWU1FTlRfTUVUSE9EX1VOU1BFQ0lGSUVEEAASCAoEQ0FTSB'
    'ABEggKBENBUkQQAhIRCg1CQU5LX1RSQU5TRkVSEAMSCQoFT1RIRVIQBA==');

@$core.Deprecated('Use interactionTypeDescriptor instead')
const InteractionType$json = {
  '1': 'InteractionType',
  '2': [
    {'1': 'INTERACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'INTERACTION_TYPE_CALL', '2': 1},
    {'1': 'INTERACTION_TYPE_MEETING', '2': 2},
    {'1': 'INTERACTION_TYPE_EMAIL', '2': 3},
    {'1': 'INTERACTION_TYPE_CHAT', '2': 4},
    {'1': 'INTERACTION_TYPE_OTHER', '2': 5},
  ],
};

/// Descriptor for `InteractionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List interactionTypeDescriptor = $convert.base64Decode(
    'Cg9JbnRlcmFjdGlvblR5cGUSIAocSU5URVJBQ1RJT05fVFlQRV9VTlNQRUNJRklFRBAAEhkKFU'
    'lOVEVSQUNUSU9OX1RZUEVfQ0FMTBABEhwKGElOVEVSQUNUSU9OX1RZUEVfTUVFVElORxACEhoK'
    'FklOVEVSQUNUSU9OX1RZUEVfRU1BSUwQAxIZChVJTlRFUkFDVElPTl9UWVBFX0NIQVQQBBIaCh'
    'ZJTlRFUkFDVElPTl9UWVBFX09USEVSEAU=');

@$core.Deprecated('Use clientSourceDescriptor instead')
const ClientSource$json = {
  '1': 'ClientSource',
  '2': [
    {'1': 'CLIENT_SOURCE_UNSPECIFIED', '2': 0},
    {'1': 'CLIENT_SOURCE_REFERRAL', '2': 1},
    {'1': 'CLIENT_SOURCE_ONLINE', '2': 2},
    {'1': 'CLIENT_SOURCE_WALK_IN', '2': 3},
    {'1': 'CLIENT_SOURCE_PARTNER', '2': 4},
    {'1': 'CLIENT_SOURCE_OTHER', '2': 5},
  ],
};

/// Descriptor for `ClientSource`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List clientSourceDescriptor = $convert.base64Decode(
    'CgxDbGllbnRTb3VyY2USHQoZQ0xJRU5UX1NPVVJDRV9VTlNQRUNJRklFRBAAEhoKFkNMSUVOVF'
    '9TT1VSQ0VfUkVGRVJSQUwQARIYChRDTElFTlRfU09VUkNFX09OTElORRACEhkKFUNMSUVOVF9T'
    'T1VSQ0VfV0FMS19JThADEhkKFUNMSUVOVF9TT1VSQ0VfUEFSVE5FUhAEEhcKE0NMSUVOVF9TT1'
    'VSQ0VfT1RIRVIQBQ==');

@$core.Deprecated('Use translationProgressStatusDescriptor instead')
const TranslationProgressStatus$json = {
  '1': 'TranslationProgressStatus',
  '2': [
    {'1': 'TRANSLATION_PROGRESS_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PENDING_ASSIGNMENT', '2': 1},
    {'1': 'IN_PROGRESS', '2': 2},
    {'1': 'TRANSLATED', '2': 3},
    {'1': 'CHECKED_BY_MANAGER', '2': 4},
    {'1': 'CLIENT_NOTIFIED', '2': 5},
    {'1': 'DELIVERED', '2': 6},
  ],
};

/// Descriptor for `TranslationProgressStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List translationProgressStatusDescriptor = $convert.base64Decode(
    'ChlUcmFuc2xhdGlvblByb2dyZXNzU3RhdHVzEisKJ1RSQU5TTEFUSU9OX1BST0dSRVNTX1NUQV'
    'RVU19VTlNQRUNJRklFRBAAEhYKElBFTkRJTkdfQVNTSUdOTUVOVBABEg8KC0lOX1BST0dSRVNT'
    'EAISDgoKVFJBTlNMQVRFRBADEhYKEkNIRUNLRURfQllfTUFOQUdFUhAEEhMKD0NMSUVOVF9OT1'
    'RJRklFRBAFEg0KCURFTElWRVJFRBAG');

@$core.Deprecated('Use policyRenewalStatusDescriptor instead')
const PolicyRenewalStatus$json = {
  '1': 'PolicyRenewalStatus',
  '2': [
    {'1': 'POLICY_RENEWAL_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PENDING_RENEWAL', '2': 1},
    {'1': 'RENEWED', '2': 2},
    {'1': 'NOT_RENEWED', '2': 3},
  ],
};

/// Descriptor for `PolicyRenewalStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List policyRenewalStatusDescriptor = $convert.base64Decode(
    'ChNQb2xpY3lSZW5ld2FsU3RhdHVzEiUKIVBPTElDWV9SRU5FV0FMX1NUQVRVU19VTlNQRUNJRk'
    'lFRBAAEhMKD1BFTkRJTkdfUkVORVdBTBABEgsKB1JFTkVXRUQQAhIPCgtOT1RfUkVORVdFRBAD');

@$core.Deprecated('Use serviceCategoryDescriptor instead')
const ServiceCategory$json = {
  '1': 'ServiceCategory',
  '2': [
    {'1': 'SERVICE_CATEGORY_UNSPECIFIED', '2': 0},
    {'1': 'LEGAL_SERVICES', '2': 1},
    {'1': 'TRANSLATIONS', '2': 2},
    {'1': 'INSURANCE', '2': 3},
    {'1': 'PROFESSIONAL_DEVELOPMENT', '2': 4},
    {'1': 'ACCOUNT_OPENING', '2': 5},
    {'1': 'BUSINESS_REGISTRATION', '2': 6},
    {'1': 'LENDING', '2': 7},
    {'1': 'ALL_SERVICES', '2': 8},
  ],
};

/// Descriptor for `ServiceCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serviceCategoryDescriptor = $convert.base64Decode(
    'Cg9TZXJ2aWNlQ2F0ZWdvcnkSIAocU0VSVklDRV9DQVRFR09SWV9VTlNQRUNJRklFRBAAEhIKDk'
    'xFR0FMX1NFUlZJQ0VTEAESEAoMVFJBTlNMQVRJT05TEAISDQoJSU5TVVJBTkNFEAMSHAoYUFJP'
    'RkVTU0lPTkFMX0RFVkVMT1BNRU5UEAQSEwoPQUNDT1VOVF9PUEVOSU5HEAUSGQoVQlVTSU5FU1'
    'NfUkVHSVNUUkFUSU9OEAYSCwoHTEVORElORxAHEhAKDEFMTF9TRVJWSUNFUxAI');

@$core.Deprecated('Use reportPaymentStatusDescriptor instead')
const ReportPaymentStatus$json = {
  '1': 'ReportPaymentStatus',
  '2': [
    {'1': 'REPORT_PAYMENT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PAID', '2': 1},
    {'1': 'PARTIALLY_PAID', '2': 2},
    {'1': 'UNPAID', '2': 3},
    {'1': 'OVERDUE', '2': 4},
    {'1': 'NOT_APPLICABLE', '2': 5},
  ],
};

/// Descriptor for `ReportPaymentStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportPaymentStatusDescriptor = $convert.base64Decode(
    'ChNSZXBvcnRQYXltZW50U3RhdHVzEiUKIVJFUE9SVF9QQVlNRU5UX1NUQVRVU19VTlNQRUNJRk'
    'lFRBAAEggKBFBBSUQQARISCg5QQVJUSUFMTFlfUEFJRBACEgoKBlVOUEFJRBADEgsKB09WRVJE'
    'VUUQBBISCg5OT1RfQVBQTElDQUJMRRAF');

@$core.Deprecated('Use clientDescriptor instead')
const Client$json = {
  '1': 'Client',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'phone', '3': 4, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'email', '17': true},
    {'1': 'telegram_id', '3': 6, '4': 1, '5': 3, '9': 1, '10': 'telegramId', '17': true},
    {'1': 'whatsapp_number', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'whatsappNumber', '17': true},
    {'1': 'passport_data', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Value', '9': 3, '10': 'passportData', '17': true},
    {'1': 'notes', '3': 10, '4': 1, '5': 9, '9': 4, '10': 'notes', '17': true},
    {'1': 'manager_id', '3': 11, '4': 1, '5': 13, '9': 5, '10': 'managerId', '17': true},
    {'1': 'office_id', '3': 12, '4': 1, '5': 13, '9': 6, '10': 'officeId', '17': true},
  ],
  '8': [
    {'1': '_email'},
    {'1': '_telegram_id'},
    {'1': '_whatsapp_number'},
    {'1': '_passport_data'},
    {'1': '_notes'},
    {'1': '_manager_id'},
    {'1': '_office_id'},
  ],
};

/// Descriptor for `Client`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientDescriptor = $convert.base64Decode(
    'CgZDbGllbnQSGwoJY2xpZW50X2lkGAEgASgNUghjbGllbnRJZBIdCgpmaXJzdF9uYW1lGAIgAS'
    'gJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAMgASgJUghsYXN0TmFtZRIUCgVwaG9uZRgEIAEo'
    'CVIFcGhvbmUSGQoFZW1haWwYBSABKAlIAFIFZW1haWyIAQESJAoLdGVsZWdyYW1faWQYBiABKA'
    'NIAVIKdGVsZWdyYW1JZIgBARIsCg93aGF0c2FwcF9udW1iZXIYByABKAlIAlIOd2hhdHNhcHBO'
    'dW1iZXKIAQESQAoNcGFzc3BvcnRfZGF0YRgJIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5WYWx1ZU'
    'gDUgxwYXNzcG9ydERhdGGIAQESGQoFbm90ZXMYCiABKAlIBFIFbm90ZXOIAQESIgoKbWFuYWdl'
    'cl9pZBgLIAEoDUgFUgltYW5hZ2VySWSIAQESIAoJb2ZmaWNlX2lkGAwgASgNSAZSCG9mZmljZU'
    'lkiAEBQggKBl9lbWFpbEIOCgxfdGVsZWdyYW1faWRCEgoQX3doYXRzYXBwX251bWJlckIQCg5f'
    'cGFzc3BvcnRfZGF0YUIICgZfbm90ZXNCDQoLX21hbmFnZXJfaWRCDAoKX29mZmljZV9pZA==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'login', '3': 2, '4': 1, '5': 9, '10': 'login'},
    {'1': 'last_login', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'lastLogin', '17': true},
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'email', '17': true},
  ],
  '8': [
    {'1': '_last_login'},
    {'1': '_notes'},
    {'1': '_email'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhcKB3VzZXJfaWQYASABKA1SBnVzZXJJZBIUCgVsb2dpbhgCIAEoCVIFbG9naW4SPg'
    'oKbGFzdF9sb2dpbhgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAFIJbGFzdExv'
    'Z2luiAEBEhkKBW5vdGVzGAQgASgJSAFSBW5vdGVziAEBEhkKBWVtYWlsGAUgASgJSAJSBWVtYW'
    'lsiAEBQg0KC19sYXN0X2xvZ2luQggKBl9ub3Rlc0IICgZfZW1haWw=');

@$core.Deprecated('Use employeeDescriptor instead')
const Employee$json = {
  '1': 'Employee',
  '2': [
    {'1': 'employee_id', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'login', '3': 3, '4': 1, '5': 9, '10': 'login'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'role', '3': 5, '4': 1, '5': 14, '6': '.proto.EmployeeRole', '10': 'role'},
    {'1': 'office_id', '3': 6, '4': 1, '5': 13, '10': 'officeId'},
    {'1': 'telegram_id', '3': 7, '4': 1, '5': 3, '9': 0, '10': 'telegramId', '17': true},
    {'1': 'whatsapp_number', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'whatsappNumber', '17': true},
    {'1': 'email', '3': 9, '4': 1, '5': 9, '10': 'email'},
    {'1': 'is_active', '3': 10, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'notes', '3': 11, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_telegram_id'},
    {'1': '_whatsapp_number'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `Employee`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List employeeDescriptor = $convert.base64Decode(
    'CghFbXBsb3llZRIfCgtlbXBsb3llZV9pZBgBIAEoDVIKZW1wbG95ZWVJZBIXCgd1c2VyX2lkGA'
    'IgASgNUgZ1c2VySWQSFAoFbG9naW4YAyABKAlSBWxvZ2luEhIKBG5hbWUYBCABKAlSBG5hbWUS'
    'JwoEcm9sZRgFIAEoDjITLnByb3RvLkVtcGxveWVlUm9sZVIEcm9sZRIbCglvZmZpY2VfaWQYBi'
    'ABKA1SCG9mZmljZUlkEiQKC3RlbGVncmFtX2lkGAcgASgDSABSCnRlbGVncmFtSWSIAQESLAoP'
    'd2hhdHNhcHBfbnVtYmVyGAggASgJSAFSDndoYXRzYXBwTnVtYmVyiAEBEhQKBWVtYWlsGAkgAS'
    'gJUgVlbWFpbBIbCglpc19hY3RpdmUYCiABKAhSCGlzQWN0aXZlEhkKBW5vdGVzGAsgASgJSAJS'
    'BW5vdGVziAEBQg4KDF90ZWxlZ3JhbV9pZEISChBfd2hhdHNhcHBfbnVtYmVyQggKBl9ub3Rlcw'
    '==');

@$core.Deprecated('Use officeDescriptor instead')
const Office$json = {
  '1': 'Office',
  '2': [
    {'1': 'office_id', '3': 1, '4': 1, '5': 13, '10': 'officeId'},
    {'1': 'city', '3': 2, '4': 1, '5': 9, '10': 'city'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'address', '17': true},
    {'1': 'phone', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'phone', '17': true},
    {'1': 'notes', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_address'},
    {'1': '_phone'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `Office`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List officeDescriptor = $convert.base64Decode(
    'CgZPZmZpY2USGwoJb2ZmaWNlX2lkGAEgASgNUghvZmZpY2VJZBISCgRjaXR5GAIgASgJUgRjaX'
    'R5Eh0KB2FkZHJlc3MYAyABKAlIAFIHYWRkcmVzc4gBARIZCgVwaG9uZRgEIAEoCUgBUgVwaG9u'
    'ZYgBARIZCgVub3RlcxgFIAEoCUgCUgVub3Rlc4gBAUIKCghfYWRkcmVzc0IICgZfcGhvbmVCCA'
    'oGX25vdGVz');

@$core.Deprecated('Use legalCaseDescriptor instead')
const LegalCase$json = {
  '1': 'LegalCase',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 13, '10': 'caseId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 3, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'issue_type_id', '3': 4, '4': 1, '5': 13, '10': 'issueTypeId'},
    {'1': 'partner_id', '3': 5, '4': 1, '5': 13, '9': 0, '10': 'partnerId', '17': true},
    {'1': 'consultation_date', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'consultationDate', '17': true},
    {'1': 'contract_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'contractDate', '17': true},
    {'1': 'contract_amount', '3': 8, '4': 1, '5': 1, '10': 'contractAmount'},
    {'1': 'expected_commission', '3': 9, '4': 1, '5': 1, '10': 'expectedCommission'},
    {'1': 'status', '3': 10, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'payment_id', '3': 11, '4': 1, '5': 13, '9': 3, '10': 'paymentId', '17': true},
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '9': 4, '10': 'notes', '17': true},
    {'1': 'consultation_scheduled_date', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 5, '10': 'consultationScheduledDate', '17': true},
    {'1': 'consultation_notes', '3': 14, '4': 1, '5': 9, '9': 6, '10': 'consultationNotes', '17': true},
    {'1': 'contract_planned_date', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 7, '10': 'contractPlannedDate', '17': true},
  ],
  '8': [
    {'1': '_partner_id'},
    {'1': '_consultation_date'},
    {'1': '_contract_date'},
    {'1': '_payment_id'},
    {'1': '_notes'},
    {'1': '_consultation_scheduled_date'},
    {'1': '_consultation_notes'},
    {'1': '_contract_planned_date'},
  ],
};

/// Descriptor for `LegalCase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List legalCaseDescriptor = $convert.base64Decode(
    'CglMZWdhbENhc2USFwoHY2FzZV9pZBgBIAEoDVIGY2FzZUlkEhsKCWNsaWVudF9pZBgCIAEoDV'
    'IIY2xpZW50SWQSHQoKbWFuYWdlcl9pZBgDIAEoDVIJbWFuYWdlcklkEiIKDWlzc3VlX3R5cGVf'
    'aWQYBCABKA1SC2lzc3VlVHlwZUlkEiIKCnBhcnRuZXJfaWQYBSABKA1IAFIJcGFydG5lcklkiA'
    'EBEkwKEWNvbnN1bHRhdGlvbl9kYXRlGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cEgBUhBjb25zdWx0YXRpb25EYXRliAEBEkQKDWNvbnRyYWN0X2RhdGUYByABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wSAJSDGNvbnRyYWN0RGF0ZYgBARInCg9jb250cmFjdF9hbW91'
    'bnQYCCABKAFSDmNvbnRyYWN0QW1vdW50Ei8KE2V4cGVjdGVkX2NvbW1pc3Npb24YCSABKAFSEm'
    'V4cGVjdGVkQ29tbWlzc2lvbhIlCgZzdGF0dXMYCiABKA4yDS5wcm90by5TdGF0dXNSBnN0YXR1'
    'cxIiCgpwYXltZW50X2lkGAsgASgNSANSCXBheW1lbnRJZIgBARIZCgVub3RlcxgMIAEoCUgEUg'
    'Vub3Rlc4gBARJfChtjb25zdWx0YXRpb25fc2NoZWR1bGVkX2RhdGUYDSABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wSAVSGWNvbnN1bHRhdGlvblNjaGVkdWxlZERhdGWIAQESMgoSY2'
    '9uc3VsdGF0aW9uX25vdGVzGA4gASgJSAZSEWNvbnN1bHRhdGlvbk5vdGVziAEBElMKFWNvbnRy'
    'YWN0X3BsYW5uZWRfZGF0ZRgPIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIB1ITY2'
    '9udHJhY3RQbGFubmVkRGF0ZYgBAUINCgtfcGFydG5lcl9pZEIUChJfY29uc3VsdGF0aW9uX2Rh'
    'dGVCEAoOX2NvbnRyYWN0X2RhdGVCDQoLX3BheW1lbnRfaWRCCAoGX25vdGVzQh4KHF9jb25zdW'
    'x0YXRpb25fc2NoZWR1bGVkX2RhdGVCFQoTX2NvbnN1bHRhdGlvbl9ub3Rlc0IYChZfY29udHJh'
    'Y3RfcGxhbm5lZF9kYXRl');

@$core.Deprecated('Use translationOrderDescriptor instead')
const TranslationOrder$json = {
  '1': 'TranslationOrder',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'client_id', '3': 3, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 4, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'translator_id', '3': 5, '4': 1, '5': 13, '9': 0, '10': 'translatorId', '17': true},
    {'1': 'office_id', '3': 6, '4': 1, '5': 13, '10': 'officeId'},
    {'1': 'document_type_key', '3': 7, '4': 1, '5': 9, '9': 1, '10': 'documentTypeKey', '17': true},
    {'1': 'source_language', '3': 8, '4': 1, '5': 9, '9': 2, '10': 'sourceLanguage', '17': true},
    {'1': 'target_language', '3': 9, '4': 1, '5': 9, '9': 3, '10': 'targetLanguage', '17': true},
    {'1': 'page_count', '3': 10, '4': 1, '5': 5, '9': 4, '10': 'pageCount', '17': true},
    {'1': 'translation_sum', '3': 11, '4': 1, '5': 1, '10': 'translationSum'},
    {'1': 'notarial_sum', '3': 12, '4': 1, '5': 1, '10': 'notarialSum'},
    {'1': 'total_sum', '3': 13, '4': 1, '5': 1, '10': 'totalSum'},
    {'1': 'priority', '3': 14, '4': 1, '5': 14, '6': '.proto.Priority', '10': 'priority'},
    {'1': 'translation_progress', '3': 15, '4': 1, '5': 14, '6': '.proto.TranslationProgressStatus', '10': 'translationProgress'},
    {'1': 'payment_id', '3': 16, '4': 1, '5': 13, '9': 5, '10': 'paymentId', '17': true},
    {'1': 'blanks', '3': 17, '4': 3, '5': 11, '6': '.proto.TranslationOrder.BlankInfo', '10': 'blanks'},
    {'1': 'notes', '3': 18, '4': 1, '5': 9, '9': 6, '10': 'notes', '17': true},
    {'1': 'source', '3': 19, '4': 1, '5': 14, '6': '.proto.ClientSource', '9': 7, '10': 'source', '17': true},
    {'1': 'created_at', '3': 22, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'done_at', '3': 23, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 8, '10': 'doneAt', '17': true},
  ],
  '3': [TranslationOrder_BlankInfo$json],
  '8': [
    {'1': '_translator_id'},
    {'1': '_document_type_key'},
    {'1': '_source_language'},
    {'1': '_target_language'},
    {'1': '_page_count'},
    {'1': '_payment_id'},
    {'1': '_notes'},
    {'1': '_source'},
    {'1': '_done_at'},
  ],
};

@$core.Deprecated('Use translationOrderDescriptor instead')
const TranslationOrder_BlankInfo$json = {
  '1': 'BlankInfo',
  '2': [
    {'1': 'blank_number', '3': 1, '4': 1, '5': 9, '10': 'blankNumber'},
    {'1': 'is_spoiled', '3': 2, '4': 1, '5': 8, '10': 'isSpoiled'},
    {'1': 'replacement_blank_number', '3': 3, '4': 1, '5': 9, '10': 'replacementBlankNumber'},
  ],
};

/// Descriptor for `TranslationOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List translationOrderDescriptor = $convert.base64Decode(
    'ChBUcmFuc2xhdGlvbk9yZGVyEhkKCG9yZGVyX2lkGAEgASgNUgdvcmRlcklkEhQKBXRpdGxlGA'
    'IgASgJUgV0aXRsZRIbCgljbGllbnRfaWQYAyABKA1SCGNsaWVudElkEh0KCm1hbmFnZXJfaWQY'
    'BCABKA1SCW1hbmFnZXJJZBIoCg10cmFuc2xhdG9yX2lkGAUgASgNSABSDHRyYW5zbGF0b3JJZI'
    'gBARIbCglvZmZpY2VfaWQYBiABKA1SCG9mZmljZUlkEi8KEWRvY3VtZW50X3R5cGVfa2V5GAcg'
    'ASgJSAFSD2RvY3VtZW50VHlwZUtleYgBARIsCg9zb3VyY2VfbGFuZ3VhZ2UYCCABKAlIAlIOc2'
    '91cmNlTGFuZ3VhZ2WIAQESLAoPdGFyZ2V0X2xhbmd1YWdlGAkgASgJSANSDnRhcmdldExhbmd1'
    'YWdliAEBEiIKCnBhZ2VfY291bnQYCiABKAVIBFIJcGFnZUNvdW50iAEBEicKD3RyYW5zbGF0aW'
    '9uX3N1bRgLIAEoAVIOdHJhbnNsYXRpb25TdW0SIQoMbm90YXJpYWxfc3VtGAwgASgBUgtub3Rh'
    'cmlhbFN1bRIbCgl0b3RhbF9zdW0YDSABKAFSCHRvdGFsU3VtEisKCHByaW9yaXR5GA4gASgOMg'
    '8ucHJvdG8uUHJpb3JpdHlSCHByaW9yaXR5ElMKFHRyYW5zbGF0aW9uX3Byb2dyZXNzGA8gASgO'
    'MiAucHJvdG8uVHJhbnNsYXRpb25Qcm9ncmVzc1N0YXR1c1ITdHJhbnNsYXRpb25Qcm9ncmVzcx'
    'IiCgpwYXltZW50X2lkGBAgASgNSAVSCXBheW1lbnRJZIgBARI5CgZibGFua3MYESADKAsyIS5w'
    'cm90by5UcmFuc2xhdGlvbk9yZGVyLkJsYW5rSW5mb1IGYmxhbmtzEhkKBW5vdGVzGBIgASgJSA'
    'ZSBW5vdGVziAEBEjAKBnNvdXJjZRgTIAEoDjITLnByb3RvLkNsaWVudFNvdXJjZUgHUgZzb3Vy'
    'Y2WIAQESOQoKY3JlYXRlZF9hdBgWIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCW'
    'NyZWF0ZWRBdBI4Cgdkb25lX2F0GBcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgI'
    'UgZkb25lQXSIAQEahwEKCUJsYW5rSW5mbxIhCgxibGFua19udW1iZXIYASABKAlSC2JsYW5rTn'
    'VtYmVyEh0KCmlzX3Nwb2lsZWQYAiABKAhSCWlzU3BvaWxlZBI4ChhyZXBsYWNlbWVudF9ibGFu'
    'a19udW1iZXIYAyABKAlSFnJlcGxhY2VtZW50QmxhbmtOdW1iZXJCEAoOX3RyYW5zbGF0b3JfaW'
    'RCFAoSX2RvY3VtZW50X3R5cGVfa2V5QhIKEF9zb3VyY2VfbGFuZ3VhZ2VCEgoQX3RhcmdldF9s'
    'YW5ndWFnZUINCgtfcGFnZV9jb3VudEINCgtfcGF5bWVudF9pZEIICgZfbm90ZXNCCQoHX3NvdX'
    'JjZUIKCghfZG9uZV9hdA==');

@$core.Deprecated('Use insurancePolicyDescriptor instead')
const InsurancePolicy$json = {
  '1': 'InsurancePolicy',
  '2': [
    {'1': 'policy_id', '3': 1, '4': 1, '5': 13, '10': 'policyId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 3, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'policy_number', '3': 4, '4': 1, '5': 9, '10': 'policyNumber'},
    {'1': 'insurance_company_name', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'insuranceCompanyName', '17': true},
    {'1': 'insurance_line', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'insuranceLine', '17': true},
    {'1': 'insurance_product', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'insuranceProduct', '17': true},
    {'1': 'start_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startDate'},
    {'1': 'expiry_date', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiryDate'},
    {'1': 'amount', '3': 10, '4': 1, '5': 1, '10': 'amount'},
    {'1': 'status', '3': 11, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'renewal_status', '3': 12, '4': 1, '5': 14, '6': '.proto.PolicyRenewalStatus', '10': 'renewalStatus'},
    {'1': 'notes', '3': 13, '4': 1, '5': 9, '9': 3, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_insurance_company_name'},
    {'1': '_insurance_line'},
    {'1': '_insurance_product'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `InsurancePolicy`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insurancePolicyDescriptor = $convert.base64Decode(
    'Cg9JbnN1cmFuY2VQb2xpY3kSGwoJcG9saWN5X2lkGAEgASgNUghwb2xpY3lJZBIbCgljbGllbn'
    'RfaWQYAiABKA1SCGNsaWVudElkEh0KCm1hbmFnZXJfaWQYAyABKA1SCW1hbmFnZXJJZBIjCg1w'
    'b2xpY3lfbnVtYmVyGAQgASgJUgxwb2xpY3lOdW1iZXISOQoWaW5zdXJhbmNlX2NvbXBhbnlfbm'
    'FtZRgFIAEoCUgAUhRpbnN1cmFuY2VDb21wYW55TmFtZYgBARIqCg5pbnN1cmFuY2VfbGluZRgG'
    'IAEoCUgBUg1pbnN1cmFuY2VMaW5liAEBEjAKEWluc3VyYW5jZV9wcm9kdWN0GAcgASgJSAJSEG'
    'luc3VyYW5jZVByb2R1Y3SIAQESOQoKc3RhcnRfZGF0ZRgIIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSCXN0YXJ0RGF0ZRI7CgtleHBpcnlfZGF0ZRgJIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCmV4cGlyeURhdGUSFgoGYW1vdW50GAogASgBUgZhbW91bnQSJQoG'
    'c3RhdHVzGAsgASgOMg0ucHJvdG8uU3RhdHVzUgZzdGF0dXMSQQoOcmVuZXdhbF9zdGF0dXMYDC'
    'ABKA4yGi5wcm90by5Qb2xpY3lSZW5ld2FsU3RhdHVzUg1yZW5ld2FsU3RhdHVzEhkKBW5vdGVz'
    'GA0gASgJSANSBW5vdGVziAEBQhkKF19pbnN1cmFuY2VfY29tcGFueV9uYW1lQhEKD19pbnN1cm'
    'FuY2VfbGluZUIUChJfaW5zdXJhbmNlX3Byb2R1Y3RCCAoGX25vdGVz');

@$core.Deprecated('Use trainingEnrollmentDescriptor instead')
const TrainingEnrollment$json = {
  '1': 'TrainingEnrollment',
  '2': [
    {'1': 'enrollment_id', '3': 1, '4': 1, '5': 13, '10': 'enrollmentId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 3, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'course_id', '3': 4, '4': 1, '5': 13, '10': 'courseId'},
    {'1': 'contract_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'contractDate', '17': true},
    {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'payment_id', '3': 7, '4': 1, '5': 13, '9': 1, '10': 'paymentId', '17': true},
    {'1': 'notes', '3': 8, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
    {'1': 'paid', '3': 9, '4': 1, '5': 8, '10': 'paid'},
    {'1': 'accountant_verified', '3': 10, '4': 1, '5': 8, '10': 'accountantVerified'},
    {'1': 'price_at_enrollment', '3': 11, '4': 1, '5': 1, '10': 'priceAtEnrollment'},
    {'1': 'is_contract_signed', '3': 12, '4': 1, '5': 8, '10': 'isContractSigned'},
    {'1': 'agency_commission_amount', '3': 13, '4': 1, '5': 1, '10': 'agencyCommissionAmount'},
  ],
  '8': [
    {'1': '_contract_date'},
    {'1': '_payment_id'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `TrainingEnrollment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingEnrollmentDescriptor = $convert.base64Decode(
    'ChJUcmFpbmluZ0Vucm9sbG1lbnQSIwoNZW5yb2xsbWVudF9pZBgBIAEoDVIMZW5yb2xsbWVudE'
    'lkEhsKCWNsaWVudF9pZBgCIAEoDVIIY2xpZW50SWQSHQoKbWFuYWdlcl9pZBgDIAEoDVIJbWFu'
    'YWdlcklkEhsKCWNvdXJzZV9pZBgEIAEoDVIIY291cnNlSWQSRAoNY29udHJhY3RfZGF0ZRgFIA'
    'EoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAFIMY29udHJhY3REYXRliAEBEiUKBnN0'
    'YXR1cxgGIAEoDjINLnByb3RvLlN0YXR1c1IGc3RhdHVzEiIKCnBheW1lbnRfaWQYByABKA1IAV'
    'IJcGF5bWVudElkiAEBEhkKBW5vdGVzGAggASgJSAJSBW5vdGVziAEBEhIKBHBhaWQYCSABKAhS'
    'BHBhaWQSLwoTYWNjb3VudGFudF92ZXJpZmllZBgKIAEoCFISYWNjb3VudGFudFZlcmlmaWVkEi'
    '4KE3ByaWNlX2F0X2Vucm9sbG1lbnQYCyABKAFSEXByaWNlQXRFbnJvbGxtZW50EiwKEmlzX2Nv'
    'bnRyYWN0X3NpZ25lZBgMIAEoCFIQaXNDb250cmFjdFNpZ25lZBI4ChhhZ2VuY3lfY29tbWlzc2'
    'lvbl9hbW91bnQYDSABKAFSFmFnZW5jeUNvbW1pc3Npb25BbW91bnRCEAoOX2NvbnRyYWN0X2Rh'
    'dGVCDQoLX3BheW1lbnRfaWRCCAoGX25vdGVz');

@$core.Deprecated('Use accountOpeningRequestDescriptor instead')
const AccountOpeningRequest$json = {
  '1': 'AccountOpeningRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 3, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'bank_id', '3': 4, '4': 1, '5': 13, '10': 'bankId'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'application_date', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'applicationDate', '17': true},
    {'1': 'opened_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'openedDate', '17': true},
    {'1': 'payment_id', '3': 8, '4': 1, '5': 13, '9': 2, '10': 'paymentId', '17': true},
    {'1': 'notes', '3': 9, '4': 1, '5': 9, '9': 3, '10': 'notes', '17': true},
    {'1': 'agent_commission_received', '3': 10, '4': 1, '5': 8, '10': 'agentCommissionReceived'},
    {'1': 'agency_commission_amount_at_request', '3': 11, '4': 1, '5': 1, '10': 'agencyCommissionAmountAtRequest'},
  ],
  '8': [
    {'1': '_application_date'},
    {'1': '_opened_date'},
    {'1': '_payment_id'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `AccountOpeningRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountOpeningRequestDescriptor = $convert.base64Decode(
    'ChVBY2NvdW50T3BlbmluZ1JlcXVlc3QSHQoKcmVxdWVzdF9pZBgBIAEoDVIJcmVxdWVzdElkEh'
    'sKCWNsaWVudF9pZBgCIAEoDVIIY2xpZW50SWQSHQoKbWFuYWdlcl9pZBgDIAEoDVIJbWFuYWdl'
    'cklkEhcKB2JhbmtfaWQYBCABKA1SBmJhbmtJZBIlCgZzdGF0dXMYBSABKA4yDS5wcm90by5TdG'
    'F0dXNSBnN0YXR1cxJKChBhcHBsaWNhdGlvbl9kYXRlGAYgASgLMhouZ29vZ2xlLnByb3RvYnVm'
    'LlRpbWVzdGFtcEgAUg9hcHBsaWNhdGlvbkRhdGWIAQESQAoLb3BlbmVkX2RhdGUYByABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSCm9wZW5lZERhdGWIAQESIgoKcGF5bWVudF9p'
    'ZBgIIAEoDUgCUglwYXltZW50SWSIAQESGQoFbm90ZXMYCSABKAlIA1IFbm90ZXOIAQESOgoZYW'
    'dlbnRfY29tbWlzc2lvbl9yZWNlaXZlZBgKIAEoCFIXYWdlbnRDb21taXNzaW9uUmVjZWl2ZWQS'
    'TAojYWdlbmN5X2NvbW1pc3Npb25fYW1vdW50X2F0X3JlcXVlc3QYCyABKAFSH2FnZW5jeUNvbW'
    '1pc3Npb25BbW91bnRBdFJlcXVlc3RCEwoRX2FwcGxpY2F0aW9uX2RhdGVCDgoMX29wZW5lZF9k'
    'YXRlQg0KC19wYXltZW50X2lkQggKBl9ub3Rlcw==');

@$core.Deprecated('Use businessRegistrationDescriptor instead')
const BusinessRegistration$json = {
  '1': 'BusinessRegistration',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 3, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'bank_id', '3': 4, '4': 1, '5': 13, '10': 'bankId'},
    {'1': 'registration_type', '3': 5, '4': 1, '5': 14, '6': '.proto.RegistrationType', '10': 'registrationType'},
    {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'application_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'applicationDate', '17': true},
    {'1': 'registration_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'registrationDate', '17': true},
    {'1': 'payment_id', '3': 9, '4': 1, '5': 13, '9': 2, '10': 'paymentId', '17': true},
    {'1': 'notes', '3': 10, '4': 1, '5': 9, '9': 3, '10': 'notes', '17': true},
    {'1': 'agent_commission_received', '3': 11, '4': 1, '5': 8, '10': 'agentCommissionReceived'},
    {'1': 'agency_commission_amount_at_request', '3': 12, '4': 1, '5': 1, '10': 'agencyCommissionAmountAtRequest'},
  ],
  '8': [
    {'1': '_application_date'},
    {'1': '_registration_date'},
    {'1': '_payment_id'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `BusinessRegistration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessRegistrationDescriptor = $convert.base64Decode(
    'ChRCdXNpbmVzc1JlZ2lzdHJhdGlvbhIdCgpyZXF1ZXN0X2lkGAEgASgNUglyZXF1ZXN0SWQSGw'
    'oJY2xpZW50X2lkGAIgASgNUghjbGllbnRJZBIdCgptYW5hZ2VyX2lkGAMgASgNUgltYW5hZ2Vy'
    'SWQSFwoHYmFua19pZBgEIAEoDVIGYmFua0lkEkQKEXJlZ2lzdHJhdGlvbl90eXBlGAUgASgOMh'
    'cucHJvdG8uUmVnaXN0cmF0aW9uVHlwZVIQcmVnaXN0cmF0aW9uVHlwZRIlCgZzdGF0dXMYBiAB'
    'KA4yDS5wcm90by5TdGF0dXNSBnN0YXR1cxJKChBhcHBsaWNhdGlvbl9kYXRlGAcgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgAUg9hcHBsaWNhdGlvbkRhdGWIAQESTAoRcmVnaXN0'
    'cmF0aW9uX2RhdGUYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSEHJlZ2lzdH'
    'JhdGlvbkRhdGWIAQESIgoKcGF5bWVudF9pZBgJIAEoDUgCUglwYXltZW50SWSIAQESGQoFbm90'
    'ZXMYCiABKAlIA1IFbm90ZXOIAQESOgoZYWdlbnRfY29tbWlzc2lvbl9yZWNlaXZlZBgLIAEoCF'
    'IXYWdlbnRDb21taXNzaW9uUmVjZWl2ZWQSTAojYWdlbmN5X2NvbW1pc3Npb25fYW1vdW50X2F0'
    'X3JlcXVlc3QYDCABKAFSH2FnZW5jeUNvbW1pc3Npb25BbW91bnRBdFJlcXVlc3RCEwoRX2FwcG'
    'xpY2F0aW9uX2RhdGVCFAoSX3JlZ2lzdHJhdGlvbl9kYXRlQg0KC19wYXltZW50X2lkQggKBl9u'
    'b3Rlcw==');

@$core.Deprecated('Use lendingApplicationDescriptor instead')
const LendingApplication$json = {
  '1': 'LendingApplication',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 3, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'bank_id', '3': 4, '4': 1, '5': 13, '10': 'bankId'},
    {'1': 'requested_amount', '3': 5, '4': 1, '5': 1, '10': 'requestedAmount'},
    {'1': 'approved_amount', '3': 6, '4': 1, '5': 1, '9': 0, '10': 'approvedAmount', '17': true},
    {'1': 'application_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'applicationDate', '17': true},
    {'1': 'approval_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'approvalDate', '17': true},
    {'1': 'funds_received_date', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'fundsReceivedDate', '17': true},
    {'1': 'company_contract_date', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 4, '10': 'companyContractDate', '17': true},
    {'1': 'status', '3': 11, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'payment_id', '3': 12, '4': 1, '5': 13, '9': 5, '10': 'paymentId', '17': true},
    {'1': 'notes', '3': 13, '4': 1, '5': 9, '9': 6, '10': 'notes', '17': true},
    {'1': 'company_commission_percent', '3': 14, '4': 1, '5': 1, '10': 'companyCommissionPercent'},
    {'1': 'calculated_commission_amount', '3': 15, '4': 1, '5': 1, '10': 'calculatedCommissionAmount'},
    {'1': 'commission_paid', '3': 16, '4': 1, '5': 8, '10': 'commissionPaid'},
    {'1': 'entity_type', '3': 17, '4': 1, '5': 14, '6': '.proto.RegistrationType', '10': 'entityType'},
  ],
  '8': [
    {'1': '_approved_amount'},
    {'1': '_application_date'},
    {'1': '_approval_date'},
    {'1': '_funds_received_date'},
    {'1': '_company_contract_date'},
    {'1': '_payment_id'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `LendingApplication`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lendingApplicationDescriptor = $convert.base64Decode(
    'ChJMZW5kaW5nQXBwbGljYXRpb24SHQoKcmVxdWVzdF9pZBgBIAEoDVIJcmVxdWVzdElkEhsKCW'
    'NsaWVudF9pZBgCIAEoDVIIY2xpZW50SWQSHQoKbWFuYWdlcl9pZBgDIAEoDVIJbWFuYWdlcklk'
    'EhcKB2JhbmtfaWQYBCABKA1SBmJhbmtJZBIpChByZXF1ZXN0ZWRfYW1vdW50GAUgASgBUg9yZX'
    'F1ZXN0ZWRBbW91bnQSLAoPYXBwcm92ZWRfYW1vdW50GAYgASgBSABSDmFwcHJvdmVkQW1vdW50'
    'iAEBEkoKEGFwcGxpY2F0aW9uX2RhdGUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW'
    '1wSAFSD2FwcGxpY2F0aW9uRGF0ZYgBARJECg1hcHByb3ZhbF9kYXRlGAggASgLMhouZ29vZ2xl'
    'LnByb3RvYnVmLlRpbWVzdGFtcEgCUgxhcHByb3ZhbERhdGWIAQESTwoTZnVuZHNfcmVjZWl2ZW'
    'RfZGF0ZRgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIA1IRZnVuZHNSZWNlaXZl'
    'ZERhdGWIAQESUwoVY29tcGFueV9jb250cmFjdF9kYXRlGAogASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcEgEUhNjb21wYW55Q29udHJhY3REYXRliAEBEiUKBnN0YXR1cxgLIAEoDjIN'
    'LnByb3RvLlN0YXR1c1IGc3RhdHVzEiIKCnBheW1lbnRfaWQYDCABKA1IBVIJcGF5bWVudElkiA'
    'EBEhkKBW5vdGVzGA0gASgJSAZSBW5vdGVziAEBEjwKGmNvbXBhbnlfY29tbWlzc2lvbl9wZXJj'
    'ZW50GA4gASgBUhhjb21wYW55Q29tbWlzc2lvblBlcmNlbnQSQAocY2FsY3VsYXRlZF9jb21taX'
    'NzaW9uX2Ftb3VudBgPIAEoAVIaY2FsY3VsYXRlZENvbW1pc3Npb25BbW91bnQSJwoPY29tbWlz'
    'c2lvbl9wYWlkGBAgASgIUg5jb21taXNzaW9uUGFpZBI4CgtlbnRpdHlfdHlwZRgRIAEoDjIXLn'
    'Byb3RvLlJlZ2lzdHJhdGlvblR5cGVSCmVudGl0eVR5cGVCEgoQX2FwcHJvdmVkX2Ftb3VudEIT'
    'ChFfYXBwbGljYXRpb25fZGF0ZUIQCg5fYXBwcm92YWxfZGF0ZUIWChRfZnVuZHNfcmVjZWl2ZW'
    'RfZGF0ZUIYChZfY29tcGFueV9jb250cmFjdF9kYXRlQg0KC19wYXltZW50X2lkQggKBl9ub3Rl'
    'cw==');

@$core.Deprecated('Use partnerDescriptor instead')
const Partner$json = {
  '1': 'Partner',
  '2': [
    {'1': 'partner_id', '3': 1, '4': 1, '5': 13, '10': 'partnerId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'city_of_residence', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'cityOfResidence', '17': true},
    {'1': 'contact_info', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'contactInfo', '17': true},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'notes', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
    {'1': 'service_area_cities', '3': 7, '4': 3, '5': 9, '10': 'serviceAreaCities'},
    {'1': 'specialization_issue_type_ids', '3': 8, '4': 3, '5': 9, '10': 'specializationIssueTypeIds'},
  ],
  '8': [
    {'1': '_city_of_residence'},
    {'1': '_contact_info'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `Partner`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List partnerDescriptor = $convert.base64Decode(
    'CgdQYXJ0bmVyEh0KCnBhcnRuZXJfaWQYASABKA1SCXBhcnRuZXJJZBISCgRuYW1lGAIgASgJUg'
    'RuYW1lEi8KEWNpdHlfb2ZfcmVzaWRlbmNlGAMgASgJSABSD2NpdHlPZlJlc2lkZW5jZYgBARIm'
    'Cgxjb250YWN0X2luZm8YBCABKAlIAVILY29udGFjdEluZm+IAQESJQoGc3RhdHVzGAUgASgOMg'
    '0ucHJvdG8uU3RhdHVzUgZzdGF0dXMSGQoFbm90ZXMYBiABKAlIAlIFbm90ZXOIAQESLgoTc2Vy'
    'dmljZV9hcmVhX2NpdGllcxgHIAMoCVIRc2VydmljZUFyZWFDaXRpZXMSQQodc3BlY2lhbGl6YX'
    'Rpb25faXNzdWVfdHlwZV9pZHMYCCADKAlSGnNwZWNpYWxpemF0aW9uSXNzdWVUeXBlSWRzQhQK'
    'El9jaXR5X29mX3Jlc2lkZW5jZUIPCg1fY29udGFjdF9pbmZvQggKBl9ub3Rlcw==');

@$core.Deprecated('Use legalIssueTypeDescriptor instead')
const LegalIssueType$json = {
  '1': 'LegalIssueType',
  '2': [
    {'1': 'issue_type_id', '3': 1, '4': 1, '5': 13, '10': 'issueTypeId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `LegalIssueType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List legalIssueTypeDescriptor = $convert.base64Decode(
    'Cg5MZWdhbElzc3VlVHlwZRIiCg1pc3N1ZV90eXBlX2lkGAEgASgNUgtpc3N1ZVR5cGVJZBISCg'
    'RuYW1lGAIgASgJUgRuYW1lEiUKC2Rlc2NyaXB0aW9uGAMgASgJSABSC2Rlc2NyaXB0aW9uiAEB'
    'EhkKBW5vdGVzGAQgASgJSAFSBW5vdGVziAEBQg4KDF9kZXNjcmlwdGlvbkIICgZfbm90ZXM=');

@$core.Deprecated('Use trainingCourseDescriptor instead')
const TrainingCourse$json = {
  '1': 'TrainingCourse',
  '2': [
    {'1': 'course_id', '3': 1, '4': 1, '5': 13, '10': 'courseId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'price', '3': 3, '4': 1, '5': 1, '10': 'price'},
    {'1': 'commission_percent', '3': 4, '4': 1, '5': 1, '10': 'commissionPercent'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'notes', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
    {'1': 'parent_course_id', '3': 7, '4': 1, '5': 13, '9': 2, '10': 'parentCourseId', '17': true},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_notes'},
    {'1': '_parent_course_id'},
  ],
};

/// Descriptor for `TrainingCourse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingCourseDescriptor = $convert.base64Decode(
    'Cg5UcmFpbmluZ0NvdXJzZRIbCgljb3Vyc2VfaWQYASABKA1SCGNvdXJzZUlkEhIKBG5hbWUYAi'
    'ABKAlSBG5hbWUSFAoFcHJpY2UYAyABKAFSBXByaWNlEi0KEmNvbW1pc3Npb25fcGVyY2VudBgE'
    'IAEoAVIRY29tbWlzc2lvblBlcmNlbnQSJQoLZGVzY3JpcHRpb24YBSABKAlIAFILZGVzY3JpcH'
    'Rpb26IAQESGQoFbm90ZXMYBiABKAlIAVIFbm90ZXOIAQESLQoQcGFyZW50X2NvdXJzZV9pZBgH'
    'IAEoDUgCUg5wYXJlbnRDb3Vyc2VJZIgBAUIOCgxfZGVzY3JpcHRpb25CCAoGX25vdGVzQhMKEV'
    '9wYXJlbnRfY291cnNlX2lk');

@$core.Deprecated('Use translationPriceListItemDescriptor instead')
const TranslationPriceListItem$json = {
  '1': 'TranslationPriceListItem',
  '2': [
    {'1': 'item_id', '3': 1, '4': 1, '5': 13, '10': 'itemId'},
    {'1': 'office_id', '3': 2, '4': 1, '5': 13, '10': 'officeId'},
    {'1': 'document_type_key', '3': 3, '4': 1, '5': 9, '10': 'documentTypeKey'},
    {'1': 'price_per_page', '3': 4, '4': 1, '5': 1, '10': 'pricePerPage'},
    {'1': 'currency_code', '3': 6, '4': 1, '5': 9, '10': 'currencyCode'},
    {'1': 'effective_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'effectiveDate'},
    {'1': 'expiry_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'expiryDate', '17': true},
  ],
  '8': [
    {'1': '_expiry_date'},
  ],
};

/// Descriptor for `TranslationPriceListItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List translationPriceListItemDescriptor = $convert.base64Decode(
    'ChhUcmFuc2xhdGlvblByaWNlTGlzdEl0ZW0SFwoHaXRlbV9pZBgBIAEoDVIGaXRlbUlkEhsKCW'
    '9mZmljZV9pZBgCIAEoDVIIb2ZmaWNlSWQSKgoRZG9jdW1lbnRfdHlwZV9rZXkYAyABKAlSD2Rv'
    'Y3VtZW50VHlwZUtleRIkCg5wcmljZV9wZXJfcGFnZRgEIAEoAVIMcHJpY2VQZXJQYWdlEiMKDW'
    'N1cnJlbmN5X2NvZGUYBiABKAlSDGN1cnJlbmN5Q29kZRJBCg5lZmZlY3RpdmVfZGF0ZRgHIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDWVmZmVjdGl2ZURhdGUSQAoLZXhwaXJ5X2'
    'RhdGUYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSCmV4cGlyeURhdGWIAQFC'
    'DgoMX2V4cGlyeV9kYXRl');

@$core.Deprecated('Use bankDescriptor instead')
const Bank$json = {
  '1': 'Bank',
  '2': [
    {'1': 'bank_id', '3': 1, '4': 1, '5': 13, '10': 'bankId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'address', '17': true},
    {'1': 'contact_person', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'contactPerson', '17': true},
    {'1': 'account_opening_commission', '3': 5, '4': 1, '5': 1, '9': 2, '10': 'accountOpeningCommission', '17': true},
    {'1': 'notes', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_address'},
    {'1': '_contact_person'},
    {'1': '_account_opening_commission'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `Bank`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bankDescriptor = $convert.base64Decode(
    'CgRCYW5rEhcKB2JhbmtfaWQYASABKA1SBmJhbmtJZBISCgRuYW1lGAIgASgJUgRuYW1lEh0KB2'
    'FkZHJlc3MYAyABKAlIAFIHYWRkcmVzc4gBARIqCg5jb250YWN0X3BlcnNvbhgEIAEoCUgBUg1j'
    'b250YWN0UGVyc29uiAEBEkEKGmFjY291bnRfb3BlbmluZ19jb21taXNzaW9uGAUgASgBSAJSGG'
    'FjY291bnRPcGVuaW5nQ29tbWlzc2lvbogBARIZCgVub3RlcxgGIAEoCUgDUgVub3Rlc4gBAUIK'
    'CghfYWRkcmVzc0IRCg9fY29udGFjdF9wZXJzb25CHQobX2FjY291bnRfb3BlbmluZ19jb21taX'
    'NzaW9uQggKBl9ub3Rlcw==');

@$core.Deprecated('Use interactionDescriptor instead')
const Interaction$json = {
  '1': 'Interaction',
  '2': [
    {'1': 'interaction_id', '3': 1, '4': 1, '5': 13, '10': 'interactionId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'manager_id', '3': 3, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.proto.InteractionType', '10': 'type'},
    {'1': 'interaction_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'interactionDate'},
    {'1': 'summary', '3': 6, '4': 1, '5': 9, '10': 'summary'},
    {'1': 'notes', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_notes'},
  ],
};

/// Descriptor for `Interaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List interactionDescriptor = $convert.base64Decode(
    'CgtJbnRlcmFjdGlvbhIlCg5pbnRlcmFjdGlvbl9pZBgBIAEoDVINaW50ZXJhY3Rpb25JZBIbCg'
    'ljbGllbnRfaWQYAiABKA1SCGNsaWVudElkEh0KCm1hbmFnZXJfaWQYAyABKA1SCW1hbmFnZXJJ'
    'ZBIqCgR0eXBlGAQgASgOMhYucHJvdG8uSW50ZXJhY3Rpb25UeXBlUgR0eXBlEkUKEGludGVyYW'
    'N0aW9uX2RhdGUYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg9pbnRlcmFjdGlv'
    'bkRhdGUSGAoHc3VtbWFyeRgGIAEoCVIHc3VtbWFyeRIZCgVub3RlcxgHIAEoCUgAUgVub3Rlc4'
    'gBAUIICgZfbm90ZXM=');

@$core.Deprecated('Use paymentDescriptor instead')
const Payment$json = {
  '1': 'Payment',
  '2': [
    {'1': 'payment_id', '3': 1, '4': 1, '5': 13, '10': 'paymentId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'related_entity_id', '3': 3, '4': 1, '5': 13, '10': 'relatedEntityId'},
    {'1': 'service_category', '3': 4, '4': 1, '5': 14, '6': '.proto.ServiceCategory', '10': 'serviceCategory'},
    {'1': 'amount', '3': 5, '4': 1, '5': 1, '10': 'amount'},
    {'1': 'currency_code', '3': 6, '4': 1, '5': 9, '10': 'currencyCode'},
    {'1': 'payment_method', '3': 7, '4': 1, '5': 14, '6': '.proto.PaymentMethod', '10': 'paymentMethod'},
    {'1': 'payment_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'paymentDate'},
    {'1': 'transaction_reference', '3': 9, '4': 1, '5': 9, '9': 0, '10': 'transactionReference', '17': true},
    {'1': 'status', '3': 10, '4': 1, '5': 14, '6': '.proto.Status', '10': 'status'},
    {'1': 'notes', '3': 11, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_transaction_reference'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode(
    'CgdQYXltZW50Eh0KCnBheW1lbnRfaWQYASABKA1SCXBheW1lbnRJZBIbCgljbGllbnRfaWQYAi'
    'ABKA1SCGNsaWVudElkEioKEXJlbGF0ZWRfZW50aXR5X2lkGAMgASgNUg9yZWxhdGVkRW50aXR5'
    'SWQSQQoQc2VydmljZV9jYXRlZ29yeRgEIAEoDjIWLnByb3RvLlNlcnZpY2VDYXRlZ29yeVIPc2'
    'VydmljZUNhdGVnb3J5EhYKBmFtb3VudBgFIAEoAVIGYW1vdW50EiMKDWN1cnJlbmN5X2NvZGUY'
    'BiABKAlSDGN1cnJlbmN5Q29kZRI7Cg5wYXltZW50X21ldGhvZBgHIAEoDjIULnByb3RvLlBheW'
    '1lbnRNZXRob2RSDXBheW1lbnRNZXRob2QSPQoMcGF5bWVudF9kYXRlGAggASgLMhouZ29vZ2xl'
    'LnByb3RvYnVmLlRpbWVzdGFtcFILcGF5bWVudERhdGUSOAoVdHJhbnNhY3Rpb25fcmVmZXJlbm'
    'NlGAkgASgJSABSFHRyYW5zYWN0aW9uUmVmZXJlbmNliAEBEiUKBnN0YXR1cxgKIAEoDjINLnBy'
    'b3RvLlN0YXR1c1IGc3RhdHVzEhkKBW5vdGVzGAsgASgJSAFSBW5vdGVziAEBQhgKFl90cmFuc2'
    'FjdGlvbl9yZWZlcmVuY2VCCAoGX25vdGVz');

@$core.Deprecated('Use financialReportItemDescriptor instead')
const FinancialReportItem$json = {
  '1': 'FinancialReportItem',
  '2': [
    {'1': 'item_id', '3': 1, '4': 1, '5': 13, '10': 'itemId'},
    {'1': 'service_category', '3': 2, '4': 1, '5': 14, '6': '.proto.ServiceCategory', '10': 'serviceCategory'},
    {'1': 'item_description', '3': 3, '4': 1, '5': 9, '10': 'itemDescription'},
    {'1': 'client_id', '3': 4, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'client_name', '3': 5, '4': 1, '5': 9, '10': 'clientName'},
    {'1': 'manager_id', '3': 6, '4': 1, '5': 13, '10': 'managerId'},
    {'1': 'manager_name', '3': 7, '4': 1, '5': 9, '10': 'managerName'},
    {'1': 'item_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'itemDate'},
    {'1': 'due_date', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'dueDate', '17': true},
    {'1': 'planned_amount', '3': 10, '4': 1, '5': 1, '10': 'plannedAmount'},
    {'1': 'actual_amount_received', '3': 11, '4': 1, '5': 1, '9': 1, '10': 'actualAmountReceived', '17': true},
    {'1': 'payment_date', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'paymentDate', '17': true},
    {'1': 'payment_status', '3': 13, '4': 1, '5': 14, '6': '.proto.ReportPaymentStatus', '10': 'paymentStatus'},
    {'1': 'currency_code', '3': 14, '4': 1, '5': 9, '10': 'currencyCode'},
    {'1': 'notes', '3': 15, '4': 1, '5': 9, '9': 3, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_due_date'},
    {'1': '_actual_amount_received'},
    {'1': '_payment_date'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `FinancialReportItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List financialReportItemDescriptor = $convert.base64Decode(
    'ChNGaW5hbmNpYWxSZXBvcnRJdGVtEhcKB2l0ZW1faWQYASABKA1SBml0ZW1JZBJBChBzZXJ2aW'
    'NlX2NhdGVnb3J5GAIgASgOMhYucHJvdG8uU2VydmljZUNhdGVnb3J5Ug9zZXJ2aWNlQ2F0ZWdv'
    'cnkSKQoQaXRlbV9kZXNjcmlwdGlvbhgDIAEoCVIPaXRlbURlc2NyaXB0aW9uEhsKCWNsaWVudF'
    '9pZBgEIAEoDVIIY2xpZW50SWQSHwoLY2xpZW50X25hbWUYBSABKAlSCmNsaWVudE5hbWUSHQoK'
    'bWFuYWdlcl9pZBgGIAEoDVIJbWFuYWdlcklkEiEKDG1hbmFnZXJfbmFtZRgHIAEoCVILbWFuYW'
    'dlck5hbWUSNwoJaXRlbV9kYXRlGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFII'
    'aXRlbURhdGUSOgoIZHVlX2RhdGUYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSA'
    'BSB2R1ZURhdGWIAQESJQoOcGxhbm5lZF9hbW91bnQYCiABKAFSDXBsYW5uZWRBbW91bnQSOQoW'
    'YWN0dWFsX2Ftb3VudF9yZWNlaXZlZBgLIAEoAUgBUhRhY3R1YWxBbW91bnRSZWNlaXZlZIgBAR'
    'JCCgxwYXltZW50X2RhdGUYDCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAJSC3Bh'
    'eW1lbnREYXRliAEBEkEKDnBheW1lbnRfc3RhdHVzGA0gASgOMhoucHJvdG8uUmVwb3J0UGF5bW'
    'VudFN0YXR1c1INcGF5bWVudFN0YXR1cxIjCg1jdXJyZW5jeV9jb2RlGA4gASgJUgxjdXJyZW5j'
    'eUNvZGUSGQoFbm90ZXMYDyABKAlIA1IFbm90ZXOIAQFCCwoJX2R1ZV9kYXRlQhkKF19hY3R1YW'
    'xfYW1vdW50X3JlY2VpdmVkQg8KDV9wYXltZW50X2RhdGVCCAoGX25vdGVz');

@$core.Deprecated('Use getFinancialReportRequestDescriptor instead')
const GetFinancialReportRequest$json = {
  '1': 'GetFinancialReportRequest',
  '2': [
    {'1': 'start_date', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startDate'},
    {'1': 'end_date', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endDate'},
    {'1': 'service_categories', '3': 3, '4': 3, '5': 14, '6': '.proto.ServiceCategory', '10': 'serviceCategories'},
    {'1': 'manager_id_filter', '3': 4, '4': 1, '5': 13, '9': 0, '10': 'managerIdFilter', '17': true},
    {'1': 'client_id_filter', '3': 5, '4': 1, '5': 13, '9': 1, '10': 'clientIdFilter', '17': true},
    {'1': 'page_size', '3': 6, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 7, '4': 1, '5': 9, '10': 'pageToken'},
  ],
  '8': [
    {'1': '_manager_id_filter'},
    {'1': '_client_id_filter'},
  ],
};

/// Descriptor for `GetFinancialReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFinancialReportRequestDescriptor = $convert.base64Decode(
    'ChlHZXRGaW5hbmNpYWxSZXBvcnRSZXF1ZXN0EjkKCnN0YXJ0X2RhdGUYASABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUglzdGFydERhdGUSNQoIZW5kX2RhdGUYAiABKAsyGi5nb29n'
    'bGUucHJvdG9idWYuVGltZXN0YW1wUgdlbmREYXRlEkUKEnNlcnZpY2VfY2F0ZWdvcmllcxgDIA'
    'MoDjIWLnByb3RvLlNlcnZpY2VDYXRlZ29yeVIRc2VydmljZUNhdGVnb3JpZXMSLwoRbWFuYWdl'
    'cl9pZF9maWx0ZXIYBCABKA1IAFIPbWFuYWdlcklkRmlsdGVyiAEBEi0KEGNsaWVudF9pZF9maW'
    'x0ZXIYBSABKA1IAVIOY2xpZW50SWRGaWx0ZXKIAQESGwoJcGFnZV9zaXplGAYgASgFUghwYWdl'
    'U2l6ZRIdCgpwYWdlX3Rva2VuGAcgASgJUglwYWdlVG9rZW5CFAoSX21hbmFnZXJfaWRfZmlsdG'
    'VyQhMKEV9jbGllbnRfaWRfZmlsdGVy');

@$core.Deprecated('Use getFinancialReportResponseDescriptor instead')
const GetFinancialReportResponse$json = {
  '1': 'GetFinancialReportResponse',
  '2': [
    {'1': 'total_planned_amount', '3': 1, '4': 1, '5': 1, '10': 'totalPlannedAmount'},
    {'1': 'total_actual_amount_received', '3': 2, '4': 1, '5': 1, '10': 'totalActualAmountReceived'},
    {'1': 'total_items', '3': 3, '4': 1, '5': 5, '10': 'totalItems'},
    {'1': 'report_items', '3': 4, '4': 3, '5': 11, '6': '.proto.FinancialReportItem', '10': 'reportItems'},
    {'1': 'next_page_token', '3': 5, '4': 1, '5': 9, '10': 'nextPageToken'},
    {'1': 'currency_code', '3': 6, '4': 1, '5': 9, '10': 'currencyCode'},
  ],
};

/// Descriptor for `GetFinancialReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFinancialReportResponseDescriptor = $convert.base64Decode(
    'ChpHZXRGaW5hbmNpYWxSZXBvcnRSZXNwb25zZRIwChR0b3RhbF9wbGFubmVkX2Ftb3VudBgBIA'
    'EoAVISdG90YWxQbGFubmVkQW1vdW50Ej8KHHRvdGFsX2FjdHVhbF9hbW91bnRfcmVjZWl2ZWQY'
    'AiABKAFSGXRvdGFsQWN0dWFsQW1vdW50UmVjZWl2ZWQSHwoLdG90YWxfaXRlbXMYAyABKAVSCn'
    'RvdGFsSXRlbXMSPQoMcmVwb3J0X2l0ZW1zGAQgAygLMhoucHJvdG8uRmluYW5jaWFsUmVwb3J0'
    'SXRlbVILcmVwb3J0SXRlbXMSJgoPbmV4dF9wYWdlX3Rva2VuGAUgASgJUg1uZXh0UGFnZVRva2'
    'VuEiMKDWN1cnJlbmN5X2NvZGUYBiABKAlSDGN1cnJlbmN5Q29kZQ==');

@$core.Deprecated('Use createClientRequestDescriptor instead')
const CreateClientRequest$json = {
  '1': 'CreateClientRequest',
  '2': [
    {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.proto.Client', '10': 'client'},
    {'1': 'telegram_id', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'telegramId', '17': true},
  ],
  '8': [
    {'1': '_telegram_id'},
  ],
};

/// Descriptor for `CreateClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createClientRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVDbGllbnRSZXF1ZXN0EiUKBmNsaWVudBgBIAEoCzINLnByb3RvLkNsaWVudFIGY2'
    'xpZW50EiQKC3RlbGVncmFtX2lkGAIgASgDSABSCnRlbGVncmFtSWSIAQFCDgoMX3RlbGVncmFt'
    'X2lk');

@$core.Deprecated('Use createClientResponseDescriptor instead')
const CreateClientResponse$json = {
  '1': 'CreateClientResponse',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 13, '10': 'clientId'},
  ],
};

/// Descriptor for `CreateClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createClientResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVDbGllbnRSZXNwb25zZRIbCgljbGllbnRfaWQYASABKA1SCGNsaWVudElk');

@$core.Deprecated('Use getClientRequestDescriptor instead')
const GetClientRequest$json = {
  '1': 'GetClientRequest',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 13, '10': 'clientId'},
  ],
};

/// Descriptor for `GetClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClientRequestDescriptor = $convert.base64Decode(
    'ChBHZXRDbGllbnRSZXF1ZXN0EhsKCWNsaWVudF9pZBgBIAEoDVIIY2xpZW50SWQ=');

@$core.Deprecated('Use getClientResponseDescriptor instead')
const GetClientResponse$json = {
  '1': 'GetClientResponse',
  '2': [
    {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.proto.Client', '10': 'client'},
  ],
};

/// Descriptor for `GetClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getClientResponseDescriptor = $convert.base64Decode(
    'ChFHZXRDbGllbnRSZXNwb25zZRIlCgZjbGllbnQYASABKAsyDS5wcm90by5DbGllbnRSBmNsaW'
    'VudA==');

@$core.Deprecated('Use updateClientRequestDescriptor instead')
const UpdateClientRequest$json = {
  '1': 'UpdateClientRequest',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 13, '10': 'clientId'},
    {'1': 'client_data', '3': 2, '4': 1, '5': 11, '6': '.proto.Client', '10': 'clientData'},
    {'1': 'telegram_id', '3': 3, '4': 1, '5': 3, '9': 0, '10': 'telegramId', '17': true},
  ],
  '8': [
    {'1': '_telegram_id'},
  ],
};

/// Descriptor for `UpdateClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateClientRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVDbGllbnRSZXF1ZXN0EhsKCWNsaWVudF9pZBgBIAEoDVIIY2xpZW50SWQSLgoLY2'
    'xpZW50X2RhdGEYAiABKAsyDS5wcm90by5DbGllbnRSCmNsaWVudERhdGESJAoLdGVsZWdyYW1f'
    'aWQYAyABKANIAFIKdGVsZWdyYW1JZIgBAUIOCgxfdGVsZWdyYW1faWQ=');

@$core.Deprecated('Use updateClientResponseDescriptor instead')
const UpdateClientResponse$json = {
  '1': 'UpdateClientResponse',
  '2': [
    {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.proto.Client', '10': 'client'},
  ],
};

/// Descriptor for `UpdateClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateClientResponseDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDbGllbnRSZXNwb25zZRIlCgZjbGllbnQYASABKAsyDS5wcm90by5DbGllbnRSBm'
    'NsaWVudA==');

@$core.Deprecated('Use deleteClientRequestDescriptor instead')
const DeleteClientRequest$json = {
  '1': 'DeleteClientRequest',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 13, '10': 'clientId'},
  ],
};

/// Descriptor for `DeleteClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteClientRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVDbGllbnRSZXF1ZXN0EhsKCWNsaWVudF9pZBgBIAEoDVIIY2xpZW50SWQ=');

@$core.Deprecated('Use deleteClientResponseDescriptor instead')
const DeleteClientResponse$json = {
  '1': 'DeleteClientResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteClientResponseDescriptor = $convert.base64Decode(
    'ChREZWxldGVDbGllbnRSZXNwb25zZRIyCghyZXNwb25zZRgBIAEoCzIWLmdvb2dsZS5wcm90b2'
    'J1Zi5FbXB0eVIIcmVzcG9uc2U=');

@$core.Deprecated('Use listClientsRequestDescriptor instead')
const ListClientsRequest$json = {
  '1': 'ListClientsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListClientsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listClientsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0Q2xpZW50c1JlcXVlc3QSGwoJcGFnZV9zaXplGAEgASgFUghwYWdlU2l6ZRIdCgpwYW'
    'dlX3Rva2VuGAIgASgJUglwYWdlVG9rZW4=');

@$core.Deprecated('Use listClientsResponseDescriptor instead')
const ListClientsResponse$json = {
  '1': 'ListClientsResponse',
  '2': [
    {'1': 'clients', '3': 1, '4': 3, '5': 11, '6': '.proto.Client', '10': 'clients'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListClientsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listClientsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0Q2xpZW50c1Jlc3BvbnNlEicKB2NsaWVudHMYASADKAsyDS5wcm90by5DbGllbnRSB2'
    'NsaWVudHMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');

@$core.Deprecated('Use createEmployeeRequestDescriptor instead')
const CreateEmployeeRequest$json = {
  '1': 'CreateEmployeeRequest',
  '2': [
    {'1': 'employee', '3': 1, '4': 1, '5': 11, '6': '.proto.Employee', '10': 'employee'},
    {'1': 'user_login', '3': 2, '4': 1, '5': 9, '10': 'userLogin'},
    {'1': 'user_password', '3': 3, '4': 1, '5': 9, '10': 'userPassword'},
    {'1': 'telegram_id', '3': 4, '4': 1, '5': 3, '9': 0, '10': 'telegramId', '17': true},
  ],
  '8': [
    {'1': '_telegram_id'},
  ],
};

/// Descriptor for `CreateEmployeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEmployeeRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVFbXBsb3llZVJlcXVlc3QSKwoIZW1wbG95ZWUYASABKAsyDy5wcm90by5FbXBsb3'
    'llZVIIZW1wbG95ZWUSHQoKdXNlcl9sb2dpbhgCIAEoCVIJdXNlckxvZ2luEiMKDXVzZXJfcGFz'
    'c3dvcmQYAyABKAlSDHVzZXJQYXNzd29yZBIkCgt0ZWxlZ3JhbV9pZBgEIAEoA0gAUgp0ZWxlZ3'
    'JhbUlkiAEBQg4KDF90ZWxlZ3JhbV9pZA==');

@$core.Deprecated('Use createEmployeeResponseDescriptor instead')
const CreateEmployeeResponse$json = {
  '1': 'CreateEmployeeResponse',
  '2': [
    {'1': 'employee_id', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 13, '10': 'userId'},
  ],
};

/// Descriptor for `CreateEmployeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEmployeeResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVFbXBsb3llZVJlc3BvbnNlEh8KC2VtcGxveWVlX2lkGAEgASgNUgplbXBsb3llZU'
    'lkEhcKB3VzZXJfaWQYAiABKA1SBnVzZXJJZA==');

@$core.Deprecated('Use getEmployeeRequestDescriptor instead')
const GetEmployeeRequest$json = {
  '1': 'GetEmployeeRequest',
  '2': [
    {'1': 'employee_id', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
  ],
};

/// Descriptor for `GetEmployeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEmployeeRequestDescriptor = $convert.base64Decode(
    'ChJHZXRFbXBsb3llZVJlcXVlc3QSHwoLZW1wbG95ZWVfaWQYASABKA1SCmVtcGxveWVlSWQ=');

@$core.Deprecated('Use getEmployeeResponseDescriptor instead')
const GetEmployeeResponse$json = {
  '1': 'GetEmployeeResponse',
  '2': [
    {'1': 'employee', '3': 1, '4': 1, '5': 11, '6': '.proto.Employee', '10': 'employee'},
  ],
};

/// Descriptor for `GetEmployeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEmployeeResponseDescriptor = $convert.base64Decode(
    'ChNHZXRFbXBsb3llZVJlc3BvbnNlEisKCGVtcGxveWVlGAEgASgLMg8ucHJvdG8uRW1wbG95ZW'
    'VSCGVtcGxveWVl');

@$core.Deprecated('Use updateEmployeeRequestDescriptor instead')
const UpdateEmployeeRequest$json = {
  '1': 'UpdateEmployeeRequest',
  '2': [
    {'1': 'employee_id', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
    {'1': 'employee_data', '3': 2, '4': 1, '5': 11, '6': '.proto.Employee', '10': 'employeeData'},
    {'1': 'telegram_id', '3': 3, '4': 1, '5': 3, '9': 0, '10': 'telegramId', '17': true},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'password', '17': true},
  ],
  '8': [
    {'1': '_telegram_id'},
    {'1': '_password'},
  ],
};

/// Descriptor for `UpdateEmployeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEmployeeRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVFbXBsb3llZVJlcXVlc3QSHwoLZW1wbG95ZWVfaWQYASABKA1SCmVtcGxveWVlSW'
    'QSNAoNZW1wbG95ZWVfZGF0YRgCIAEoCzIPLnByb3RvLkVtcGxveWVlUgxlbXBsb3llZURhdGES'
    'JAoLdGVsZWdyYW1faWQYAyABKANIAFIKdGVsZWdyYW1JZIgBARIfCghwYXNzd29yZBgEIAEoCU'
    'gBUghwYXNzd29yZIgBAUIOCgxfdGVsZWdyYW1faWRCCwoJX3Bhc3N3b3Jk');

@$core.Deprecated('Use updateEmployeeResponseDescriptor instead')
const UpdateEmployeeResponse$json = {
  '1': 'UpdateEmployeeResponse',
  '2': [
    {'1': 'employee', '3': 1, '4': 1, '5': 11, '6': '.proto.Employee', '10': 'employee'},
  ],
};

/// Descriptor for `UpdateEmployeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEmployeeResponseDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVFbXBsb3llZVJlc3BvbnNlEisKCGVtcGxveWVlGAEgASgLMg8ucHJvdG8uRW1wbG'
    '95ZWVSCGVtcGxveWVl');

@$core.Deprecated('Use deleteEmployeeRequestDescriptor instead')
const DeleteEmployeeRequest$json = {
  '1': 'DeleteEmployeeRequest',
  '2': [
    {'1': 'employee_id', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
  ],
};

/// Descriptor for `DeleteEmployeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEmployeeRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVFbXBsb3llZVJlcXVlc3QSHwoLZW1wbG95ZWVfaWQYASABKA1SCmVtcGxveWVlSW'
    'Q=');

@$core.Deprecated('Use deleteEmployeeResponseDescriptor instead')
const DeleteEmployeeResponse$json = {
  '1': 'DeleteEmployeeResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteEmployeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEmployeeResponseDescriptor = $convert.base64Decode(
    'ChZEZWxldGVFbXBsb3llZVJlc3BvbnNlEjIKCHJlc3BvbnNlGAEgASgLMhYuZ29vZ2xlLnByb3'
    'RvYnVmLkVtcHR5UghyZXNwb25zZQ==');

@$core.Deprecated('Use listEmployeesRequestDescriptor instead')
const ListEmployeesRequest$json = {
  '1': 'ListEmployeesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListEmployeesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEmployeesRequestDescriptor = $convert.base64Decode(
    'ChRMaXN0RW1wbG95ZWVzUmVxdWVzdBIbCglwYWdlX3NpemUYASABKAVSCHBhZ2VTaXplEh0KCn'
    'BhZ2VfdG9rZW4YAiABKAlSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use listEmployeesResponseDescriptor instead')
const ListEmployeesResponse$json = {
  '1': 'ListEmployeesResponse',
  '2': [
    {'1': 'employees', '3': 1, '4': 3, '5': 11, '6': '.proto.Employee', '10': 'employees'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListEmployeesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEmployeesResponseDescriptor = $convert.base64Decode(
    'ChVMaXN0RW1wbG95ZWVzUmVzcG9uc2USLQoJZW1wbG95ZWVzGAEgAygLMg8ucHJvdG8uRW1wbG'
    '95ZWVSCWVtcGxveWVlcxImCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlSDW5leHRQYWdlVG9rZW4=');

@$core.Deprecated('Use getSelfProfileRequestDescriptor instead')
const GetSelfProfileRequest$json = {
  '1': 'GetSelfProfileRequest',
};

/// Descriptor for `GetSelfProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSelfProfileRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTZWxmUHJvZmlsZVJlcXVlc3Q=');

@$core.Deprecated('Use getSelfProfileResponseDescriptor instead')
const GetSelfProfileResponse$json = {
  '1': 'GetSelfProfileResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.User', '10': 'user'},
    {'1': 'employee', '3': 2, '4': 1, '5': 11, '6': '.proto.Employee', '10': 'employee'},
  ],
};

/// Descriptor for `GetSelfProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSelfProfileResponseDescriptor = $convert.base64Decode(
    'ChZHZXRTZWxmUHJvZmlsZVJlc3BvbnNlEh8KBHVzZXIYASABKAsyCy5wcm90by5Vc2VyUgR1c2'
    'VyEisKCGVtcGxveWVlGAIgASgLMg8ucHJvdG8uRW1wbG95ZWVSCGVtcGxveWVl');

@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = {
  '1': 'CreateUserRequest',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.User', '10': 'user'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVc2VyUmVxdWVzdBIfCgR1c2VyGAEgASgLMgsucHJvdG8uVXNlclIEdXNlchIaCg'
    'hwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = {
  '1': 'CreateUserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 13, '10': 'userId'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVVc2VyUmVzcG9uc2USFwoHdXNlcl9pZBgBIAEoDVIGdXNlcklk');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 13, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgNUgZ1c2VySWQ=');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.User', '10': 'user'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USHwoEdXNlchgBIAEoCzILLnByb3RvLlVzZXJSBHVzZXI=');

@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = {
  '1': 'UpdateUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'user_data', '3': 2, '4': 1, '5': 11, '6': '.proto.User', '10': 'userData'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgNUgZ1c2VySWQSKAoJdXNlcl9kYX'
    'RhGAIgASgLMgsucHJvdG8uVXNlclIIdXNlckRhdGE=');

@$core.Deprecated('Use updateUserResponseDescriptor instead')
const UpdateUserResponse$json = {
  '1': 'UpdateUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.User', '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResponseDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVVc2VyUmVzcG9uc2USHwoEdXNlchgBIAEoCzILLnByb3RvLlVzZXJSBHVzZXI=');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 13, '10': 'userId'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgNUgZ1c2VySWQ=');

@$core.Deprecated('Use deleteUserResponseDescriptor instead')
const DeleteUserResponse$json = {
  '1': 'DeleteUserResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVVc2VyUmVzcG9uc2USMgoIcmVzcG9uc2UYASABKAsyFi5nb29nbGUucHJvdG9idW'
    'YuRW1wdHlSCHJlc3BvbnNl');

@$core.Deprecated('Use listUsersRequestDescriptor instead')
const ListUsersRequest$json = {
  '1': 'ListUsersRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VXNlcnNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZVNpemUSHQoKcGFnZV'
    '90b2tlbhgCIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listUsersResponseDescriptor instead')
const ListUsersResponse$json = {
  '1': 'ListUsersResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.proto.User', '10': 'users'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VXNlcnNSZXNwb25zZRIhCgV1c2VycxgBIAMoCzILLnByb3RvLlVzZXJSBXVzZXJzEi'
    'YKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createOfficeRequestDescriptor instead')
const CreateOfficeRequest$json = {
  '1': 'CreateOfficeRequest',
  '2': [
    {'1': 'office', '3': 1, '4': 1, '5': 11, '6': '.proto.Office', '10': 'office'},
  ],
};

/// Descriptor for `CreateOfficeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOfficeRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVPZmZpY2VSZXF1ZXN0EiUKBm9mZmljZRgBIAEoCzINLnByb3RvLk9mZmljZVIGb2'
    'ZmaWNl');

@$core.Deprecated('Use createOfficeResponseDescriptor instead')
const CreateOfficeResponse$json = {
  '1': 'CreateOfficeResponse',
  '2': [
    {'1': 'office_id', '3': 1, '4': 1, '5': 13, '10': 'officeId'},
  ],
};

/// Descriptor for `CreateOfficeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOfficeResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVPZmZpY2VSZXNwb25zZRIbCglvZmZpY2VfaWQYASABKA1SCG9mZmljZUlk');

@$core.Deprecated('Use getOfficeRequestDescriptor instead')
const GetOfficeRequest$json = {
  '1': 'GetOfficeRequest',
  '2': [
    {'1': 'office_id', '3': 1, '4': 1, '5': 13, '10': 'officeId'},
  ],
};

/// Descriptor for `GetOfficeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOfficeRequestDescriptor = $convert.base64Decode(
    'ChBHZXRPZmZpY2VSZXF1ZXN0EhsKCW9mZmljZV9pZBgBIAEoDVIIb2ZmaWNlSWQ=');

@$core.Deprecated('Use getOfficeResponseDescriptor instead')
const GetOfficeResponse$json = {
  '1': 'GetOfficeResponse',
  '2': [
    {'1': 'office', '3': 1, '4': 1, '5': 11, '6': '.proto.Office', '10': 'office'},
  ],
};

/// Descriptor for `GetOfficeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOfficeResponseDescriptor = $convert.base64Decode(
    'ChFHZXRPZmZpY2VSZXNwb25zZRIlCgZvZmZpY2UYASABKAsyDS5wcm90by5PZmZpY2VSBm9mZm'
    'ljZQ==');

@$core.Deprecated('Use updateOfficeRequestDescriptor instead')
const UpdateOfficeRequest$json = {
  '1': 'UpdateOfficeRequest',
  '2': [
    {'1': 'office_id', '3': 1, '4': 1, '5': 13, '10': 'officeId'},
    {'1': 'office_data', '3': 2, '4': 1, '5': 11, '6': '.proto.Office', '10': 'officeData'},
  ],
};

/// Descriptor for `UpdateOfficeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOfficeRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVPZmZpY2VSZXF1ZXN0EhsKCW9mZmljZV9pZBgBIAEoDVIIb2ZmaWNlSWQSLgoLb2'
    'ZmaWNlX2RhdGEYAiABKAsyDS5wcm90by5PZmZpY2VSCm9mZmljZURhdGE=');

@$core.Deprecated('Use updateOfficeResponseDescriptor instead')
const UpdateOfficeResponse$json = {
  '1': 'UpdateOfficeResponse',
  '2': [
    {'1': 'office', '3': 1, '4': 1, '5': 11, '6': '.proto.Office', '10': 'office'},
  ],
};

/// Descriptor for `UpdateOfficeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOfficeResponseDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVPZmZpY2VSZXNwb25zZRIlCgZvZmZpY2UYASABKAsyDS5wcm90by5PZmZpY2VSBm'
    '9mZmljZQ==');

@$core.Deprecated('Use deleteOfficeRequestDescriptor instead')
const DeleteOfficeRequest$json = {
  '1': 'DeleteOfficeRequest',
  '2': [
    {'1': 'office_id', '3': 1, '4': 1, '5': 13, '10': 'officeId'},
  ],
};

/// Descriptor for `DeleteOfficeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOfficeRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVPZmZpY2VSZXF1ZXN0EhsKCW9mZmljZV9pZBgBIAEoDVIIb2ZmaWNlSWQ=');

@$core.Deprecated('Use deleteOfficeResponseDescriptor instead')
const DeleteOfficeResponse$json = {
  '1': 'DeleteOfficeResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteOfficeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOfficeResponseDescriptor = $convert.base64Decode(
    'ChREZWxldGVPZmZpY2VSZXNwb25zZRIyCghyZXNwb25zZRgBIAEoCzIWLmdvb2dsZS5wcm90b2'
    'J1Zi5FbXB0eVIIcmVzcG9uc2U=');

@$core.Deprecated('Use listOfficesRequestDescriptor instead')
const ListOfficesRequest$json = {
  '1': 'ListOfficesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListOfficesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOfficesRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0T2ZmaWNlc1JlcXVlc3QSGwoJcGFnZV9zaXplGAEgASgFUghwYWdlU2l6ZRIdCgpwYW'
    'dlX3Rva2VuGAIgASgJUglwYWdlVG9rZW4=');

@$core.Deprecated('Use listOfficesResponseDescriptor instead')
const ListOfficesResponse$json = {
  '1': 'ListOfficesResponse',
  '2': [
    {'1': 'offices', '3': 1, '4': 3, '5': 11, '6': '.proto.Office', '10': 'offices'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListOfficesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOfficesResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0T2ZmaWNlc1Jlc3BvbnNlEicKB29mZmljZXMYASADKAsyDS5wcm90by5PZmZpY2VSB2'
    '9mZmljZXMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');

@$core.Deprecated('Use createLegalCaseRequestDescriptor instead')
const CreateLegalCaseRequest$json = {
  '1': 'CreateLegalCaseRequest',
  '2': [
    {'1': 'legal_case', '3': 1, '4': 1, '5': 11, '6': '.proto.LegalCase', '10': 'legalCase'},
  ],
};

/// Descriptor for `CreateLegalCaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLegalCaseRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVMZWdhbENhc2VSZXF1ZXN0Ei8KCmxlZ2FsX2Nhc2UYASABKAsyEC5wcm90by5MZW'
    'dhbENhc2VSCWxlZ2FsQ2FzZQ==');

@$core.Deprecated('Use createLegalCaseResponseDescriptor instead')
const CreateLegalCaseResponse$json = {
  '1': 'CreateLegalCaseResponse',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 13, '10': 'caseId'},
  ],
};

/// Descriptor for `CreateLegalCaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLegalCaseResponseDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVMZWdhbENhc2VSZXNwb25zZRIXCgdjYXNlX2lkGAEgASgNUgZjYXNlSWQ=');

@$core.Deprecated('Use getLegalCaseRequestDescriptor instead')
const GetLegalCaseRequest$json = {
  '1': 'GetLegalCaseRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 13, '10': 'caseId'},
  ],
};

/// Descriptor for `GetLegalCaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLegalCaseRequestDescriptor = $convert.base64Decode(
    'ChNHZXRMZWdhbENhc2VSZXF1ZXN0EhcKB2Nhc2VfaWQYASABKA1SBmNhc2VJZA==');

@$core.Deprecated('Use getLegalCaseResponseDescriptor instead')
const GetLegalCaseResponse$json = {
  '1': 'GetLegalCaseResponse',
  '2': [
    {'1': 'legal_case', '3': 1, '4': 1, '5': 11, '6': '.proto.LegalCase', '10': 'legalCase'},
  ],
};

/// Descriptor for `GetLegalCaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLegalCaseResponseDescriptor = $convert.base64Decode(
    'ChRHZXRMZWdhbENhc2VSZXNwb25zZRIvCgpsZWdhbF9jYXNlGAEgASgLMhAucHJvdG8uTGVnYW'
    'xDYXNlUglsZWdhbENhc2U=');

@$core.Deprecated('Use updateLegalCaseRequestDescriptor instead')
const UpdateLegalCaseRequest$json = {
  '1': 'UpdateLegalCaseRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 13, '10': 'caseId'},
    {'1': 'case_data', '3': 2, '4': 1, '5': 11, '6': '.proto.LegalCase', '10': 'caseData'},
  ],
};

/// Descriptor for `UpdateLegalCaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLegalCaseRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVMZWdhbENhc2VSZXF1ZXN0EhcKB2Nhc2VfaWQYASABKA1SBmNhc2VJZBItCgljYX'
    'NlX2RhdGEYAiABKAsyEC5wcm90by5MZWdhbENhc2VSCGNhc2VEYXRh');

@$core.Deprecated('Use updateLegalCaseResponseDescriptor instead')
const UpdateLegalCaseResponse$json = {
  '1': 'UpdateLegalCaseResponse',
  '2': [
    {'1': 'legal_case', '3': 1, '4': 1, '5': 11, '6': '.proto.LegalCase', '10': 'legalCase'},
  ],
};

/// Descriptor for `UpdateLegalCaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLegalCaseResponseDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVMZWdhbENhc2VSZXNwb25zZRIvCgpsZWdhbF9jYXNlGAEgASgLMhAucHJvdG8uTG'
    'VnYWxDYXNlUglsZWdhbENhc2U=');

@$core.Deprecated('Use deleteLegalCaseRequestDescriptor instead')
const DeleteLegalCaseRequest$json = {
  '1': 'DeleteLegalCaseRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 13, '10': 'caseId'},
  ],
};

/// Descriptor for `DeleteLegalCaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLegalCaseRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVMZWdhbENhc2VSZXF1ZXN0EhcKB2Nhc2VfaWQYASABKA1SBmNhc2VJZA==');

@$core.Deprecated('Use deleteLegalCaseResponseDescriptor instead')
const DeleteLegalCaseResponse$json = {
  '1': 'DeleteLegalCaseResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteLegalCaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLegalCaseResponseDescriptor = $convert.base64Decode(
    'ChdEZWxldGVMZWdhbENhc2VSZXNwb25zZRIyCghyZXNwb25zZRgBIAEoCzIWLmdvb2dsZS5wcm'
    '90b2J1Zi5FbXB0eVIIcmVzcG9uc2U=');

@$core.Deprecated('Use listLegalCasesRequestDescriptor instead')
const ListLegalCasesRequest$json = {
  '1': 'ListLegalCasesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListLegalCasesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLegalCasesRequestDescriptor = $convert.base64Decode(
    'ChVMaXN0TGVnYWxDYXNlc1JlcXVlc3QSGwoJcGFnZV9zaXplGAEgASgFUghwYWdlU2l6ZRIdCg'
    'pwYWdlX3Rva2VuGAIgASgJUglwYWdlVG9rZW4=');

@$core.Deprecated('Use listLegalCasesResponseDescriptor instead')
const ListLegalCasesResponse$json = {
  '1': 'ListLegalCasesResponse',
  '2': [
    {'1': 'legal_cases', '3': 1, '4': 3, '5': 11, '6': '.proto.LegalCase', '10': 'legalCases'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListLegalCasesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLegalCasesResponseDescriptor = $convert.base64Decode(
    'ChZMaXN0TGVnYWxDYXNlc1Jlc3BvbnNlEjEKC2xlZ2FsX2Nhc2VzGAEgAygLMhAucHJvdG8uTG'
    'VnYWxDYXNlUgpsZWdhbENhc2VzEiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VU'
    'b2tlbg==');

@$core.Deprecated('Use createTranslationOrderRequestDescriptor instead')
const CreateTranslationOrderRequest$json = {
  '1': 'CreateTranslationOrderRequest',
  '2': [
    {'1': 'translation_order', '3': 1, '4': 1, '5': 11, '6': '.proto.TranslationOrder', '10': 'translationOrder'},
  ],
};

/// Descriptor for `CreateTranslationOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTranslationOrderRequestDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVUcmFuc2xhdGlvbk9yZGVyUmVxdWVzdBJEChF0cmFuc2xhdGlvbl9vcmRlchgBIA'
    'EoCzIXLnByb3RvLlRyYW5zbGF0aW9uT3JkZXJSEHRyYW5zbGF0aW9uT3JkZXI=');

@$core.Deprecated('Use createTranslationOrderResponseDescriptor instead')
const CreateTranslationOrderResponse$json = {
  '1': 'CreateTranslationOrderResponse',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
  ],
};

/// Descriptor for `CreateTranslationOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTranslationOrderResponseDescriptor = $convert.base64Decode(
    'Ch5DcmVhdGVUcmFuc2xhdGlvbk9yZGVyUmVzcG9uc2USGQoIb3JkZXJfaWQYASABKA1SB29yZG'
    'VySWQ=');

@$core.Deprecated('Use getTranslationOrderRequestDescriptor instead')
const GetTranslationOrderRequest$json = {
  '1': 'GetTranslationOrderRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
  ],
};

/// Descriptor for `GetTranslationOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTranslationOrderRequestDescriptor = $convert.base64Decode(
    'ChpHZXRUcmFuc2xhdGlvbk9yZGVyUmVxdWVzdBIZCghvcmRlcl9pZBgBIAEoDVIHb3JkZXJJZA'
    '==');

@$core.Deprecated('Use getTranslationOrderResponseDescriptor instead')
const GetTranslationOrderResponse$json = {
  '1': 'GetTranslationOrderResponse',
  '2': [
    {'1': 'translation_order', '3': 1, '4': 1, '5': 11, '6': '.proto.TranslationOrder', '10': 'translationOrder'},
  ],
};

/// Descriptor for `GetTranslationOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTranslationOrderResponseDescriptor = $convert.base64Decode(
    'ChtHZXRUcmFuc2xhdGlvbk9yZGVyUmVzcG9uc2USRAoRdHJhbnNsYXRpb25fb3JkZXIYASABKA'
    'syFy5wcm90by5UcmFuc2xhdGlvbk9yZGVyUhB0cmFuc2xhdGlvbk9yZGVy');

@$core.Deprecated('Use updateTranslationOrderRequestDescriptor instead')
const UpdateTranslationOrderRequest$json = {
  '1': 'UpdateTranslationOrderRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
    {'1': 'order_data', '3': 2, '4': 1, '5': 11, '6': '.proto.TranslationOrder', '10': 'orderData'},
  ],
};

/// Descriptor for `UpdateTranslationOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTranslationOrderRequestDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVUcmFuc2xhdGlvbk9yZGVyUmVxdWVzdBIZCghvcmRlcl9pZBgBIAEoDVIHb3JkZX'
    'JJZBI2CgpvcmRlcl9kYXRhGAIgASgLMhcucHJvdG8uVHJhbnNsYXRpb25PcmRlclIJb3JkZXJE'
    'YXRh');

@$core.Deprecated('Use updateTranslationOrderResponseDescriptor instead')
const UpdateTranslationOrderResponse$json = {
  '1': 'UpdateTranslationOrderResponse',
  '2': [
    {'1': 'translation_order', '3': 1, '4': 1, '5': 11, '6': '.proto.TranslationOrder', '10': 'translationOrder'},
  ],
};

/// Descriptor for `UpdateTranslationOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTranslationOrderResponseDescriptor = $convert.base64Decode(
    'Ch5VcGRhdGVUcmFuc2xhdGlvbk9yZGVyUmVzcG9uc2USRAoRdHJhbnNsYXRpb25fb3JkZXIYAS'
    'ABKAsyFy5wcm90by5UcmFuc2xhdGlvbk9yZGVyUhB0cmFuc2xhdGlvbk9yZGVy');

@$core.Deprecated('Use deleteTranslationOrderRequestDescriptor instead')
const DeleteTranslationOrderRequest$json = {
  '1': 'DeleteTranslationOrderRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
  ],
};

/// Descriptor for `DeleteTranslationOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTranslationOrderRequestDescriptor = $convert.base64Decode(
    'Ch1EZWxldGVUcmFuc2xhdGlvbk9yZGVyUmVxdWVzdBIZCghvcmRlcl9pZBgBIAEoDVIHb3JkZX'
    'JJZA==');

@$core.Deprecated('Use deleteTranslationOrderResponseDescriptor instead')
const DeleteTranslationOrderResponse$json = {
  '1': 'DeleteTranslationOrderResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteTranslationOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTranslationOrderResponseDescriptor = $convert.base64Decode(
    'Ch5EZWxldGVUcmFuc2xhdGlvbk9yZGVyUmVzcG9uc2USMgoIcmVzcG9uc2UYASABKAsyFi5nb2'
    '9nbGUucHJvdG9idWYuRW1wdHlSCHJlc3BvbnNl');

@$core.Deprecated('Use listTranslationOrdersRequestDescriptor instead')
const ListTranslationOrdersRequest$json = {
  '1': 'ListTranslationOrdersRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListTranslationOrdersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTranslationOrdersRequestDescriptor = $convert.base64Decode(
    'ChxMaXN0VHJhbnNsYXRpb25PcmRlcnNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZV'
    'NpemUSHQoKcGFnZV90b2tlbhgCIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listTranslationOrdersResponseDescriptor instead')
const ListTranslationOrdersResponse$json = {
  '1': 'ListTranslationOrdersResponse',
  '2': [
    {'1': 'translation_orders', '3': 1, '4': 3, '5': 11, '6': '.proto.TranslationOrder', '10': 'translationOrders'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListTranslationOrdersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTranslationOrdersResponseDescriptor = $convert.base64Decode(
    'Ch1MaXN0VHJhbnNsYXRpb25PcmRlcnNSZXNwb25zZRJGChJ0cmFuc2xhdGlvbl9vcmRlcnMYAS'
    'ADKAsyFy5wcm90by5UcmFuc2xhdGlvbk9yZGVyUhF0cmFuc2xhdGlvbk9yZGVycxImCg9uZXh0'
    'X3BhZ2VfdG9rZW4YAiABKAlSDW5leHRQYWdlVG9rZW4=');

@$core.Deprecated('Use createInsurancePolicyRequestDescriptor instead')
const CreateInsurancePolicyRequest$json = {
  '1': 'CreateInsurancePolicyRequest',
  '2': [
    {'1': 'insurance_policy', '3': 1, '4': 1, '5': 11, '6': '.proto.InsurancePolicy', '10': 'insurancePolicy'},
  ],
};

/// Descriptor for `CreateInsurancePolicyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInsurancePolicyRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVJbnN1cmFuY2VQb2xpY3lSZXF1ZXN0EkEKEGluc3VyYW5jZV9wb2xpY3kYASABKA'
    'syFi5wcm90by5JbnN1cmFuY2VQb2xpY3lSD2luc3VyYW5jZVBvbGljeQ==');

@$core.Deprecated('Use createInsurancePolicyResponseDescriptor instead')
const CreateInsurancePolicyResponse$json = {
  '1': 'CreateInsurancePolicyResponse',
  '2': [
    {'1': 'policy_id', '3': 1, '4': 1, '5': 13, '10': 'policyId'},
  ],
};

/// Descriptor for `CreateInsurancePolicyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInsurancePolicyResponseDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVJbnN1cmFuY2VQb2xpY3lSZXNwb25zZRIbCglwb2xpY3lfaWQYASABKA1SCHBvbG'
    'ljeUlk');

@$core.Deprecated('Use getInsurancePolicyRequestDescriptor instead')
const GetInsurancePolicyRequest$json = {
  '1': 'GetInsurancePolicyRequest',
  '2': [
    {'1': 'policy_id', '3': 1, '4': 1, '5': 13, '10': 'policyId'},
  ],
};

/// Descriptor for `GetInsurancePolicyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInsurancePolicyRequestDescriptor = $convert.base64Decode(
    'ChlHZXRJbnN1cmFuY2VQb2xpY3lSZXF1ZXN0EhsKCXBvbGljeV9pZBgBIAEoDVIIcG9saWN5SW'
    'Q=');

@$core.Deprecated('Use getInsurancePolicyResponseDescriptor instead')
const GetInsurancePolicyResponse$json = {
  '1': 'GetInsurancePolicyResponse',
  '2': [
    {'1': 'insurance_policy', '3': 1, '4': 1, '5': 11, '6': '.proto.InsurancePolicy', '10': 'insurancePolicy'},
  ],
};

/// Descriptor for `GetInsurancePolicyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInsurancePolicyResponseDescriptor = $convert.base64Decode(
    'ChpHZXRJbnN1cmFuY2VQb2xpY3lSZXNwb25zZRJBChBpbnN1cmFuY2VfcG9saWN5GAEgASgLMh'
    'YucHJvdG8uSW5zdXJhbmNlUG9saWN5Ug9pbnN1cmFuY2VQb2xpY3k=');

@$core.Deprecated('Use updateInsurancePolicyRequestDescriptor instead')
const UpdateInsurancePolicyRequest$json = {
  '1': 'UpdateInsurancePolicyRequest',
  '2': [
    {'1': 'policy_id', '3': 1, '4': 1, '5': 13, '10': 'policyId'},
    {'1': 'policy_data', '3': 2, '4': 1, '5': 11, '6': '.proto.InsurancePolicy', '10': 'policyData'},
  ],
};

/// Descriptor for `UpdateInsurancePolicyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInsurancePolicyRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVJbnN1cmFuY2VQb2xpY3lSZXF1ZXN0EhsKCXBvbGljeV9pZBgBIAEoDVIIcG9saW'
    'N5SWQSNwoLcG9saWN5X2RhdGEYAiABKAsyFi5wcm90by5JbnN1cmFuY2VQb2xpY3lSCnBvbGlj'
    'eURhdGE=');

@$core.Deprecated('Use updateInsurancePolicyResponseDescriptor instead')
const UpdateInsurancePolicyResponse$json = {
  '1': 'UpdateInsurancePolicyResponse',
  '2': [
    {'1': 'insurance_policy', '3': 1, '4': 1, '5': 11, '6': '.proto.InsurancePolicy', '10': 'insurancePolicy'},
  ],
};

/// Descriptor for `UpdateInsurancePolicyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInsurancePolicyResponseDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVJbnN1cmFuY2VQb2xpY3lSZXNwb25zZRJBChBpbnN1cmFuY2VfcG9saWN5GAEgAS'
    'gLMhYucHJvdG8uSW5zdXJhbmNlUG9saWN5Ug9pbnN1cmFuY2VQb2xpY3k=');

@$core.Deprecated('Use deleteInsurancePolicyRequestDescriptor instead')
const DeleteInsurancePolicyRequest$json = {
  '1': 'DeleteInsurancePolicyRequest',
  '2': [
    {'1': 'policy_id', '3': 1, '4': 1, '5': 13, '10': 'policyId'},
  ],
};

/// Descriptor for `DeleteInsurancePolicyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteInsurancePolicyRequestDescriptor = $convert.base64Decode(
    'ChxEZWxldGVJbnN1cmFuY2VQb2xpY3lSZXF1ZXN0EhsKCXBvbGljeV9pZBgBIAEoDVIIcG9saW'
    'N5SWQ=');

@$core.Deprecated('Use deleteInsurancePolicyResponseDescriptor instead')
const DeleteInsurancePolicyResponse$json = {
  '1': 'DeleteInsurancePolicyResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteInsurancePolicyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteInsurancePolicyResponseDescriptor = $convert.base64Decode(
    'Ch1EZWxldGVJbnN1cmFuY2VQb2xpY3lSZXNwb25zZRIyCghyZXNwb25zZRgBIAEoCzIWLmdvb2'
    'dsZS5wcm90b2J1Zi5FbXB0eVIIcmVzcG9uc2U=');

@$core.Deprecated('Use listInsurancePoliciesRequestDescriptor instead')
const ListInsurancePoliciesRequest$json = {
  '1': 'ListInsurancePoliciesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListInsurancePoliciesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInsurancePoliciesRequestDescriptor = $convert.base64Decode(
    'ChxMaXN0SW5zdXJhbmNlUG9saWNpZXNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZV'
    'NpemUSHQoKcGFnZV90b2tlbhgCIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listInsurancePoliciesResponseDescriptor instead')
const ListInsurancePoliciesResponse$json = {
  '1': 'ListInsurancePoliciesResponse',
  '2': [
    {'1': 'insurance_policies', '3': 1, '4': 3, '5': 11, '6': '.proto.InsurancePolicy', '10': 'insurancePolicies'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListInsurancePoliciesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInsurancePoliciesResponseDescriptor = $convert.base64Decode(
    'Ch1MaXN0SW5zdXJhbmNlUG9saWNpZXNSZXNwb25zZRJFChJpbnN1cmFuY2VfcG9saWNpZXMYAS'
    'ADKAsyFi5wcm90by5JbnN1cmFuY2VQb2xpY3lSEWluc3VyYW5jZVBvbGljaWVzEiYKD25leHRf'
    'cGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createTrainingEnrollmentRequestDescriptor instead')
const CreateTrainingEnrollmentRequest$json = {
  '1': 'CreateTrainingEnrollmentRequest',
  '2': [
    {'1': 'training_enrollment', '3': 1, '4': 1, '5': 11, '6': '.proto.TrainingEnrollment', '10': 'trainingEnrollment'},
  ],
};

/// Descriptor for `CreateTrainingEnrollmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTrainingEnrollmentRequestDescriptor = $convert.base64Decode(
    'Ch9DcmVhdGVUcmFpbmluZ0Vucm9sbG1lbnRSZXF1ZXN0EkoKE3RyYWluaW5nX2Vucm9sbG1lbn'
    'QYASABKAsyGS5wcm90by5UcmFpbmluZ0Vucm9sbG1lbnRSEnRyYWluaW5nRW5yb2xsbWVudA==');

@$core.Deprecated('Use createTrainingEnrollmentResponseDescriptor instead')
const CreateTrainingEnrollmentResponse$json = {
  '1': 'CreateTrainingEnrollmentResponse',
  '2': [
    {'1': 'enrollment_id', '3': 1, '4': 1, '5': 13, '10': 'enrollmentId'},
  ],
};

/// Descriptor for `CreateTrainingEnrollmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTrainingEnrollmentResponseDescriptor = $convert.base64Decode(
    'CiBDcmVhdGVUcmFpbmluZ0Vucm9sbG1lbnRSZXNwb25zZRIjCg1lbnJvbGxtZW50X2lkGAEgAS'
    'gNUgxlbnJvbGxtZW50SWQ=');

@$core.Deprecated('Use getTrainingEnrollmentRequestDescriptor instead')
const GetTrainingEnrollmentRequest$json = {
  '1': 'GetTrainingEnrollmentRequest',
  '2': [
    {'1': 'enrollment_id', '3': 1, '4': 1, '5': 13, '10': 'enrollmentId'},
  ],
};

/// Descriptor for `GetTrainingEnrollmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTrainingEnrollmentRequestDescriptor = $convert.base64Decode(
    'ChxHZXRUcmFpbmluZ0Vucm9sbG1lbnRSZXF1ZXN0EiMKDWVucm9sbG1lbnRfaWQYASABKA1SDG'
    'Vucm9sbG1lbnRJZA==');

@$core.Deprecated('Use getTrainingEnrollmentResponseDescriptor instead')
const GetTrainingEnrollmentResponse$json = {
  '1': 'GetTrainingEnrollmentResponse',
  '2': [
    {'1': 'training_enrollment', '3': 1, '4': 1, '5': 11, '6': '.proto.TrainingEnrollment', '10': 'trainingEnrollment'},
  ],
};

/// Descriptor for `GetTrainingEnrollmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTrainingEnrollmentResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRUcmFpbmluZ0Vucm9sbG1lbnRSZXNwb25zZRJKChN0cmFpbmluZ19lbnJvbGxtZW50GA'
    'EgASgLMhkucHJvdG8uVHJhaW5pbmdFbnJvbGxtZW50UhJ0cmFpbmluZ0Vucm9sbG1lbnQ=');

@$core.Deprecated('Use updateTrainingEnrollmentRequestDescriptor instead')
const UpdateTrainingEnrollmentRequest$json = {
  '1': 'UpdateTrainingEnrollmentRequest',
  '2': [
    {'1': 'enrollment_id', '3': 1, '4': 1, '5': 13, '10': 'enrollmentId'},
    {'1': 'enrollment_data', '3': 2, '4': 1, '5': 11, '6': '.proto.TrainingEnrollment', '10': 'enrollmentData'},
  ],
};

/// Descriptor for `UpdateTrainingEnrollmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTrainingEnrollmentRequestDescriptor = $convert.base64Decode(
    'Ch9VcGRhdGVUcmFpbmluZ0Vucm9sbG1lbnRSZXF1ZXN0EiMKDWVucm9sbG1lbnRfaWQYASABKA'
    '1SDGVucm9sbG1lbnRJZBJCCg9lbnJvbGxtZW50X2RhdGEYAiABKAsyGS5wcm90by5UcmFpbmlu'
    'Z0Vucm9sbG1lbnRSDmVucm9sbG1lbnREYXRh');

@$core.Deprecated('Use updateTrainingEnrollmentResponseDescriptor instead')
const UpdateTrainingEnrollmentResponse$json = {
  '1': 'UpdateTrainingEnrollmentResponse',
  '2': [
    {'1': 'training_enrollment', '3': 1, '4': 1, '5': 11, '6': '.proto.TrainingEnrollment', '10': 'trainingEnrollment'},
  ],
};

/// Descriptor for `UpdateTrainingEnrollmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTrainingEnrollmentResponseDescriptor = $convert.base64Decode(
    'CiBVcGRhdGVUcmFpbmluZ0Vucm9sbG1lbnRSZXNwb25zZRJKChN0cmFpbmluZ19lbnJvbGxtZW'
    '50GAEgASgLMhkucHJvdG8uVHJhaW5pbmdFbnJvbGxtZW50UhJ0cmFpbmluZ0Vucm9sbG1lbnQ=');

@$core.Deprecated('Use deleteTrainingEnrollmentRequestDescriptor instead')
const DeleteTrainingEnrollmentRequest$json = {
  '1': 'DeleteTrainingEnrollmentRequest',
  '2': [
    {'1': 'enrollment_id', '3': 1, '4': 1, '5': 13, '10': 'enrollmentId'},
  ],
};

/// Descriptor for `DeleteTrainingEnrollmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTrainingEnrollmentRequestDescriptor = $convert.base64Decode(
    'Ch9EZWxldGVUcmFpbmluZ0Vucm9sbG1lbnRSZXF1ZXN0EiMKDWVucm9sbG1lbnRfaWQYASABKA'
    '1SDGVucm9sbG1lbnRJZA==');

@$core.Deprecated('Use deleteTrainingEnrollmentResponseDescriptor instead')
const DeleteTrainingEnrollmentResponse$json = {
  '1': 'DeleteTrainingEnrollmentResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteTrainingEnrollmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTrainingEnrollmentResponseDescriptor = $convert.base64Decode(
    'CiBEZWxldGVUcmFpbmluZ0Vucm9sbG1lbnRSZXNwb25zZRIyCghyZXNwb25zZRgBIAEoCzIWLm'
    'dvb2dsZS5wcm90b2J1Zi5FbXB0eVIIcmVzcG9uc2U=');

@$core.Deprecated('Use listTrainingEnrollmentsRequestDescriptor instead')
const ListTrainingEnrollmentsRequest$json = {
  '1': 'ListTrainingEnrollmentsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListTrainingEnrollmentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTrainingEnrollmentsRequestDescriptor = $convert.base64Decode(
    'Ch5MaXN0VHJhaW5pbmdFbnJvbGxtZW50c1JlcXVlc3QSGwoJcGFnZV9zaXplGAEgASgFUghwYW'
    'dlU2l6ZRIdCgpwYWdlX3Rva2VuGAIgASgJUglwYWdlVG9rZW4=');

@$core.Deprecated('Use listTrainingEnrollmentsResponseDescriptor instead')
const ListTrainingEnrollmentsResponse$json = {
  '1': 'ListTrainingEnrollmentsResponse',
  '2': [
    {'1': 'training_enrollments', '3': 1, '4': 3, '5': 11, '6': '.proto.TrainingEnrollment', '10': 'trainingEnrollments'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListTrainingEnrollmentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTrainingEnrollmentsResponseDescriptor = $convert.base64Decode(
    'Ch9MaXN0VHJhaW5pbmdFbnJvbGxtZW50c1Jlc3BvbnNlEkwKFHRyYWluaW5nX2Vucm9sbG1lbn'
    'RzGAEgAygLMhkucHJvdG8uVHJhaW5pbmdFbnJvbGxtZW50UhN0cmFpbmluZ0Vucm9sbG1lbnRz'
    'EiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createAccountOpeningRequestRequestDescriptor instead')
const CreateAccountOpeningRequestRequest$json = {
  '1': 'CreateAccountOpeningRequestRequest',
  '2': [
    {'1': 'account_opening_request', '3': 1, '4': 1, '5': 11, '6': '.proto.AccountOpeningRequest', '10': 'accountOpeningRequest'},
  ],
};

/// Descriptor for `CreateAccountOpeningRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountOpeningRequestRequestDescriptor = $convert.base64Decode(
    'CiJDcmVhdGVBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXF1ZXN0ElQKF2FjY291bnRfb3BlbmluZ1'
    '9yZXF1ZXN0GAEgASgLMhwucHJvdG8uQWNjb3VudE9wZW5pbmdSZXF1ZXN0UhVhY2NvdW50T3Bl'
    'bmluZ1JlcXVlc3Q=');

@$core.Deprecated('Use createAccountOpeningRequestResponseDescriptor instead')
const CreateAccountOpeningRequestResponse$json = {
  '1': 'CreateAccountOpeningRequestResponse',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `CreateAccountOpeningRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountOpeningRequestResponseDescriptor = $convert.base64Decode(
    'CiNDcmVhdGVBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXNwb25zZRIdCgpyZXF1ZXN0X2lkGAEgAS'
    'gNUglyZXF1ZXN0SWQ=');

@$core.Deprecated('Use getAccountOpeningRequestRequestDescriptor instead')
const GetAccountOpeningRequestRequest$json = {
  '1': 'GetAccountOpeningRequestRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `GetAccountOpeningRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountOpeningRequestRequestDescriptor = $convert.base64Decode(
    'Ch9HZXRBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKA1SCX'
    'JlcXVlc3RJZA==');

@$core.Deprecated('Use getAccountOpeningRequestResponseDescriptor instead')
const GetAccountOpeningRequestResponse$json = {
  '1': 'GetAccountOpeningRequestResponse',
  '2': [
    {'1': 'account_opening_request', '3': 1, '4': 1, '5': 11, '6': '.proto.AccountOpeningRequest', '10': 'accountOpeningRequest'},
  ],
};

/// Descriptor for `GetAccountOpeningRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountOpeningRequestResponseDescriptor = $convert.base64Decode(
    'CiBHZXRBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXNwb25zZRJUChdhY2NvdW50X29wZW5pbmdfcm'
    'VxdWVzdBgBIAEoCzIcLnByb3RvLkFjY291bnRPcGVuaW5nUmVxdWVzdFIVYWNjb3VudE9wZW5p'
    'bmdSZXF1ZXN0');

@$core.Deprecated('Use updateAccountOpeningRequestRequestDescriptor instead')
const UpdateAccountOpeningRequestRequest$json = {
  '1': 'UpdateAccountOpeningRequestRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
    {'1': 'request_data', '3': 2, '4': 1, '5': 11, '6': '.proto.AccountOpeningRequest', '10': 'requestData'},
  ],
};

/// Descriptor for `UpdateAccountOpeningRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountOpeningRequestRequestDescriptor = $convert.base64Decode(
    'CiJVcGRhdGVBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKA'
    '1SCXJlcXVlc3RJZBI/CgxyZXF1ZXN0X2RhdGEYAiABKAsyHC5wcm90by5BY2NvdW50T3Blbmlu'
    'Z1JlcXVlc3RSC3JlcXVlc3REYXRh');

@$core.Deprecated('Use updateAccountOpeningRequestResponseDescriptor instead')
const UpdateAccountOpeningRequestResponse$json = {
  '1': 'UpdateAccountOpeningRequestResponse',
  '2': [
    {'1': 'account_opening_request', '3': 1, '4': 1, '5': 11, '6': '.proto.AccountOpeningRequest', '10': 'accountOpeningRequest'},
  ],
};

/// Descriptor for `UpdateAccountOpeningRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountOpeningRequestResponseDescriptor = $convert.base64Decode(
    'CiNVcGRhdGVBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXNwb25zZRJUChdhY2NvdW50X29wZW5pbm'
    'dfcmVxdWVzdBgBIAEoCzIcLnByb3RvLkFjY291bnRPcGVuaW5nUmVxdWVzdFIVYWNjb3VudE9w'
    'ZW5pbmdSZXF1ZXN0');

@$core.Deprecated('Use deleteAccountOpeningRequestRequestDescriptor instead')
const DeleteAccountOpeningRequestRequest$json = {
  '1': 'DeleteAccountOpeningRequestRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `DeleteAccountOpeningRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAccountOpeningRequestRequestDescriptor = $convert.base64Decode(
    'CiJEZWxldGVBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKA'
    '1SCXJlcXVlc3RJZA==');

@$core.Deprecated('Use deleteAccountOpeningRequestResponseDescriptor instead')
const DeleteAccountOpeningRequestResponse$json = {
  '1': 'DeleteAccountOpeningRequestResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteAccountOpeningRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAccountOpeningRequestResponseDescriptor = $convert.base64Decode(
    'CiNEZWxldGVBY2NvdW50T3BlbmluZ1JlcXVlc3RSZXNwb25zZRIyCghyZXNwb25zZRgBIAEoCz'
    'IWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eVIIcmVzcG9uc2U=');

@$core.Deprecated('Use listAccountOpeningRequestsRequestDescriptor instead')
const ListAccountOpeningRequestsRequest$json = {
  '1': 'ListAccountOpeningRequestsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListAccountOpeningRequestsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountOpeningRequestsRequestDescriptor = $convert.base64Decode(
    'CiFMaXN0QWNjb3VudE9wZW5pbmdSZXF1ZXN0c1JlcXVlc3QSGwoJcGFnZV9zaXplGAEgASgFUg'
    'hwYWdlU2l6ZRIdCgpwYWdlX3Rva2VuGAIgASgJUglwYWdlVG9rZW4=');

@$core.Deprecated('Use listAccountOpeningRequestsResponseDescriptor instead')
const ListAccountOpeningRequestsResponse$json = {
  '1': 'ListAccountOpeningRequestsResponse',
  '2': [
    {'1': 'account_opening_requests', '3': 1, '4': 3, '5': 11, '6': '.proto.AccountOpeningRequest', '10': 'accountOpeningRequests'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListAccountOpeningRequestsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountOpeningRequestsResponseDescriptor = $convert.base64Decode(
    'CiJMaXN0QWNjb3VudE9wZW5pbmdSZXF1ZXN0c1Jlc3BvbnNlElYKGGFjY291bnRfb3BlbmluZ1'
    '9yZXF1ZXN0cxgBIAMoCzIcLnByb3RvLkFjY291bnRPcGVuaW5nUmVxdWVzdFIWYWNjb3VudE9w'
    'ZW5pbmdSZXF1ZXN0cxImCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlSDW5leHRQYWdlVG9rZW4=');

@$core.Deprecated('Use createBusinessRegistrationRequestDescriptor instead')
const CreateBusinessRegistrationRequest$json = {
  '1': 'CreateBusinessRegistrationRequest',
  '2': [
    {'1': 'business_registration', '3': 1, '4': 1, '5': 11, '6': '.proto.BusinessRegistration', '10': 'businessRegistration'},
  ],
};

/// Descriptor for `CreateBusinessRegistrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessRegistrationRequestDescriptor = $convert.base64Decode(
    'CiFDcmVhdGVCdXNpbmVzc1JlZ2lzdHJhdGlvblJlcXVlc3QSUAoVYnVzaW5lc3NfcmVnaXN0cm'
    'F0aW9uGAEgASgLMhsucHJvdG8uQnVzaW5lc3NSZWdpc3RyYXRpb25SFGJ1c2luZXNzUmVnaXN0'
    'cmF0aW9u');

@$core.Deprecated('Use createBusinessRegistrationResponseDescriptor instead')
const CreateBusinessRegistrationResponse$json = {
  '1': 'CreateBusinessRegistrationResponse',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `CreateBusinessRegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessRegistrationResponseDescriptor = $convert.base64Decode(
    'CiJDcmVhdGVCdXNpbmVzc1JlZ2lzdHJhdGlvblJlc3BvbnNlEh0KCnJlcXVlc3RfaWQYASABKA'
    '1SCXJlcXVlc3RJZA==');

@$core.Deprecated('Use getBusinessRegistrationRequestDescriptor instead')
const GetBusinessRegistrationRequest$json = {
  '1': 'GetBusinessRegistrationRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `GetBusinessRegistrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessRegistrationRequestDescriptor = $convert.base64Decode(
    'Ch5HZXRCdXNpbmVzc1JlZ2lzdHJhdGlvblJlcXVlc3QSHQoKcmVxdWVzdF9pZBgBIAEoDVIJcm'
    'VxdWVzdElk');

@$core.Deprecated('Use getBusinessRegistrationResponseDescriptor instead')
const GetBusinessRegistrationResponse$json = {
  '1': 'GetBusinessRegistrationResponse',
  '2': [
    {'1': 'business_registration', '3': 1, '4': 1, '5': 11, '6': '.proto.BusinessRegistration', '10': 'businessRegistration'},
  ],
};

/// Descriptor for `GetBusinessRegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessRegistrationResponseDescriptor = $convert.base64Decode(
    'Ch9HZXRCdXNpbmVzc1JlZ2lzdHJhdGlvblJlc3BvbnNlElAKFWJ1c2luZXNzX3JlZ2lzdHJhdG'
    'lvbhgBIAEoCzIbLnByb3RvLkJ1c2luZXNzUmVnaXN0cmF0aW9uUhRidXNpbmVzc1JlZ2lzdHJh'
    'dGlvbg==');

@$core.Deprecated('Use updateBusinessRegistrationRequestDescriptor instead')
const UpdateBusinessRegistrationRequest$json = {
  '1': 'UpdateBusinessRegistrationRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
    {'1': 'registration_data', '3': 2, '4': 1, '5': 11, '6': '.proto.BusinessRegistration', '10': 'registrationData'},
  ],
};

/// Descriptor for `UpdateBusinessRegistrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessRegistrationRequestDescriptor = $convert.base64Decode(
    'CiFVcGRhdGVCdXNpbmVzc1JlZ2lzdHJhdGlvblJlcXVlc3QSHQoKcmVxdWVzdF9pZBgBIAEoDV'
    'IJcmVxdWVzdElkEkgKEXJlZ2lzdHJhdGlvbl9kYXRhGAIgASgLMhsucHJvdG8uQnVzaW5lc3NS'
    'ZWdpc3RyYXRpb25SEHJlZ2lzdHJhdGlvbkRhdGE=');

@$core.Deprecated('Use updateBusinessRegistrationResponseDescriptor instead')
const UpdateBusinessRegistrationResponse$json = {
  '1': 'UpdateBusinessRegistrationResponse',
  '2': [
    {'1': 'business_registration', '3': 1, '4': 1, '5': 11, '6': '.proto.BusinessRegistration', '10': 'businessRegistration'},
  ],
};

/// Descriptor for `UpdateBusinessRegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessRegistrationResponseDescriptor = $convert.base64Decode(
    'CiJVcGRhdGVCdXNpbmVzc1JlZ2lzdHJhdGlvblJlc3BvbnNlElAKFWJ1c2luZXNzX3JlZ2lzdH'
    'JhdGlvbhgBIAEoCzIbLnByb3RvLkJ1c2luZXNzUmVnaXN0cmF0aW9uUhRidXNpbmVzc1JlZ2lz'
    'dHJhdGlvbg==');

@$core.Deprecated('Use deleteBusinessRegistrationRequestDescriptor instead')
const DeleteBusinessRegistrationRequest$json = {
  '1': 'DeleteBusinessRegistrationRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `DeleteBusinessRegistrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessRegistrationRequestDescriptor = $convert.base64Decode(
    'CiFEZWxldGVCdXNpbmVzc1JlZ2lzdHJhdGlvblJlcXVlc3QSHQoKcmVxdWVzdF9pZBgBIAEoDV'
    'IJcmVxdWVzdElk');

@$core.Deprecated('Use deleteBusinessRegistrationResponseDescriptor instead')
const DeleteBusinessRegistrationResponse$json = {
  '1': 'DeleteBusinessRegistrationResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteBusinessRegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessRegistrationResponseDescriptor = $convert.base64Decode(
    'CiJEZWxldGVCdXNpbmVzc1JlZ2lzdHJhdGlvblJlc3BvbnNlEjIKCHJlc3BvbnNlGAEgASgLMh'
    'YuZ29vZ2xlLnByb3RvYnVmLkVtcHR5UghyZXNwb25zZQ==');

@$core.Deprecated('Use listBusinessRegistrationsRequestDescriptor instead')
const ListBusinessRegistrationsRequest$json = {
  '1': 'ListBusinessRegistrationsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListBusinessRegistrationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBusinessRegistrationsRequestDescriptor = $convert.base64Decode(
    'CiBMaXN0QnVzaW5lc3NSZWdpc3RyYXRpb25zUmVxdWVzdBIbCglwYWdlX3NpemUYASABKAVSCH'
    'BhZ2VTaXplEh0KCnBhZ2VfdG9rZW4YAiABKAlSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use listBusinessRegistrationsResponseDescriptor instead')
const ListBusinessRegistrationsResponse$json = {
  '1': 'ListBusinessRegistrationsResponse',
  '2': [
    {'1': 'business_registrations', '3': 1, '4': 3, '5': 11, '6': '.proto.BusinessRegistration', '10': 'businessRegistrations'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListBusinessRegistrationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBusinessRegistrationsResponseDescriptor = $convert.base64Decode(
    'CiFMaXN0QnVzaW5lc3NSZWdpc3RyYXRpb25zUmVzcG9uc2USUgoWYnVzaW5lc3NfcmVnaXN0cm'
    'F0aW9ucxgBIAMoCzIbLnByb3RvLkJ1c2luZXNzUmVnaXN0cmF0aW9uUhVidXNpbmVzc1JlZ2lz'
    'dHJhdGlvbnMSJgoPbmV4dF9wYWdlX3Rva2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');

@$core.Deprecated('Use createLendingApplicationRequestDescriptor instead')
const CreateLendingApplicationRequest$json = {
  '1': 'CreateLendingApplicationRequest',
  '2': [
    {'1': 'lending_application', '3': 1, '4': 1, '5': 11, '6': '.proto.LendingApplication', '10': 'lendingApplication'},
  ],
};

/// Descriptor for `CreateLendingApplicationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLendingApplicationRequestDescriptor = $convert.base64Decode(
    'Ch9DcmVhdGVMZW5kaW5nQXBwbGljYXRpb25SZXF1ZXN0EkoKE2xlbmRpbmdfYXBwbGljYXRpb2'
    '4YASABKAsyGS5wcm90by5MZW5kaW5nQXBwbGljYXRpb25SEmxlbmRpbmdBcHBsaWNhdGlvbg==');

@$core.Deprecated('Use createLendingApplicationResponseDescriptor instead')
const CreateLendingApplicationResponse$json = {
  '1': 'CreateLendingApplicationResponse',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `CreateLendingApplicationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLendingApplicationResponseDescriptor = $convert.base64Decode(
    'CiBDcmVhdGVMZW5kaW5nQXBwbGljYXRpb25SZXNwb25zZRIdCgpyZXF1ZXN0X2lkGAEgASgNUg'
    'lyZXF1ZXN0SWQ=');

@$core.Deprecated('Use getLendingApplicationRequestDescriptor instead')
const GetLendingApplicationRequest$json = {
  '1': 'GetLendingApplicationRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `GetLendingApplicationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLendingApplicationRequestDescriptor = $convert.base64Decode(
    'ChxHZXRMZW5kaW5nQXBwbGljYXRpb25SZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKA1SCXJlcX'
    'Vlc3RJZA==');

@$core.Deprecated('Use getLendingApplicationResponseDescriptor instead')
const GetLendingApplicationResponse$json = {
  '1': 'GetLendingApplicationResponse',
  '2': [
    {'1': 'lending_application', '3': 1, '4': 1, '5': 11, '6': '.proto.LendingApplication', '10': 'lendingApplication'},
  ],
};

/// Descriptor for `GetLendingApplicationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLendingApplicationResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRMZW5kaW5nQXBwbGljYXRpb25SZXNwb25zZRJKChNsZW5kaW5nX2FwcGxpY2F0aW9uGA'
    'EgASgLMhkucHJvdG8uTGVuZGluZ0FwcGxpY2F0aW9uUhJsZW5kaW5nQXBwbGljYXRpb24=');

@$core.Deprecated('Use updateLendingApplicationRequestDescriptor instead')
const UpdateLendingApplicationRequest$json = {
  '1': 'UpdateLendingApplicationRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
    {'1': 'application_data', '3': 2, '4': 1, '5': 11, '6': '.proto.LendingApplication', '10': 'applicationData'},
  ],
};

/// Descriptor for `UpdateLendingApplicationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLendingApplicationRequestDescriptor = $convert.base64Decode(
    'Ch9VcGRhdGVMZW5kaW5nQXBwbGljYXRpb25SZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKA1SCX'
    'JlcXVlc3RJZBJEChBhcHBsaWNhdGlvbl9kYXRhGAIgASgLMhkucHJvdG8uTGVuZGluZ0FwcGxp'
    'Y2F0aW9uUg9hcHBsaWNhdGlvbkRhdGE=');

@$core.Deprecated('Use updateLendingApplicationResponseDescriptor instead')
const UpdateLendingApplicationResponse$json = {
  '1': 'UpdateLendingApplicationResponse',
  '2': [
    {'1': 'lending_application', '3': 1, '4': 1, '5': 11, '6': '.proto.LendingApplication', '10': 'lendingApplication'},
  ],
};

/// Descriptor for `UpdateLendingApplicationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLendingApplicationResponseDescriptor = $convert.base64Decode(
    'CiBVcGRhdGVMZW5kaW5nQXBwbGljYXRpb25SZXNwb25zZRJKChNsZW5kaW5nX2FwcGxpY2F0aW'
    '9uGAEgASgLMhkucHJvdG8uTGVuZGluZ0FwcGxpY2F0aW9uUhJsZW5kaW5nQXBwbGljYXRpb24=');

@$core.Deprecated('Use deleteLendingApplicationRequestDescriptor instead')
const DeleteLendingApplicationRequest$json = {
  '1': 'DeleteLendingApplicationRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 13, '10': 'requestId'},
  ],
};

/// Descriptor for `DeleteLendingApplicationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLendingApplicationRequestDescriptor = $convert.base64Decode(
    'Ch9EZWxldGVMZW5kaW5nQXBwbGljYXRpb25SZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKA1SCX'
    'JlcXVlc3RJZA==');

@$core.Deprecated('Use deleteLendingApplicationResponseDescriptor instead')
const DeleteLendingApplicationResponse$json = {
  '1': 'DeleteLendingApplicationResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteLendingApplicationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLendingApplicationResponseDescriptor = $convert.base64Decode(
    'CiBEZWxldGVMZW5kaW5nQXBwbGljYXRpb25SZXNwb25zZRIyCghyZXNwb25zZRgBIAEoCzIWLm'
    'dvb2dsZS5wcm90b2J1Zi5FbXB0eVIIcmVzcG9uc2U=');

@$core.Deprecated('Use listLendingApplicationsRequestDescriptor instead')
const ListLendingApplicationsRequest$json = {
  '1': 'ListLendingApplicationsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListLendingApplicationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLendingApplicationsRequestDescriptor = $convert.base64Decode(
    'Ch5MaXN0TGVuZGluZ0FwcGxpY2F0aW9uc1JlcXVlc3QSGwoJcGFnZV9zaXplGAEgASgFUghwYW'
    'dlU2l6ZRIdCgpwYWdlX3Rva2VuGAIgASgJUglwYWdlVG9rZW4=');

@$core.Deprecated('Use listLendingApplicationsResponseDescriptor instead')
const ListLendingApplicationsResponse$json = {
  '1': 'ListLendingApplicationsResponse',
  '2': [
    {'1': 'lending_applications', '3': 1, '4': 3, '5': 11, '6': '.proto.LendingApplication', '10': 'lendingApplications'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListLendingApplicationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLendingApplicationsResponseDescriptor = $convert.base64Decode(
    'Ch9MaXN0TGVuZGluZ0FwcGxpY2F0aW9uc1Jlc3BvbnNlEkwKFGxlbmRpbmdfYXBwbGljYXRpb2'
    '5zGAEgAygLMhkucHJvdG8uTGVuZGluZ0FwcGxpY2F0aW9uUhNsZW5kaW5nQXBwbGljYXRpb25z'
    'EiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createPartnerRequestDescriptor instead')
const CreatePartnerRequest$json = {
  '1': 'CreatePartnerRequest',
  '2': [
    {'1': 'partner', '3': 1, '4': 1, '5': 11, '6': '.proto.Partner', '10': 'partner'},
  ],
};

/// Descriptor for `CreatePartnerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPartnerRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQYXJ0bmVyUmVxdWVzdBIoCgdwYXJ0bmVyGAEgASgLMg4ucHJvdG8uUGFydG5lcl'
    'IHcGFydG5lcg==');

@$core.Deprecated('Use createPartnerResponseDescriptor instead')
const CreatePartnerResponse$json = {
  '1': 'CreatePartnerResponse',
  '2': [
    {'1': 'partner_id', '3': 1, '4': 1, '5': 13, '10': 'partnerId'},
  ],
};

/// Descriptor for `CreatePartnerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPartnerResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQYXJ0bmVyUmVzcG9uc2USHQoKcGFydG5lcl9pZBgBIAEoDVIJcGFydG5lcklk');

@$core.Deprecated('Use getPartnerRequestDescriptor instead')
const GetPartnerRequest$json = {
  '1': 'GetPartnerRequest',
  '2': [
    {'1': 'partner_id', '3': 1, '4': 1, '5': 13, '10': 'partnerId'},
  ],
};

/// Descriptor for `GetPartnerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPartnerRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQYXJ0bmVyUmVxdWVzdBIdCgpwYXJ0bmVyX2lkGAEgASgNUglwYXJ0bmVySWQ=');

@$core.Deprecated('Use getPartnerResponseDescriptor instead')
const GetPartnerResponse$json = {
  '1': 'GetPartnerResponse',
  '2': [
    {'1': 'partner', '3': 1, '4': 1, '5': 11, '6': '.proto.Partner', '10': 'partner'},
  ],
};

/// Descriptor for `GetPartnerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPartnerResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQYXJ0bmVyUmVzcG9uc2USKAoHcGFydG5lchgBIAEoCzIOLnByb3RvLlBhcnRuZXJSB3'
    'BhcnRuZXI=');

@$core.Deprecated('Use updatePartnerRequestDescriptor instead')
const UpdatePartnerRequest$json = {
  '1': 'UpdatePartnerRequest',
  '2': [
    {'1': 'partner_id', '3': 1, '4': 1, '5': 13, '10': 'partnerId'},
    {'1': 'partner_data', '3': 2, '4': 1, '5': 11, '6': '.proto.Partner', '10': 'partnerData'},
  ],
};

/// Descriptor for `UpdatePartnerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePartnerRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQYXJ0bmVyUmVxdWVzdBIdCgpwYXJ0bmVyX2lkGAEgASgNUglwYXJ0bmVySWQSMQ'
    'oMcGFydG5lcl9kYXRhGAIgASgLMg4ucHJvdG8uUGFydG5lclILcGFydG5lckRhdGE=');

@$core.Deprecated('Use updatePartnerResponseDescriptor instead')
const UpdatePartnerResponse$json = {
  '1': 'UpdatePartnerResponse',
  '2': [
    {'1': 'partner', '3': 1, '4': 1, '5': 11, '6': '.proto.Partner', '10': 'partner'},
  ],
};

/// Descriptor for `UpdatePartnerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePartnerResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQYXJ0bmVyUmVzcG9uc2USKAoHcGFydG5lchgBIAEoCzIOLnByb3RvLlBhcnRuZX'
    'JSB3BhcnRuZXI=');

@$core.Deprecated('Use deletePartnerRequestDescriptor instead')
const DeletePartnerRequest$json = {
  '1': 'DeletePartnerRequest',
  '2': [
    {'1': 'partner_id', '3': 1, '4': 1, '5': 13, '10': 'partnerId'},
  ],
};

/// Descriptor for `DeletePartnerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePartnerRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVQYXJ0bmVyUmVxdWVzdBIdCgpwYXJ0bmVyX2lkGAEgASgNUglwYXJ0bmVySWQ=');

@$core.Deprecated('Use deletePartnerResponseDescriptor instead')
const DeletePartnerResponse$json = {
  '1': 'DeletePartnerResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeletePartnerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePartnerResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVQYXJ0bmVyUmVzcG9uc2USMgoIcmVzcG9uc2UYASABKAsyFi5nb29nbGUucHJvdG'
    '9idWYuRW1wdHlSCHJlc3BvbnNl');

@$core.Deprecated('Use listPartnersRequestDescriptor instead')
const ListPartnersRequest$json = {
  '1': 'ListPartnersRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListPartnersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPartnersRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0UGFydG5lcnNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZVNpemUSHQoKcG'
    'FnZV90b2tlbhgCIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listPartnersResponseDescriptor instead')
const ListPartnersResponse$json = {
  '1': 'ListPartnersResponse',
  '2': [
    {'1': 'partners', '3': 1, '4': 3, '5': 11, '6': '.proto.Partner', '10': 'partners'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListPartnersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPartnersResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0UGFydG5lcnNSZXNwb25zZRIqCghwYXJ0bmVycxgBIAMoCzIOLnByb3RvLlBhcnRuZX'
    'JSCHBhcnRuZXJzEiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createLegalIssueTypeRequestDescriptor instead')
const CreateLegalIssueTypeRequest$json = {
  '1': 'CreateLegalIssueTypeRequest',
  '2': [
    {'1': 'legal_issue_type', '3': 1, '4': 1, '5': 11, '6': '.proto.LegalIssueType', '10': 'legalIssueType'},
  ],
};

/// Descriptor for `CreateLegalIssueTypeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLegalIssueTypeRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVMZWdhbElzc3VlVHlwZVJlcXVlc3QSPwoQbGVnYWxfaXNzdWVfdHlwZRgBIAEoCz'
    'IVLnByb3RvLkxlZ2FsSXNzdWVUeXBlUg5sZWdhbElzc3VlVHlwZQ==');

@$core.Deprecated('Use createLegalIssueTypeResponseDescriptor instead')
const CreateLegalIssueTypeResponse$json = {
  '1': 'CreateLegalIssueTypeResponse',
  '2': [
    {'1': 'issue_type_id', '3': 1, '4': 1, '5': 13, '10': 'issueTypeId'},
  ],
};

/// Descriptor for `CreateLegalIssueTypeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLegalIssueTypeResponseDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVMZWdhbElzc3VlVHlwZVJlc3BvbnNlEiIKDWlzc3VlX3R5cGVfaWQYASABKA1SC2'
    'lzc3VlVHlwZUlk');

@$core.Deprecated('Use getLegalIssueTypeRequestDescriptor instead')
const GetLegalIssueTypeRequest$json = {
  '1': 'GetLegalIssueTypeRequest',
  '2': [
    {'1': 'issue_type_id', '3': 1, '4': 1, '5': 13, '10': 'issueTypeId'},
  ],
};

/// Descriptor for `GetLegalIssueTypeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLegalIssueTypeRequestDescriptor = $convert.base64Decode(
    'ChhHZXRMZWdhbElzc3VlVHlwZVJlcXVlc3QSIgoNaXNzdWVfdHlwZV9pZBgBIAEoDVILaXNzdW'
    'VUeXBlSWQ=');

@$core.Deprecated('Use getLegalIssueTypeResponseDescriptor instead')
const GetLegalIssueTypeResponse$json = {
  '1': 'GetLegalIssueTypeResponse',
  '2': [
    {'1': 'legal_issue_type', '3': 1, '4': 1, '5': 11, '6': '.proto.LegalIssueType', '10': 'legalIssueType'},
  ],
};

/// Descriptor for `GetLegalIssueTypeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLegalIssueTypeResponseDescriptor = $convert.base64Decode(
    'ChlHZXRMZWdhbElzc3VlVHlwZVJlc3BvbnNlEj8KEGxlZ2FsX2lzc3VlX3R5cGUYASABKAsyFS'
    '5wcm90by5MZWdhbElzc3VlVHlwZVIObGVnYWxJc3N1ZVR5cGU=');

@$core.Deprecated('Use updateLegalIssueTypeRequestDescriptor instead')
const UpdateLegalIssueTypeRequest$json = {
  '1': 'UpdateLegalIssueTypeRequest',
  '2': [
    {'1': 'issue_type_id', '3': 1, '4': 1, '5': 13, '10': 'issueTypeId'},
    {'1': 'issue_type_data', '3': 2, '4': 1, '5': 11, '6': '.proto.LegalIssueType', '10': 'issueTypeData'},
  ],
};

/// Descriptor for `UpdateLegalIssueTypeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLegalIssueTypeRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVMZWdhbElzc3VlVHlwZVJlcXVlc3QSIgoNaXNzdWVfdHlwZV9pZBgBIAEoDVILaX'
    'NzdWVUeXBlSWQSPQoPaXNzdWVfdHlwZV9kYXRhGAIgASgLMhUucHJvdG8uTGVnYWxJc3N1ZVR5'
    'cGVSDWlzc3VlVHlwZURhdGE=');

@$core.Deprecated('Use updateLegalIssueTypeResponseDescriptor instead')
const UpdateLegalIssueTypeResponse$json = {
  '1': 'UpdateLegalIssueTypeResponse',
  '2': [
    {'1': 'legal_issue_type', '3': 1, '4': 1, '5': 11, '6': '.proto.LegalIssueType', '10': 'legalIssueType'},
  ],
};

/// Descriptor for `UpdateLegalIssueTypeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLegalIssueTypeResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVMZWdhbElzc3VlVHlwZVJlc3BvbnNlEj8KEGxlZ2FsX2lzc3VlX3R5cGUYASABKA'
    'syFS5wcm90by5MZWdhbElzc3VlVHlwZVIObGVnYWxJc3N1ZVR5cGU=');

@$core.Deprecated('Use deleteLegalIssueTypeRequestDescriptor instead')
const DeleteLegalIssueTypeRequest$json = {
  '1': 'DeleteLegalIssueTypeRequest',
  '2': [
    {'1': 'issue_type_id', '3': 1, '4': 1, '5': 13, '10': 'issueTypeId'},
  ],
};

/// Descriptor for `DeleteLegalIssueTypeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLegalIssueTypeRequestDescriptor = $convert.base64Decode(
    'ChtEZWxldGVMZWdhbElzc3VlVHlwZVJlcXVlc3QSIgoNaXNzdWVfdHlwZV9pZBgBIAEoDVILaX'
    'NzdWVUeXBlSWQ=');

@$core.Deprecated('Use deleteLegalIssueTypeResponseDescriptor instead')
const DeleteLegalIssueTypeResponse$json = {
  '1': 'DeleteLegalIssueTypeResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteLegalIssueTypeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLegalIssueTypeResponseDescriptor = $convert.base64Decode(
    'ChxEZWxldGVMZWdhbElzc3VlVHlwZVJlc3BvbnNlEjIKCHJlc3BvbnNlGAEgASgLMhYuZ29vZ2'
    'xlLnByb3RvYnVmLkVtcHR5UghyZXNwb25zZQ==');

@$core.Deprecated('Use listLegalIssueTypesRequestDescriptor instead')
const ListLegalIssueTypesRequest$json = {
  '1': 'ListLegalIssueTypesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListLegalIssueTypesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLegalIssueTypesRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0TGVnYWxJc3N1ZVR5cGVzUmVxdWVzdBIbCglwYWdlX3NpemUYASABKAVSCHBhZ2VTaX'
    'plEh0KCnBhZ2VfdG9rZW4YAiABKAlSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use listLegalIssueTypesResponseDescriptor instead')
const ListLegalIssueTypesResponse$json = {
  '1': 'ListLegalIssueTypesResponse',
  '2': [
    {'1': 'legal_issue_types', '3': 1, '4': 3, '5': 11, '6': '.proto.LegalIssueType', '10': 'legalIssueTypes'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListLegalIssueTypesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLegalIssueTypesResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0TGVnYWxJc3N1ZVR5cGVzUmVzcG9uc2USQQoRbGVnYWxfaXNzdWVfdHlwZXMYASADKA'
    'syFS5wcm90by5MZWdhbElzc3VlVHlwZVIPbGVnYWxJc3N1ZVR5cGVzEiYKD25leHRfcGFnZV90'
    'b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createTrainingCourseRequestDescriptor instead')
const CreateTrainingCourseRequest$json = {
  '1': 'CreateTrainingCourseRequest',
  '2': [
    {'1': 'training_course', '3': 1, '4': 1, '5': 11, '6': '.proto.TrainingCourse', '10': 'trainingCourse'},
  ],
};

/// Descriptor for `CreateTrainingCourseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTrainingCourseRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVUcmFpbmluZ0NvdXJzZVJlcXVlc3QSPgoPdHJhaW5pbmdfY291cnNlGAEgASgLMh'
    'UucHJvdG8uVHJhaW5pbmdDb3Vyc2VSDnRyYWluaW5nQ291cnNl');

@$core.Deprecated('Use createTrainingCourseResponseDescriptor instead')
const CreateTrainingCourseResponse$json = {
  '1': 'CreateTrainingCourseResponse',
  '2': [
    {'1': 'course_id', '3': 1, '4': 1, '5': 13, '10': 'courseId'},
  ],
};

/// Descriptor for `CreateTrainingCourseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTrainingCourseResponseDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVUcmFpbmluZ0NvdXJzZVJlc3BvbnNlEhsKCWNvdXJzZV9pZBgBIAEoDVIIY291cn'
    'NlSWQ=');

@$core.Deprecated('Use getTrainingCourseRequestDescriptor instead')
const GetTrainingCourseRequest$json = {
  '1': 'GetTrainingCourseRequest',
  '2': [
    {'1': 'course_id', '3': 1, '4': 1, '5': 13, '10': 'courseId'},
  ],
};

/// Descriptor for `GetTrainingCourseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTrainingCourseRequestDescriptor = $convert.base64Decode(
    'ChhHZXRUcmFpbmluZ0NvdXJzZVJlcXVlc3QSGwoJY291cnNlX2lkGAEgASgNUghjb3Vyc2VJZA'
    '==');

@$core.Deprecated('Use getTrainingCourseResponseDescriptor instead')
const GetTrainingCourseResponse$json = {
  '1': 'GetTrainingCourseResponse',
  '2': [
    {'1': 'training_course', '3': 1, '4': 1, '5': 11, '6': '.proto.TrainingCourse', '10': 'trainingCourse'},
  ],
};

/// Descriptor for `GetTrainingCourseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTrainingCourseResponseDescriptor = $convert.base64Decode(
    'ChlHZXRUcmFpbmluZ0NvdXJzZVJlc3BvbnNlEj4KD3RyYWluaW5nX2NvdXJzZRgBIAEoCzIVLn'
    'Byb3RvLlRyYWluaW5nQ291cnNlUg50cmFpbmluZ0NvdXJzZQ==');

@$core.Deprecated('Use updateTrainingCourseRequestDescriptor instead')
const UpdateTrainingCourseRequest$json = {
  '1': 'UpdateTrainingCourseRequest',
  '2': [
    {'1': 'course_id', '3': 1, '4': 1, '5': 13, '10': 'courseId'},
    {'1': 'course_data', '3': 2, '4': 1, '5': 11, '6': '.proto.TrainingCourse', '10': 'courseData'},
  ],
};

/// Descriptor for `UpdateTrainingCourseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTrainingCourseRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVUcmFpbmluZ0NvdXJzZVJlcXVlc3QSGwoJY291cnNlX2lkGAEgASgNUghjb3Vyc2'
    'VJZBI2Cgtjb3Vyc2VfZGF0YRgCIAEoCzIVLnByb3RvLlRyYWluaW5nQ291cnNlUgpjb3Vyc2VE'
    'YXRh');

@$core.Deprecated('Use updateTrainingCourseResponseDescriptor instead')
const UpdateTrainingCourseResponse$json = {
  '1': 'UpdateTrainingCourseResponse',
  '2': [
    {'1': 'training_course', '3': 1, '4': 1, '5': 11, '6': '.proto.TrainingCourse', '10': 'trainingCourse'},
  ],
};

/// Descriptor for `UpdateTrainingCourseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTrainingCourseResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVUcmFpbmluZ0NvdXJzZVJlc3BvbnNlEj4KD3RyYWluaW5nX2NvdXJzZRgBIAEoCz'
    'IVLnByb3RvLlRyYWluaW5nQ291cnNlUg50cmFpbmluZ0NvdXJzZQ==');

@$core.Deprecated('Use deleteTrainingCourseRequestDescriptor instead')
const DeleteTrainingCourseRequest$json = {
  '1': 'DeleteTrainingCourseRequest',
  '2': [
    {'1': 'course_id', '3': 1, '4': 1, '5': 13, '10': 'courseId'},
  ],
};

/// Descriptor for `DeleteTrainingCourseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTrainingCourseRequestDescriptor = $convert.base64Decode(
    'ChtEZWxldGVUcmFpbmluZ0NvdXJzZVJlcXVlc3QSGwoJY291cnNlX2lkGAEgASgNUghjb3Vyc2'
    'VJZA==');

@$core.Deprecated('Use deleteTrainingCourseResponseDescriptor instead')
const DeleteTrainingCourseResponse$json = {
  '1': 'DeleteTrainingCourseResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteTrainingCourseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTrainingCourseResponseDescriptor = $convert.base64Decode(
    'ChxEZWxldGVUcmFpbmluZ0NvdXJzZVJlc3BvbnNlEjIKCHJlc3BvbnNlGAEgASgLMhYuZ29vZ2'
    'xlLnByb3RvYnVmLkVtcHR5UghyZXNwb25zZQ==');

@$core.Deprecated('Use listTrainingCoursesRequestDescriptor instead')
const ListTrainingCoursesRequest$json = {
  '1': 'ListTrainingCoursesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListTrainingCoursesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTrainingCoursesRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0VHJhaW5pbmdDb3Vyc2VzUmVxdWVzdBIbCglwYWdlX3NpemUYASABKAVSCHBhZ2VTaX'
    'plEh0KCnBhZ2VfdG9rZW4YAiABKAlSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use listTrainingCoursesResponseDescriptor instead')
const ListTrainingCoursesResponse$json = {
  '1': 'ListTrainingCoursesResponse',
  '2': [
    {'1': 'training_courses', '3': 1, '4': 3, '5': 11, '6': '.proto.TrainingCourse', '10': 'trainingCourses'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListTrainingCoursesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTrainingCoursesResponseDescriptor = $convert.base64Decode(
    'ChtMaXN0VHJhaW5pbmdDb3Vyc2VzUmVzcG9uc2USQAoQdHJhaW5pbmdfY291cnNlcxgBIAMoCz'
    'IVLnByb3RvLlRyYWluaW5nQ291cnNlUg90cmFpbmluZ0NvdXJzZXMSJgoPbmV4dF9wYWdlX3Rv'
    'a2VuGAIgASgJUg1uZXh0UGFnZVRva2Vu');

@$core.Deprecated('Use createBankRequestDescriptor instead')
const CreateBankRequest$json = {
  '1': 'CreateBankRequest',
  '2': [
    {'1': 'bank', '3': 1, '4': 1, '5': 11, '6': '.proto.Bank', '10': 'bank'},
  ],
};

/// Descriptor for `CreateBankRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBankRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVCYW5rUmVxdWVzdBIfCgRiYW5rGAEgASgLMgsucHJvdG8uQmFua1IEYmFuaw==');

@$core.Deprecated('Use createBankResponseDescriptor instead')
const CreateBankResponse$json = {
  '1': 'CreateBankResponse',
  '2': [
    {'1': 'bank_id', '3': 1, '4': 1, '5': 13, '10': 'bankId'},
  ],
};

/// Descriptor for `CreateBankResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBankResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVCYW5rUmVzcG9uc2USFwoHYmFua19pZBgBIAEoDVIGYmFua0lk');

@$core.Deprecated('Use getBankRequestDescriptor instead')
const GetBankRequest$json = {
  '1': 'GetBankRequest',
  '2': [
    {'1': 'bank_id', '3': 1, '4': 1, '5': 13, '10': 'bankId'},
  ],
};

/// Descriptor for `GetBankRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBankRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRCYW5rUmVxdWVzdBIXCgdiYW5rX2lkGAEgASgNUgZiYW5rSWQ=');

@$core.Deprecated('Use getBankResponseDescriptor instead')
const GetBankResponse$json = {
  '1': 'GetBankResponse',
  '2': [
    {'1': 'bank', '3': 1, '4': 1, '5': 11, '6': '.proto.Bank', '10': 'bank'},
  ],
};

/// Descriptor for `GetBankResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBankResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRCYW5rUmVzcG9uc2USHwoEYmFuaxgBIAEoCzILLnByb3RvLkJhbmtSBGJhbms=');

@$core.Deprecated('Use updateBankRequestDescriptor instead')
const UpdateBankRequest$json = {
  '1': 'UpdateBankRequest',
  '2': [
    {'1': 'bank_id', '3': 1, '4': 1, '5': 13, '10': 'bankId'},
    {'1': 'bank_data', '3': 2, '4': 1, '5': 11, '6': '.proto.Bank', '10': 'bankData'},
  ],
};

/// Descriptor for `UpdateBankRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBankRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVCYW5rUmVxdWVzdBIXCgdiYW5rX2lkGAEgASgNUgZiYW5rSWQSKAoJYmFua19kYX'
    'RhGAIgASgLMgsucHJvdG8uQmFua1IIYmFua0RhdGE=');

@$core.Deprecated('Use updateBankResponseDescriptor instead')
const UpdateBankResponse$json = {
  '1': 'UpdateBankResponse',
  '2': [
    {'1': 'bank', '3': 1, '4': 1, '5': 11, '6': '.proto.Bank', '10': 'bank'},
  ],
};

/// Descriptor for `UpdateBankResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBankResponseDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVCYW5rUmVzcG9uc2USHwoEYmFuaxgBIAEoCzILLnByb3RvLkJhbmtSBGJhbms=');

@$core.Deprecated('Use deleteBankRequestDescriptor instead')
const DeleteBankRequest$json = {
  '1': 'DeleteBankRequest',
  '2': [
    {'1': 'bank_id', '3': 1, '4': 1, '5': 13, '10': 'bankId'},
  ],
};

/// Descriptor for `DeleteBankRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBankRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVCYW5rUmVxdWVzdBIXCgdiYW5rX2lkGAEgASgNUgZiYW5rSWQ=');

@$core.Deprecated('Use deleteBankResponseDescriptor instead')
const DeleteBankResponse$json = {
  '1': 'DeleteBankResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteBankResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBankResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVCYW5rUmVzcG9uc2USMgoIcmVzcG9uc2UYASABKAsyFi5nb29nbGUucHJvdG9idW'
    'YuRW1wdHlSCHJlc3BvbnNl');

@$core.Deprecated('Use listBanksRequestDescriptor instead')
const ListBanksRequest$json = {
  '1': 'ListBanksRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListBanksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBanksRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0QmFua3NSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZVNpemUSHQoKcGFnZV'
    '90b2tlbhgCIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listBanksResponseDescriptor instead')
const ListBanksResponse$json = {
  '1': 'ListBanksResponse',
  '2': [
    {'1': 'banks', '3': 1, '4': 3, '5': 11, '6': '.proto.Bank', '10': 'banks'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListBanksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBanksResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0QmFua3NSZXNwb25zZRIhCgViYW5rcxgBIAMoCzILLnByb3RvLkJhbmtSBWJhbmtzEi'
    'YKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use createInteractionRequestDescriptor instead')
const CreateInteractionRequest$json = {
  '1': 'CreateInteractionRequest',
  '2': [
    {'1': 'interaction', '3': 1, '4': 1, '5': 11, '6': '.proto.Interaction', '10': 'interaction'},
  ],
};

/// Descriptor for `CreateInteractionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInteractionRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVJbnRlcmFjdGlvblJlcXVlc3QSNAoLaW50ZXJhY3Rpb24YASABKAsyEi5wcm90by'
    '5JbnRlcmFjdGlvblILaW50ZXJhY3Rpb24=');

@$core.Deprecated('Use createInteractionResponseDescriptor instead')
const CreateInteractionResponse$json = {
  '1': 'CreateInteractionResponse',
  '2': [
    {'1': 'interaction_id', '3': 1, '4': 1, '5': 13, '10': 'interactionId'},
  ],
};

/// Descriptor for `CreateInteractionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInteractionResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVJbnRlcmFjdGlvblJlc3BvbnNlEiUKDmludGVyYWN0aW9uX2lkGAEgASgNUg1pbn'
    'RlcmFjdGlvbklk');

@$core.Deprecated('Use getInteractionRequestDescriptor instead')
const GetInteractionRequest$json = {
  '1': 'GetInteractionRequest',
  '2': [
    {'1': 'interaction_id', '3': 1, '4': 1, '5': 13, '10': 'interactionId'},
  ],
};

/// Descriptor for `GetInteractionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInteractionRequestDescriptor = $convert.base64Decode(
    'ChVHZXRJbnRlcmFjdGlvblJlcXVlc3QSJQoOaW50ZXJhY3Rpb25faWQYASABKA1SDWludGVyYW'
    'N0aW9uSWQ=');

@$core.Deprecated('Use getInteractionResponseDescriptor instead')
const GetInteractionResponse$json = {
  '1': 'GetInteractionResponse',
  '2': [
    {'1': 'interaction', '3': 1, '4': 1, '5': 11, '6': '.proto.Interaction', '10': 'interaction'},
  ],
};

/// Descriptor for `GetInteractionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInteractionResponseDescriptor = $convert.base64Decode(
    'ChZHZXRJbnRlcmFjdGlvblJlc3BvbnNlEjQKC2ludGVyYWN0aW9uGAEgASgLMhIucHJvdG8uSW'
    '50ZXJhY3Rpb25SC2ludGVyYWN0aW9u');

@$core.Deprecated('Use updateInteractionRequestDescriptor instead')
const UpdateInteractionRequest$json = {
  '1': 'UpdateInteractionRequest',
  '2': [
    {'1': 'interaction_id', '3': 1, '4': 1, '5': 13, '10': 'interactionId'},
    {'1': 'interaction_data', '3': 2, '4': 1, '5': 11, '6': '.proto.Interaction', '10': 'interactionData'},
  ],
};

/// Descriptor for `UpdateInteractionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInteractionRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVJbnRlcmFjdGlvblJlcXVlc3QSJQoOaW50ZXJhY3Rpb25faWQYASABKA1SDWludG'
    'VyYWN0aW9uSWQSPQoQaW50ZXJhY3Rpb25fZGF0YRgCIAEoCzISLnByb3RvLkludGVyYWN0aW9u'
    'Ug9pbnRlcmFjdGlvbkRhdGE=');

@$core.Deprecated('Use updateInteractionResponseDescriptor instead')
const UpdateInteractionResponse$json = {
  '1': 'UpdateInteractionResponse',
  '2': [
    {'1': 'interaction', '3': 1, '4': 1, '5': 11, '6': '.proto.Interaction', '10': 'interaction'},
  ],
};

/// Descriptor for `UpdateInteractionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInteractionResponseDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVJbnRlcmFjdGlvblJlc3BvbnNlEjQKC2ludGVyYWN0aW9uGAEgASgLMhIucHJvdG'
    '8uSW50ZXJhY3Rpb25SC2ludGVyYWN0aW9u');

@$core.Deprecated('Use deleteInteractionRequestDescriptor instead')
const DeleteInteractionRequest$json = {
  '1': 'DeleteInteractionRequest',
  '2': [
    {'1': 'interaction_id', '3': 1, '4': 1, '5': 13, '10': 'interactionId'},
  ],
};

/// Descriptor for `DeleteInteractionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteInteractionRequestDescriptor = $convert.base64Decode(
    'ChhEZWxldGVJbnRlcmFjdGlvblJlcXVlc3QSJQoOaW50ZXJhY3Rpb25faWQYASABKA1SDWludG'
    'VyYWN0aW9uSWQ=');

@$core.Deprecated('Use deleteInteractionResponseDescriptor instead')
const DeleteInteractionResponse$json = {
  '1': 'DeleteInteractionResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeleteInteractionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteInteractionResponseDescriptor = $convert.base64Decode(
    'ChlEZWxldGVJbnRlcmFjdGlvblJlc3BvbnNlEjIKCHJlc3BvbnNlGAEgASgLMhYuZ29vZ2xlLn'
    'Byb3RvYnVmLkVtcHR5UghyZXNwb25zZQ==');

@$core.Deprecated('Use listInteractionsRequestDescriptor instead')
const ListInteractionsRequest$json = {
  '1': 'ListInteractionsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListInteractionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInteractionsRequestDescriptor = $convert.base64Decode(
    'ChdMaXN0SW50ZXJhY3Rpb25zUmVxdWVzdBIbCglwYWdlX3NpemUYASABKAVSCHBhZ2VTaXplEh'
    '0KCnBhZ2VfdG9rZW4YAiABKAlSCXBhZ2VUb2tlbg==');

@$core.Deprecated('Use listInteractionsResponseDescriptor instead')
const ListInteractionsResponse$json = {
  '1': 'ListInteractionsResponse',
  '2': [
    {'1': 'interactions', '3': 1, '4': 3, '5': 11, '6': '.proto.Interaction', '10': 'interactions'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListInteractionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInteractionsResponseDescriptor = $convert.base64Decode(
    'ChhMaXN0SW50ZXJhY3Rpb25zUmVzcG9uc2USNgoMaW50ZXJhY3Rpb25zGAEgAygLMhIucHJvdG'
    '8uSW50ZXJhY3Rpb25SDGludGVyYWN0aW9ucxImCg9uZXh0X3BhZ2VfdG9rZW4YAiABKAlSDW5l'
    'eHRQYWdlVG9rZW4=');

@$core.Deprecated('Use createPaymentRequestDescriptor instead')
const CreatePaymentRequest$json = {
  '1': 'CreatePaymentRequest',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.proto.Payment', '10': 'payment'},
  ],
};

/// Descriptor for `CreatePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQYXltZW50UmVxdWVzdBIoCgdwYXltZW50GAEgASgLMg4ucHJvdG8uUGF5bWVudF'
    'IHcGF5bWVudA==');

@$core.Deprecated('Use createPaymentResponseDescriptor instead')
const CreatePaymentResponse$json = {
  '1': 'CreatePaymentResponse',
  '2': [
    {'1': 'payment_id', '3': 1, '4': 1, '5': 13, '10': 'paymentId'},
  ],
};

/// Descriptor for `CreatePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQYXltZW50UmVzcG9uc2USHQoKcGF5bWVudF9pZBgBIAEoDVIJcGF5bWVudElk');

@$core.Deprecated('Use getPaymentRequestDescriptor instead')
const GetPaymentRequest$json = {
  '1': 'GetPaymentRequest',
  '2': [
    {'1': 'payment_id', '3': 1, '4': 1, '5': 13, '10': 'paymentId'},
  ],
};

/// Descriptor for `GetPaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQYXltZW50UmVxdWVzdBIdCgpwYXltZW50X2lkGAEgASgNUglwYXltZW50SWQ=');

@$core.Deprecated('Use getPaymentResponseDescriptor instead')
const GetPaymentResponse$json = {
  '1': 'GetPaymentResponse',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.proto.Payment', '10': 'payment'},
  ],
};

/// Descriptor for `GetPaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQYXltZW50UmVzcG9uc2USKAoHcGF5bWVudBgBIAEoCzIOLnByb3RvLlBheW1lbnRSB3'
    'BheW1lbnQ=');

@$core.Deprecated('Use updatePaymentRequestDescriptor instead')
const UpdatePaymentRequest$json = {
  '1': 'UpdatePaymentRequest',
  '2': [
    {'1': 'payment_id', '3': 1, '4': 1, '5': 13, '10': 'paymentId'},
    {'1': 'payment_data', '3': 2, '4': 1, '5': 11, '6': '.proto.Payment', '10': 'paymentData'},
  ],
};

/// Descriptor for `UpdatePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePaymentRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQYXltZW50UmVxdWVzdBIdCgpwYXltZW50X2lkGAEgASgNUglwYXltZW50SWQSMQ'
    'oMcGF5bWVudF9kYXRhGAIgASgLMg4ucHJvdG8uUGF5bWVudFILcGF5bWVudERhdGE=');

@$core.Deprecated('Use updatePaymentResponseDescriptor instead')
const UpdatePaymentResponse$json = {
  '1': 'UpdatePaymentResponse',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.proto.Payment', '10': 'payment'},
  ],
};

/// Descriptor for `UpdatePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePaymentResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQYXltZW50UmVzcG9uc2USKAoHcGF5bWVudBgBIAEoCzIOLnByb3RvLlBheW1lbn'
    'RSB3BheW1lbnQ=');

@$core.Deprecated('Use deletePaymentRequestDescriptor instead')
const DeletePaymentRequest$json = {
  '1': 'DeletePaymentRequest',
  '2': [
    {'1': 'payment_id', '3': 1, '4': 1, '5': 13, '10': 'paymentId'},
  ],
};

/// Descriptor for `DeletePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePaymentRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVQYXltZW50UmVxdWVzdBIdCgpwYXltZW50X2lkGAEgASgNUglwYXltZW50SWQ=');

@$core.Deprecated('Use deletePaymentResponseDescriptor instead')
const DeletePaymentResponse$json = {
  '1': 'DeletePaymentResponse',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Empty', '10': 'response'},
  ],
};

/// Descriptor for `DeletePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePaymentResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVQYXltZW50UmVzcG9uc2USMgoIcmVzcG9uc2UYASABKAsyFi5nb29nbGUucHJvdG'
    '9idWYuRW1wdHlSCHJlc3BvbnNl');

@$core.Deprecated('Use listPaymentsRequestDescriptor instead')
const ListPaymentsRequest$json = {
  '1': 'ListPaymentsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListPaymentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPaymentsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0UGF5bWVudHNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZVNpemUSHQoKcG'
    'FnZV90b2tlbhgCIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listPaymentsResponseDescriptor instead')
const ListPaymentsResponse$json = {
  '1': 'ListPaymentsResponse',
  '2': [
    {'1': 'payments', '3': 1, '4': 3, '5': 11, '6': '.proto.Payment', '10': 'payments'},
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListPaymentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPaymentsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0UGF5bWVudHNSZXNwb25zZRIqCghwYXltZW50cxgBIAMoCzIOLnByb3RvLlBheW1lbn'
    'RSCHBheW1lbnRzEiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhQKBXRva2VuGAEgASgJUgV0b2tlbg==');

@$core.Deprecated('Use loginEmployeeRequestDescriptor instead')
const LoginEmployeeRequest$json = {
  '1': 'LoginEmployeeRequest',
  '2': [
    {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginEmployeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginEmployeeRequestDescriptor = $convert.base64Decode(
    'ChRMb2dpbkVtcGxveWVlUmVxdWVzdBIUCgVsb2dpbhgBIAEoCVIFbG9naW4SGgoIcGFzc3dvcm'
    'QYAiABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use loginEmployeeResponseDescriptor instead')
const LoginEmployeeResponse$json = {
  '1': 'LoginEmployeeResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'employee', '3': 2, '4': 1, '5': 11, '6': '.proto.Employee', '10': 'employee'},
  ],
};

/// Descriptor for `LoginEmployeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginEmployeeResponseDescriptor = $convert.base64Decode(
    'ChVMb2dpbkVtcGxveWVlUmVzcG9uc2USFAoFdG9rZW4YASABKAlSBXRva2VuEisKCGVtcGxveW'
    'VlGAIgASgLMg8ucHJvdG8uRW1wbG95ZWVSCGVtcGxveWVl');


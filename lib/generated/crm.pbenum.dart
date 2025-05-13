//
//  Generated code. Do not modify.
//  source: crm.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Employee roles
class EmployeeRole extends $pb.ProtobufEnum {
  static const EmployeeRole EMPLOYEE_ROLE_UNSPECIFIED = EmployeeRole._(0, _omitEnumNames ? '' : 'EMPLOYEE_ROLE_UNSPECIFIED');
  static const EmployeeRole MANAGER = EmployeeRole._(1, _omitEnumNames ? '' : 'MANAGER');
  static const EmployeeRole CHIEF_MANAGER = EmployeeRole._(2, _omitEnumNames ? '' : 'CHIEF_MANAGER');
  static const EmployeeRole DIRECTOR = EmployeeRole._(3, _omitEnumNames ? '' : 'DIRECTOR');
  static const EmployeeRole TRANSLATOR = EmployeeRole._(4, _omitEnumNames ? '' : 'TRANSLATOR');
  static const EmployeeRole ACCOUNTANT = EmployeeRole._(5, _omitEnumNames ? '' : 'ACCOUNTANT');

  static const $core.List<EmployeeRole> values = <EmployeeRole> [
    EMPLOYEE_ROLE_UNSPECIFIED,
    MANAGER,
    CHIEF_MANAGER,
    DIRECTOR,
    TRANSLATOR,
    ACCOUNTANT,
  ];

  static final $core.Map<$core.int, EmployeeRole> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EmployeeRole? valueOf($core.int value) => _byValue[value];

  const EmployeeRole._(super.v, super.n);
}

/// Status for various entities
class Status extends $pb.ProtobufEnum {
  static const Status STATUS_UNSPECIFIED = Status._(0, _omitEnumNames ? '' : 'STATUS_UNSPECIFIED');
  static const Status DRAFT = Status._(1, _omitEnumNames ? '' : 'DRAFT');
  static const Status ACTIVE = Status._(2, _omitEnumNames ? '' : 'ACTIVE');
  static const Status COMPLETED = Status._(3, _omitEnumNames ? '' : 'COMPLETED');
  static const Status CANCELLED = Status._(4, _omitEnumNames ? '' : 'CANCELLED');
  static const Status REJECTED = Status._(5, _omitEnumNames ? '' : 'REJECTED');
  static const Status APPROVED = Status._(6, _omitEnumNames ? '' : 'APPROVED');
  static const Status PENDING = Status._(7, _omitEnumNames ? '' : 'PENDING');

  static const $core.List<Status> values = <Status> [
    STATUS_UNSPECIFIED,
    DRAFT,
    ACTIVE,
    COMPLETED,
    CANCELLED,
    REJECTED,
    APPROVED,
    PENDING,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status? valueOf($core.int value) => _byValue[value];

  const Status._(super.v, super.n);
}

/// Priority for translation orders
class Priority extends $pb.ProtobufEnum {
  static const Priority PRIORITY_UNSPECIFIED = Priority._(0, _omitEnumNames ? '' : 'PRIORITY_UNSPECIFIED');
  static const Priority NORMAL = Priority._(1, _omitEnumNames ? '' : 'NORMAL');
  static const Priority URGENT = Priority._(2, _omitEnumNames ? '' : 'URGENT');
  static const Priority SEMI_URGENT = Priority._(3, _omitEnumNames ? '' : 'SEMI_URGENT');

  static const $core.List<Priority> values = <Priority> [
    PRIORITY_UNSPECIFIED,
    NORMAL,
    URGENT,
    SEMI_URGENT,
  ];

  static final $core.Map<$core.int, Priority> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Priority? valueOf($core.int value) => _byValue[value];

  const Priority._(super.v, super.n);
}

/// Registration type for business registration
class RegistrationType extends $pb.ProtobufEnum {
  static const RegistrationType REGISTRATION_TYPE_UNSPECIFIED = RegistrationType._(0, _omitEnumNames ? '' : 'REGISTRATION_TYPE_UNSPECIFIED');
  static const RegistrationType IP = RegistrationType._(1, _omitEnumNames ? '' : 'IP');
  static const RegistrationType OOO = RegistrationType._(2, _omitEnumNames ? '' : 'OOO');

  static const $core.List<RegistrationType> values = <RegistrationType> [
    REGISTRATION_TYPE_UNSPECIFIED,
    IP,
    OOO,
  ];

  static final $core.Map<$core.int, RegistrationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RegistrationType? valueOf($core.int value) => _byValue[value];

  const RegistrationType._(super.v, super.n);
}

/// Payment method
class PaymentMethod extends $pb.ProtobufEnum {
  static const PaymentMethod PAYMENT_METHOD_UNSPECIFIED = PaymentMethod._(0, _omitEnumNames ? '' : 'PAYMENT_METHOD_UNSPECIFIED');
  static const PaymentMethod CASH = PaymentMethod._(1, _omitEnumNames ? '' : 'CASH');
  static const PaymentMethod CARD = PaymentMethod._(2, _omitEnumNames ? '' : 'CARD');
  static const PaymentMethod BANK_TRANSFER = PaymentMethod._(3, _omitEnumNames ? '' : 'BANK_TRANSFER');
  static const PaymentMethod OTHER = PaymentMethod._(4, _omitEnumNames ? '' : 'OTHER');

  static const $core.List<PaymentMethod> values = <PaymentMethod> [
    PAYMENT_METHOD_UNSPECIFIED,
    CASH,
    CARD,
    BANK_TRANSFER,
    OTHER,
  ];

  static final $core.Map<$core.int, PaymentMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentMethod? valueOf($core.int value) => _byValue[value];

  const PaymentMethod._(super.v, super.n);
}

/// Interaction type
class InteractionType extends $pb.ProtobufEnum {
  static const InteractionType INTERACTION_TYPE_UNSPECIFIED = InteractionType._(0, _omitEnumNames ? '' : 'INTERACTION_TYPE_UNSPECIFIED');
  static const InteractionType INTERACTION_TYPE_CALL = InteractionType._(1, _omitEnumNames ? '' : 'INTERACTION_TYPE_CALL');
  static const InteractionType INTERACTION_TYPE_MEETING = InteractionType._(2, _omitEnumNames ? '' : 'INTERACTION_TYPE_MEETING');
  static const InteractionType INTERACTION_TYPE_EMAIL = InteractionType._(3, _omitEnumNames ? '' : 'INTERACTION_TYPE_EMAIL');
  static const InteractionType INTERACTION_TYPE_CHAT = InteractionType._(4, _omitEnumNames ? '' : 'INTERACTION_TYPE_CHAT');
  static const InteractionType INTERACTION_TYPE_OTHER = InteractionType._(5, _omitEnumNames ? '' : 'INTERACTION_TYPE_OTHER');

  static const $core.List<InteractionType> values = <InteractionType> [
    INTERACTION_TYPE_UNSPECIFIED,
    INTERACTION_TYPE_CALL,
    INTERACTION_TYPE_MEETING,
    INTERACTION_TYPE_EMAIL,
    INTERACTION_TYPE_CHAT,
    INTERACTION_TYPE_OTHER,
  ];

  static final $core.Map<$core.int, InteractionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InteractionType? valueOf($core.int value) => _byValue[value];

  const InteractionType._(super.v, super.n);
}

/// Client source
class ClientSource extends $pb.ProtobufEnum {
  static const ClientSource CLIENT_SOURCE_UNSPECIFIED = ClientSource._(0, _omitEnumNames ? '' : 'CLIENT_SOURCE_UNSPECIFIED');
  static const ClientSource CLIENT_SOURCE_REFERRAL = ClientSource._(1, _omitEnumNames ? '' : 'CLIENT_SOURCE_REFERRAL');
  static const ClientSource CLIENT_SOURCE_ONLINE = ClientSource._(2, _omitEnumNames ? '' : 'CLIENT_SOURCE_ONLINE');
  static const ClientSource CLIENT_SOURCE_WALK_IN = ClientSource._(3, _omitEnumNames ? '' : 'CLIENT_SOURCE_WALK_IN');
  static const ClientSource CLIENT_SOURCE_PARTNER = ClientSource._(4, _omitEnumNames ? '' : 'CLIENT_SOURCE_PARTNER');
  static const ClientSource CLIENT_SOURCE_OTHER = ClientSource._(5, _omitEnumNames ? '' : 'CLIENT_SOURCE_OTHER');

  static const $core.List<ClientSource> values = <ClientSource> [
    CLIENT_SOURCE_UNSPECIFIED,
    CLIENT_SOURCE_REFERRAL,
    CLIENT_SOURCE_ONLINE,
    CLIENT_SOURCE_WALK_IN,
    CLIENT_SOURCE_PARTNER,
    CLIENT_SOURCE_OTHER,
  ];

  static final $core.Map<$core.int, ClientSource> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientSource? valueOf($core.int value) => _byValue[value];

  const ClientSource._(super.v, super.n);
}

/// Translation Progress Status
class TranslationProgressStatus extends $pb.ProtobufEnum {
  static const TranslationProgressStatus TRANSLATION_PROGRESS_STATUS_UNSPECIFIED = TranslationProgressStatus._(0, _omitEnumNames ? '' : 'TRANSLATION_PROGRESS_STATUS_UNSPECIFIED');
  static const TranslationProgressStatus PENDING_ASSIGNMENT = TranslationProgressStatus._(1, _omitEnumNames ? '' : 'PENDING_ASSIGNMENT');
  static const TranslationProgressStatus IN_PROGRESS = TranslationProgressStatus._(2, _omitEnumNames ? '' : 'IN_PROGRESS');
  static const TranslationProgressStatus TRANSLATED = TranslationProgressStatus._(3, _omitEnumNames ? '' : 'TRANSLATED');
  static const TranslationProgressStatus CHECKED_BY_MANAGER = TranslationProgressStatus._(4, _omitEnumNames ? '' : 'CHECKED_BY_MANAGER');
  static const TranslationProgressStatus CLIENT_NOTIFIED = TranslationProgressStatus._(5, _omitEnumNames ? '' : 'CLIENT_NOTIFIED');
  static const TranslationProgressStatus DELIVERED = TranslationProgressStatus._(6, _omitEnumNames ? '' : 'DELIVERED');

  static const $core.List<TranslationProgressStatus> values = <TranslationProgressStatus> [
    TRANSLATION_PROGRESS_STATUS_UNSPECIFIED,
    PENDING_ASSIGNMENT,
    IN_PROGRESS,
    TRANSLATED,
    CHECKED_BY_MANAGER,
    CLIENT_NOTIFIED,
    DELIVERED,
  ];

  static final $core.Map<$core.int, TranslationProgressStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TranslationProgressStatus? valueOf($core.int value) => _byValue[value];

  const TranslationProgressStatus._(super.v, super.n);
}

/// Policy Renewal Status
class PolicyRenewalStatus extends $pb.ProtobufEnum {
  static const PolicyRenewalStatus POLICY_RENEWAL_STATUS_UNSPECIFIED = PolicyRenewalStatus._(0, _omitEnumNames ? '' : 'POLICY_RENEWAL_STATUS_UNSPECIFIED');
  static const PolicyRenewalStatus PENDING_RENEWAL = PolicyRenewalStatus._(1, _omitEnumNames ? '' : 'PENDING_RENEWAL');
  static const PolicyRenewalStatus RENEWED = PolicyRenewalStatus._(2, _omitEnumNames ? '' : 'RENEWED');
  static const PolicyRenewalStatus NOT_RENEWED = PolicyRenewalStatus._(3, _omitEnumNames ? '' : 'NOT_RENEWED');

  static const $core.List<PolicyRenewalStatus> values = <PolicyRenewalStatus> [
    POLICY_RENEWAL_STATUS_UNSPECIFIED,
    PENDING_RENEWAL,
    RENEWED,
    NOT_RENEWED,
  ];

  static final $core.Map<$core.int, PolicyRenewalStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PolicyRenewalStatus? valueOf($core.int value) => _byValue[value];

  const PolicyRenewalStatus._(super.v, super.n);
}

/// Service Category for Reporting
class ServiceCategory extends $pb.ProtobufEnum {
  static const ServiceCategory SERVICE_CATEGORY_UNSPECIFIED = ServiceCategory._(0, _omitEnumNames ? '' : 'SERVICE_CATEGORY_UNSPECIFIED');
  static const ServiceCategory LEGAL_SERVICES = ServiceCategory._(1, _omitEnumNames ? '' : 'LEGAL_SERVICES');
  static const ServiceCategory TRANSLATIONS = ServiceCategory._(2, _omitEnumNames ? '' : 'TRANSLATIONS');
  static const ServiceCategory INSURANCE = ServiceCategory._(3, _omitEnumNames ? '' : 'INSURANCE');
  static const ServiceCategory PROFESSIONAL_DEVELOPMENT = ServiceCategory._(4, _omitEnumNames ? '' : 'PROFESSIONAL_DEVELOPMENT');
  static const ServiceCategory ACCOUNT_OPENING = ServiceCategory._(5, _omitEnumNames ? '' : 'ACCOUNT_OPENING');
  static const ServiceCategory BUSINESS_REGISTRATION = ServiceCategory._(6, _omitEnumNames ? '' : 'BUSINESS_REGISTRATION');
  static const ServiceCategory LENDING = ServiceCategory._(7, _omitEnumNames ? '' : 'LENDING');
  static const ServiceCategory ALL_SERVICES = ServiceCategory._(8, _omitEnumNames ? '' : 'ALL_SERVICES');

  static const $core.List<ServiceCategory> values = <ServiceCategory> [
    SERVICE_CATEGORY_UNSPECIFIED,
    LEGAL_SERVICES,
    TRANSLATIONS,
    INSURANCE,
    PROFESSIONAL_DEVELOPMENT,
    ACCOUNT_OPENING,
    BUSINESS_REGISTRATION,
    LENDING,
    ALL_SERVICES,
  ];

  static final $core.Map<$core.int, ServiceCategory> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceCategory? valueOf($core.int value) => _byValue[value];

  const ServiceCategory._(super.v, super.n);
}

/// Payment Status for Report Items
class ReportPaymentStatus extends $pb.ProtobufEnum {
  static const ReportPaymentStatus REPORT_PAYMENT_STATUS_UNSPECIFIED = ReportPaymentStatus._(0, _omitEnumNames ? '' : 'REPORT_PAYMENT_STATUS_UNSPECIFIED');
  static const ReportPaymentStatus PAID = ReportPaymentStatus._(1, _omitEnumNames ? '' : 'PAID');
  static const ReportPaymentStatus PARTIALLY_PAID = ReportPaymentStatus._(2, _omitEnumNames ? '' : 'PARTIALLY_PAID');
  static const ReportPaymentStatus UNPAID = ReportPaymentStatus._(3, _omitEnumNames ? '' : 'UNPAID');
  static const ReportPaymentStatus OVERDUE = ReportPaymentStatus._(4, _omitEnumNames ? '' : 'OVERDUE');
  static const ReportPaymentStatus NOT_APPLICABLE = ReportPaymentStatus._(5, _omitEnumNames ? '' : 'NOT_APPLICABLE');

  static const $core.List<ReportPaymentStatus> values = <ReportPaymentStatus> [
    REPORT_PAYMENT_STATUS_UNSPECIFIED,
    PAID,
    PARTIALLY_PAID,
    UNPAID,
    OVERDUE,
    NOT_APPLICABLE,
  ];

  static final $core.Map<$core.int, ReportPaymentStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportPaymentStatus? valueOf($core.int value) => _byValue[value];

  const ReportPaymentStatus._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

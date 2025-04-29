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

/// Document type for translation orders
class DocumentType extends $pb.ProtobufEnum {
  static const DocumentType DOCUMENT_TYPE_UNSPECIFIED = DocumentType._(0, _omitEnumNames ? '' : 'DOCUMENT_TYPE_UNSPECIFIED');
  static const DocumentType DOCUMENT_TYPE_PASSPORT = DocumentType._(1, _omitEnumNames ? '' : 'DOCUMENT_TYPE_PASSPORT');
  static const DocumentType DOCUMENT_TYPE_CERTIFICATE = DocumentType._(2, _omitEnumNames ? '' : 'DOCUMENT_TYPE_CERTIFICATE');
  static const DocumentType DOCUMENT_TYPE_CONTRACT = DocumentType._(3, _omitEnumNames ? '' : 'DOCUMENT_TYPE_CONTRACT');
  static const DocumentType DOCUMENT_TYPE_OTHER = DocumentType._(4, _omitEnumNames ? '' : 'DOCUMENT_TYPE_OTHER');

  static const $core.List<DocumentType> values = <DocumentType> [
    DOCUMENT_TYPE_UNSPECIFIED,
    DOCUMENT_TYPE_PASSPORT,
    DOCUMENT_TYPE_CERTIFICATE,
    DOCUMENT_TYPE_CONTRACT,
    DOCUMENT_TYPE_OTHER,
  ];

  static final $core.Map<$core.int, DocumentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DocumentType? valueOf($core.int value) => _byValue[value];

  const DocumentType._(super.v, super.n);
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


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

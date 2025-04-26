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

import 'google/protobuf/empty.pb.dart' as $3;
import 'google/protobuf/struct.pb.dart' as $1;
import 'google/protobuf/timestamp.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Client represents a customer in the CRM system.
/// All fields are required unless marked as optional.
class Client extends $pb.GeneratedMessage {
  factory Client({
    $core.String? clientId,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? phone,
    $core.String? email,
    $core.String? telegramId,
    $core.String? whatsappNumber,
    $core.String? source,
    $1.Value? passportData,
    $core.String? notes,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (email != null) {
      $result.email = email;
    }
    if (telegramId != null) {
      $result.telegramId = telegramId;
    }
    if (whatsappNumber != null) {
      $result.whatsappNumber = whatsappNumber;
    }
    if (source != null) {
      $result.source = source;
    }
    if (passportData != null) {
      $result.passportData = passportData;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  Client._() : super();
  factory Client.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Client.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Client', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..aOS(2, _omitFieldNames ? '' : 'firstName')
    ..aOS(3, _omitFieldNames ? '' : 'lastName')
    ..aOS(4, _omitFieldNames ? '' : 'phone')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'telegramId')
    ..aOS(7, _omitFieldNames ? '' : 'whatsappNumber')
    ..aOS(8, _omitFieldNames ? '' : 'source')
    ..aOM<$1.Value>(9, _omitFieldNames ? '' : 'passportData', subBuilder: $1.Value.create)
    ..aOS(10, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Client clone() => Client()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Client copyWith(void Function(Client) updates) => super.copyWith((message) => updates(message as Client)) as Client;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Client create() => Client._();
  Client createEmptyInstance() => create();
  static $pb.PbList<Client> createRepeated() => $pb.PbList<Client>();
  @$core.pragma('dart2js:noInline')
  static Client getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Client>(create);
  static Client? _defaultInstance;

  /// Unique identifier for the client (UUID format)
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);

  /// Client's first name (min 2 chars, max 255 chars)
  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => $_clearField(2);

  /// Client's last name (min 2 chars, max 255 chars)
  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => $_clearField(3);

  /// Client's phone number (E.164 format)
  @$pb.TagNumber(4)
  $core.String get phone => $_getSZ(3);
  @$pb.TagNumber(4)
  set phone($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhone() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhone() => $_clearField(4);

  /// Client's email address (valid email format)
  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => $_clearField(5);

  /// Client's Telegram ID
  @$pb.TagNumber(6)
  $core.String get telegramId => $_getSZ(5);
  @$pb.TagNumber(6)
  set telegramId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTelegramId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTelegramId() => $_clearField(6);

  /// Client's WhatsApp number (E.164 format)
  @$pb.TagNumber(7)
  $core.String get whatsappNumber => $_getSZ(6);
  @$pb.TagNumber(7)
  set whatsappNumber($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWhatsappNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearWhatsappNumber() => $_clearField(7);

  /// Source of the client
  @$pb.TagNumber(8)
  $core.String get source => $_getSZ(7);
  @$pb.TagNumber(8)
  set source($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSource() => $_has(7);
  @$pb.TagNumber(8)
  void clearSource() => $_clearField(8);

  /// Client's passport data (stored as JSON)
  @$pb.TagNumber(9)
  $1.Value get passportData => $_getN(8);
  @$pb.TagNumber(9)
  set passportData($1.Value v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPassportData() => $_has(8);
  @$pb.TagNumber(9)
  void clearPassportData() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Value ensurePassportData() => $_ensure(8);

  /// Notes about the client
  @$pb.TagNumber(10)
  $core.String get notes => $_getSZ(9);
  @$pb.TagNumber(10)
  set notes($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNotes() => $_has(9);
  @$pb.TagNumber(10)
  void clearNotes() => $_clearField(10);
}

/// User represents a system user with authentication credentials.
/// All fields are required unless marked as optional.
class User extends $pb.GeneratedMessage {
  factory User({
    $core.String? userId,
    $core.String? login,
    $2.Timestamp? lastLogin,
    $core.String? notes,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (login != null) {
      $result.login = login;
    }
    if (lastLogin != null) {
      $result.lastLogin = lastLogin;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'login')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'lastLogin', subBuilder: $2.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  /// Unique identifier for the user (UUID format)
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// User's login name (min 3 chars, max 100 chars, alphanumeric only)
  @$pb.TagNumber(2)
  $core.String get login => $_getSZ(1);
  @$pb.TagNumber(2)
  set login($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogin() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogin() => $_clearField(2);

  /// PasswordHash is intentionally omitted from proto messages for security
  @$pb.TagNumber(3)
  $2.Timestamp get lastLogin => $_getN(2);
  @$pb.TagNumber(3)
  set lastLogin($2.Timestamp v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastLogin() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastLogin() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureLastLogin() => $_ensure(2);

  /// Notes about the user
  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => $_clearField(4);
}

class Employee extends $pb.GeneratedMessage {
  factory Employee({
    $core.String? employeeId,
    $core.String? userId,
    $core.String? name,
    $core.String? role,
    $core.String? officeId,
    $core.String? telegramId,
    $core.String? whatsappNumber,
    $core.String? email,
    $core.bool? isActive,
    $core.String? notes,
  }) {
    final $result = create();
    if (employeeId != null) {
      $result.employeeId = employeeId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (role != null) {
      $result.role = role;
    }
    if (officeId != null) {
      $result.officeId = officeId;
    }
    if (telegramId != null) {
      $result.telegramId = telegramId;
    }
    if (whatsappNumber != null) {
      $result.whatsappNumber = whatsappNumber;
    }
    if (email != null) {
      $result.email = email;
    }
    if (isActive != null) {
      $result.isActive = isActive;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  Employee._() : super();
  factory Employee.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Employee.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Employee', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'employeeId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'role')
    ..aOS(5, _omitFieldNames ? '' : 'officeId')
    ..aOS(6, _omitFieldNames ? '' : 'telegramId')
    ..aOS(7, _omitFieldNames ? '' : 'whatsappNumber')
    ..aOS(8, _omitFieldNames ? '' : 'email')
    ..aOB(9, _omitFieldNames ? '' : 'isActive')
    ..aOS(10, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Employee clone() => Employee()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Employee copyWith(void Function(Employee) updates) => super.copyWith((message) => updates(message as Employee)) as Employee;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Employee create() => Employee._();
  Employee createEmptyInstance() => create();
  static $pb.PbList<Employee> createRepeated() => $pb.PbList<Employee>();
  @$core.pragma('dart2js:noInline')
  static Employee getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Employee>(create);
  static Employee? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get role => $_getSZ(3);
  @$pb.TagNumber(4)
  set role($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get officeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set officeId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOfficeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOfficeId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get telegramId => $_getSZ(5);
  @$pb.TagNumber(6)
  set telegramId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTelegramId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTelegramId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get whatsappNumber => $_getSZ(6);
  @$pb.TagNumber(7)
  set whatsappNumber($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWhatsappNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearWhatsappNumber() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get email => $_getSZ(7);
  @$pb.TagNumber(8)
  set email($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEmail() => $_has(7);
  @$pb.TagNumber(8)
  void clearEmail() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isActive => $_getBF(8);
  @$pb.TagNumber(9)
  set isActive($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsActive() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsActive() => $_clearField(9);

  /// Notes about the employee
  @$pb.TagNumber(10)
  $core.String get notes => $_getSZ(9);
  @$pb.TagNumber(10)
  set notes($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNotes() => $_has(9);
  @$pb.TagNumber(10)
  void clearNotes() => $_clearField(10);
}

class Office extends $pb.GeneratedMessage {
  factory Office({
    $core.String? officeId,
    $core.String? city,
    $core.String? address,
    $core.String? phone,
    $core.String? notes,
  }) {
    final $result = create();
    if (officeId != null) {
      $result.officeId = officeId;
    }
    if (city != null) {
      $result.city = city;
    }
    if (address != null) {
      $result.address = address;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  Office._() : super();
  factory Office.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Office.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Office', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'officeId')
    ..aOS(2, _omitFieldNames ? '' : 'city')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..aOS(4, _omitFieldNames ? '' : 'phone')
    ..aOS(5, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Office clone() => Office()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Office copyWith(void Function(Office) updates) => super.copyWith((message) => updates(message as Office)) as Office;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Office create() => Office._();
  Office createEmptyInstance() => create();
  static $pb.PbList<Office> createRepeated() => $pb.PbList<Office>();
  @$core.pragma('dart2js:noInline')
  static Office getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Office>(create);
  static Office? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get officeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set officeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOfficeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOfficeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get city => $_getSZ(1);
  @$pb.TagNumber(2)
  set city($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCity() => $_has(1);
  @$pb.TagNumber(2)
  void clearCity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get phone => $_getSZ(3);
  @$pb.TagNumber(4)
  set phone($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhone() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhone() => $_clearField(4);

  /// Notes about the office
  @$pb.TagNumber(5)
  $core.String get notes => $_getSZ(4);
  @$pb.TagNumber(5)
  set notes($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotes() => $_clearField(5);
}

class LegalCase extends $pb.GeneratedMessage {
  factory LegalCase({
    $core.String? caseId,
    $core.String? clientId,
    $core.String? managerId,
    $core.String? issueTypeId,
    $core.String? partnerId,
    $2.Timestamp? consultationDate,
    $2.Timestamp? contractDate,
    $core.double? contractAmount,
    $core.double? expectedCommission,
    $core.String? status,
    $core.String? paymentId,
    $core.String? notes,
  }) {
    final $result = create();
    if (caseId != null) {
      $result.caseId = caseId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (managerId != null) {
      $result.managerId = managerId;
    }
    if (issueTypeId != null) {
      $result.issueTypeId = issueTypeId;
    }
    if (partnerId != null) {
      $result.partnerId = partnerId;
    }
    if (consultationDate != null) {
      $result.consultationDate = consultationDate;
    }
    if (contractDate != null) {
      $result.contractDate = contractDate;
    }
    if (contractAmount != null) {
      $result.contractAmount = contractAmount;
    }
    if (expectedCommission != null) {
      $result.expectedCommission = expectedCommission;
    }
    if (status != null) {
      $result.status = status;
    }
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  LegalCase._() : super();
  factory LegalCase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LegalCase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LegalCase', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'managerId')
    ..aOS(4, _omitFieldNames ? '' : 'issueTypeId')
    ..aOS(5, _omitFieldNames ? '' : 'partnerId')
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'consultationDate', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'contractDate', subBuilder: $2.Timestamp.create)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'contractAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'expectedCommission', $pb.PbFieldType.OD)
    ..aOS(10, _omitFieldNames ? '' : 'status')
    ..aOS(11, _omitFieldNames ? '' : 'paymentId')
    ..aOS(12, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LegalCase clone() => LegalCase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LegalCase copyWith(void Function(LegalCase) updates) => super.copyWith((message) => updates(message as LegalCase)) as LegalCase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LegalCase create() => LegalCase._();
  LegalCase createEmptyInstance() => create();
  static $pb.PbList<LegalCase> createRepeated() => $pb.PbList<LegalCase>();
  @$core.pragma('dart2js:noInline')
  static LegalCase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LegalCase>(create);
  static LegalCase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get managerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set managerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get issueTypeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set issueTypeId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIssueTypeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearIssueTypeId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get partnerId => $_getSZ(4);
  @$pb.TagNumber(5)
  set partnerId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPartnerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPartnerId() => $_clearField(5);

  @$pb.TagNumber(6)
  $2.Timestamp get consultationDate => $_getN(5);
  @$pb.TagNumber(6)
  set consultationDate($2.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasConsultationDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearConsultationDate() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureConsultationDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.Timestamp get contractDate => $_getN(6);
  @$pb.TagNumber(7)
  set contractDate($2.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasContractDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearContractDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureContractDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.double get contractAmount => $_getN(7);
  @$pb.TagNumber(8)
  set contractAmount($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasContractAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearContractAmount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get expectedCommission => $_getN(8);
  @$pb.TagNumber(9)
  set expectedCommission($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasExpectedCommission() => $_has(8);
  @$pb.TagNumber(9)
  void clearExpectedCommission() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get status => $_getSZ(9);
  @$pb.TagNumber(10)
  set status($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get paymentId => $_getSZ(10);
  @$pb.TagNumber(11)
  set paymentId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPaymentId() => $_has(10);
  @$pb.TagNumber(11)
  void clearPaymentId() => $_clearField(11);

  /// Notes about the legal case
  @$pb.TagNumber(12)
  $core.String get notes => $_getSZ(11);
  @$pb.TagNumber(12)
  set notes($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasNotes() => $_has(11);
  @$pb.TagNumber(12)
  void clearNotes() => $_clearField(12);
}

class TranslationOrder extends $pb.GeneratedMessage {
  factory TranslationOrder({
    $core.String? orderId,
    $core.String? clientId,
    $core.String? managerId,
    $core.String? translatorId,
    $core.String? officeId,
    $core.String? documentType,
    $core.String? targetLanguage,
    $core.int? pageCount,
    $core.double? translationSum,
    $core.double? notarialSum,
    $core.double? totalSum,
    $core.String? priority,
    $core.String? status,
    $core.String? paymentId,
    $1.Value? documentBlanks,
    $core.String? notes,
  }) {
    final $result = create();
    if (orderId != null) {
      $result.orderId = orderId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (managerId != null) {
      $result.managerId = managerId;
    }
    if (translatorId != null) {
      $result.translatorId = translatorId;
    }
    if (officeId != null) {
      $result.officeId = officeId;
    }
    if (documentType != null) {
      $result.documentType = documentType;
    }
    if (targetLanguage != null) {
      $result.targetLanguage = targetLanguage;
    }
    if (pageCount != null) {
      $result.pageCount = pageCount;
    }
    if (translationSum != null) {
      $result.translationSum = translationSum;
    }
    if (notarialSum != null) {
      $result.notarialSum = notarialSum;
    }
    if (totalSum != null) {
      $result.totalSum = totalSum;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (status != null) {
      $result.status = status;
    }
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (documentBlanks != null) {
      $result.documentBlanks = documentBlanks;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  TranslationOrder._() : super();
  factory TranslationOrder.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TranslationOrder.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TranslationOrder', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'managerId')
    ..aOS(4, _omitFieldNames ? '' : 'translatorId')
    ..aOS(5, _omitFieldNames ? '' : 'officeId')
    ..aOS(6, _omitFieldNames ? '' : 'documentType')
    ..aOS(7, _omitFieldNames ? '' : 'targetLanguage')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'pageCount', $pb.PbFieldType.O3)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'translationSum', $pb.PbFieldType.OD)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'notarialSum', $pb.PbFieldType.OD)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'totalSum', $pb.PbFieldType.OD)
    ..aOS(12, _omitFieldNames ? '' : 'priority')
    ..aOS(13, _omitFieldNames ? '' : 'status')
    ..aOS(14, _omitFieldNames ? '' : 'paymentId')
    ..aOM<$1.Value>(15, _omitFieldNames ? '' : 'documentBlanks', subBuilder: $1.Value.create)
    ..aOS(16, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TranslationOrder clone() => TranslationOrder()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TranslationOrder copyWith(void Function(TranslationOrder) updates) => super.copyWith((message) => updates(message as TranslationOrder)) as TranslationOrder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TranslationOrder create() => TranslationOrder._();
  TranslationOrder createEmptyInstance() => create();
  static $pb.PbList<TranslationOrder> createRepeated() => $pb.PbList<TranslationOrder>();
  @$core.pragma('dart2js:noInline')
  static TranslationOrder getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TranslationOrder>(create);
  static TranslationOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get managerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set managerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get translatorId => $_getSZ(3);
  @$pb.TagNumber(4)
  set translatorId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTranslatorId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTranslatorId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get officeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set officeId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOfficeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOfficeId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get documentType => $_getSZ(5);
  @$pb.TagNumber(6)
  set documentType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDocumentType() => $_has(5);
  @$pb.TagNumber(6)
  void clearDocumentType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get targetLanguage => $_getSZ(6);
  @$pb.TagNumber(7)
  set targetLanguage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTargetLanguage() => $_has(6);
  @$pb.TagNumber(7)
  void clearTargetLanguage() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get pageCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set pageCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPageCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearPageCount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get translationSum => $_getN(8);
  @$pb.TagNumber(9)
  set translationSum($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTranslationSum() => $_has(8);
  @$pb.TagNumber(9)
  void clearTranslationSum() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get notarialSum => $_getN(9);
  @$pb.TagNumber(10)
  set notarialSum($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNotarialSum() => $_has(9);
  @$pb.TagNumber(10)
  void clearNotarialSum() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get totalSum => $_getN(10);
  @$pb.TagNumber(11)
  set totalSum($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTotalSum() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotalSum() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get priority => $_getSZ(11);
  @$pb.TagNumber(12)
  set priority($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPriority() => $_has(11);
  @$pb.TagNumber(12)
  void clearPriority() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get status => $_getSZ(12);
  @$pb.TagNumber(13)
  set status($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasStatus() => $_has(12);
  @$pb.TagNumber(13)
  void clearStatus() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get paymentId => $_getSZ(13);
  @$pb.TagNumber(14)
  set paymentId($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasPaymentId() => $_has(13);
  @$pb.TagNumber(14)
  void clearPaymentId() => $_clearField(14);

  @$pb.TagNumber(15)
  $1.Value get documentBlanks => $_getN(14);
  @$pb.TagNumber(15)
  set documentBlanks($1.Value v) { $_setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasDocumentBlanks() => $_has(14);
  @$pb.TagNumber(15)
  void clearDocumentBlanks() => $_clearField(15);
  @$pb.TagNumber(15)
  $1.Value ensureDocumentBlanks() => $_ensure(14);

  /// Notes about the translation order
  @$pb.TagNumber(16)
  $core.String get notes => $_getSZ(15);
  @$pb.TagNumber(16)
  set notes($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasNotes() => $_has(15);
  @$pb.TagNumber(16)
  void clearNotes() => $_clearField(16);
}

class InsurancePolicy extends $pb.GeneratedMessage {
  factory InsurancePolicy({
    $core.String? policyId,
    $core.String? clientId,
    $core.String? managerId,
    $core.String? policyNumber,
    $2.Timestamp? startDate,
    $2.Timestamp? expiryDate,
    $core.double? amount,
    $core.String? status,
    $core.String? renewalStatus,
    $core.String? notes,
  }) {
    final $result = create();
    if (policyId != null) {
      $result.policyId = policyId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (managerId != null) {
      $result.managerId = managerId;
    }
    if (policyNumber != null) {
      $result.policyNumber = policyNumber;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (expiryDate != null) {
      $result.expiryDate = expiryDate;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (status != null) {
      $result.status = status;
    }
    if (renewalStatus != null) {
      $result.renewalStatus = renewalStatus;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  InsurancePolicy._() : super();
  factory InsurancePolicy.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsurancePolicy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsurancePolicy', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'managerId')
    ..aOS(4, _omitFieldNames ? '' : 'policyNumber')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'startDate', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'expiryDate', subBuilder: $2.Timestamp.create)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(8, _omitFieldNames ? '' : 'status')
    ..aOS(9, _omitFieldNames ? '' : 'renewalStatus')
    ..aOS(10, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsurancePolicy clone() => InsurancePolicy()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsurancePolicy copyWith(void Function(InsurancePolicy) updates) => super.copyWith((message) => updates(message as InsurancePolicy)) as InsurancePolicy;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsurancePolicy create() => InsurancePolicy._();
  InsurancePolicy createEmptyInstance() => create();
  static $pb.PbList<InsurancePolicy> createRepeated() => $pb.PbList<InsurancePolicy>();
  @$core.pragma('dart2js:noInline')
  static InsurancePolicy getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsurancePolicy>(create);
  static InsurancePolicy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get managerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set managerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get policyNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set policyNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPolicyNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPolicyNumber() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get startDate => $_getN(4);
  @$pb.TagNumber(5)
  set startDate($2.Timestamp v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureStartDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.Timestamp get expiryDate => $_getN(5);
  @$pb.TagNumber(6)
  set expiryDate($2.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpiryDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiryDate() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureExpiryDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.double get amount => $_getN(6);
  @$pb.TagNumber(7)
  set amount($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get renewalStatus => $_getSZ(8);
  @$pb.TagNumber(9)
  set renewalStatus($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRenewalStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearRenewalStatus() => $_clearField(9);

  /// Notes about the insurance policy
  @$pb.TagNumber(10)
  $core.String get notes => $_getSZ(9);
  @$pb.TagNumber(10)
  set notes($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNotes() => $_has(9);
  @$pb.TagNumber(10)
  void clearNotes() => $_clearField(10);
}

class TrainingEnrollment extends $pb.GeneratedMessage {
  factory TrainingEnrollment({
    $core.String? enrollmentId,
    $core.String? clientId,
    $core.String? managerId,
    $core.String? courseId,
    $2.Timestamp? contractDate,
    $core.String? status,
    $core.String? paymentId,
    $core.String? notes,
  }) {
    final $result = create();
    if (enrollmentId != null) {
      $result.enrollmentId = enrollmentId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (managerId != null) {
      $result.managerId = managerId;
    }
    if (courseId != null) {
      $result.courseId = courseId;
    }
    if (contractDate != null) {
      $result.contractDate = contractDate;
    }
    if (status != null) {
      $result.status = status;
    }
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  TrainingEnrollment._() : super();
  factory TrainingEnrollment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainingEnrollment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrainingEnrollment', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'enrollmentId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'managerId')
    ..aOS(4, _omitFieldNames ? '' : 'courseId')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'contractDate', subBuilder: $2.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'paymentId')
    ..aOS(8, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainingEnrollment clone() => TrainingEnrollment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainingEnrollment copyWith(void Function(TrainingEnrollment) updates) => super.copyWith((message) => updates(message as TrainingEnrollment)) as TrainingEnrollment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingEnrollment create() => TrainingEnrollment._();
  TrainingEnrollment createEmptyInstance() => create();
  static $pb.PbList<TrainingEnrollment> createRepeated() => $pb.PbList<TrainingEnrollment>();
  @$core.pragma('dart2js:noInline')
  static TrainingEnrollment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainingEnrollment>(create);
  static TrainingEnrollment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get enrollmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set enrollmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnrollmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnrollmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get managerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set managerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get courseId => $_getSZ(3);
  @$pb.TagNumber(4)
  set courseId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCourseId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCourseId() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get contractDate => $_getN(4);
  @$pb.TagNumber(5)
  set contractDate($2.Timestamp v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasContractDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearContractDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureContractDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get paymentId => $_getSZ(6);
  @$pb.TagNumber(7)
  set paymentId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPaymentId() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaymentId() => $_clearField(7);

  /// Notes about the training enrollment
  @$pb.TagNumber(8)
  $core.String get notes => $_getSZ(7);
  @$pb.TagNumber(8)
  set notes($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNotes() => $_has(7);
  @$pb.TagNumber(8)
  void clearNotes() => $_clearField(8);
}

class AccountOpeningRequest extends $pb.GeneratedMessage {
  factory AccountOpeningRequest({
    $core.String? requestId,
    $core.String? clientId,
    $core.String? managerId,
    $core.String? bankId,
    $core.String? status,
    $2.Timestamp? applicationDate,
    $2.Timestamp? openedDate,
    $core.String? paymentId,
    $core.String? notes,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (managerId != null) {
      $result.managerId = managerId;
    }
    if (bankId != null) {
      $result.bankId = bankId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (applicationDate != null) {
      $result.applicationDate = applicationDate;
    }
    if (openedDate != null) {
      $result.openedDate = openedDate;
    }
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  AccountOpeningRequest._() : super();
  factory AccountOpeningRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountOpeningRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountOpeningRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'managerId')
    ..aOS(4, _omitFieldNames ? '' : 'bankId')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'applicationDate', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'openedDate', subBuilder: $2.Timestamp.create)
    ..aOS(8, _omitFieldNames ? '' : 'paymentId')
    ..aOS(9, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountOpeningRequest clone() => AccountOpeningRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountOpeningRequest copyWith(void Function(AccountOpeningRequest) updates) => super.copyWith((message) => updates(message as AccountOpeningRequest)) as AccountOpeningRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountOpeningRequest create() => AccountOpeningRequest._();
  AccountOpeningRequest createEmptyInstance() => create();
  static $pb.PbList<AccountOpeningRequest> createRepeated() => $pb.PbList<AccountOpeningRequest>();
  @$core.pragma('dart2js:noInline')
  static AccountOpeningRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountOpeningRequest>(create);
  static AccountOpeningRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get managerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set managerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bankId => $_getSZ(3);
  @$pb.TagNumber(4)
  set bankId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBankId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBankId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $2.Timestamp get applicationDate => $_getN(5);
  @$pb.TagNumber(6)
  set applicationDate($2.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasApplicationDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearApplicationDate() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureApplicationDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.Timestamp get openedDate => $_getN(6);
  @$pb.TagNumber(7)
  set openedDate($2.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasOpenedDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearOpenedDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureOpenedDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get paymentId => $_getSZ(7);
  @$pb.TagNumber(8)
  set paymentId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPaymentId() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymentId() => $_clearField(8);

  /// Notes about the account opening request
  @$pb.TagNumber(9)
  $core.String get notes => $_getSZ(8);
  @$pb.TagNumber(9)
  set notes($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNotes() => $_has(8);
  @$pb.TagNumber(9)
  void clearNotes() => $_clearField(9);
}

class BusinessRegistration extends $pb.GeneratedMessage {
  factory BusinessRegistration({
    $core.String? requestId,
    $core.String? clientId,
    $core.String? managerId,
    $core.String? bankId,
    $core.String? registrationType,
    $core.String? status,
    $2.Timestamp? applicationDate,
    $2.Timestamp? registrationDate,
    $core.String? paymentId,
    $core.String? notes,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (managerId != null) {
      $result.managerId = managerId;
    }
    if (bankId != null) {
      $result.bankId = bankId;
    }
    if (registrationType != null) {
      $result.registrationType = registrationType;
    }
    if (status != null) {
      $result.status = status;
    }
    if (applicationDate != null) {
      $result.applicationDate = applicationDate;
    }
    if (registrationDate != null) {
      $result.registrationDate = registrationDate;
    }
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  BusinessRegistration._() : super();
  factory BusinessRegistration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BusinessRegistration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BusinessRegistration', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'managerId')
    ..aOS(4, _omitFieldNames ? '' : 'bankId')
    ..aOS(5, _omitFieldNames ? '' : 'registrationType')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'applicationDate', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(8, _omitFieldNames ? '' : 'registrationDate', subBuilder: $2.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'paymentId')
    ..aOS(10, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BusinessRegistration clone() => BusinessRegistration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BusinessRegistration copyWith(void Function(BusinessRegistration) updates) => super.copyWith((message) => updates(message as BusinessRegistration)) as BusinessRegistration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessRegistration create() => BusinessRegistration._();
  BusinessRegistration createEmptyInstance() => create();
  static $pb.PbList<BusinessRegistration> createRepeated() => $pb.PbList<BusinessRegistration>();
  @$core.pragma('dart2js:noInline')
  static BusinessRegistration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusinessRegistration>(create);
  static BusinessRegistration? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get managerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set managerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bankId => $_getSZ(3);
  @$pb.TagNumber(4)
  set bankId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBankId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBankId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get registrationType => $_getSZ(4);
  @$pb.TagNumber(5)
  set registrationType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRegistrationType() => $_has(4);
  @$pb.TagNumber(5)
  void clearRegistrationType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $2.Timestamp get applicationDate => $_getN(6);
  @$pb.TagNumber(7)
  set applicationDate($2.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasApplicationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearApplicationDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureApplicationDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $2.Timestamp get registrationDate => $_getN(7);
  @$pb.TagNumber(8)
  set registrationDate($2.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRegistrationDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearRegistrationDate() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureRegistrationDate() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get paymentId => $_getSZ(8);
  @$pb.TagNumber(9)
  set paymentId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPaymentId() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymentId() => $_clearField(9);

  /// Notes about the business registration
  @$pb.TagNumber(10)
  $core.String get notes => $_getSZ(9);
  @$pb.TagNumber(10)
  set notes($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNotes() => $_has(9);
  @$pb.TagNumber(10)
  void clearNotes() => $_clearField(10);
}

class LendingApplication extends $pb.GeneratedMessage {
  factory LendingApplication({
    $core.String? requestId,
    $core.String? clientId,
    $core.String? managerId,
    $core.String? bankId,
    $core.double? requestedAmount,
    $core.double? approvedAmount,
    $2.Timestamp? applicationDate,
    $2.Timestamp? approvalDate,
    $2.Timestamp? fundsReceivedDate,
    $2.Timestamp? companyContractDate,
    $core.double? expectedCommission,
    $core.String? status,
    $core.String? paymentId,
    $core.String? notes,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (managerId != null) {
      $result.managerId = managerId;
    }
    if (bankId != null) {
      $result.bankId = bankId;
    }
    if (requestedAmount != null) {
      $result.requestedAmount = requestedAmount;
    }
    if (approvedAmount != null) {
      $result.approvedAmount = approvedAmount;
    }
    if (applicationDate != null) {
      $result.applicationDate = applicationDate;
    }
    if (approvalDate != null) {
      $result.approvalDate = approvalDate;
    }
    if (fundsReceivedDate != null) {
      $result.fundsReceivedDate = fundsReceivedDate;
    }
    if (companyContractDate != null) {
      $result.companyContractDate = companyContractDate;
    }
    if (expectedCommission != null) {
      $result.expectedCommission = expectedCommission;
    }
    if (status != null) {
      $result.status = status;
    }
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  LendingApplication._() : super();
  factory LendingApplication.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LendingApplication.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LendingApplication', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'managerId')
    ..aOS(4, _omitFieldNames ? '' : 'bankId')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'requestedAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'approvedAmount', $pb.PbFieldType.OD)
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'applicationDate', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(8, _omitFieldNames ? '' : 'approvalDate', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(9, _omitFieldNames ? '' : 'fundsReceivedDate', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(10, _omitFieldNames ? '' : 'companyContractDate', subBuilder: $2.Timestamp.create)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'expectedCommission', $pb.PbFieldType.OD)
    ..aOS(12, _omitFieldNames ? '' : 'status')
    ..aOS(13, _omitFieldNames ? '' : 'paymentId')
    ..aOS(14, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LendingApplication clone() => LendingApplication()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LendingApplication copyWith(void Function(LendingApplication) updates) => super.copyWith((message) => updates(message as LendingApplication)) as LendingApplication;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LendingApplication create() => LendingApplication._();
  LendingApplication createEmptyInstance() => create();
  static $pb.PbList<LendingApplication> createRepeated() => $pb.PbList<LendingApplication>();
  @$core.pragma('dart2js:noInline')
  static LendingApplication getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LendingApplication>(create);
  static LendingApplication? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get managerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set managerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bankId => $_getSZ(3);
  @$pb.TagNumber(4)
  set bankId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBankId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBankId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get requestedAmount => $_getN(4);
  @$pb.TagNumber(5)
  set requestedAmount($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequestedAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequestedAmount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get approvedAmount => $_getN(5);
  @$pb.TagNumber(6)
  set approvedAmount($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasApprovedAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearApprovedAmount() => $_clearField(6);

  @$pb.TagNumber(7)
  $2.Timestamp get applicationDate => $_getN(6);
  @$pb.TagNumber(7)
  set applicationDate($2.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasApplicationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearApplicationDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureApplicationDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $2.Timestamp get approvalDate => $_getN(7);
  @$pb.TagNumber(8)
  set approvalDate($2.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasApprovalDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearApprovalDate() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureApprovalDate() => $_ensure(7);

  @$pb.TagNumber(9)
  $2.Timestamp get fundsReceivedDate => $_getN(8);
  @$pb.TagNumber(9)
  set fundsReceivedDate($2.Timestamp v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasFundsReceivedDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearFundsReceivedDate() => $_clearField(9);
  @$pb.TagNumber(9)
  $2.Timestamp ensureFundsReceivedDate() => $_ensure(8);

  @$pb.TagNumber(10)
  $2.Timestamp get companyContractDate => $_getN(9);
  @$pb.TagNumber(10)
  set companyContractDate($2.Timestamp v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCompanyContractDate() => $_has(9);
  @$pb.TagNumber(10)
  void clearCompanyContractDate() => $_clearField(10);
  @$pb.TagNumber(10)
  $2.Timestamp ensureCompanyContractDate() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.double get expectedCommission => $_getN(10);
  @$pb.TagNumber(11)
  set expectedCommission($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasExpectedCommission() => $_has(10);
  @$pb.TagNumber(11)
  void clearExpectedCommission() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get status => $_getSZ(11);
  @$pb.TagNumber(12)
  set status($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get paymentId => $_getSZ(12);
  @$pb.TagNumber(13)
  set paymentId($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPaymentId() => $_has(12);
  @$pb.TagNumber(13)
  void clearPaymentId() => $_clearField(13);

  /// Notes about the lending application
  @$pb.TagNumber(14)
  $core.String get notes => $_getSZ(13);
  @$pb.TagNumber(14)
  set notes($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasNotes() => $_has(13);
  @$pb.TagNumber(14)
  void clearNotes() => $_clearField(14);
}

class Partner extends $pb.GeneratedMessage {
  factory Partner({
    $core.String? partnerId,
    $core.String? name,
    $core.String? cityOfResidence,
    $core.String? contactInfo,
    $core.String? status,
    $core.String? notes,
  }) {
    final $result = create();
    if (partnerId != null) {
      $result.partnerId = partnerId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (cityOfResidence != null) {
      $result.cityOfResidence = cityOfResidence;
    }
    if (contactInfo != null) {
      $result.contactInfo = contactInfo;
    }
    if (status != null) {
      $result.status = status;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  Partner._() : super();
  factory Partner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Partner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Partner', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'partnerId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'cityOfResidence')
    ..aOS(4, _omitFieldNames ? '' : 'contactInfo')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Partner clone() => Partner()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Partner copyWith(void Function(Partner) updates) => super.copyWith((message) => updates(message as Partner)) as Partner;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Partner create() => Partner._();
  Partner createEmptyInstance() => create();
  static $pb.PbList<Partner> createRepeated() => $pb.PbList<Partner>();
  @$core.pragma('dart2js:noInline')
  static Partner getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Partner>(create);
  static Partner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get partnerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set partnerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartnerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get cityOfResidence => $_getSZ(2);
  @$pb.TagNumber(3)
  set cityOfResidence($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCityOfResidence() => $_has(2);
  @$pb.TagNumber(3)
  void clearCityOfResidence() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get contactInfo => $_getSZ(3);
  @$pb.TagNumber(4)
  set contactInfo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContactInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearContactInfo() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  /// Notes about the partner
  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => $_clearField(6);
}

class LegalIssueType extends $pb.GeneratedMessage {
  factory LegalIssueType({
    $core.String? issueTypeId,
    $core.String? name,
    $core.String? description,
    $core.String? notes,
  }) {
    final $result = create();
    if (issueTypeId != null) {
      $result.issueTypeId = issueTypeId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  LegalIssueType._() : super();
  factory LegalIssueType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LegalIssueType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LegalIssueType', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'issueTypeId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LegalIssueType clone() => LegalIssueType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LegalIssueType copyWith(void Function(LegalIssueType) updates) => super.copyWith((message) => updates(message as LegalIssueType)) as LegalIssueType;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LegalIssueType create() => LegalIssueType._();
  LegalIssueType createEmptyInstance() => create();
  static $pb.PbList<LegalIssueType> createRepeated() => $pb.PbList<LegalIssueType>();
  @$core.pragma('dart2js:noInline')
  static LegalIssueType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LegalIssueType>(create);
  static LegalIssueType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issueTypeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set issueTypeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIssueTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssueTypeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// Notes about the legal issue type
  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => $_clearField(4);
}

class TrainingCourse extends $pb.GeneratedMessage {
  factory TrainingCourse({
    $core.String? courseId,
    $core.String? name,
    $core.double? price,
    $core.double? commissionPercent,
    $core.String? description,
    $core.String? notes,
  }) {
    final $result = create();
    if (courseId != null) {
      $result.courseId = courseId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (price != null) {
      $result.price = price;
    }
    if (commissionPercent != null) {
      $result.commissionPercent = commissionPercent;
    }
    if (description != null) {
      $result.description = description;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  TrainingCourse._() : super();
  factory TrainingCourse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainingCourse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrainingCourse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'courseId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'commissionPercent', $pb.PbFieldType.OD)
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainingCourse clone() => TrainingCourse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainingCourse copyWith(void Function(TrainingCourse) updates) => super.copyWith((message) => updates(message as TrainingCourse)) as TrainingCourse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingCourse create() => TrainingCourse._();
  TrainingCourse createEmptyInstance() => create();
  static $pb.PbList<TrainingCourse> createRepeated() => $pb.PbList<TrainingCourse>();
  @$core.pragma('dart2js:noInline')
  static TrainingCourse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainingCourse>(create);
  static TrainingCourse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get courseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set courseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCourseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCourseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get commissionPercent => $_getN(3);
  @$pb.TagNumber(4)
  set commissionPercent($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCommissionPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommissionPercent() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  /// Notes about the training course
  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => $_clearField(6);
}

class Bank extends $pb.GeneratedMessage {
  factory Bank({
    $core.String? bankId,
    $core.String? name,
    $core.double? accountOpeningCommission,
    $core.double? ipRegistrationCommission,
    $core.double? oooRegistrationCommission,
    $core.double? lendingCommissionPercent,
    $core.String? notes,
  }) {
    final $result = create();
    if (bankId != null) {
      $result.bankId = bankId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (accountOpeningCommission != null) {
      $result.accountOpeningCommission = accountOpeningCommission;
    }
    if (ipRegistrationCommission != null) {
      $result.ipRegistrationCommission = ipRegistrationCommission;
    }
    if (oooRegistrationCommission != null) {
      $result.oooRegistrationCommission = oooRegistrationCommission;
    }
    if (lendingCommissionPercent != null) {
      $result.lendingCommissionPercent = lendingCommissionPercent;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  Bank._() : super();
  factory Bank.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bank.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Bank', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bankId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'accountOpeningCommission', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'ipRegistrationCommission', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'oooRegistrationCommission', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'lendingCommissionPercent', $pb.PbFieldType.OD)
    ..aOS(7, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Bank clone() => Bank()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Bank copyWith(void Function(Bank) updates) => super.copyWith((message) => updates(message as Bank)) as Bank;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Bank create() => Bank._();
  Bank createEmptyInstance() => create();
  static $pb.PbList<Bank> createRepeated() => $pb.PbList<Bank>();
  @$core.pragma('dart2js:noInline')
  static Bank getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bank>(create);
  static Bank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bankId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bankId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBankId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBankId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get accountOpeningCommission => $_getN(2);
  @$pb.TagNumber(3)
  set accountOpeningCommission($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountOpeningCommission() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountOpeningCommission() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get ipRegistrationCommission => $_getN(3);
  @$pb.TagNumber(4)
  set ipRegistrationCommission($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIpRegistrationCommission() => $_has(3);
  @$pb.TagNumber(4)
  void clearIpRegistrationCommission() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get oooRegistrationCommission => $_getN(4);
  @$pb.TagNumber(5)
  set oooRegistrationCommission($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOooRegistrationCommission() => $_has(4);
  @$pb.TagNumber(5)
  void clearOooRegistrationCommission() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get lendingCommissionPercent => $_getN(5);
  @$pb.TagNumber(6)
  set lendingCommissionPercent($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLendingCommissionPercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearLendingCommissionPercent() => $_clearField(6);

  /// Notes about the bank
  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => $_clearField(7);
}

class Interaction extends $pb.GeneratedMessage {
  factory Interaction({
    $core.String? interactionId,
    $core.String? clientId,
    $core.String? employeeId,
    $2.Timestamp? date,
    $core.String? type,
    $core.String? description,
    $core.String? subject,
    $2.Timestamp? endTime,
    $core.bool? isScheduled,
    $core.bool? isCompleted,
    $core.String? notes,
  }) {
    final $result = create();
    if (interactionId != null) {
      $result.interactionId = interactionId;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (employeeId != null) {
      $result.employeeId = employeeId;
    }
    if (date != null) {
      $result.date = date;
    }
    if (type != null) {
      $result.type = type;
    }
    if (description != null) {
      $result.description = description;
    }
    if (subject != null) {
      $result.subject = subject;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (isScheduled != null) {
      $result.isScheduled = isScheduled;
    }
    if (isCompleted != null) {
      $result.isCompleted = isCompleted;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  Interaction._() : super();
  factory Interaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Interaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Interaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interactionId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'employeeId')
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'date', subBuilder: $2.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'subject')
    ..aOM<$2.Timestamp>(8, _omitFieldNames ? '' : 'endTime', subBuilder: $2.Timestamp.create)
    ..aOB(9, _omitFieldNames ? '' : 'isScheduled')
    ..aOB(10, _omitFieldNames ? '' : 'isCompleted')
    ..aOS(11, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Interaction clone() => Interaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Interaction copyWith(void Function(Interaction) updates) => super.copyWith((message) => updates(message as Interaction)) as Interaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Interaction create() => Interaction._();
  Interaction createEmptyInstance() => create();
  static $pb.PbList<Interaction> createRepeated() => $pb.PbList<Interaction>();
  @$core.pragma('dart2js:noInline')
  static Interaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Interaction>(create);
  static Interaction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get interactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set interactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteractionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get employeeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set employeeId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmployeeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmployeeId() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get date => $_getN(3);
  @$pb.TagNumber(4)
  set date($2.Timestamp v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get subject => $_getSZ(6);
  @$pb.TagNumber(7)
  set subject($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSubject() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubject() => $_clearField(7);

  @$pb.TagNumber(8)
  $2.Timestamp get endTime => $_getN(7);
  @$pb.TagNumber(8)
  set endTime($2.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndTime() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureEndTime() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.bool get isScheduled => $_getBF(8);
  @$pb.TagNumber(9)
  set isScheduled($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsScheduled() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsScheduled() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isCompleted => $_getBF(9);
  @$pb.TagNumber(10)
  set isCompleted($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsCompleted() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsCompleted() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get notes => $_getSZ(10);
  @$pb.TagNumber(11)
  set notes($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNotes() => $_has(10);
  @$pb.TagNumber(11)
  void clearNotes() => $_clearField(11);
}

class Payment extends $pb.GeneratedMessage {
  factory Payment({
    $core.String? paymentId,
    $core.String? relatedEntityId,
    $core.String? relatedEntityType,
    $core.String? clientId,
    $core.double? expectedAmount,
    $core.double? actualAmountReceived,
    $2.Timestamp? paymentDate,
    $core.String? paymentMethod,
    $core.String? status,
    $core.bool? verifiedByAccountant,
    $2.Timestamp? createdAtEntity,
    $core.String? notes,
  }) {
    final $result = create();
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (relatedEntityId != null) {
      $result.relatedEntityId = relatedEntityId;
    }
    if (relatedEntityType != null) {
      $result.relatedEntityType = relatedEntityType;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (expectedAmount != null) {
      $result.expectedAmount = expectedAmount;
    }
    if (actualAmountReceived != null) {
      $result.actualAmountReceived = actualAmountReceived;
    }
    if (paymentDate != null) {
      $result.paymentDate = paymentDate;
    }
    if (paymentMethod != null) {
      $result.paymentMethod = paymentMethod;
    }
    if (status != null) {
      $result.status = status;
    }
    if (verifiedByAccountant != null) {
      $result.verifiedByAccountant = verifiedByAccountant;
    }
    if (createdAtEntity != null) {
      $result.createdAtEntity = createdAtEntity;
    }
    if (notes != null) {
      $result.notes = notes;
    }
    return $result;
  }
  Payment._() : super();
  factory Payment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Payment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Payment', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'paymentId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedEntityId')
    ..aOS(3, _omitFieldNames ? '' : 'relatedEntityType')
    ..aOS(4, _omitFieldNames ? '' : 'clientId')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'expectedAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'actualAmountReceived', $pb.PbFieldType.OD)
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'paymentDate', subBuilder: $2.Timestamp.create)
    ..aOS(8, _omitFieldNames ? '' : 'paymentMethod')
    ..aOS(9, _omitFieldNames ? '' : 'status')
    ..aOB(10, _omitFieldNames ? '' : 'verifiedByAccountant')
    ..aOM<$2.Timestamp>(11, _omitFieldNames ? '' : 'createdAtEntity', subBuilder: $2.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Payment clone() => Payment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Payment copyWith(void Function(Payment) updates) => super.copyWith((message) => updates(message as Payment)) as Payment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Payment create() => Payment._();
  Payment createEmptyInstance() => create();
  static $pb.PbList<Payment> createRepeated() => $pb.PbList<Payment>();
  @$core.pragma('dart2js:noInline')
  static Payment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payment>(create);
  static Payment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get relatedEntityId => $_getSZ(1);
  @$pb.TagNumber(2)
  set relatedEntityId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRelatedEntityId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelatedEntityId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get relatedEntityType => $_getSZ(2);
  @$pb.TagNumber(3)
  set relatedEntityType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRelatedEntityType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRelatedEntityType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get clientId => $_getSZ(3);
  @$pb.TagNumber(4)
  set clientId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClientId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get expectedAmount => $_getN(4);
  @$pb.TagNumber(5)
  set expectedAmount($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpectedAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpectedAmount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get actualAmountReceived => $_getN(5);
  @$pb.TagNumber(6)
  set actualAmountReceived($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasActualAmountReceived() => $_has(5);
  @$pb.TagNumber(6)
  void clearActualAmountReceived() => $_clearField(6);

  @$pb.TagNumber(7)
  $2.Timestamp get paymentDate => $_getN(6);
  @$pb.TagNumber(7)
  set paymentDate($2.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPaymentDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaymentDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensurePaymentDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get paymentMethod => $_getSZ(7);
  @$pb.TagNumber(8)
  set paymentMethod($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPaymentMethod() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymentMethod() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get status => $_getSZ(8);
  @$pb.TagNumber(9)
  set status($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get verifiedByAccountant => $_getBF(9);
  @$pb.TagNumber(10)
  set verifiedByAccountant($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasVerifiedByAccountant() => $_has(9);
  @$pb.TagNumber(10)
  void clearVerifiedByAccountant() => $_clearField(10);

  @$pb.TagNumber(11)
  $2.Timestamp get createdAtEntity => $_getN(10);
  @$pb.TagNumber(11)
  set createdAtEntity($2.Timestamp v) { $_setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreatedAtEntity() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAtEntity() => $_clearField(11);
  @$pb.TagNumber(11)
  $2.Timestamp ensureCreatedAtEntity() => $_ensure(10);

  /// Notes about the payment
  @$pb.TagNumber(12)
  $core.String get notes => $_getSZ(11);
  @$pb.TagNumber(12)
  set notes($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasNotes() => $_has(11);
  @$pb.TagNumber(12)
  void clearNotes() => $_clearField(12);
}

/// Client CRUD
class CreateClientRequest extends $pb.GeneratedMessage {
  factory CreateClientRequest({
    Client? client,
  }) {
    final $result = create();
    if (client != null) {
      $result.client = client;
    }
    return $result;
  }
  CreateClientRequest._() : super();
  factory CreateClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Client>(1, _omitFieldNames ? '' : 'client', subBuilder: Client.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateClientRequest clone() => CreateClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateClientRequest copyWith(void Function(CreateClientRequest) updates) => super.copyWith((message) => updates(message as CreateClientRequest)) as CreateClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateClientRequest create() => CreateClientRequest._();
  CreateClientRequest createEmptyInstance() => create();
  static $pb.PbList<CreateClientRequest> createRepeated() => $pb.PbList<CreateClientRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateClientRequest>(create);
  static CreateClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Client get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(Client v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  Client ensureClient() => $_ensure(0);
}

class CreateClientResponse extends $pb.GeneratedMessage {
  factory CreateClientResponse({
    $core.String? clientId,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    return $result;
  }
  CreateClientResponse._() : super();
  factory CreateClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateClientResponse clone() => CreateClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateClientResponse copyWith(void Function(CreateClientResponse) updates) => super.copyWith((message) => updates(message as CreateClientResponse)) as CreateClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateClientResponse create() => CreateClientResponse._();
  CreateClientResponse createEmptyInstance() => create();
  static $pb.PbList<CreateClientResponse> createRepeated() => $pb.PbList<CreateClientResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateClientResponse>(create);
  static CreateClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);
}

class GetClientRequest extends $pb.GeneratedMessage {
  factory GetClientRequest({
    $core.String? clientId,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    return $result;
  }
  GetClientRequest._() : super();
  factory GetClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetClientRequest clone() => GetClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetClientRequest copyWith(void Function(GetClientRequest) updates) => super.copyWith((message) => updates(message as GetClientRequest)) as GetClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClientRequest create() => GetClientRequest._();
  GetClientRequest createEmptyInstance() => create();
  static $pb.PbList<GetClientRequest> createRepeated() => $pb.PbList<GetClientRequest>();
  @$core.pragma('dart2js:noInline')
  static GetClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetClientRequest>(create);
  static GetClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);
}

class GetClientResponse extends $pb.GeneratedMessage {
  factory GetClientResponse({
    Client? client,
  }) {
    final $result = create();
    if (client != null) {
      $result.client = client;
    }
    return $result;
  }
  GetClientResponse._() : super();
  factory GetClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Client>(1, _omitFieldNames ? '' : 'client', subBuilder: Client.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetClientResponse clone() => GetClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetClientResponse copyWith(void Function(GetClientResponse) updates) => super.copyWith((message) => updates(message as GetClientResponse)) as GetClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetClientResponse create() => GetClientResponse._();
  GetClientResponse createEmptyInstance() => create();
  static $pb.PbList<GetClientResponse> createRepeated() => $pb.PbList<GetClientResponse>();
  @$core.pragma('dart2js:noInline')
  static GetClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetClientResponse>(create);
  static GetClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Client get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(Client v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  Client ensureClient() => $_ensure(0);
}

class UpdateClientRequest extends $pb.GeneratedMessage {
  factory UpdateClientRequest({
    $core.String? clientId,
    Client? clientData,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (clientData != null) {
      $result.clientData = clientData;
    }
    return $result;
  }
  UpdateClientRequest._() : super();
  factory UpdateClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..aOM<Client>(2, _omitFieldNames ? '' : 'clientData', subBuilder: Client.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateClientRequest clone() => UpdateClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateClientRequest copyWith(void Function(UpdateClientRequest) updates) => super.copyWith((message) => updates(message as UpdateClientRequest)) as UpdateClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateClientRequest create() => UpdateClientRequest._();
  UpdateClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateClientRequest> createRepeated() => $pb.PbList<UpdateClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateClientRequest>(create);
  static UpdateClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);

  @$pb.TagNumber(2)
  Client get clientData => $_getN(1);
  @$pb.TagNumber(2)
  set clientData(Client v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientData() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientData() => $_clearField(2);
  @$pb.TagNumber(2)
  Client ensureClientData() => $_ensure(1);
}

/// Update often returns Empty or the updated resource
class UpdateClientResponse extends $pb.GeneratedMessage {
  factory UpdateClientResponse({
    Client? client,
  }) {
    final $result = create();
    if (client != null) {
      $result.client = client;
    }
    return $result;
  }
  UpdateClientResponse._() : super();
  factory UpdateClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Client>(1, _omitFieldNames ? '' : 'client', subBuilder: Client.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateClientResponse clone() => UpdateClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateClientResponse copyWith(void Function(UpdateClientResponse) updates) => super.copyWith((message) => updates(message as UpdateClientResponse)) as UpdateClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateClientResponse create() => UpdateClientResponse._();
  UpdateClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateClientResponse> createRepeated() => $pb.PbList<UpdateClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateClientResponse>(create);
  static UpdateClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Client get client => $_getN(0);
  @$pb.TagNumber(1)
  set client(Client v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  Client ensureClient() => $_ensure(0);
}

class DeleteClientRequest extends $pb.GeneratedMessage {
  factory DeleteClientRequest({
    $core.String? clientId,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    return $result;
  }
  DeleteClientRequest._() : super();
  factory DeleteClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteClientRequest clone() => DeleteClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteClientRequest copyWith(void Function(DeleteClientRequest) updates) => super.copyWith((message) => updates(message as DeleteClientRequest)) as DeleteClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteClientRequest create() => DeleteClientRequest._();
  DeleteClientRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteClientRequest> createRepeated() => $pb.PbList<DeleteClientRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteClientRequest>(create);
  static DeleteClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => $_clearField(1);
}

/// Delete often returns Empty
class DeleteClientResponse extends $pb.GeneratedMessage {
  factory DeleteClientResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteClientResponse._() : super();
  factory DeleteClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteClientResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteClientResponse clone() => DeleteClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteClientResponse copyWith(void Function(DeleteClientResponse) updates) => super.copyWith((message) => updates(message as DeleteClientResponse)) as DeleteClientResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteClientResponse create() => DeleteClientResponse._();
  DeleteClientResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteClientResponse> createRepeated() => $pb.PbList<DeleteClientResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteClientResponse>(create);
  static DeleteClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListClientsRequest extends $pb.GeneratedMessage {
  factory ListClientsRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListClientsRequest._() : super();
  factory ListClientsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListClientsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListClientsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListClientsRequest clone() => ListClientsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListClientsRequest copyWith(void Function(ListClientsRequest) updates) => super.copyWith((message) => updates(message as ListClientsRequest)) as ListClientsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListClientsRequest create() => ListClientsRequest._();
  ListClientsRequest createEmptyInstance() => create();
  static $pb.PbList<ListClientsRequest> createRepeated() => $pb.PbList<ListClientsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListClientsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListClientsRequest>(create);
  static ListClientsRequest? _defaultInstance;

  /// Add pagination, filtering fields later if needed
  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListClientsResponse extends $pb.GeneratedMessage {
  factory ListClientsResponse({
    $core.Iterable<Client>? clients,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (clients != null) {
      $result.clients.addAll(clients);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListClientsResponse._() : super();
  factory ListClientsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListClientsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListClientsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Client>(1, _omitFieldNames ? '' : 'clients', $pb.PbFieldType.PM, subBuilder: Client.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListClientsResponse clone() => ListClientsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListClientsResponse copyWith(void Function(ListClientsResponse) updates) => super.copyWith((message) => updates(message as ListClientsResponse)) as ListClientsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListClientsResponse create() => ListClientsResponse._();
  ListClientsResponse createEmptyInstance() => create();
  static $pb.PbList<ListClientsResponse> createRepeated() => $pb.PbList<ListClientsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListClientsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListClientsResponse>(create);
  static ListClientsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Client> get clients => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Employee CRUD (Similar structure)
class CreateEmployeeRequest extends $pb.GeneratedMessage {
  factory CreateEmployeeRequest({
    Employee? employee,
    $core.String? userLogin,
    $core.String? userPassword,
  }) {
    final $result = create();
    if (employee != null) {
      $result.employee = employee;
    }
    if (userLogin != null) {
      $result.userLogin = userLogin;
    }
    if (userPassword != null) {
      $result.userPassword = userPassword;
    }
    return $result;
  }
  CreateEmployeeRequest._() : super();
  factory CreateEmployeeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEmployeeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateEmployeeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Employee>(1, _omitFieldNames ? '' : 'employee', subBuilder: Employee.create)
    ..aOS(2, _omitFieldNames ? '' : 'userLogin')
    ..aOS(3, _omitFieldNames ? '' : 'userPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEmployeeRequest clone() => CreateEmployeeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEmployeeRequest copyWith(void Function(CreateEmployeeRequest) updates) => super.copyWith((message) => updates(message as CreateEmployeeRequest)) as CreateEmployeeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEmployeeRequest create() => CreateEmployeeRequest._();
  CreateEmployeeRequest createEmptyInstance() => create();
  static $pb.PbList<CreateEmployeeRequest> createRepeated() => $pb.PbList<CreateEmployeeRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateEmployeeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEmployeeRequest>(create);
  static CreateEmployeeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Employee get employee => $_getN(0);
  @$pb.TagNumber(1)
  set employee(Employee v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployee() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployee() => $_clearField(1);
  @$pb.TagNumber(1)
  Employee ensureEmployee() => $_ensure(0);

  /// Might need User info too if creating User simultaneously
  @$pb.TagNumber(2)
  $core.String get userLogin => $_getSZ(1);
  @$pb.TagNumber(2)
  set userLogin($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserLogin() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserLogin() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set userPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserPassword() => $_clearField(3);
}

class CreateEmployeeResponse extends $pb.GeneratedMessage {
  factory CreateEmployeeResponse({
    $core.String? employeeId,
    $core.String? userId,
  }) {
    final $result = create();
    if (employeeId != null) {
      $result.employeeId = employeeId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  CreateEmployeeResponse._() : super();
  factory CreateEmployeeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEmployeeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateEmployeeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'employeeId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEmployeeResponse clone() => CreateEmployeeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEmployeeResponse copyWith(void Function(CreateEmployeeResponse) updates) => super.copyWith((message) => updates(message as CreateEmployeeResponse)) as CreateEmployeeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEmployeeResponse create() => CreateEmployeeResponse._();
  CreateEmployeeResponse createEmptyInstance() => create();
  static $pb.PbList<CreateEmployeeResponse> createRepeated() => $pb.PbList<CreateEmployeeResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateEmployeeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEmployeeResponse>(create);
  static CreateEmployeeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);
}

class GetEmployeeRequest extends $pb.GeneratedMessage {
  factory GetEmployeeRequest({
    $core.String? employeeId,
  }) {
    final $result = create();
    if (employeeId != null) {
      $result.employeeId = employeeId;
    }
    return $result;
  }
  GetEmployeeRequest._() : super();
  factory GetEmployeeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEmployeeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEmployeeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'employeeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEmployeeRequest clone() => GetEmployeeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEmployeeRequest copyWith(void Function(GetEmployeeRequest) updates) => super.copyWith((message) => updates(message as GetEmployeeRequest)) as GetEmployeeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEmployeeRequest create() => GetEmployeeRequest._();
  GetEmployeeRequest createEmptyInstance() => create();
  static $pb.PbList<GetEmployeeRequest> createRepeated() => $pb.PbList<GetEmployeeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEmployeeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEmployeeRequest>(create);
  static GetEmployeeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);
}

class GetEmployeeResponse extends $pb.GeneratedMessage {
  factory GetEmployeeResponse({
    Employee? employee,
  }) {
    final $result = create();
    if (employee != null) {
      $result.employee = employee;
    }
    return $result;
  }
  GetEmployeeResponse._() : super();
  factory GetEmployeeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEmployeeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEmployeeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Employee>(1, _omitFieldNames ? '' : 'employee', subBuilder: Employee.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEmployeeResponse clone() => GetEmployeeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEmployeeResponse copyWith(void Function(GetEmployeeResponse) updates) => super.copyWith((message) => updates(message as GetEmployeeResponse)) as GetEmployeeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEmployeeResponse create() => GetEmployeeResponse._();
  GetEmployeeResponse createEmptyInstance() => create();
  static $pb.PbList<GetEmployeeResponse> createRepeated() => $pb.PbList<GetEmployeeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetEmployeeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEmployeeResponse>(create);
  static GetEmployeeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Employee get employee => $_getN(0);
  @$pb.TagNumber(1)
  set employee(Employee v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployee() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployee() => $_clearField(1);
  @$pb.TagNumber(1)
  Employee ensureEmployee() => $_ensure(0);
}

class UpdateEmployeeRequest extends $pb.GeneratedMessage {
  factory UpdateEmployeeRequest({
    $core.String? employeeId,
    Employee? employeeData,
  }) {
    final $result = create();
    if (employeeId != null) {
      $result.employeeId = employeeId;
    }
    if (employeeData != null) {
      $result.employeeData = employeeData;
    }
    return $result;
  }
  UpdateEmployeeRequest._() : super();
  factory UpdateEmployeeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEmployeeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEmployeeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'employeeId')
    ..aOM<Employee>(2, _omitFieldNames ? '' : 'employeeData', subBuilder: Employee.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEmployeeRequest clone() => UpdateEmployeeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEmployeeRequest copyWith(void Function(UpdateEmployeeRequest) updates) => super.copyWith((message) => updates(message as UpdateEmployeeRequest)) as UpdateEmployeeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeRequest create() => UpdateEmployeeRequest._();
  UpdateEmployeeRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateEmployeeRequest> createRepeated() => $pb.PbList<UpdateEmployeeRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEmployeeRequest>(create);
  static UpdateEmployeeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);

  @$pb.TagNumber(2)
  Employee get employeeData => $_getN(1);
  @$pb.TagNumber(2)
  set employeeData(Employee v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmployeeData() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmployeeData() => $_clearField(2);
  @$pb.TagNumber(2)
  Employee ensureEmployeeData() => $_ensure(1);
}

class UpdateEmployeeResponse extends $pb.GeneratedMessage {
  factory UpdateEmployeeResponse({
    Employee? employee,
  }) {
    final $result = create();
    if (employee != null) {
      $result.employee = employee;
    }
    return $result;
  }
  UpdateEmployeeResponse._() : super();
  factory UpdateEmployeeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEmployeeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEmployeeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Employee>(1, _omitFieldNames ? '' : 'employee', subBuilder: Employee.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEmployeeResponse clone() => UpdateEmployeeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEmployeeResponse copyWith(void Function(UpdateEmployeeResponse) updates) => super.copyWith((message) => updates(message as UpdateEmployeeResponse)) as UpdateEmployeeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeResponse create() => UpdateEmployeeResponse._();
  UpdateEmployeeResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateEmployeeResponse> createRepeated() => $pb.PbList<UpdateEmployeeResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEmployeeResponse>(create);
  static UpdateEmployeeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Employee get employee => $_getN(0);
  @$pb.TagNumber(1)
  set employee(Employee v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployee() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployee() => $_clearField(1);
  @$pb.TagNumber(1)
  Employee ensureEmployee() => $_ensure(0);
}

class DeleteEmployeeRequest extends $pb.GeneratedMessage {
  factory DeleteEmployeeRequest({
    $core.String? employeeId,
  }) {
    final $result = create();
    if (employeeId != null) {
      $result.employeeId = employeeId;
    }
    return $result;
  }
  DeleteEmployeeRequest._() : super();
  factory DeleteEmployeeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteEmployeeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteEmployeeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'employeeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteEmployeeRequest clone() => DeleteEmployeeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteEmployeeRequest copyWith(void Function(DeleteEmployeeRequest) updates) => super.copyWith((message) => updates(message as DeleteEmployeeRequest)) as DeleteEmployeeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteEmployeeRequest create() => DeleteEmployeeRequest._();
  DeleteEmployeeRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteEmployeeRequest> createRepeated() => $pb.PbList<DeleteEmployeeRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteEmployeeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteEmployeeRequest>(create);
  static DeleteEmployeeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);
}

class DeleteEmployeeResponse extends $pb.GeneratedMessage {
  factory DeleteEmployeeResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteEmployeeResponse._() : super();
  factory DeleteEmployeeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteEmployeeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteEmployeeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteEmployeeResponse clone() => DeleteEmployeeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteEmployeeResponse copyWith(void Function(DeleteEmployeeResponse) updates) => super.copyWith((message) => updates(message as DeleteEmployeeResponse)) as DeleteEmployeeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteEmployeeResponse create() => DeleteEmployeeResponse._();
  DeleteEmployeeResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteEmployeeResponse> createRepeated() => $pb.PbList<DeleteEmployeeResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteEmployeeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteEmployeeResponse>(create);
  static DeleteEmployeeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListEmployeesRequest extends $pb.GeneratedMessage {
  factory ListEmployeesRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListEmployeesRequest._() : super();
  factory ListEmployeesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEmployeesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEmployeesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEmployeesRequest clone() => ListEmployeesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEmployeesRequest copyWith(void Function(ListEmployeesRequest) updates) => super.copyWith((message) => updates(message as ListEmployeesRequest)) as ListEmployeesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEmployeesRequest create() => ListEmployeesRequest._();
  ListEmployeesRequest createEmptyInstance() => create();
  static $pb.PbList<ListEmployeesRequest> createRepeated() => $pb.PbList<ListEmployeesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListEmployeesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEmployeesRequest>(create);
  static ListEmployeesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListEmployeesResponse extends $pb.GeneratedMessage {
  factory ListEmployeesResponse({
    $core.Iterable<Employee>? employees,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (employees != null) {
      $result.employees.addAll(employees);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListEmployeesResponse._() : super();
  factory ListEmployeesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEmployeesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEmployeesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Employee>(1, _omitFieldNames ? '' : 'employees', $pb.PbFieldType.PM, subBuilder: Employee.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEmployeesResponse clone() => ListEmployeesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEmployeesResponse copyWith(void Function(ListEmployeesResponse) updates) => super.copyWith((message) => updates(message as ListEmployeesResponse)) as ListEmployeesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEmployeesResponse create() => ListEmployeesResponse._();
  ListEmployeesResponse createEmptyInstance() => create();
  static $pb.PbList<ListEmployeesResponse> createRepeated() => $pb.PbList<ListEmployeesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListEmployeesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEmployeesResponse>(create);
  static ListEmployeesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Employee> get employees => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// User (Password handled separately)
class CreateUserRequest extends $pb.GeneratedMessage {
  factory CreateUserRequest({
    User? user,
    $core.String? password,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  CreateUserRequest._() : super();
  factory CreateUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserRequest clone() => CreateUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserRequest copyWith(void Function(CreateUserRequest) updates) => super.copyWith((message) => updates(message as CreateUserRequest)) as CreateUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserRequest create() => CreateUserRequest._();
  CreateUserRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserRequest> createRepeated() => $pb.PbList<CreateUserRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserRequest>(create);
  static CreateUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class CreateUserResponse extends $pb.GeneratedMessage {
  factory CreateUserResponse({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  CreateUserResponse._() : super();
  factory CreateUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserResponse clone() => CreateUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserResponse copyWith(void Function(CreateUserResponse) updates) => super.copyWith((message) => updates(message as CreateUserResponse)) as CreateUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserResponse create() => CreateUserResponse._();
  CreateUserResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserResponse> createRepeated() => $pb.PbList<CreateUserResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserResponse>(create);
  static CreateUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class GetUserRequest extends $pb.GeneratedMessage {
  factory GetUserRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetUserRequest._() : super();
  factory GetUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserRequest clone() => GetUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserRequest copyWith(void Function(GetUserRequest) updates) => super.copyWith((message) => updates(message as GetUserRequest)) as GetUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  GetUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserRequest> createRepeated() => $pb.PbList<GetUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class GetUserResponse extends $pb.GeneratedMessage {
  factory GetUserResponse({
    User? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  GetUserResponse._() : super();
  factory GetUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserResponse clone() => GetUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserResponse copyWith(void Function(GetUserResponse) updates) => super.copyWith((message) => updates(message as GetUserResponse)) as GetUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserResponse create() => GetUserResponse._();
  GetUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserResponse> createRepeated() => $pb.PbList<GetUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserResponse>(create);
  static GetUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class UpdateUserRequest extends $pb.GeneratedMessage {
  factory UpdateUserRequest({
    $core.String? userId,
    User? userData,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (userData != null) {
      $result.userData = userData;
    }
    return $result;
  }
  UpdateUserRequest._() : super();
  factory UpdateUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOM<User>(2, _omitFieldNames ? '' : 'userData', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserRequest clone() => UpdateUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserRequest copyWith(void Function(UpdateUserRequest) updates) => super.copyWith((message) => updates(message as UpdateUserRequest)) as UpdateUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserRequest create() => UpdateUserRequest._();
  UpdateUserRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserRequest> createRepeated() => $pb.PbList<UpdateUserRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserRequest>(create);
  static UpdateUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  User get userData => $_getN(1);
  @$pb.TagNumber(2)
  set userData(User v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserData() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserData() => $_clearField(2);
  @$pb.TagNumber(2)
  User ensureUserData() => $_ensure(1);
}

class UpdateUserResponse extends $pb.GeneratedMessage {
  factory UpdateUserResponse({
    User? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  UpdateUserResponse._() : super();
  factory UpdateUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserResponse clone() => UpdateUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserResponse copyWith(void Function(UpdateUserResponse) updates) => super.copyWith((message) => updates(message as UpdateUserResponse)) as UpdateUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserResponse create() => UpdateUserResponse._();
  UpdateUserResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserResponse> createRepeated() => $pb.PbList<UpdateUserResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserResponse>(create);
  static UpdateUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class DeleteUserRequest extends $pb.GeneratedMessage {
  factory DeleteUserRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  DeleteUserRequest._() : super();
  factory DeleteUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUserRequest clone() => DeleteUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUserRequest copyWith(void Function(DeleteUserRequest) updates) => super.copyWith((message) => updates(message as DeleteUserRequest)) as DeleteUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUserRequest create() => DeleteUserRequest._();
  DeleteUserRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteUserRequest> createRepeated() => $pb.PbList<DeleteUserRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUserRequest>(create);
  static DeleteUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class DeleteUserResponse extends $pb.GeneratedMessage {
  factory DeleteUserResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteUserResponse._() : super();
  factory DeleteUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUserResponse clone() => DeleteUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUserResponse copyWith(void Function(DeleteUserResponse) updates) => super.copyWith((message) => updates(message as DeleteUserResponse)) as DeleteUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUserResponse create() => DeleteUserResponse._();
  DeleteUserResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteUserResponse> createRepeated() => $pb.PbList<DeleteUserResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUserResponse>(create);
  static DeleteUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListUsersRequest extends $pb.GeneratedMessage {
  factory ListUsersRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListUsersRequest._() : super();
  factory ListUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUsersRequest clone() => ListUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUsersRequest copyWith(void Function(ListUsersRequest) updates) => super.copyWith((message) => updates(message as ListUsersRequest)) as ListUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersRequest create() => ListUsersRequest._();
  ListUsersRequest createEmptyInstance() => create();
  static $pb.PbList<ListUsersRequest> createRepeated() => $pb.PbList<ListUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUsersRequest>(create);
  static ListUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListUsersResponse extends $pb.GeneratedMessage {
  factory ListUsersResponse({
    $core.Iterable<User>? users,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (users != null) {
      $result.users.addAll(users);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListUsersResponse._() : super();
  factory ListUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<User>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: User.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUsersResponse clone() => ListUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUsersResponse copyWith(void Function(ListUsersResponse) updates) => super.copyWith((message) => updates(message as ListUsersResponse)) as ListUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersResponse create() => ListUsersResponse._();
  ListUsersResponse createEmptyInstance() => create();
  static $pb.PbList<ListUsersResponse> createRepeated() => $pb.PbList<ListUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUsersResponse>(create);
  static ListUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<User> get users => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Office
class CreateOfficeRequest extends $pb.GeneratedMessage {
  factory CreateOfficeRequest({
    Office? office,
  }) {
    final $result = create();
    if (office != null) {
      $result.office = office;
    }
    return $result;
  }
  CreateOfficeRequest._() : super();
  factory CreateOfficeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateOfficeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateOfficeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Office>(1, _omitFieldNames ? '' : 'office', subBuilder: Office.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateOfficeRequest clone() => CreateOfficeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateOfficeRequest copyWith(void Function(CreateOfficeRequest) updates) => super.copyWith((message) => updates(message as CreateOfficeRequest)) as CreateOfficeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOfficeRequest create() => CreateOfficeRequest._();
  CreateOfficeRequest createEmptyInstance() => create();
  static $pb.PbList<CreateOfficeRequest> createRepeated() => $pb.PbList<CreateOfficeRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateOfficeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateOfficeRequest>(create);
  static CreateOfficeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Office get office => $_getN(0);
  @$pb.TagNumber(1)
  set office(Office v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffice() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffice() => $_clearField(1);
  @$pb.TagNumber(1)
  Office ensureOffice() => $_ensure(0);
}

class CreateOfficeResponse extends $pb.GeneratedMessage {
  factory CreateOfficeResponse({
    $core.String? officeId,
  }) {
    final $result = create();
    if (officeId != null) {
      $result.officeId = officeId;
    }
    return $result;
  }
  CreateOfficeResponse._() : super();
  factory CreateOfficeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateOfficeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateOfficeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'officeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateOfficeResponse clone() => CreateOfficeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateOfficeResponse copyWith(void Function(CreateOfficeResponse) updates) => super.copyWith((message) => updates(message as CreateOfficeResponse)) as CreateOfficeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOfficeResponse create() => CreateOfficeResponse._();
  CreateOfficeResponse createEmptyInstance() => create();
  static $pb.PbList<CreateOfficeResponse> createRepeated() => $pb.PbList<CreateOfficeResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateOfficeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateOfficeResponse>(create);
  static CreateOfficeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get officeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set officeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOfficeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOfficeId() => $_clearField(1);
}

class GetOfficeRequest extends $pb.GeneratedMessage {
  factory GetOfficeRequest({
    $core.String? officeId,
  }) {
    final $result = create();
    if (officeId != null) {
      $result.officeId = officeId;
    }
    return $result;
  }
  GetOfficeRequest._() : super();
  factory GetOfficeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOfficeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOfficeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'officeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOfficeRequest clone() => GetOfficeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOfficeRequest copyWith(void Function(GetOfficeRequest) updates) => super.copyWith((message) => updates(message as GetOfficeRequest)) as GetOfficeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOfficeRequest create() => GetOfficeRequest._();
  GetOfficeRequest createEmptyInstance() => create();
  static $pb.PbList<GetOfficeRequest> createRepeated() => $pb.PbList<GetOfficeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOfficeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOfficeRequest>(create);
  static GetOfficeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get officeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set officeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOfficeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOfficeId() => $_clearField(1);
}

class GetOfficeResponse extends $pb.GeneratedMessage {
  factory GetOfficeResponse({
    Office? office,
  }) {
    final $result = create();
    if (office != null) {
      $result.office = office;
    }
    return $result;
  }
  GetOfficeResponse._() : super();
  factory GetOfficeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOfficeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOfficeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Office>(1, _omitFieldNames ? '' : 'office', subBuilder: Office.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOfficeResponse clone() => GetOfficeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOfficeResponse copyWith(void Function(GetOfficeResponse) updates) => super.copyWith((message) => updates(message as GetOfficeResponse)) as GetOfficeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOfficeResponse create() => GetOfficeResponse._();
  GetOfficeResponse createEmptyInstance() => create();
  static $pb.PbList<GetOfficeResponse> createRepeated() => $pb.PbList<GetOfficeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetOfficeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOfficeResponse>(create);
  static GetOfficeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Office get office => $_getN(0);
  @$pb.TagNumber(1)
  set office(Office v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffice() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffice() => $_clearField(1);
  @$pb.TagNumber(1)
  Office ensureOffice() => $_ensure(0);
}

class UpdateOfficeRequest extends $pb.GeneratedMessage {
  factory UpdateOfficeRequest({
    $core.String? officeId,
    Office? officeData,
  }) {
    final $result = create();
    if (officeId != null) {
      $result.officeId = officeId;
    }
    if (officeData != null) {
      $result.officeData = officeData;
    }
    return $result;
  }
  UpdateOfficeRequest._() : super();
  factory UpdateOfficeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOfficeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateOfficeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'officeId')
    ..aOM<Office>(2, _omitFieldNames ? '' : 'officeData', subBuilder: Office.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateOfficeRequest clone() => UpdateOfficeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateOfficeRequest copyWith(void Function(UpdateOfficeRequest) updates) => super.copyWith((message) => updates(message as UpdateOfficeRequest)) as UpdateOfficeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOfficeRequest create() => UpdateOfficeRequest._();
  UpdateOfficeRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateOfficeRequest> createRepeated() => $pb.PbList<UpdateOfficeRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateOfficeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOfficeRequest>(create);
  static UpdateOfficeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get officeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set officeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOfficeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOfficeId() => $_clearField(1);

  @$pb.TagNumber(2)
  Office get officeData => $_getN(1);
  @$pb.TagNumber(2)
  set officeData(Office v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOfficeData() => $_has(1);
  @$pb.TagNumber(2)
  void clearOfficeData() => $_clearField(2);
  @$pb.TagNumber(2)
  Office ensureOfficeData() => $_ensure(1);
}

class UpdateOfficeResponse extends $pb.GeneratedMessage {
  factory UpdateOfficeResponse({
    Office? office,
  }) {
    final $result = create();
    if (office != null) {
      $result.office = office;
    }
    return $result;
  }
  UpdateOfficeResponse._() : super();
  factory UpdateOfficeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOfficeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateOfficeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Office>(1, _omitFieldNames ? '' : 'office', subBuilder: Office.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateOfficeResponse clone() => UpdateOfficeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateOfficeResponse copyWith(void Function(UpdateOfficeResponse) updates) => super.copyWith((message) => updates(message as UpdateOfficeResponse)) as UpdateOfficeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOfficeResponse create() => UpdateOfficeResponse._();
  UpdateOfficeResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateOfficeResponse> createRepeated() => $pb.PbList<UpdateOfficeResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateOfficeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOfficeResponse>(create);
  static UpdateOfficeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Office get office => $_getN(0);
  @$pb.TagNumber(1)
  set office(Office v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffice() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffice() => $_clearField(1);
  @$pb.TagNumber(1)
  Office ensureOffice() => $_ensure(0);
}

class DeleteOfficeRequest extends $pb.GeneratedMessage {
  factory DeleteOfficeRequest({
    $core.String? officeId,
  }) {
    final $result = create();
    if (officeId != null) {
      $result.officeId = officeId;
    }
    return $result;
  }
  DeleteOfficeRequest._() : super();
  factory DeleteOfficeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteOfficeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteOfficeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'officeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteOfficeRequest clone() => DeleteOfficeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteOfficeRequest copyWith(void Function(DeleteOfficeRequest) updates) => super.copyWith((message) => updates(message as DeleteOfficeRequest)) as DeleteOfficeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteOfficeRequest create() => DeleteOfficeRequest._();
  DeleteOfficeRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteOfficeRequest> createRepeated() => $pb.PbList<DeleteOfficeRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteOfficeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteOfficeRequest>(create);
  static DeleteOfficeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get officeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set officeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOfficeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOfficeId() => $_clearField(1);
}

class DeleteOfficeResponse extends $pb.GeneratedMessage {
  factory DeleteOfficeResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteOfficeResponse._() : super();
  factory DeleteOfficeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteOfficeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteOfficeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteOfficeResponse clone() => DeleteOfficeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteOfficeResponse copyWith(void Function(DeleteOfficeResponse) updates) => super.copyWith((message) => updates(message as DeleteOfficeResponse)) as DeleteOfficeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteOfficeResponse create() => DeleteOfficeResponse._();
  DeleteOfficeResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteOfficeResponse> createRepeated() => $pb.PbList<DeleteOfficeResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteOfficeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteOfficeResponse>(create);
  static DeleteOfficeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListOfficesRequest extends $pb.GeneratedMessage {
  factory ListOfficesRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListOfficesRequest._() : super();
  factory ListOfficesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOfficesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListOfficesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOfficesRequest clone() => ListOfficesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOfficesRequest copyWith(void Function(ListOfficesRequest) updates) => super.copyWith((message) => updates(message as ListOfficesRequest)) as ListOfficesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListOfficesRequest create() => ListOfficesRequest._();
  ListOfficesRequest createEmptyInstance() => create();
  static $pb.PbList<ListOfficesRequest> createRepeated() => $pb.PbList<ListOfficesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListOfficesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOfficesRequest>(create);
  static ListOfficesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListOfficesResponse extends $pb.GeneratedMessage {
  factory ListOfficesResponse({
    $core.Iterable<Office>? offices,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (offices != null) {
      $result.offices.addAll(offices);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListOfficesResponse._() : super();
  factory ListOfficesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOfficesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListOfficesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Office>(1, _omitFieldNames ? '' : 'offices', $pb.PbFieldType.PM, subBuilder: Office.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOfficesResponse clone() => ListOfficesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOfficesResponse copyWith(void Function(ListOfficesResponse) updates) => super.copyWith((message) => updates(message as ListOfficesResponse)) as ListOfficesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListOfficesResponse create() => ListOfficesResponse._();
  ListOfficesResponse createEmptyInstance() => create();
  static $pb.PbList<ListOfficesResponse> createRepeated() => $pb.PbList<ListOfficesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListOfficesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOfficesResponse>(create);
  static ListOfficesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Office> get offices => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// LegalCase
class CreateLegalCaseRequest extends $pb.GeneratedMessage {
  factory CreateLegalCaseRequest({
    LegalCase? legalCase,
  }) {
    final $result = create();
    if (legalCase != null) {
      $result.legalCase = legalCase;
    }
    return $result;
  }
  CreateLegalCaseRequest._() : super();
  factory CreateLegalCaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLegalCaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLegalCaseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LegalCase>(1, _omitFieldNames ? '' : 'legalCase', subBuilder: LegalCase.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLegalCaseRequest clone() => CreateLegalCaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLegalCaseRequest copyWith(void Function(CreateLegalCaseRequest) updates) => super.copyWith((message) => updates(message as CreateLegalCaseRequest)) as CreateLegalCaseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLegalCaseRequest create() => CreateLegalCaseRequest._();
  CreateLegalCaseRequest createEmptyInstance() => create();
  static $pb.PbList<CreateLegalCaseRequest> createRepeated() => $pb.PbList<CreateLegalCaseRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateLegalCaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLegalCaseRequest>(create);
  static CreateLegalCaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  LegalCase get legalCase => $_getN(0);
  @$pb.TagNumber(1)
  set legalCase(LegalCase v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLegalCase() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegalCase() => $_clearField(1);
  @$pb.TagNumber(1)
  LegalCase ensureLegalCase() => $_ensure(0);
}

class CreateLegalCaseResponse extends $pb.GeneratedMessage {
  factory CreateLegalCaseResponse({
    $core.String? caseId,
  }) {
    final $result = create();
    if (caseId != null) {
      $result.caseId = caseId;
    }
    return $result;
  }
  CreateLegalCaseResponse._() : super();
  factory CreateLegalCaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLegalCaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLegalCaseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLegalCaseResponse clone() => CreateLegalCaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLegalCaseResponse copyWith(void Function(CreateLegalCaseResponse) updates) => super.copyWith((message) => updates(message as CreateLegalCaseResponse)) as CreateLegalCaseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLegalCaseResponse create() => CreateLegalCaseResponse._();
  CreateLegalCaseResponse createEmptyInstance() => create();
  static $pb.PbList<CreateLegalCaseResponse> createRepeated() => $pb.PbList<CreateLegalCaseResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateLegalCaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLegalCaseResponse>(create);
  static CreateLegalCaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);
}

class GetLegalCaseRequest extends $pb.GeneratedMessage {
  factory GetLegalCaseRequest({
    $core.String? caseId,
  }) {
    final $result = create();
    if (caseId != null) {
      $result.caseId = caseId;
    }
    return $result;
  }
  GetLegalCaseRequest._() : super();
  factory GetLegalCaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLegalCaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLegalCaseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLegalCaseRequest clone() => GetLegalCaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLegalCaseRequest copyWith(void Function(GetLegalCaseRequest) updates) => super.copyWith((message) => updates(message as GetLegalCaseRequest)) as GetLegalCaseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLegalCaseRequest create() => GetLegalCaseRequest._();
  GetLegalCaseRequest createEmptyInstance() => create();
  static $pb.PbList<GetLegalCaseRequest> createRepeated() => $pb.PbList<GetLegalCaseRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLegalCaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLegalCaseRequest>(create);
  static GetLegalCaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);
}

class GetLegalCaseResponse extends $pb.GeneratedMessage {
  factory GetLegalCaseResponse({
    LegalCase? legalCase,
  }) {
    final $result = create();
    if (legalCase != null) {
      $result.legalCase = legalCase;
    }
    return $result;
  }
  GetLegalCaseResponse._() : super();
  factory GetLegalCaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLegalCaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLegalCaseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LegalCase>(1, _omitFieldNames ? '' : 'legalCase', subBuilder: LegalCase.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLegalCaseResponse clone() => GetLegalCaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLegalCaseResponse copyWith(void Function(GetLegalCaseResponse) updates) => super.copyWith((message) => updates(message as GetLegalCaseResponse)) as GetLegalCaseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLegalCaseResponse create() => GetLegalCaseResponse._();
  GetLegalCaseResponse createEmptyInstance() => create();
  static $pb.PbList<GetLegalCaseResponse> createRepeated() => $pb.PbList<GetLegalCaseResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLegalCaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLegalCaseResponse>(create);
  static GetLegalCaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LegalCase get legalCase => $_getN(0);
  @$pb.TagNumber(1)
  set legalCase(LegalCase v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLegalCase() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegalCase() => $_clearField(1);
  @$pb.TagNumber(1)
  LegalCase ensureLegalCase() => $_ensure(0);
}

class UpdateLegalCaseRequest extends $pb.GeneratedMessage {
  factory UpdateLegalCaseRequest({
    $core.String? caseId,
    LegalCase? caseData,
  }) {
    final $result = create();
    if (caseId != null) {
      $result.caseId = caseId;
    }
    if (caseData != null) {
      $result.caseData = caseData;
    }
    return $result;
  }
  UpdateLegalCaseRequest._() : super();
  factory UpdateLegalCaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLegalCaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLegalCaseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOM<LegalCase>(2, _omitFieldNames ? '' : 'caseData', subBuilder: LegalCase.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLegalCaseRequest clone() => UpdateLegalCaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLegalCaseRequest copyWith(void Function(UpdateLegalCaseRequest) updates) => super.copyWith((message) => updates(message as UpdateLegalCaseRequest)) as UpdateLegalCaseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLegalCaseRequest create() => UpdateLegalCaseRequest._();
  UpdateLegalCaseRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLegalCaseRequest> createRepeated() => $pb.PbList<UpdateLegalCaseRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLegalCaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLegalCaseRequest>(create);
  static UpdateLegalCaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  LegalCase get caseData => $_getN(1);
  @$pb.TagNumber(2)
  set caseData(LegalCase v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCaseData() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaseData() => $_clearField(2);
  @$pb.TagNumber(2)
  LegalCase ensureCaseData() => $_ensure(1);
}

class UpdateLegalCaseResponse extends $pb.GeneratedMessage {
  factory UpdateLegalCaseResponse({
    LegalCase? legalCase,
  }) {
    final $result = create();
    if (legalCase != null) {
      $result.legalCase = legalCase;
    }
    return $result;
  }
  UpdateLegalCaseResponse._() : super();
  factory UpdateLegalCaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLegalCaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLegalCaseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LegalCase>(1, _omitFieldNames ? '' : 'legalCase', subBuilder: LegalCase.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLegalCaseResponse clone() => UpdateLegalCaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLegalCaseResponse copyWith(void Function(UpdateLegalCaseResponse) updates) => super.copyWith((message) => updates(message as UpdateLegalCaseResponse)) as UpdateLegalCaseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLegalCaseResponse create() => UpdateLegalCaseResponse._();
  UpdateLegalCaseResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateLegalCaseResponse> createRepeated() => $pb.PbList<UpdateLegalCaseResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateLegalCaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLegalCaseResponse>(create);
  static UpdateLegalCaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LegalCase get legalCase => $_getN(0);
  @$pb.TagNumber(1)
  set legalCase(LegalCase v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLegalCase() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegalCase() => $_clearField(1);
  @$pb.TagNumber(1)
  LegalCase ensureLegalCase() => $_ensure(0);
}

class DeleteLegalCaseRequest extends $pb.GeneratedMessage {
  factory DeleteLegalCaseRequest({
    $core.String? caseId,
  }) {
    final $result = create();
    if (caseId != null) {
      $result.caseId = caseId;
    }
    return $result;
  }
  DeleteLegalCaseRequest._() : super();
  factory DeleteLegalCaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLegalCaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLegalCaseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLegalCaseRequest clone() => DeleteLegalCaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLegalCaseRequest copyWith(void Function(DeleteLegalCaseRequest) updates) => super.copyWith((message) => updates(message as DeleteLegalCaseRequest)) as DeleteLegalCaseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLegalCaseRequest create() => DeleteLegalCaseRequest._();
  DeleteLegalCaseRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteLegalCaseRequest> createRepeated() => $pb.PbList<DeleteLegalCaseRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteLegalCaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLegalCaseRequest>(create);
  static DeleteLegalCaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);
}

class DeleteLegalCaseResponse extends $pb.GeneratedMessage {
  factory DeleteLegalCaseResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteLegalCaseResponse._() : super();
  factory DeleteLegalCaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLegalCaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLegalCaseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLegalCaseResponse clone() => DeleteLegalCaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLegalCaseResponse copyWith(void Function(DeleteLegalCaseResponse) updates) => super.copyWith((message) => updates(message as DeleteLegalCaseResponse)) as DeleteLegalCaseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLegalCaseResponse create() => DeleteLegalCaseResponse._();
  DeleteLegalCaseResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteLegalCaseResponse> createRepeated() => $pb.PbList<DeleteLegalCaseResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteLegalCaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLegalCaseResponse>(create);
  static DeleteLegalCaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListLegalCasesRequest extends $pb.GeneratedMessage {
  factory ListLegalCasesRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListLegalCasesRequest._() : super();
  factory ListLegalCasesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLegalCasesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLegalCasesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLegalCasesRequest clone() => ListLegalCasesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLegalCasesRequest copyWith(void Function(ListLegalCasesRequest) updates) => super.copyWith((message) => updates(message as ListLegalCasesRequest)) as ListLegalCasesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLegalCasesRequest create() => ListLegalCasesRequest._();
  ListLegalCasesRequest createEmptyInstance() => create();
  static $pb.PbList<ListLegalCasesRequest> createRepeated() => $pb.PbList<ListLegalCasesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListLegalCasesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLegalCasesRequest>(create);
  static ListLegalCasesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListLegalCasesResponse extends $pb.GeneratedMessage {
  factory ListLegalCasesResponse({
    $core.Iterable<LegalCase>? legalCases,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (legalCases != null) {
      $result.legalCases.addAll(legalCases);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListLegalCasesResponse._() : super();
  factory ListLegalCasesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLegalCasesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLegalCasesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<LegalCase>(1, _omitFieldNames ? '' : 'legalCases', $pb.PbFieldType.PM, subBuilder: LegalCase.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLegalCasesResponse clone() => ListLegalCasesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLegalCasesResponse copyWith(void Function(ListLegalCasesResponse) updates) => super.copyWith((message) => updates(message as ListLegalCasesResponse)) as ListLegalCasesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLegalCasesResponse create() => ListLegalCasesResponse._();
  ListLegalCasesResponse createEmptyInstance() => create();
  static $pb.PbList<ListLegalCasesResponse> createRepeated() => $pb.PbList<ListLegalCasesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListLegalCasesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLegalCasesResponse>(create);
  static ListLegalCasesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LegalCase> get legalCases => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// TranslationOrder
class CreateTranslationOrderRequest extends $pb.GeneratedMessage {
  factory CreateTranslationOrderRequest({
    TranslationOrder? translationOrder,
  }) {
    final $result = create();
    if (translationOrder != null) {
      $result.translationOrder = translationOrder;
    }
    return $result;
  }
  CreateTranslationOrderRequest._() : super();
  factory CreateTranslationOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTranslationOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTranslationOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TranslationOrder>(1, _omitFieldNames ? '' : 'translationOrder', subBuilder: TranslationOrder.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTranslationOrderRequest clone() => CreateTranslationOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTranslationOrderRequest copyWith(void Function(CreateTranslationOrderRequest) updates) => super.copyWith((message) => updates(message as CreateTranslationOrderRequest)) as CreateTranslationOrderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTranslationOrderRequest create() => CreateTranslationOrderRequest._();
  CreateTranslationOrderRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTranslationOrderRequest> createRepeated() => $pb.PbList<CreateTranslationOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTranslationOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTranslationOrderRequest>(create);
  static CreateTranslationOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TranslationOrder get translationOrder => $_getN(0);
  @$pb.TagNumber(1)
  set translationOrder(TranslationOrder v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTranslationOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearTranslationOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  TranslationOrder ensureTranslationOrder() => $_ensure(0);
}

class CreateTranslationOrderResponse extends $pb.GeneratedMessage {
  factory CreateTranslationOrderResponse({
    $core.String? orderId,
  }) {
    final $result = create();
    if (orderId != null) {
      $result.orderId = orderId;
    }
    return $result;
  }
  CreateTranslationOrderResponse._() : super();
  factory CreateTranslationOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTranslationOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTranslationOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTranslationOrderResponse clone() => CreateTranslationOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTranslationOrderResponse copyWith(void Function(CreateTranslationOrderResponse) updates) => super.copyWith((message) => updates(message as CreateTranslationOrderResponse)) as CreateTranslationOrderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTranslationOrderResponse create() => CreateTranslationOrderResponse._();
  CreateTranslationOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CreateTranslationOrderResponse> createRepeated() => $pb.PbList<CreateTranslationOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateTranslationOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTranslationOrderResponse>(create);
  static CreateTranslationOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);
}

class GetTranslationOrderRequest extends $pb.GeneratedMessage {
  factory GetTranslationOrderRequest({
    $core.String? orderId,
  }) {
    final $result = create();
    if (orderId != null) {
      $result.orderId = orderId;
    }
    return $result;
  }
  GetTranslationOrderRequest._() : super();
  factory GetTranslationOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTranslationOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTranslationOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTranslationOrderRequest clone() => GetTranslationOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTranslationOrderRequest copyWith(void Function(GetTranslationOrderRequest) updates) => super.copyWith((message) => updates(message as GetTranslationOrderRequest)) as GetTranslationOrderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTranslationOrderRequest create() => GetTranslationOrderRequest._();
  GetTranslationOrderRequest createEmptyInstance() => create();
  static $pb.PbList<GetTranslationOrderRequest> createRepeated() => $pb.PbList<GetTranslationOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTranslationOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTranslationOrderRequest>(create);
  static GetTranslationOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);
}

class GetTranslationOrderResponse extends $pb.GeneratedMessage {
  factory GetTranslationOrderResponse({
    TranslationOrder? translationOrder,
  }) {
    final $result = create();
    if (translationOrder != null) {
      $result.translationOrder = translationOrder;
    }
    return $result;
  }
  GetTranslationOrderResponse._() : super();
  factory GetTranslationOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTranslationOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTranslationOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TranslationOrder>(1, _omitFieldNames ? '' : 'translationOrder', subBuilder: TranslationOrder.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTranslationOrderResponse clone() => GetTranslationOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTranslationOrderResponse copyWith(void Function(GetTranslationOrderResponse) updates) => super.copyWith((message) => updates(message as GetTranslationOrderResponse)) as GetTranslationOrderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTranslationOrderResponse create() => GetTranslationOrderResponse._();
  GetTranslationOrderResponse createEmptyInstance() => create();
  static $pb.PbList<GetTranslationOrderResponse> createRepeated() => $pb.PbList<GetTranslationOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTranslationOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTranslationOrderResponse>(create);
  static GetTranslationOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TranslationOrder get translationOrder => $_getN(0);
  @$pb.TagNumber(1)
  set translationOrder(TranslationOrder v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTranslationOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearTranslationOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  TranslationOrder ensureTranslationOrder() => $_ensure(0);
}

class UpdateTranslationOrderRequest extends $pb.GeneratedMessage {
  factory UpdateTranslationOrderRequest({
    $core.String? orderId,
    TranslationOrder? orderData,
  }) {
    final $result = create();
    if (orderId != null) {
      $result.orderId = orderId;
    }
    if (orderData != null) {
      $result.orderData = orderData;
    }
    return $result;
  }
  UpdateTranslationOrderRequest._() : super();
  factory UpdateTranslationOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTranslationOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTranslationOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..aOM<TranslationOrder>(2, _omitFieldNames ? '' : 'orderData', subBuilder: TranslationOrder.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTranslationOrderRequest clone() => UpdateTranslationOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTranslationOrderRequest copyWith(void Function(UpdateTranslationOrderRequest) updates) => super.copyWith((message) => updates(message as UpdateTranslationOrderRequest)) as UpdateTranslationOrderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTranslationOrderRequest create() => UpdateTranslationOrderRequest._();
  UpdateTranslationOrderRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTranslationOrderRequest> createRepeated() => $pb.PbList<UpdateTranslationOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTranslationOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTranslationOrderRequest>(create);
  static UpdateTranslationOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  TranslationOrder get orderData => $_getN(1);
  @$pb.TagNumber(2)
  set orderData(TranslationOrder v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrderData() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderData() => $_clearField(2);
  @$pb.TagNumber(2)
  TranslationOrder ensureOrderData() => $_ensure(1);
}

class UpdateTranslationOrderResponse extends $pb.GeneratedMessage {
  factory UpdateTranslationOrderResponse({
    TranslationOrder? translationOrder,
  }) {
    final $result = create();
    if (translationOrder != null) {
      $result.translationOrder = translationOrder;
    }
    return $result;
  }
  UpdateTranslationOrderResponse._() : super();
  factory UpdateTranslationOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTranslationOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTranslationOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TranslationOrder>(1, _omitFieldNames ? '' : 'translationOrder', subBuilder: TranslationOrder.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTranslationOrderResponse clone() => UpdateTranslationOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTranslationOrderResponse copyWith(void Function(UpdateTranslationOrderResponse) updates) => super.copyWith((message) => updates(message as UpdateTranslationOrderResponse)) as UpdateTranslationOrderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTranslationOrderResponse create() => UpdateTranslationOrderResponse._();
  UpdateTranslationOrderResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateTranslationOrderResponse> createRepeated() => $pb.PbList<UpdateTranslationOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateTranslationOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTranslationOrderResponse>(create);
  static UpdateTranslationOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TranslationOrder get translationOrder => $_getN(0);
  @$pb.TagNumber(1)
  set translationOrder(TranslationOrder v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTranslationOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearTranslationOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  TranslationOrder ensureTranslationOrder() => $_ensure(0);
}

class DeleteTranslationOrderRequest extends $pb.GeneratedMessage {
  factory DeleteTranslationOrderRequest({
    $core.String? orderId,
  }) {
    final $result = create();
    if (orderId != null) {
      $result.orderId = orderId;
    }
    return $result;
  }
  DeleteTranslationOrderRequest._() : super();
  factory DeleteTranslationOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTranslationOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTranslationOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTranslationOrderRequest clone() => DeleteTranslationOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTranslationOrderRequest copyWith(void Function(DeleteTranslationOrderRequest) updates) => super.copyWith((message) => updates(message as DeleteTranslationOrderRequest)) as DeleteTranslationOrderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTranslationOrderRequest create() => DeleteTranslationOrderRequest._();
  DeleteTranslationOrderRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTranslationOrderRequest> createRepeated() => $pb.PbList<DeleteTranslationOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTranslationOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTranslationOrderRequest>(create);
  static DeleteTranslationOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);
}

class DeleteTranslationOrderResponse extends $pb.GeneratedMessage {
  factory DeleteTranslationOrderResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteTranslationOrderResponse._() : super();
  factory DeleteTranslationOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTranslationOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTranslationOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTranslationOrderResponse clone() => DeleteTranslationOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTranslationOrderResponse copyWith(void Function(DeleteTranslationOrderResponse) updates) => super.copyWith((message) => updates(message as DeleteTranslationOrderResponse)) as DeleteTranslationOrderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTranslationOrderResponse create() => DeleteTranslationOrderResponse._();
  DeleteTranslationOrderResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTranslationOrderResponse> createRepeated() => $pb.PbList<DeleteTranslationOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTranslationOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTranslationOrderResponse>(create);
  static DeleteTranslationOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListTranslationOrdersRequest extends $pb.GeneratedMessage {
  factory ListTranslationOrdersRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListTranslationOrdersRequest._() : super();
  factory ListTranslationOrdersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTranslationOrdersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTranslationOrdersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTranslationOrdersRequest clone() => ListTranslationOrdersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTranslationOrdersRequest copyWith(void Function(ListTranslationOrdersRequest) updates) => super.copyWith((message) => updates(message as ListTranslationOrdersRequest)) as ListTranslationOrdersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTranslationOrdersRequest create() => ListTranslationOrdersRequest._();
  ListTranslationOrdersRequest createEmptyInstance() => create();
  static $pb.PbList<ListTranslationOrdersRequest> createRepeated() => $pb.PbList<ListTranslationOrdersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTranslationOrdersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTranslationOrdersRequest>(create);
  static ListTranslationOrdersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListTranslationOrdersResponse extends $pb.GeneratedMessage {
  factory ListTranslationOrdersResponse({
    $core.Iterable<TranslationOrder>? translationOrders,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (translationOrders != null) {
      $result.translationOrders.addAll(translationOrders);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListTranslationOrdersResponse._() : super();
  factory ListTranslationOrdersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTranslationOrdersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTranslationOrdersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<TranslationOrder>(1, _omitFieldNames ? '' : 'translationOrders', $pb.PbFieldType.PM, subBuilder: TranslationOrder.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTranslationOrdersResponse clone() => ListTranslationOrdersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTranslationOrdersResponse copyWith(void Function(ListTranslationOrdersResponse) updates) => super.copyWith((message) => updates(message as ListTranslationOrdersResponse)) as ListTranslationOrdersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTranslationOrdersResponse create() => ListTranslationOrdersResponse._();
  ListTranslationOrdersResponse createEmptyInstance() => create();
  static $pb.PbList<ListTranslationOrdersResponse> createRepeated() => $pb.PbList<ListTranslationOrdersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTranslationOrdersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTranslationOrdersResponse>(create);
  static ListTranslationOrdersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TranslationOrder> get translationOrders => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// InsurancePolicy
class CreateInsurancePolicyRequest extends $pb.GeneratedMessage {
  factory CreateInsurancePolicyRequest({
    InsurancePolicy? insurancePolicy,
  }) {
    final $result = create();
    if (insurancePolicy != null) {
      $result.insurancePolicy = insurancePolicy;
    }
    return $result;
  }
  CreateInsurancePolicyRequest._() : super();
  factory CreateInsurancePolicyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateInsurancePolicyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateInsurancePolicyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<InsurancePolicy>(1, _omitFieldNames ? '' : 'insurancePolicy', subBuilder: InsurancePolicy.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateInsurancePolicyRequest clone() => CreateInsurancePolicyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateInsurancePolicyRequest copyWith(void Function(CreateInsurancePolicyRequest) updates) => super.copyWith((message) => updates(message as CreateInsurancePolicyRequest)) as CreateInsurancePolicyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInsurancePolicyRequest create() => CreateInsurancePolicyRequest._();
  CreateInsurancePolicyRequest createEmptyInstance() => create();
  static $pb.PbList<CreateInsurancePolicyRequest> createRepeated() => $pb.PbList<CreateInsurancePolicyRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateInsurancePolicyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateInsurancePolicyRequest>(create);
  static CreateInsurancePolicyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  InsurancePolicy get insurancePolicy => $_getN(0);
  @$pb.TagNumber(1)
  set insurancePolicy(InsurancePolicy v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInsurancePolicy() => $_has(0);
  @$pb.TagNumber(1)
  void clearInsurancePolicy() => $_clearField(1);
  @$pb.TagNumber(1)
  InsurancePolicy ensureInsurancePolicy() => $_ensure(0);
}

class CreateInsurancePolicyResponse extends $pb.GeneratedMessage {
  factory CreateInsurancePolicyResponse({
    $core.String? policyId,
  }) {
    final $result = create();
    if (policyId != null) {
      $result.policyId = policyId;
    }
    return $result;
  }
  CreateInsurancePolicyResponse._() : super();
  factory CreateInsurancePolicyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateInsurancePolicyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateInsurancePolicyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateInsurancePolicyResponse clone() => CreateInsurancePolicyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateInsurancePolicyResponse copyWith(void Function(CreateInsurancePolicyResponse) updates) => super.copyWith((message) => updates(message as CreateInsurancePolicyResponse)) as CreateInsurancePolicyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInsurancePolicyResponse create() => CreateInsurancePolicyResponse._();
  CreateInsurancePolicyResponse createEmptyInstance() => create();
  static $pb.PbList<CreateInsurancePolicyResponse> createRepeated() => $pb.PbList<CreateInsurancePolicyResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateInsurancePolicyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateInsurancePolicyResponse>(create);
  static CreateInsurancePolicyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);
}

class GetInsurancePolicyRequest extends $pb.GeneratedMessage {
  factory GetInsurancePolicyRequest({
    $core.String? policyId,
  }) {
    final $result = create();
    if (policyId != null) {
      $result.policyId = policyId;
    }
    return $result;
  }
  GetInsurancePolicyRequest._() : super();
  factory GetInsurancePolicyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInsurancePolicyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInsurancePolicyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInsurancePolicyRequest clone() => GetInsurancePolicyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInsurancePolicyRequest copyWith(void Function(GetInsurancePolicyRequest) updates) => super.copyWith((message) => updates(message as GetInsurancePolicyRequest)) as GetInsurancePolicyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInsurancePolicyRequest create() => GetInsurancePolicyRequest._();
  GetInsurancePolicyRequest createEmptyInstance() => create();
  static $pb.PbList<GetInsurancePolicyRequest> createRepeated() => $pb.PbList<GetInsurancePolicyRequest>();
  @$core.pragma('dart2js:noInline')
  static GetInsurancePolicyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInsurancePolicyRequest>(create);
  static GetInsurancePolicyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);
}

class GetInsurancePolicyResponse extends $pb.GeneratedMessage {
  factory GetInsurancePolicyResponse({
    InsurancePolicy? insurancePolicy,
  }) {
    final $result = create();
    if (insurancePolicy != null) {
      $result.insurancePolicy = insurancePolicy;
    }
    return $result;
  }
  GetInsurancePolicyResponse._() : super();
  factory GetInsurancePolicyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInsurancePolicyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInsurancePolicyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<InsurancePolicy>(1, _omitFieldNames ? '' : 'insurancePolicy', subBuilder: InsurancePolicy.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInsurancePolicyResponse clone() => GetInsurancePolicyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInsurancePolicyResponse copyWith(void Function(GetInsurancePolicyResponse) updates) => super.copyWith((message) => updates(message as GetInsurancePolicyResponse)) as GetInsurancePolicyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInsurancePolicyResponse create() => GetInsurancePolicyResponse._();
  GetInsurancePolicyResponse createEmptyInstance() => create();
  static $pb.PbList<GetInsurancePolicyResponse> createRepeated() => $pb.PbList<GetInsurancePolicyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetInsurancePolicyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInsurancePolicyResponse>(create);
  static GetInsurancePolicyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  InsurancePolicy get insurancePolicy => $_getN(0);
  @$pb.TagNumber(1)
  set insurancePolicy(InsurancePolicy v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInsurancePolicy() => $_has(0);
  @$pb.TagNumber(1)
  void clearInsurancePolicy() => $_clearField(1);
  @$pb.TagNumber(1)
  InsurancePolicy ensureInsurancePolicy() => $_ensure(0);
}

class UpdateInsurancePolicyRequest extends $pb.GeneratedMessage {
  factory UpdateInsurancePolicyRequest({
    $core.String? policyId,
    InsurancePolicy? policyData,
  }) {
    final $result = create();
    if (policyId != null) {
      $result.policyId = policyId;
    }
    if (policyData != null) {
      $result.policyData = policyData;
    }
    return $result;
  }
  UpdateInsurancePolicyRequest._() : super();
  factory UpdateInsurancePolicyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInsurancePolicyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInsurancePolicyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..aOM<InsurancePolicy>(2, _omitFieldNames ? '' : 'policyData', subBuilder: InsurancePolicy.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInsurancePolicyRequest clone() => UpdateInsurancePolicyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInsurancePolicyRequest copyWith(void Function(UpdateInsurancePolicyRequest) updates) => super.copyWith((message) => updates(message as UpdateInsurancePolicyRequest)) as UpdateInsurancePolicyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInsurancePolicyRequest create() => UpdateInsurancePolicyRequest._();
  UpdateInsurancePolicyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateInsurancePolicyRequest> createRepeated() => $pb.PbList<UpdateInsurancePolicyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateInsurancePolicyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInsurancePolicyRequest>(create);
  static UpdateInsurancePolicyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);

  @$pb.TagNumber(2)
  InsurancePolicy get policyData => $_getN(1);
  @$pb.TagNumber(2)
  set policyData(InsurancePolicy v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPolicyData() => $_has(1);
  @$pb.TagNumber(2)
  void clearPolicyData() => $_clearField(2);
  @$pb.TagNumber(2)
  InsurancePolicy ensurePolicyData() => $_ensure(1);
}

class UpdateInsurancePolicyResponse extends $pb.GeneratedMessage {
  factory UpdateInsurancePolicyResponse({
    InsurancePolicy? insurancePolicy,
  }) {
    final $result = create();
    if (insurancePolicy != null) {
      $result.insurancePolicy = insurancePolicy;
    }
    return $result;
  }
  UpdateInsurancePolicyResponse._() : super();
  factory UpdateInsurancePolicyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInsurancePolicyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInsurancePolicyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<InsurancePolicy>(1, _omitFieldNames ? '' : 'insurancePolicy', subBuilder: InsurancePolicy.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInsurancePolicyResponse clone() => UpdateInsurancePolicyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInsurancePolicyResponse copyWith(void Function(UpdateInsurancePolicyResponse) updates) => super.copyWith((message) => updates(message as UpdateInsurancePolicyResponse)) as UpdateInsurancePolicyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInsurancePolicyResponse create() => UpdateInsurancePolicyResponse._();
  UpdateInsurancePolicyResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateInsurancePolicyResponse> createRepeated() => $pb.PbList<UpdateInsurancePolicyResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateInsurancePolicyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInsurancePolicyResponse>(create);
  static UpdateInsurancePolicyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  InsurancePolicy get insurancePolicy => $_getN(0);
  @$pb.TagNumber(1)
  set insurancePolicy(InsurancePolicy v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInsurancePolicy() => $_has(0);
  @$pb.TagNumber(1)
  void clearInsurancePolicy() => $_clearField(1);
  @$pb.TagNumber(1)
  InsurancePolicy ensureInsurancePolicy() => $_ensure(0);
}

class DeleteInsurancePolicyRequest extends $pb.GeneratedMessage {
  factory DeleteInsurancePolicyRequest({
    $core.String? policyId,
  }) {
    final $result = create();
    if (policyId != null) {
      $result.policyId = policyId;
    }
    return $result;
  }
  DeleteInsurancePolicyRequest._() : super();
  factory DeleteInsurancePolicyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteInsurancePolicyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteInsurancePolicyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteInsurancePolicyRequest clone() => DeleteInsurancePolicyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteInsurancePolicyRequest copyWith(void Function(DeleteInsurancePolicyRequest) updates) => super.copyWith((message) => updates(message as DeleteInsurancePolicyRequest)) as DeleteInsurancePolicyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteInsurancePolicyRequest create() => DeleteInsurancePolicyRequest._();
  DeleteInsurancePolicyRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteInsurancePolicyRequest> createRepeated() => $pb.PbList<DeleteInsurancePolicyRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteInsurancePolicyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteInsurancePolicyRequest>(create);
  static DeleteInsurancePolicyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);
}

class DeleteInsurancePolicyResponse extends $pb.GeneratedMessage {
  factory DeleteInsurancePolicyResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteInsurancePolicyResponse._() : super();
  factory DeleteInsurancePolicyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteInsurancePolicyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteInsurancePolicyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteInsurancePolicyResponse clone() => DeleteInsurancePolicyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteInsurancePolicyResponse copyWith(void Function(DeleteInsurancePolicyResponse) updates) => super.copyWith((message) => updates(message as DeleteInsurancePolicyResponse)) as DeleteInsurancePolicyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteInsurancePolicyResponse create() => DeleteInsurancePolicyResponse._();
  DeleteInsurancePolicyResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteInsurancePolicyResponse> createRepeated() => $pb.PbList<DeleteInsurancePolicyResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteInsurancePolicyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteInsurancePolicyResponse>(create);
  static DeleteInsurancePolicyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListInsurancePoliciesRequest extends $pb.GeneratedMessage {
  factory ListInsurancePoliciesRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListInsurancePoliciesRequest._() : super();
  factory ListInsurancePoliciesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInsurancePoliciesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInsurancePoliciesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListInsurancePoliciesRequest clone() => ListInsurancePoliciesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListInsurancePoliciesRequest copyWith(void Function(ListInsurancePoliciesRequest) updates) => super.copyWith((message) => updates(message as ListInsurancePoliciesRequest)) as ListInsurancePoliciesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInsurancePoliciesRequest create() => ListInsurancePoliciesRequest._();
  ListInsurancePoliciesRequest createEmptyInstance() => create();
  static $pb.PbList<ListInsurancePoliciesRequest> createRepeated() => $pb.PbList<ListInsurancePoliciesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListInsurancePoliciesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListInsurancePoliciesRequest>(create);
  static ListInsurancePoliciesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListInsurancePoliciesResponse extends $pb.GeneratedMessage {
  factory ListInsurancePoliciesResponse({
    $core.Iterable<InsurancePolicy>? insurancePolicies,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (insurancePolicies != null) {
      $result.insurancePolicies.addAll(insurancePolicies);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListInsurancePoliciesResponse._() : super();
  factory ListInsurancePoliciesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInsurancePoliciesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInsurancePoliciesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<InsurancePolicy>(1, _omitFieldNames ? '' : 'insurancePolicies', $pb.PbFieldType.PM, subBuilder: InsurancePolicy.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListInsurancePoliciesResponse clone() => ListInsurancePoliciesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListInsurancePoliciesResponse copyWith(void Function(ListInsurancePoliciesResponse) updates) => super.copyWith((message) => updates(message as ListInsurancePoliciesResponse)) as ListInsurancePoliciesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInsurancePoliciesResponse create() => ListInsurancePoliciesResponse._();
  ListInsurancePoliciesResponse createEmptyInstance() => create();
  static $pb.PbList<ListInsurancePoliciesResponse> createRepeated() => $pb.PbList<ListInsurancePoliciesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListInsurancePoliciesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListInsurancePoliciesResponse>(create);
  static ListInsurancePoliciesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InsurancePolicy> get insurancePolicies => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// TrainingEnrollment
class CreateTrainingEnrollmentRequest extends $pb.GeneratedMessage {
  factory CreateTrainingEnrollmentRequest({
    TrainingEnrollment? trainingEnrollment,
  }) {
    final $result = create();
    if (trainingEnrollment != null) {
      $result.trainingEnrollment = trainingEnrollment;
    }
    return $result;
  }
  CreateTrainingEnrollmentRequest._() : super();
  factory CreateTrainingEnrollmentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTrainingEnrollmentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTrainingEnrollmentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TrainingEnrollment>(1, _omitFieldNames ? '' : 'trainingEnrollment', subBuilder: TrainingEnrollment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTrainingEnrollmentRequest clone() => CreateTrainingEnrollmentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTrainingEnrollmentRequest copyWith(void Function(CreateTrainingEnrollmentRequest) updates) => super.copyWith((message) => updates(message as CreateTrainingEnrollmentRequest)) as CreateTrainingEnrollmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTrainingEnrollmentRequest create() => CreateTrainingEnrollmentRequest._();
  CreateTrainingEnrollmentRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTrainingEnrollmentRequest> createRepeated() => $pb.PbList<CreateTrainingEnrollmentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTrainingEnrollmentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTrainingEnrollmentRequest>(create);
  static CreateTrainingEnrollmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TrainingEnrollment get trainingEnrollment => $_getN(0);
  @$pb.TagNumber(1)
  set trainingEnrollment(TrainingEnrollment v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrainingEnrollment() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrainingEnrollment() => $_clearField(1);
  @$pb.TagNumber(1)
  TrainingEnrollment ensureTrainingEnrollment() => $_ensure(0);
}

class CreateTrainingEnrollmentResponse extends $pb.GeneratedMessage {
  factory CreateTrainingEnrollmentResponse({
    $core.String? enrollmentId,
  }) {
    final $result = create();
    if (enrollmentId != null) {
      $result.enrollmentId = enrollmentId;
    }
    return $result;
  }
  CreateTrainingEnrollmentResponse._() : super();
  factory CreateTrainingEnrollmentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTrainingEnrollmentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTrainingEnrollmentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'enrollmentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTrainingEnrollmentResponse clone() => CreateTrainingEnrollmentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTrainingEnrollmentResponse copyWith(void Function(CreateTrainingEnrollmentResponse) updates) => super.copyWith((message) => updates(message as CreateTrainingEnrollmentResponse)) as CreateTrainingEnrollmentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTrainingEnrollmentResponse create() => CreateTrainingEnrollmentResponse._();
  CreateTrainingEnrollmentResponse createEmptyInstance() => create();
  static $pb.PbList<CreateTrainingEnrollmentResponse> createRepeated() => $pb.PbList<CreateTrainingEnrollmentResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateTrainingEnrollmentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTrainingEnrollmentResponse>(create);
  static CreateTrainingEnrollmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get enrollmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set enrollmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnrollmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnrollmentId() => $_clearField(1);
}

class GetTrainingEnrollmentRequest extends $pb.GeneratedMessage {
  factory GetTrainingEnrollmentRequest({
    $core.String? enrollmentId,
  }) {
    final $result = create();
    if (enrollmentId != null) {
      $result.enrollmentId = enrollmentId;
    }
    return $result;
  }
  GetTrainingEnrollmentRequest._() : super();
  factory GetTrainingEnrollmentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrainingEnrollmentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTrainingEnrollmentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'enrollmentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTrainingEnrollmentRequest clone() => GetTrainingEnrollmentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTrainingEnrollmentRequest copyWith(void Function(GetTrainingEnrollmentRequest) updates) => super.copyWith((message) => updates(message as GetTrainingEnrollmentRequest)) as GetTrainingEnrollmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTrainingEnrollmentRequest create() => GetTrainingEnrollmentRequest._();
  GetTrainingEnrollmentRequest createEmptyInstance() => create();
  static $pb.PbList<GetTrainingEnrollmentRequest> createRepeated() => $pb.PbList<GetTrainingEnrollmentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTrainingEnrollmentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrainingEnrollmentRequest>(create);
  static GetTrainingEnrollmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get enrollmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set enrollmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnrollmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnrollmentId() => $_clearField(1);
}

class GetTrainingEnrollmentResponse extends $pb.GeneratedMessage {
  factory GetTrainingEnrollmentResponse({
    TrainingEnrollment? trainingEnrollment,
  }) {
    final $result = create();
    if (trainingEnrollment != null) {
      $result.trainingEnrollment = trainingEnrollment;
    }
    return $result;
  }
  GetTrainingEnrollmentResponse._() : super();
  factory GetTrainingEnrollmentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrainingEnrollmentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTrainingEnrollmentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TrainingEnrollment>(1, _omitFieldNames ? '' : 'trainingEnrollment', subBuilder: TrainingEnrollment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTrainingEnrollmentResponse clone() => GetTrainingEnrollmentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTrainingEnrollmentResponse copyWith(void Function(GetTrainingEnrollmentResponse) updates) => super.copyWith((message) => updates(message as GetTrainingEnrollmentResponse)) as GetTrainingEnrollmentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTrainingEnrollmentResponse create() => GetTrainingEnrollmentResponse._();
  GetTrainingEnrollmentResponse createEmptyInstance() => create();
  static $pb.PbList<GetTrainingEnrollmentResponse> createRepeated() => $pb.PbList<GetTrainingEnrollmentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTrainingEnrollmentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrainingEnrollmentResponse>(create);
  static GetTrainingEnrollmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TrainingEnrollment get trainingEnrollment => $_getN(0);
  @$pb.TagNumber(1)
  set trainingEnrollment(TrainingEnrollment v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrainingEnrollment() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrainingEnrollment() => $_clearField(1);
  @$pb.TagNumber(1)
  TrainingEnrollment ensureTrainingEnrollment() => $_ensure(0);
}

class UpdateTrainingEnrollmentRequest extends $pb.GeneratedMessage {
  factory UpdateTrainingEnrollmentRequest({
    $core.String? enrollmentId,
    TrainingEnrollment? enrollmentData,
  }) {
    final $result = create();
    if (enrollmentId != null) {
      $result.enrollmentId = enrollmentId;
    }
    if (enrollmentData != null) {
      $result.enrollmentData = enrollmentData;
    }
    return $result;
  }
  UpdateTrainingEnrollmentRequest._() : super();
  factory UpdateTrainingEnrollmentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTrainingEnrollmentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTrainingEnrollmentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'enrollmentId')
    ..aOM<TrainingEnrollment>(2, _omitFieldNames ? '' : 'enrollmentData', subBuilder: TrainingEnrollment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTrainingEnrollmentRequest clone() => UpdateTrainingEnrollmentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTrainingEnrollmentRequest copyWith(void Function(UpdateTrainingEnrollmentRequest) updates) => super.copyWith((message) => updates(message as UpdateTrainingEnrollmentRequest)) as UpdateTrainingEnrollmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTrainingEnrollmentRequest create() => UpdateTrainingEnrollmentRequest._();
  UpdateTrainingEnrollmentRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTrainingEnrollmentRequest> createRepeated() => $pb.PbList<UpdateTrainingEnrollmentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTrainingEnrollmentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTrainingEnrollmentRequest>(create);
  static UpdateTrainingEnrollmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get enrollmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set enrollmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnrollmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnrollmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  TrainingEnrollment get enrollmentData => $_getN(1);
  @$pb.TagNumber(2)
  set enrollmentData(TrainingEnrollment v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnrollmentData() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnrollmentData() => $_clearField(2);
  @$pb.TagNumber(2)
  TrainingEnrollment ensureEnrollmentData() => $_ensure(1);
}

class UpdateTrainingEnrollmentResponse extends $pb.GeneratedMessage {
  factory UpdateTrainingEnrollmentResponse({
    TrainingEnrollment? trainingEnrollment,
  }) {
    final $result = create();
    if (trainingEnrollment != null) {
      $result.trainingEnrollment = trainingEnrollment;
    }
    return $result;
  }
  UpdateTrainingEnrollmentResponse._() : super();
  factory UpdateTrainingEnrollmentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTrainingEnrollmentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTrainingEnrollmentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TrainingEnrollment>(1, _omitFieldNames ? '' : 'trainingEnrollment', subBuilder: TrainingEnrollment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTrainingEnrollmentResponse clone() => UpdateTrainingEnrollmentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTrainingEnrollmentResponse copyWith(void Function(UpdateTrainingEnrollmentResponse) updates) => super.copyWith((message) => updates(message as UpdateTrainingEnrollmentResponse)) as UpdateTrainingEnrollmentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTrainingEnrollmentResponse create() => UpdateTrainingEnrollmentResponse._();
  UpdateTrainingEnrollmentResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateTrainingEnrollmentResponse> createRepeated() => $pb.PbList<UpdateTrainingEnrollmentResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateTrainingEnrollmentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTrainingEnrollmentResponse>(create);
  static UpdateTrainingEnrollmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TrainingEnrollment get trainingEnrollment => $_getN(0);
  @$pb.TagNumber(1)
  set trainingEnrollment(TrainingEnrollment v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrainingEnrollment() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrainingEnrollment() => $_clearField(1);
  @$pb.TagNumber(1)
  TrainingEnrollment ensureTrainingEnrollment() => $_ensure(0);
}

class DeleteTrainingEnrollmentRequest extends $pb.GeneratedMessage {
  factory DeleteTrainingEnrollmentRequest({
    $core.String? enrollmentId,
  }) {
    final $result = create();
    if (enrollmentId != null) {
      $result.enrollmentId = enrollmentId;
    }
    return $result;
  }
  DeleteTrainingEnrollmentRequest._() : super();
  factory DeleteTrainingEnrollmentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTrainingEnrollmentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTrainingEnrollmentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'enrollmentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTrainingEnrollmentRequest clone() => DeleteTrainingEnrollmentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTrainingEnrollmentRequest copyWith(void Function(DeleteTrainingEnrollmentRequest) updates) => super.copyWith((message) => updates(message as DeleteTrainingEnrollmentRequest)) as DeleteTrainingEnrollmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTrainingEnrollmentRequest create() => DeleteTrainingEnrollmentRequest._();
  DeleteTrainingEnrollmentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTrainingEnrollmentRequest> createRepeated() => $pb.PbList<DeleteTrainingEnrollmentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTrainingEnrollmentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTrainingEnrollmentRequest>(create);
  static DeleteTrainingEnrollmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get enrollmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set enrollmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnrollmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnrollmentId() => $_clearField(1);
}

class DeleteTrainingEnrollmentResponse extends $pb.GeneratedMessage {
  factory DeleteTrainingEnrollmentResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteTrainingEnrollmentResponse._() : super();
  factory DeleteTrainingEnrollmentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTrainingEnrollmentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTrainingEnrollmentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTrainingEnrollmentResponse clone() => DeleteTrainingEnrollmentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTrainingEnrollmentResponse copyWith(void Function(DeleteTrainingEnrollmentResponse) updates) => super.copyWith((message) => updates(message as DeleteTrainingEnrollmentResponse)) as DeleteTrainingEnrollmentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTrainingEnrollmentResponse create() => DeleteTrainingEnrollmentResponse._();
  DeleteTrainingEnrollmentResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTrainingEnrollmentResponse> createRepeated() => $pb.PbList<DeleteTrainingEnrollmentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTrainingEnrollmentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTrainingEnrollmentResponse>(create);
  static DeleteTrainingEnrollmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListTrainingEnrollmentsRequest extends $pb.GeneratedMessage {
  factory ListTrainingEnrollmentsRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListTrainingEnrollmentsRequest._() : super();
  factory ListTrainingEnrollmentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTrainingEnrollmentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTrainingEnrollmentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTrainingEnrollmentsRequest clone() => ListTrainingEnrollmentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTrainingEnrollmentsRequest copyWith(void Function(ListTrainingEnrollmentsRequest) updates) => super.copyWith((message) => updates(message as ListTrainingEnrollmentsRequest)) as ListTrainingEnrollmentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTrainingEnrollmentsRequest create() => ListTrainingEnrollmentsRequest._();
  ListTrainingEnrollmentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListTrainingEnrollmentsRequest> createRepeated() => $pb.PbList<ListTrainingEnrollmentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTrainingEnrollmentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTrainingEnrollmentsRequest>(create);
  static ListTrainingEnrollmentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListTrainingEnrollmentsResponse extends $pb.GeneratedMessage {
  factory ListTrainingEnrollmentsResponse({
    $core.Iterable<TrainingEnrollment>? trainingEnrollments,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (trainingEnrollments != null) {
      $result.trainingEnrollments.addAll(trainingEnrollments);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListTrainingEnrollmentsResponse._() : super();
  factory ListTrainingEnrollmentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTrainingEnrollmentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTrainingEnrollmentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<TrainingEnrollment>(1, _omitFieldNames ? '' : 'trainingEnrollments', $pb.PbFieldType.PM, subBuilder: TrainingEnrollment.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTrainingEnrollmentsResponse clone() => ListTrainingEnrollmentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTrainingEnrollmentsResponse copyWith(void Function(ListTrainingEnrollmentsResponse) updates) => super.copyWith((message) => updates(message as ListTrainingEnrollmentsResponse)) as ListTrainingEnrollmentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTrainingEnrollmentsResponse create() => ListTrainingEnrollmentsResponse._();
  ListTrainingEnrollmentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListTrainingEnrollmentsResponse> createRepeated() => $pb.PbList<ListTrainingEnrollmentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTrainingEnrollmentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTrainingEnrollmentsResponse>(create);
  static ListTrainingEnrollmentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TrainingEnrollment> get trainingEnrollments => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// AccountOpeningRequest
class CreateAccountOpeningRequestRequest extends $pb.GeneratedMessage {
  factory CreateAccountOpeningRequestRequest({
    AccountOpeningRequest? accountOpeningRequest,
  }) {
    final $result = create();
    if (accountOpeningRequest != null) {
      $result.accountOpeningRequest = accountOpeningRequest;
    }
    return $result;
  }
  CreateAccountOpeningRequestRequest._() : super();
  factory CreateAccountOpeningRequestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccountOpeningRequestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAccountOpeningRequestRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<AccountOpeningRequest>(1, _omitFieldNames ? '' : 'accountOpeningRequest', subBuilder: AccountOpeningRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAccountOpeningRequestRequest clone() => CreateAccountOpeningRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAccountOpeningRequestRequest copyWith(void Function(CreateAccountOpeningRequestRequest) updates) => super.copyWith((message) => updates(message as CreateAccountOpeningRequestRequest)) as CreateAccountOpeningRequestRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccountOpeningRequestRequest create() => CreateAccountOpeningRequestRequest._();
  CreateAccountOpeningRequestRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAccountOpeningRequestRequest> createRepeated() => $pb.PbList<CreateAccountOpeningRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAccountOpeningRequestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccountOpeningRequestRequest>(create);
  static CreateAccountOpeningRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  AccountOpeningRequest get accountOpeningRequest => $_getN(0);
  @$pb.TagNumber(1)
  set accountOpeningRequest(AccountOpeningRequest v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountOpeningRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountOpeningRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  AccountOpeningRequest ensureAccountOpeningRequest() => $_ensure(0);
}

class CreateAccountOpeningRequestResponse extends $pb.GeneratedMessage {
  factory CreateAccountOpeningRequestResponse({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  CreateAccountOpeningRequestResponse._() : super();
  factory CreateAccountOpeningRequestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccountOpeningRequestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAccountOpeningRequestResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAccountOpeningRequestResponse clone() => CreateAccountOpeningRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAccountOpeningRequestResponse copyWith(void Function(CreateAccountOpeningRequestResponse) updates) => super.copyWith((message) => updates(message as CreateAccountOpeningRequestResponse)) as CreateAccountOpeningRequestResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccountOpeningRequestResponse create() => CreateAccountOpeningRequestResponse._();
  CreateAccountOpeningRequestResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAccountOpeningRequestResponse> createRepeated() => $pb.PbList<CreateAccountOpeningRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAccountOpeningRequestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccountOpeningRequestResponse>(create);
  static CreateAccountOpeningRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class GetAccountOpeningRequestRequest extends $pb.GeneratedMessage {
  factory GetAccountOpeningRequestRequest({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  GetAccountOpeningRequestRequest._() : super();
  factory GetAccountOpeningRequestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountOpeningRequestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccountOpeningRequestRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountOpeningRequestRequest clone() => GetAccountOpeningRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountOpeningRequestRequest copyWith(void Function(GetAccountOpeningRequestRequest) updates) => super.copyWith((message) => updates(message as GetAccountOpeningRequestRequest)) as GetAccountOpeningRequestRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccountOpeningRequestRequest create() => GetAccountOpeningRequestRequest._();
  GetAccountOpeningRequestRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountOpeningRequestRequest> createRepeated() => $pb.PbList<GetAccountOpeningRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountOpeningRequestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountOpeningRequestRequest>(create);
  static GetAccountOpeningRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class GetAccountOpeningRequestResponse extends $pb.GeneratedMessage {
  factory GetAccountOpeningRequestResponse({
    AccountOpeningRequest? accountOpeningRequest,
  }) {
    final $result = create();
    if (accountOpeningRequest != null) {
      $result.accountOpeningRequest = accountOpeningRequest;
    }
    return $result;
  }
  GetAccountOpeningRequestResponse._() : super();
  factory GetAccountOpeningRequestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountOpeningRequestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccountOpeningRequestResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<AccountOpeningRequest>(1, _omitFieldNames ? '' : 'accountOpeningRequest', subBuilder: AccountOpeningRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountOpeningRequestResponse clone() => GetAccountOpeningRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountOpeningRequestResponse copyWith(void Function(GetAccountOpeningRequestResponse) updates) => super.copyWith((message) => updates(message as GetAccountOpeningRequestResponse)) as GetAccountOpeningRequestResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccountOpeningRequestResponse create() => GetAccountOpeningRequestResponse._();
  GetAccountOpeningRequestResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccountOpeningRequestResponse> createRepeated() => $pb.PbList<GetAccountOpeningRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAccountOpeningRequestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountOpeningRequestResponse>(create);
  static GetAccountOpeningRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  AccountOpeningRequest get accountOpeningRequest => $_getN(0);
  @$pb.TagNumber(1)
  set accountOpeningRequest(AccountOpeningRequest v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountOpeningRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountOpeningRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  AccountOpeningRequest ensureAccountOpeningRequest() => $_ensure(0);
}

class UpdateAccountOpeningRequestRequest extends $pb.GeneratedMessage {
  factory UpdateAccountOpeningRequestRequest({
    $core.String? requestId,
    AccountOpeningRequest? requestData,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (requestData != null) {
      $result.requestData = requestData;
    }
    return $result;
  }
  UpdateAccountOpeningRequestRequest._() : super();
  factory UpdateAccountOpeningRequestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccountOpeningRequestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccountOpeningRequestRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOM<AccountOpeningRequest>(2, _omitFieldNames ? '' : 'requestData', subBuilder: AccountOpeningRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccountOpeningRequestRequest clone() => UpdateAccountOpeningRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccountOpeningRequestRequest copyWith(void Function(UpdateAccountOpeningRequestRequest) updates) => super.copyWith((message) => updates(message as UpdateAccountOpeningRequestRequest)) as UpdateAccountOpeningRequestRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccountOpeningRequestRequest create() => UpdateAccountOpeningRequestRequest._();
  UpdateAccountOpeningRequestRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAccountOpeningRequestRequest> createRepeated() => $pb.PbList<UpdateAccountOpeningRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccountOpeningRequestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccountOpeningRequestRequest>(create);
  static UpdateAccountOpeningRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  AccountOpeningRequest get requestData => $_getN(1);
  @$pb.TagNumber(2)
  set requestData(AccountOpeningRequest v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRequestData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestData() => $_clearField(2);
  @$pb.TagNumber(2)
  AccountOpeningRequest ensureRequestData() => $_ensure(1);
}

class UpdateAccountOpeningRequestResponse extends $pb.GeneratedMessage {
  factory UpdateAccountOpeningRequestResponse({
    AccountOpeningRequest? accountOpeningRequest,
  }) {
    final $result = create();
    if (accountOpeningRequest != null) {
      $result.accountOpeningRequest = accountOpeningRequest;
    }
    return $result;
  }
  UpdateAccountOpeningRequestResponse._() : super();
  factory UpdateAccountOpeningRequestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccountOpeningRequestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccountOpeningRequestResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<AccountOpeningRequest>(1, _omitFieldNames ? '' : 'accountOpeningRequest', subBuilder: AccountOpeningRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccountOpeningRequestResponse clone() => UpdateAccountOpeningRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccountOpeningRequestResponse copyWith(void Function(UpdateAccountOpeningRequestResponse) updates) => super.copyWith((message) => updates(message as UpdateAccountOpeningRequestResponse)) as UpdateAccountOpeningRequestResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccountOpeningRequestResponse create() => UpdateAccountOpeningRequestResponse._();
  UpdateAccountOpeningRequestResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAccountOpeningRequestResponse> createRepeated() => $pb.PbList<UpdateAccountOpeningRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccountOpeningRequestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccountOpeningRequestResponse>(create);
  static UpdateAccountOpeningRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  AccountOpeningRequest get accountOpeningRequest => $_getN(0);
  @$pb.TagNumber(1)
  set accountOpeningRequest(AccountOpeningRequest v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountOpeningRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountOpeningRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  AccountOpeningRequest ensureAccountOpeningRequest() => $_ensure(0);
}

class DeleteAccountOpeningRequestRequest extends $pb.GeneratedMessage {
  factory DeleteAccountOpeningRequestRequest({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  DeleteAccountOpeningRequestRequest._() : super();
  factory DeleteAccountOpeningRequestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAccountOpeningRequestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAccountOpeningRequestRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAccountOpeningRequestRequest clone() => DeleteAccountOpeningRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAccountOpeningRequestRequest copyWith(void Function(DeleteAccountOpeningRequestRequest) updates) => super.copyWith((message) => updates(message as DeleteAccountOpeningRequestRequest)) as DeleteAccountOpeningRequestRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAccountOpeningRequestRequest create() => DeleteAccountOpeningRequestRequest._();
  DeleteAccountOpeningRequestRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAccountOpeningRequestRequest> createRepeated() => $pb.PbList<DeleteAccountOpeningRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAccountOpeningRequestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAccountOpeningRequestRequest>(create);
  static DeleteAccountOpeningRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class DeleteAccountOpeningRequestResponse extends $pb.GeneratedMessage {
  factory DeleteAccountOpeningRequestResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteAccountOpeningRequestResponse._() : super();
  factory DeleteAccountOpeningRequestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAccountOpeningRequestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAccountOpeningRequestResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAccountOpeningRequestResponse clone() => DeleteAccountOpeningRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAccountOpeningRequestResponse copyWith(void Function(DeleteAccountOpeningRequestResponse) updates) => super.copyWith((message) => updates(message as DeleteAccountOpeningRequestResponse)) as DeleteAccountOpeningRequestResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAccountOpeningRequestResponse create() => DeleteAccountOpeningRequestResponse._();
  DeleteAccountOpeningRequestResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAccountOpeningRequestResponse> createRepeated() => $pb.PbList<DeleteAccountOpeningRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAccountOpeningRequestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAccountOpeningRequestResponse>(create);
  static DeleteAccountOpeningRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListAccountOpeningRequestsRequest extends $pb.GeneratedMessage {
  factory ListAccountOpeningRequestsRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListAccountOpeningRequestsRequest._() : super();
  factory ListAccountOpeningRequestsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountOpeningRequestsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAccountOpeningRequestsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAccountOpeningRequestsRequest clone() => ListAccountOpeningRequestsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAccountOpeningRequestsRequest copyWith(void Function(ListAccountOpeningRequestsRequest) updates) => super.copyWith((message) => updates(message as ListAccountOpeningRequestsRequest)) as ListAccountOpeningRequestsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAccountOpeningRequestsRequest create() => ListAccountOpeningRequestsRequest._();
  ListAccountOpeningRequestsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAccountOpeningRequestsRequest> createRepeated() => $pb.PbList<ListAccountOpeningRequestsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAccountOpeningRequestsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAccountOpeningRequestsRequest>(create);
  static ListAccountOpeningRequestsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListAccountOpeningRequestsResponse extends $pb.GeneratedMessage {
  factory ListAccountOpeningRequestsResponse({
    $core.Iterable<AccountOpeningRequest>? accountOpeningRequests,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (accountOpeningRequests != null) {
      $result.accountOpeningRequests.addAll(accountOpeningRequests);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListAccountOpeningRequestsResponse._() : super();
  factory ListAccountOpeningRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountOpeningRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAccountOpeningRequestsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<AccountOpeningRequest>(1, _omitFieldNames ? '' : 'accountOpeningRequests', $pb.PbFieldType.PM, subBuilder: AccountOpeningRequest.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAccountOpeningRequestsResponse clone() => ListAccountOpeningRequestsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAccountOpeningRequestsResponse copyWith(void Function(ListAccountOpeningRequestsResponse) updates) => super.copyWith((message) => updates(message as ListAccountOpeningRequestsResponse)) as ListAccountOpeningRequestsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAccountOpeningRequestsResponse create() => ListAccountOpeningRequestsResponse._();
  ListAccountOpeningRequestsResponse createEmptyInstance() => create();
  static $pb.PbList<ListAccountOpeningRequestsResponse> createRepeated() => $pb.PbList<ListAccountOpeningRequestsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAccountOpeningRequestsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAccountOpeningRequestsResponse>(create);
  static ListAccountOpeningRequestsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AccountOpeningRequest> get accountOpeningRequests => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// BusinessRegistration
class CreateBusinessRegistrationRequest extends $pb.GeneratedMessage {
  factory CreateBusinessRegistrationRequest({
    BusinessRegistration? businessRegistration,
  }) {
    final $result = create();
    if (businessRegistration != null) {
      $result.businessRegistration = businessRegistration;
    }
    return $result;
  }
  CreateBusinessRegistrationRequest._() : super();
  factory CreateBusinessRegistrationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessRegistrationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessRegistrationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<BusinessRegistration>(1, _omitFieldNames ? '' : 'businessRegistration', subBuilder: BusinessRegistration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessRegistrationRequest clone() => CreateBusinessRegistrationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessRegistrationRequest copyWith(void Function(CreateBusinessRegistrationRequest) updates) => super.copyWith((message) => updates(message as CreateBusinessRegistrationRequest)) as CreateBusinessRegistrationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessRegistrationRequest create() => CreateBusinessRegistrationRequest._();
  CreateBusinessRegistrationRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessRegistrationRequest> createRepeated() => $pb.PbList<CreateBusinessRegistrationRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessRegistrationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessRegistrationRequest>(create);
  static CreateBusinessRegistrationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessRegistration get businessRegistration => $_getN(0);
  @$pb.TagNumber(1)
  set businessRegistration(BusinessRegistration v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessRegistration() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessRegistration() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessRegistration ensureBusinessRegistration() => $_ensure(0);
}

class CreateBusinessRegistrationResponse extends $pb.GeneratedMessage {
  factory CreateBusinessRegistrationResponse({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  CreateBusinessRegistrationResponse._() : super();
  factory CreateBusinessRegistrationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessRegistrationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusinessRegistrationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessRegistrationResponse clone() => CreateBusinessRegistrationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessRegistrationResponse copyWith(void Function(CreateBusinessRegistrationResponse) updates) => super.copyWith((message) => updates(message as CreateBusinessRegistrationResponse)) as CreateBusinessRegistrationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessRegistrationResponse create() => CreateBusinessRegistrationResponse._();
  CreateBusinessRegistrationResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessRegistrationResponse> createRepeated() => $pb.PbList<CreateBusinessRegistrationResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessRegistrationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessRegistrationResponse>(create);
  static CreateBusinessRegistrationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class GetBusinessRegistrationRequest extends $pb.GeneratedMessage {
  factory GetBusinessRegistrationRequest({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  GetBusinessRegistrationRequest._() : super();
  factory GetBusinessRegistrationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessRegistrationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessRegistrationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessRegistrationRequest clone() => GetBusinessRegistrationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessRegistrationRequest copyWith(void Function(GetBusinessRegistrationRequest) updates) => super.copyWith((message) => updates(message as GetBusinessRegistrationRequest)) as GetBusinessRegistrationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessRegistrationRequest create() => GetBusinessRegistrationRequest._();
  GetBusinessRegistrationRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessRegistrationRequest> createRepeated() => $pb.PbList<GetBusinessRegistrationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessRegistrationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessRegistrationRequest>(create);
  static GetBusinessRegistrationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class GetBusinessRegistrationResponse extends $pb.GeneratedMessage {
  factory GetBusinessRegistrationResponse({
    BusinessRegistration? businessRegistration,
  }) {
    final $result = create();
    if (businessRegistration != null) {
      $result.businessRegistration = businessRegistration;
    }
    return $result;
  }
  GetBusinessRegistrationResponse._() : super();
  factory GetBusinessRegistrationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessRegistrationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessRegistrationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<BusinessRegistration>(1, _omitFieldNames ? '' : 'businessRegistration', subBuilder: BusinessRegistration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessRegistrationResponse clone() => GetBusinessRegistrationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessRegistrationResponse copyWith(void Function(GetBusinessRegistrationResponse) updates) => super.copyWith((message) => updates(message as GetBusinessRegistrationResponse)) as GetBusinessRegistrationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessRegistrationResponse create() => GetBusinessRegistrationResponse._();
  GetBusinessRegistrationResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessRegistrationResponse> createRepeated() => $pb.PbList<GetBusinessRegistrationResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessRegistrationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessRegistrationResponse>(create);
  static GetBusinessRegistrationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessRegistration get businessRegistration => $_getN(0);
  @$pb.TagNumber(1)
  set businessRegistration(BusinessRegistration v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessRegistration() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessRegistration() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessRegistration ensureBusinessRegistration() => $_ensure(0);
}

class UpdateBusinessRegistrationRequest extends $pb.GeneratedMessage {
  factory UpdateBusinessRegistrationRequest({
    $core.String? requestId,
    BusinessRegistration? registrationData,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (registrationData != null) {
      $result.registrationData = registrationData;
    }
    return $result;
  }
  UpdateBusinessRegistrationRequest._() : super();
  factory UpdateBusinessRegistrationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessRegistrationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusinessRegistrationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOM<BusinessRegistration>(2, _omitFieldNames ? '' : 'registrationData', subBuilder: BusinessRegistration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessRegistrationRequest clone() => UpdateBusinessRegistrationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessRegistrationRequest copyWith(void Function(UpdateBusinessRegistrationRequest) updates) => super.copyWith((message) => updates(message as UpdateBusinessRegistrationRequest)) as UpdateBusinessRegistrationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRegistrationRequest create() => UpdateBusinessRegistrationRequest._();
  UpdateBusinessRegistrationRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessRegistrationRequest> createRepeated() => $pb.PbList<UpdateBusinessRegistrationRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRegistrationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessRegistrationRequest>(create);
  static UpdateBusinessRegistrationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  BusinessRegistration get registrationData => $_getN(1);
  @$pb.TagNumber(2)
  set registrationData(BusinessRegistration v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRegistrationData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegistrationData() => $_clearField(2);
  @$pb.TagNumber(2)
  BusinessRegistration ensureRegistrationData() => $_ensure(1);
}

class UpdateBusinessRegistrationResponse extends $pb.GeneratedMessage {
  factory UpdateBusinessRegistrationResponse({
    BusinessRegistration? businessRegistration,
  }) {
    final $result = create();
    if (businessRegistration != null) {
      $result.businessRegistration = businessRegistration;
    }
    return $result;
  }
  UpdateBusinessRegistrationResponse._() : super();
  factory UpdateBusinessRegistrationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessRegistrationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusinessRegistrationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<BusinessRegistration>(1, _omitFieldNames ? '' : 'businessRegistration', subBuilder: BusinessRegistration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessRegistrationResponse clone() => UpdateBusinessRegistrationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessRegistrationResponse copyWith(void Function(UpdateBusinessRegistrationResponse) updates) => super.copyWith((message) => updates(message as UpdateBusinessRegistrationResponse)) as UpdateBusinessRegistrationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRegistrationResponse create() => UpdateBusinessRegistrationResponse._();
  UpdateBusinessRegistrationResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessRegistrationResponse> createRepeated() => $pb.PbList<UpdateBusinessRegistrationResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessRegistrationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessRegistrationResponse>(create);
  static UpdateBusinessRegistrationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessRegistration get businessRegistration => $_getN(0);
  @$pb.TagNumber(1)
  set businessRegistration(BusinessRegistration v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessRegistration() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessRegistration() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessRegistration ensureBusinessRegistration() => $_ensure(0);
}

class DeleteBusinessRegistrationRequest extends $pb.GeneratedMessage {
  factory DeleteBusinessRegistrationRequest({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  DeleteBusinessRegistrationRequest._() : super();
  factory DeleteBusinessRegistrationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBusinessRegistrationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBusinessRegistrationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBusinessRegistrationRequest clone() => DeleteBusinessRegistrationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBusinessRegistrationRequest copyWith(void Function(DeleteBusinessRegistrationRequest) updates) => super.copyWith((message) => updates(message as DeleteBusinessRegistrationRequest)) as DeleteBusinessRegistrationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessRegistrationRequest create() => DeleteBusinessRegistrationRequest._();
  DeleteBusinessRegistrationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessRegistrationRequest> createRepeated() => $pb.PbList<DeleteBusinessRegistrationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessRegistrationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBusinessRegistrationRequest>(create);
  static DeleteBusinessRegistrationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class DeleteBusinessRegistrationResponse extends $pb.GeneratedMessage {
  factory DeleteBusinessRegistrationResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteBusinessRegistrationResponse._() : super();
  factory DeleteBusinessRegistrationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBusinessRegistrationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBusinessRegistrationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBusinessRegistrationResponse clone() => DeleteBusinessRegistrationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBusinessRegistrationResponse copyWith(void Function(DeleteBusinessRegistrationResponse) updates) => super.copyWith((message) => updates(message as DeleteBusinessRegistrationResponse)) as DeleteBusinessRegistrationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessRegistrationResponse create() => DeleteBusinessRegistrationResponse._();
  DeleteBusinessRegistrationResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessRegistrationResponse> createRepeated() => $pb.PbList<DeleteBusinessRegistrationResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessRegistrationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBusinessRegistrationResponse>(create);
  static DeleteBusinessRegistrationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListBusinessRegistrationsRequest extends $pb.GeneratedMessage {
  factory ListBusinessRegistrationsRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListBusinessRegistrationsRequest._() : super();
  factory ListBusinessRegistrationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBusinessRegistrationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListBusinessRegistrationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBusinessRegistrationsRequest clone() => ListBusinessRegistrationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBusinessRegistrationsRequest copyWith(void Function(ListBusinessRegistrationsRequest) updates) => super.copyWith((message) => updates(message as ListBusinessRegistrationsRequest)) as ListBusinessRegistrationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBusinessRegistrationsRequest create() => ListBusinessRegistrationsRequest._();
  ListBusinessRegistrationsRequest createEmptyInstance() => create();
  static $pb.PbList<ListBusinessRegistrationsRequest> createRepeated() => $pb.PbList<ListBusinessRegistrationsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessRegistrationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBusinessRegistrationsRequest>(create);
  static ListBusinessRegistrationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListBusinessRegistrationsResponse extends $pb.GeneratedMessage {
  factory ListBusinessRegistrationsResponse({
    $core.Iterable<BusinessRegistration>? businessRegistrations,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (businessRegistrations != null) {
      $result.businessRegistrations.addAll(businessRegistrations);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListBusinessRegistrationsResponse._() : super();
  factory ListBusinessRegistrationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBusinessRegistrationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListBusinessRegistrationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<BusinessRegistration>(1, _omitFieldNames ? '' : 'businessRegistrations', $pb.PbFieldType.PM, subBuilder: BusinessRegistration.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBusinessRegistrationsResponse clone() => ListBusinessRegistrationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBusinessRegistrationsResponse copyWith(void Function(ListBusinessRegistrationsResponse) updates) => super.copyWith((message) => updates(message as ListBusinessRegistrationsResponse)) as ListBusinessRegistrationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBusinessRegistrationsResponse create() => ListBusinessRegistrationsResponse._();
  ListBusinessRegistrationsResponse createEmptyInstance() => create();
  static $pb.PbList<ListBusinessRegistrationsResponse> createRepeated() => $pb.PbList<ListBusinessRegistrationsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessRegistrationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBusinessRegistrationsResponse>(create);
  static ListBusinessRegistrationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BusinessRegistration> get businessRegistrations => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// LendingApplication
class CreateLendingApplicationRequest extends $pb.GeneratedMessage {
  factory CreateLendingApplicationRequest({
    LendingApplication? lendingApplication,
  }) {
    final $result = create();
    if (lendingApplication != null) {
      $result.lendingApplication = lendingApplication;
    }
    return $result;
  }
  CreateLendingApplicationRequest._() : super();
  factory CreateLendingApplicationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLendingApplicationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLendingApplicationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LendingApplication>(1, _omitFieldNames ? '' : 'lendingApplication', subBuilder: LendingApplication.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLendingApplicationRequest clone() => CreateLendingApplicationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLendingApplicationRequest copyWith(void Function(CreateLendingApplicationRequest) updates) => super.copyWith((message) => updates(message as CreateLendingApplicationRequest)) as CreateLendingApplicationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLendingApplicationRequest create() => CreateLendingApplicationRequest._();
  CreateLendingApplicationRequest createEmptyInstance() => create();
  static $pb.PbList<CreateLendingApplicationRequest> createRepeated() => $pb.PbList<CreateLendingApplicationRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateLendingApplicationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLendingApplicationRequest>(create);
  static CreateLendingApplicationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  LendingApplication get lendingApplication => $_getN(0);
  @$pb.TagNumber(1)
  set lendingApplication(LendingApplication v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLendingApplication() => $_has(0);
  @$pb.TagNumber(1)
  void clearLendingApplication() => $_clearField(1);
  @$pb.TagNumber(1)
  LendingApplication ensureLendingApplication() => $_ensure(0);
}

class CreateLendingApplicationResponse extends $pb.GeneratedMessage {
  factory CreateLendingApplicationResponse({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  CreateLendingApplicationResponse._() : super();
  factory CreateLendingApplicationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLendingApplicationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLendingApplicationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLendingApplicationResponse clone() => CreateLendingApplicationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLendingApplicationResponse copyWith(void Function(CreateLendingApplicationResponse) updates) => super.copyWith((message) => updates(message as CreateLendingApplicationResponse)) as CreateLendingApplicationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLendingApplicationResponse create() => CreateLendingApplicationResponse._();
  CreateLendingApplicationResponse createEmptyInstance() => create();
  static $pb.PbList<CreateLendingApplicationResponse> createRepeated() => $pb.PbList<CreateLendingApplicationResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateLendingApplicationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLendingApplicationResponse>(create);
  static CreateLendingApplicationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class GetLendingApplicationRequest extends $pb.GeneratedMessage {
  factory GetLendingApplicationRequest({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  GetLendingApplicationRequest._() : super();
  factory GetLendingApplicationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLendingApplicationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLendingApplicationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLendingApplicationRequest clone() => GetLendingApplicationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLendingApplicationRequest copyWith(void Function(GetLendingApplicationRequest) updates) => super.copyWith((message) => updates(message as GetLendingApplicationRequest)) as GetLendingApplicationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLendingApplicationRequest create() => GetLendingApplicationRequest._();
  GetLendingApplicationRequest createEmptyInstance() => create();
  static $pb.PbList<GetLendingApplicationRequest> createRepeated() => $pb.PbList<GetLendingApplicationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLendingApplicationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLendingApplicationRequest>(create);
  static GetLendingApplicationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class GetLendingApplicationResponse extends $pb.GeneratedMessage {
  factory GetLendingApplicationResponse({
    LendingApplication? lendingApplication,
  }) {
    final $result = create();
    if (lendingApplication != null) {
      $result.lendingApplication = lendingApplication;
    }
    return $result;
  }
  GetLendingApplicationResponse._() : super();
  factory GetLendingApplicationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLendingApplicationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLendingApplicationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LendingApplication>(1, _omitFieldNames ? '' : 'lendingApplication', subBuilder: LendingApplication.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLendingApplicationResponse clone() => GetLendingApplicationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLendingApplicationResponse copyWith(void Function(GetLendingApplicationResponse) updates) => super.copyWith((message) => updates(message as GetLendingApplicationResponse)) as GetLendingApplicationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLendingApplicationResponse create() => GetLendingApplicationResponse._();
  GetLendingApplicationResponse createEmptyInstance() => create();
  static $pb.PbList<GetLendingApplicationResponse> createRepeated() => $pb.PbList<GetLendingApplicationResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLendingApplicationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLendingApplicationResponse>(create);
  static GetLendingApplicationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LendingApplication get lendingApplication => $_getN(0);
  @$pb.TagNumber(1)
  set lendingApplication(LendingApplication v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLendingApplication() => $_has(0);
  @$pb.TagNumber(1)
  void clearLendingApplication() => $_clearField(1);
  @$pb.TagNumber(1)
  LendingApplication ensureLendingApplication() => $_ensure(0);
}

class UpdateLendingApplicationRequest extends $pb.GeneratedMessage {
  factory UpdateLendingApplicationRequest({
    $core.String? requestId,
    LendingApplication? applicationData,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (applicationData != null) {
      $result.applicationData = applicationData;
    }
    return $result;
  }
  UpdateLendingApplicationRequest._() : super();
  factory UpdateLendingApplicationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLendingApplicationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLendingApplicationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOM<LendingApplication>(2, _omitFieldNames ? '' : 'applicationData', subBuilder: LendingApplication.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLendingApplicationRequest clone() => UpdateLendingApplicationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLendingApplicationRequest copyWith(void Function(UpdateLendingApplicationRequest) updates) => super.copyWith((message) => updates(message as UpdateLendingApplicationRequest)) as UpdateLendingApplicationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLendingApplicationRequest create() => UpdateLendingApplicationRequest._();
  UpdateLendingApplicationRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLendingApplicationRequest> createRepeated() => $pb.PbList<UpdateLendingApplicationRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLendingApplicationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLendingApplicationRequest>(create);
  static UpdateLendingApplicationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  LendingApplication get applicationData => $_getN(1);
  @$pb.TagNumber(2)
  set applicationData(LendingApplication v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasApplicationData() => $_has(1);
  @$pb.TagNumber(2)
  void clearApplicationData() => $_clearField(2);
  @$pb.TagNumber(2)
  LendingApplication ensureApplicationData() => $_ensure(1);
}

class UpdateLendingApplicationResponse extends $pb.GeneratedMessage {
  factory UpdateLendingApplicationResponse({
    LendingApplication? lendingApplication,
  }) {
    final $result = create();
    if (lendingApplication != null) {
      $result.lendingApplication = lendingApplication;
    }
    return $result;
  }
  UpdateLendingApplicationResponse._() : super();
  factory UpdateLendingApplicationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLendingApplicationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLendingApplicationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LendingApplication>(1, _omitFieldNames ? '' : 'lendingApplication', subBuilder: LendingApplication.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLendingApplicationResponse clone() => UpdateLendingApplicationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLendingApplicationResponse copyWith(void Function(UpdateLendingApplicationResponse) updates) => super.copyWith((message) => updates(message as UpdateLendingApplicationResponse)) as UpdateLendingApplicationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLendingApplicationResponse create() => UpdateLendingApplicationResponse._();
  UpdateLendingApplicationResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateLendingApplicationResponse> createRepeated() => $pb.PbList<UpdateLendingApplicationResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateLendingApplicationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLendingApplicationResponse>(create);
  static UpdateLendingApplicationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LendingApplication get lendingApplication => $_getN(0);
  @$pb.TagNumber(1)
  set lendingApplication(LendingApplication v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLendingApplication() => $_has(0);
  @$pb.TagNumber(1)
  void clearLendingApplication() => $_clearField(1);
  @$pb.TagNumber(1)
  LendingApplication ensureLendingApplication() => $_ensure(0);
}

class DeleteLendingApplicationRequest extends $pb.GeneratedMessage {
  factory DeleteLendingApplicationRequest({
    $core.String? requestId,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  DeleteLendingApplicationRequest._() : super();
  factory DeleteLendingApplicationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLendingApplicationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLendingApplicationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLendingApplicationRequest clone() => DeleteLendingApplicationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLendingApplicationRequest copyWith(void Function(DeleteLendingApplicationRequest) updates) => super.copyWith((message) => updates(message as DeleteLendingApplicationRequest)) as DeleteLendingApplicationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLendingApplicationRequest create() => DeleteLendingApplicationRequest._();
  DeleteLendingApplicationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteLendingApplicationRequest> createRepeated() => $pb.PbList<DeleteLendingApplicationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteLendingApplicationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLendingApplicationRequest>(create);
  static DeleteLendingApplicationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);
}

class DeleteLendingApplicationResponse extends $pb.GeneratedMessage {
  factory DeleteLendingApplicationResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteLendingApplicationResponse._() : super();
  factory DeleteLendingApplicationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLendingApplicationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLendingApplicationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLendingApplicationResponse clone() => DeleteLendingApplicationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLendingApplicationResponse copyWith(void Function(DeleteLendingApplicationResponse) updates) => super.copyWith((message) => updates(message as DeleteLendingApplicationResponse)) as DeleteLendingApplicationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLendingApplicationResponse create() => DeleteLendingApplicationResponse._();
  DeleteLendingApplicationResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteLendingApplicationResponse> createRepeated() => $pb.PbList<DeleteLendingApplicationResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteLendingApplicationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLendingApplicationResponse>(create);
  static DeleteLendingApplicationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListLendingApplicationsRequest extends $pb.GeneratedMessage {
  factory ListLendingApplicationsRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListLendingApplicationsRequest._() : super();
  factory ListLendingApplicationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLendingApplicationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLendingApplicationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLendingApplicationsRequest clone() => ListLendingApplicationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLendingApplicationsRequest copyWith(void Function(ListLendingApplicationsRequest) updates) => super.copyWith((message) => updates(message as ListLendingApplicationsRequest)) as ListLendingApplicationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLendingApplicationsRequest create() => ListLendingApplicationsRequest._();
  ListLendingApplicationsRequest createEmptyInstance() => create();
  static $pb.PbList<ListLendingApplicationsRequest> createRepeated() => $pb.PbList<ListLendingApplicationsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListLendingApplicationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLendingApplicationsRequest>(create);
  static ListLendingApplicationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListLendingApplicationsResponse extends $pb.GeneratedMessage {
  factory ListLendingApplicationsResponse({
    $core.Iterable<LendingApplication>? lendingApplications,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (lendingApplications != null) {
      $result.lendingApplications.addAll(lendingApplications);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListLendingApplicationsResponse._() : super();
  factory ListLendingApplicationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLendingApplicationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLendingApplicationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<LendingApplication>(1, _omitFieldNames ? '' : 'lendingApplications', $pb.PbFieldType.PM, subBuilder: LendingApplication.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLendingApplicationsResponse clone() => ListLendingApplicationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLendingApplicationsResponse copyWith(void Function(ListLendingApplicationsResponse) updates) => super.copyWith((message) => updates(message as ListLendingApplicationsResponse)) as ListLendingApplicationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLendingApplicationsResponse create() => ListLendingApplicationsResponse._();
  ListLendingApplicationsResponse createEmptyInstance() => create();
  static $pb.PbList<ListLendingApplicationsResponse> createRepeated() => $pb.PbList<ListLendingApplicationsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListLendingApplicationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLendingApplicationsResponse>(create);
  static ListLendingApplicationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LendingApplication> get lendingApplications => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Partner
class CreatePartnerRequest extends $pb.GeneratedMessage {
  factory CreatePartnerRequest({
    Partner? partner,
  }) {
    final $result = create();
    if (partner != null) {
      $result.partner = partner;
    }
    return $result;
  }
  CreatePartnerRequest._() : super();
  factory CreatePartnerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePartnerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePartnerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Partner>(1, _omitFieldNames ? '' : 'partner', subBuilder: Partner.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePartnerRequest clone() => CreatePartnerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePartnerRequest copyWith(void Function(CreatePartnerRequest) updates) => super.copyWith((message) => updates(message as CreatePartnerRequest)) as CreatePartnerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePartnerRequest create() => CreatePartnerRequest._();
  CreatePartnerRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePartnerRequest> createRepeated() => $pb.PbList<CreatePartnerRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePartnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePartnerRequest>(create);
  static CreatePartnerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Partner get partner => $_getN(0);
  @$pb.TagNumber(1)
  set partner(Partner v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartner() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartner() => $_clearField(1);
  @$pb.TagNumber(1)
  Partner ensurePartner() => $_ensure(0);
}

class CreatePartnerResponse extends $pb.GeneratedMessage {
  factory CreatePartnerResponse({
    $core.String? partnerId,
  }) {
    final $result = create();
    if (partnerId != null) {
      $result.partnerId = partnerId;
    }
    return $result;
  }
  CreatePartnerResponse._() : super();
  factory CreatePartnerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePartnerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePartnerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'partnerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePartnerResponse clone() => CreatePartnerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePartnerResponse copyWith(void Function(CreatePartnerResponse) updates) => super.copyWith((message) => updates(message as CreatePartnerResponse)) as CreatePartnerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePartnerResponse create() => CreatePartnerResponse._();
  CreatePartnerResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePartnerResponse> createRepeated() => $pb.PbList<CreatePartnerResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePartnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePartnerResponse>(create);
  static CreatePartnerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get partnerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set partnerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartnerId() => $_clearField(1);
}

class GetPartnerRequest extends $pb.GeneratedMessage {
  factory GetPartnerRequest({
    $core.String? partnerId,
  }) {
    final $result = create();
    if (partnerId != null) {
      $result.partnerId = partnerId;
    }
    return $result;
  }
  GetPartnerRequest._() : super();
  factory GetPartnerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPartnerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPartnerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'partnerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPartnerRequest clone() => GetPartnerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPartnerRequest copyWith(void Function(GetPartnerRequest) updates) => super.copyWith((message) => updates(message as GetPartnerRequest)) as GetPartnerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPartnerRequest create() => GetPartnerRequest._();
  GetPartnerRequest createEmptyInstance() => create();
  static $pb.PbList<GetPartnerRequest> createRepeated() => $pb.PbList<GetPartnerRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPartnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPartnerRequest>(create);
  static GetPartnerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get partnerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set partnerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartnerId() => $_clearField(1);
}

class GetPartnerResponse extends $pb.GeneratedMessage {
  factory GetPartnerResponse({
    Partner? partner,
  }) {
    final $result = create();
    if (partner != null) {
      $result.partner = partner;
    }
    return $result;
  }
  GetPartnerResponse._() : super();
  factory GetPartnerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPartnerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPartnerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Partner>(1, _omitFieldNames ? '' : 'partner', subBuilder: Partner.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPartnerResponse clone() => GetPartnerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPartnerResponse copyWith(void Function(GetPartnerResponse) updates) => super.copyWith((message) => updates(message as GetPartnerResponse)) as GetPartnerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPartnerResponse create() => GetPartnerResponse._();
  GetPartnerResponse createEmptyInstance() => create();
  static $pb.PbList<GetPartnerResponse> createRepeated() => $pb.PbList<GetPartnerResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPartnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPartnerResponse>(create);
  static GetPartnerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Partner get partner => $_getN(0);
  @$pb.TagNumber(1)
  set partner(Partner v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartner() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartner() => $_clearField(1);
  @$pb.TagNumber(1)
  Partner ensurePartner() => $_ensure(0);
}

class UpdatePartnerRequest extends $pb.GeneratedMessage {
  factory UpdatePartnerRequest({
    $core.String? partnerId,
    Partner? partnerData,
  }) {
    final $result = create();
    if (partnerId != null) {
      $result.partnerId = partnerId;
    }
    if (partnerData != null) {
      $result.partnerData = partnerData;
    }
    return $result;
  }
  UpdatePartnerRequest._() : super();
  factory UpdatePartnerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePartnerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePartnerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'partnerId')
    ..aOM<Partner>(2, _omitFieldNames ? '' : 'partnerData', subBuilder: Partner.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePartnerRequest clone() => UpdatePartnerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePartnerRequest copyWith(void Function(UpdatePartnerRequest) updates) => super.copyWith((message) => updates(message as UpdatePartnerRequest)) as UpdatePartnerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePartnerRequest create() => UpdatePartnerRequest._();
  UpdatePartnerRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePartnerRequest> createRepeated() => $pb.PbList<UpdatePartnerRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePartnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePartnerRequest>(create);
  static UpdatePartnerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get partnerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set partnerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartnerId() => $_clearField(1);

  @$pb.TagNumber(2)
  Partner get partnerData => $_getN(1);
  @$pb.TagNumber(2)
  set partnerData(Partner v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPartnerData() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartnerData() => $_clearField(2);
  @$pb.TagNumber(2)
  Partner ensurePartnerData() => $_ensure(1);
}

class UpdatePartnerResponse extends $pb.GeneratedMessage {
  factory UpdatePartnerResponse({
    Partner? partner,
  }) {
    final $result = create();
    if (partner != null) {
      $result.partner = partner;
    }
    return $result;
  }
  UpdatePartnerResponse._() : super();
  factory UpdatePartnerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePartnerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePartnerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Partner>(1, _omitFieldNames ? '' : 'partner', subBuilder: Partner.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePartnerResponse clone() => UpdatePartnerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePartnerResponse copyWith(void Function(UpdatePartnerResponse) updates) => super.copyWith((message) => updates(message as UpdatePartnerResponse)) as UpdatePartnerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePartnerResponse create() => UpdatePartnerResponse._();
  UpdatePartnerResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePartnerResponse> createRepeated() => $pb.PbList<UpdatePartnerResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePartnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePartnerResponse>(create);
  static UpdatePartnerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Partner get partner => $_getN(0);
  @$pb.TagNumber(1)
  set partner(Partner v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartner() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartner() => $_clearField(1);
  @$pb.TagNumber(1)
  Partner ensurePartner() => $_ensure(0);
}

class DeletePartnerRequest extends $pb.GeneratedMessage {
  factory DeletePartnerRequest({
    $core.String? partnerId,
  }) {
    final $result = create();
    if (partnerId != null) {
      $result.partnerId = partnerId;
    }
    return $result;
  }
  DeletePartnerRequest._() : super();
  factory DeletePartnerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePartnerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePartnerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'partnerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePartnerRequest clone() => DeletePartnerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePartnerRequest copyWith(void Function(DeletePartnerRequest) updates) => super.copyWith((message) => updates(message as DeletePartnerRequest)) as DeletePartnerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePartnerRequest create() => DeletePartnerRequest._();
  DeletePartnerRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePartnerRequest> createRepeated() => $pb.PbList<DeletePartnerRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePartnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePartnerRequest>(create);
  static DeletePartnerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get partnerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set partnerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPartnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartnerId() => $_clearField(1);
}

class DeletePartnerResponse extends $pb.GeneratedMessage {
  factory DeletePartnerResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeletePartnerResponse._() : super();
  factory DeletePartnerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePartnerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePartnerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePartnerResponse clone() => DeletePartnerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePartnerResponse copyWith(void Function(DeletePartnerResponse) updates) => super.copyWith((message) => updates(message as DeletePartnerResponse)) as DeletePartnerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePartnerResponse create() => DeletePartnerResponse._();
  DeletePartnerResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePartnerResponse> createRepeated() => $pb.PbList<DeletePartnerResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePartnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePartnerResponse>(create);
  static DeletePartnerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListPartnersRequest extends $pb.GeneratedMessage {
  factory ListPartnersRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListPartnersRequest._() : super();
  factory ListPartnersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPartnersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPartnersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPartnersRequest clone() => ListPartnersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPartnersRequest copyWith(void Function(ListPartnersRequest) updates) => super.copyWith((message) => updates(message as ListPartnersRequest)) as ListPartnersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPartnersRequest create() => ListPartnersRequest._();
  ListPartnersRequest createEmptyInstance() => create();
  static $pb.PbList<ListPartnersRequest> createRepeated() => $pb.PbList<ListPartnersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPartnersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPartnersRequest>(create);
  static ListPartnersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListPartnersResponse extends $pb.GeneratedMessage {
  factory ListPartnersResponse({
    $core.Iterable<Partner>? partners,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (partners != null) {
      $result.partners.addAll(partners);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListPartnersResponse._() : super();
  factory ListPartnersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPartnersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPartnersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Partner>(1, _omitFieldNames ? '' : 'partners', $pb.PbFieldType.PM, subBuilder: Partner.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPartnersResponse clone() => ListPartnersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPartnersResponse copyWith(void Function(ListPartnersResponse) updates) => super.copyWith((message) => updates(message as ListPartnersResponse)) as ListPartnersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPartnersResponse create() => ListPartnersResponse._();
  ListPartnersResponse createEmptyInstance() => create();
  static $pb.PbList<ListPartnersResponse> createRepeated() => $pb.PbList<ListPartnersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPartnersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPartnersResponse>(create);
  static ListPartnersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Partner> get partners => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// LegalIssueType
class CreateLegalIssueTypeRequest extends $pb.GeneratedMessage {
  factory CreateLegalIssueTypeRequest({
    LegalIssueType? legalIssueType,
  }) {
    final $result = create();
    if (legalIssueType != null) {
      $result.legalIssueType = legalIssueType;
    }
    return $result;
  }
  CreateLegalIssueTypeRequest._() : super();
  factory CreateLegalIssueTypeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLegalIssueTypeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLegalIssueTypeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LegalIssueType>(1, _omitFieldNames ? '' : 'legalIssueType', subBuilder: LegalIssueType.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLegalIssueTypeRequest clone() => CreateLegalIssueTypeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLegalIssueTypeRequest copyWith(void Function(CreateLegalIssueTypeRequest) updates) => super.copyWith((message) => updates(message as CreateLegalIssueTypeRequest)) as CreateLegalIssueTypeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLegalIssueTypeRequest create() => CreateLegalIssueTypeRequest._();
  CreateLegalIssueTypeRequest createEmptyInstance() => create();
  static $pb.PbList<CreateLegalIssueTypeRequest> createRepeated() => $pb.PbList<CreateLegalIssueTypeRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateLegalIssueTypeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLegalIssueTypeRequest>(create);
  static CreateLegalIssueTypeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  LegalIssueType get legalIssueType => $_getN(0);
  @$pb.TagNumber(1)
  set legalIssueType(LegalIssueType v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLegalIssueType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegalIssueType() => $_clearField(1);
  @$pb.TagNumber(1)
  LegalIssueType ensureLegalIssueType() => $_ensure(0);
}

class CreateLegalIssueTypeResponse extends $pb.GeneratedMessage {
  factory CreateLegalIssueTypeResponse({
    $core.String? issueTypeId,
  }) {
    final $result = create();
    if (issueTypeId != null) {
      $result.issueTypeId = issueTypeId;
    }
    return $result;
  }
  CreateLegalIssueTypeResponse._() : super();
  factory CreateLegalIssueTypeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLegalIssueTypeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLegalIssueTypeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'issueTypeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLegalIssueTypeResponse clone() => CreateLegalIssueTypeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLegalIssueTypeResponse copyWith(void Function(CreateLegalIssueTypeResponse) updates) => super.copyWith((message) => updates(message as CreateLegalIssueTypeResponse)) as CreateLegalIssueTypeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLegalIssueTypeResponse create() => CreateLegalIssueTypeResponse._();
  CreateLegalIssueTypeResponse createEmptyInstance() => create();
  static $pb.PbList<CreateLegalIssueTypeResponse> createRepeated() => $pb.PbList<CreateLegalIssueTypeResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateLegalIssueTypeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLegalIssueTypeResponse>(create);
  static CreateLegalIssueTypeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issueTypeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set issueTypeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIssueTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssueTypeId() => $_clearField(1);
}

class GetLegalIssueTypeRequest extends $pb.GeneratedMessage {
  factory GetLegalIssueTypeRequest({
    $core.String? issueTypeId,
  }) {
    final $result = create();
    if (issueTypeId != null) {
      $result.issueTypeId = issueTypeId;
    }
    return $result;
  }
  GetLegalIssueTypeRequest._() : super();
  factory GetLegalIssueTypeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLegalIssueTypeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLegalIssueTypeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'issueTypeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLegalIssueTypeRequest clone() => GetLegalIssueTypeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLegalIssueTypeRequest copyWith(void Function(GetLegalIssueTypeRequest) updates) => super.copyWith((message) => updates(message as GetLegalIssueTypeRequest)) as GetLegalIssueTypeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLegalIssueTypeRequest create() => GetLegalIssueTypeRequest._();
  GetLegalIssueTypeRequest createEmptyInstance() => create();
  static $pb.PbList<GetLegalIssueTypeRequest> createRepeated() => $pb.PbList<GetLegalIssueTypeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLegalIssueTypeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLegalIssueTypeRequest>(create);
  static GetLegalIssueTypeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issueTypeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set issueTypeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIssueTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssueTypeId() => $_clearField(1);
}

class GetLegalIssueTypeResponse extends $pb.GeneratedMessage {
  factory GetLegalIssueTypeResponse({
    LegalIssueType? legalIssueType,
  }) {
    final $result = create();
    if (legalIssueType != null) {
      $result.legalIssueType = legalIssueType;
    }
    return $result;
  }
  GetLegalIssueTypeResponse._() : super();
  factory GetLegalIssueTypeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLegalIssueTypeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLegalIssueTypeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LegalIssueType>(1, _omitFieldNames ? '' : 'legalIssueType', subBuilder: LegalIssueType.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLegalIssueTypeResponse clone() => GetLegalIssueTypeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLegalIssueTypeResponse copyWith(void Function(GetLegalIssueTypeResponse) updates) => super.copyWith((message) => updates(message as GetLegalIssueTypeResponse)) as GetLegalIssueTypeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLegalIssueTypeResponse create() => GetLegalIssueTypeResponse._();
  GetLegalIssueTypeResponse createEmptyInstance() => create();
  static $pb.PbList<GetLegalIssueTypeResponse> createRepeated() => $pb.PbList<GetLegalIssueTypeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLegalIssueTypeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLegalIssueTypeResponse>(create);
  static GetLegalIssueTypeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LegalIssueType get legalIssueType => $_getN(0);
  @$pb.TagNumber(1)
  set legalIssueType(LegalIssueType v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLegalIssueType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegalIssueType() => $_clearField(1);
  @$pb.TagNumber(1)
  LegalIssueType ensureLegalIssueType() => $_ensure(0);
}

class UpdateLegalIssueTypeRequest extends $pb.GeneratedMessage {
  factory UpdateLegalIssueTypeRequest({
    $core.String? issueTypeId,
    LegalIssueType? issueTypeData,
  }) {
    final $result = create();
    if (issueTypeId != null) {
      $result.issueTypeId = issueTypeId;
    }
    if (issueTypeData != null) {
      $result.issueTypeData = issueTypeData;
    }
    return $result;
  }
  UpdateLegalIssueTypeRequest._() : super();
  factory UpdateLegalIssueTypeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLegalIssueTypeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLegalIssueTypeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'issueTypeId')
    ..aOM<LegalIssueType>(2, _omitFieldNames ? '' : 'issueTypeData', subBuilder: LegalIssueType.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLegalIssueTypeRequest clone() => UpdateLegalIssueTypeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLegalIssueTypeRequest copyWith(void Function(UpdateLegalIssueTypeRequest) updates) => super.copyWith((message) => updates(message as UpdateLegalIssueTypeRequest)) as UpdateLegalIssueTypeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLegalIssueTypeRequest create() => UpdateLegalIssueTypeRequest._();
  UpdateLegalIssueTypeRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLegalIssueTypeRequest> createRepeated() => $pb.PbList<UpdateLegalIssueTypeRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLegalIssueTypeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLegalIssueTypeRequest>(create);
  static UpdateLegalIssueTypeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issueTypeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set issueTypeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIssueTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssueTypeId() => $_clearField(1);

  @$pb.TagNumber(2)
  LegalIssueType get issueTypeData => $_getN(1);
  @$pb.TagNumber(2)
  set issueTypeData(LegalIssueType v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasIssueTypeData() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssueTypeData() => $_clearField(2);
  @$pb.TagNumber(2)
  LegalIssueType ensureIssueTypeData() => $_ensure(1);
}

class UpdateLegalIssueTypeResponse extends $pb.GeneratedMessage {
  factory UpdateLegalIssueTypeResponse({
    LegalIssueType? legalIssueType,
  }) {
    final $result = create();
    if (legalIssueType != null) {
      $result.legalIssueType = legalIssueType;
    }
    return $result;
  }
  UpdateLegalIssueTypeResponse._() : super();
  factory UpdateLegalIssueTypeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLegalIssueTypeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLegalIssueTypeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<LegalIssueType>(1, _omitFieldNames ? '' : 'legalIssueType', subBuilder: LegalIssueType.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLegalIssueTypeResponse clone() => UpdateLegalIssueTypeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLegalIssueTypeResponse copyWith(void Function(UpdateLegalIssueTypeResponse) updates) => super.copyWith((message) => updates(message as UpdateLegalIssueTypeResponse)) as UpdateLegalIssueTypeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLegalIssueTypeResponse create() => UpdateLegalIssueTypeResponse._();
  UpdateLegalIssueTypeResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateLegalIssueTypeResponse> createRepeated() => $pb.PbList<UpdateLegalIssueTypeResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateLegalIssueTypeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLegalIssueTypeResponse>(create);
  static UpdateLegalIssueTypeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LegalIssueType get legalIssueType => $_getN(0);
  @$pb.TagNumber(1)
  set legalIssueType(LegalIssueType v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLegalIssueType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegalIssueType() => $_clearField(1);
  @$pb.TagNumber(1)
  LegalIssueType ensureLegalIssueType() => $_ensure(0);
}

class DeleteLegalIssueTypeRequest extends $pb.GeneratedMessage {
  factory DeleteLegalIssueTypeRequest({
    $core.String? issueTypeId,
  }) {
    final $result = create();
    if (issueTypeId != null) {
      $result.issueTypeId = issueTypeId;
    }
    return $result;
  }
  DeleteLegalIssueTypeRequest._() : super();
  factory DeleteLegalIssueTypeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLegalIssueTypeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLegalIssueTypeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'issueTypeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLegalIssueTypeRequest clone() => DeleteLegalIssueTypeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLegalIssueTypeRequest copyWith(void Function(DeleteLegalIssueTypeRequest) updates) => super.copyWith((message) => updates(message as DeleteLegalIssueTypeRequest)) as DeleteLegalIssueTypeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLegalIssueTypeRequest create() => DeleteLegalIssueTypeRequest._();
  DeleteLegalIssueTypeRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteLegalIssueTypeRequest> createRepeated() => $pb.PbList<DeleteLegalIssueTypeRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteLegalIssueTypeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLegalIssueTypeRequest>(create);
  static DeleteLegalIssueTypeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issueTypeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set issueTypeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIssueTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssueTypeId() => $_clearField(1);
}

class DeleteLegalIssueTypeResponse extends $pb.GeneratedMessage {
  factory DeleteLegalIssueTypeResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteLegalIssueTypeResponse._() : super();
  factory DeleteLegalIssueTypeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteLegalIssueTypeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteLegalIssueTypeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteLegalIssueTypeResponse clone() => DeleteLegalIssueTypeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteLegalIssueTypeResponse copyWith(void Function(DeleteLegalIssueTypeResponse) updates) => super.copyWith((message) => updates(message as DeleteLegalIssueTypeResponse)) as DeleteLegalIssueTypeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteLegalIssueTypeResponse create() => DeleteLegalIssueTypeResponse._();
  DeleteLegalIssueTypeResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteLegalIssueTypeResponse> createRepeated() => $pb.PbList<DeleteLegalIssueTypeResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteLegalIssueTypeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteLegalIssueTypeResponse>(create);
  static DeleteLegalIssueTypeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListLegalIssueTypesRequest extends $pb.GeneratedMessage {
  factory ListLegalIssueTypesRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListLegalIssueTypesRequest._() : super();
  factory ListLegalIssueTypesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLegalIssueTypesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLegalIssueTypesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLegalIssueTypesRequest clone() => ListLegalIssueTypesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLegalIssueTypesRequest copyWith(void Function(ListLegalIssueTypesRequest) updates) => super.copyWith((message) => updates(message as ListLegalIssueTypesRequest)) as ListLegalIssueTypesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLegalIssueTypesRequest create() => ListLegalIssueTypesRequest._();
  ListLegalIssueTypesRequest createEmptyInstance() => create();
  static $pb.PbList<ListLegalIssueTypesRequest> createRepeated() => $pb.PbList<ListLegalIssueTypesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListLegalIssueTypesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLegalIssueTypesRequest>(create);
  static ListLegalIssueTypesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListLegalIssueTypesResponse extends $pb.GeneratedMessage {
  factory ListLegalIssueTypesResponse({
    $core.Iterable<LegalIssueType>? legalIssueTypes,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (legalIssueTypes != null) {
      $result.legalIssueTypes.addAll(legalIssueTypes);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListLegalIssueTypesResponse._() : super();
  factory ListLegalIssueTypesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListLegalIssueTypesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListLegalIssueTypesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<LegalIssueType>(1, _omitFieldNames ? '' : 'legalIssueTypes', $pb.PbFieldType.PM, subBuilder: LegalIssueType.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListLegalIssueTypesResponse clone() => ListLegalIssueTypesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListLegalIssueTypesResponse copyWith(void Function(ListLegalIssueTypesResponse) updates) => super.copyWith((message) => updates(message as ListLegalIssueTypesResponse)) as ListLegalIssueTypesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListLegalIssueTypesResponse create() => ListLegalIssueTypesResponse._();
  ListLegalIssueTypesResponse createEmptyInstance() => create();
  static $pb.PbList<ListLegalIssueTypesResponse> createRepeated() => $pb.PbList<ListLegalIssueTypesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListLegalIssueTypesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListLegalIssueTypesResponse>(create);
  static ListLegalIssueTypesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LegalIssueType> get legalIssueTypes => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// TrainingCourse
class CreateTrainingCourseRequest extends $pb.GeneratedMessage {
  factory CreateTrainingCourseRequest({
    TrainingCourse? trainingCourse,
  }) {
    final $result = create();
    if (trainingCourse != null) {
      $result.trainingCourse = trainingCourse;
    }
    return $result;
  }
  CreateTrainingCourseRequest._() : super();
  factory CreateTrainingCourseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTrainingCourseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTrainingCourseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TrainingCourse>(1, _omitFieldNames ? '' : 'trainingCourse', subBuilder: TrainingCourse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTrainingCourseRequest clone() => CreateTrainingCourseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTrainingCourseRequest copyWith(void Function(CreateTrainingCourseRequest) updates) => super.copyWith((message) => updates(message as CreateTrainingCourseRequest)) as CreateTrainingCourseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTrainingCourseRequest create() => CreateTrainingCourseRequest._();
  CreateTrainingCourseRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTrainingCourseRequest> createRepeated() => $pb.PbList<CreateTrainingCourseRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTrainingCourseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTrainingCourseRequest>(create);
  static CreateTrainingCourseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TrainingCourse get trainingCourse => $_getN(0);
  @$pb.TagNumber(1)
  set trainingCourse(TrainingCourse v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrainingCourse() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrainingCourse() => $_clearField(1);
  @$pb.TagNumber(1)
  TrainingCourse ensureTrainingCourse() => $_ensure(0);
}

class CreateTrainingCourseResponse extends $pb.GeneratedMessage {
  factory CreateTrainingCourseResponse({
    $core.String? courseId,
  }) {
    final $result = create();
    if (courseId != null) {
      $result.courseId = courseId;
    }
    return $result;
  }
  CreateTrainingCourseResponse._() : super();
  factory CreateTrainingCourseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTrainingCourseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTrainingCourseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'courseId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTrainingCourseResponse clone() => CreateTrainingCourseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTrainingCourseResponse copyWith(void Function(CreateTrainingCourseResponse) updates) => super.copyWith((message) => updates(message as CreateTrainingCourseResponse)) as CreateTrainingCourseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTrainingCourseResponse create() => CreateTrainingCourseResponse._();
  CreateTrainingCourseResponse createEmptyInstance() => create();
  static $pb.PbList<CreateTrainingCourseResponse> createRepeated() => $pb.PbList<CreateTrainingCourseResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateTrainingCourseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTrainingCourseResponse>(create);
  static CreateTrainingCourseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get courseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set courseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCourseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCourseId() => $_clearField(1);
}

class GetTrainingCourseRequest extends $pb.GeneratedMessage {
  factory GetTrainingCourseRequest({
    $core.String? courseId,
  }) {
    final $result = create();
    if (courseId != null) {
      $result.courseId = courseId;
    }
    return $result;
  }
  GetTrainingCourseRequest._() : super();
  factory GetTrainingCourseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrainingCourseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTrainingCourseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'courseId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTrainingCourseRequest clone() => GetTrainingCourseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTrainingCourseRequest copyWith(void Function(GetTrainingCourseRequest) updates) => super.copyWith((message) => updates(message as GetTrainingCourseRequest)) as GetTrainingCourseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTrainingCourseRequest create() => GetTrainingCourseRequest._();
  GetTrainingCourseRequest createEmptyInstance() => create();
  static $pb.PbList<GetTrainingCourseRequest> createRepeated() => $pb.PbList<GetTrainingCourseRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTrainingCourseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrainingCourseRequest>(create);
  static GetTrainingCourseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get courseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set courseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCourseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCourseId() => $_clearField(1);
}

class GetTrainingCourseResponse extends $pb.GeneratedMessage {
  factory GetTrainingCourseResponse({
    TrainingCourse? trainingCourse,
  }) {
    final $result = create();
    if (trainingCourse != null) {
      $result.trainingCourse = trainingCourse;
    }
    return $result;
  }
  GetTrainingCourseResponse._() : super();
  factory GetTrainingCourseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrainingCourseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTrainingCourseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TrainingCourse>(1, _omitFieldNames ? '' : 'trainingCourse', subBuilder: TrainingCourse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTrainingCourseResponse clone() => GetTrainingCourseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTrainingCourseResponse copyWith(void Function(GetTrainingCourseResponse) updates) => super.copyWith((message) => updates(message as GetTrainingCourseResponse)) as GetTrainingCourseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTrainingCourseResponse create() => GetTrainingCourseResponse._();
  GetTrainingCourseResponse createEmptyInstance() => create();
  static $pb.PbList<GetTrainingCourseResponse> createRepeated() => $pb.PbList<GetTrainingCourseResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTrainingCourseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrainingCourseResponse>(create);
  static GetTrainingCourseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TrainingCourse get trainingCourse => $_getN(0);
  @$pb.TagNumber(1)
  set trainingCourse(TrainingCourse v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrainingCourse() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrainingCourse() => $_clearField(1);
  @$pb.TagNumber(1)
  TrainingCourse ensureTrainingCourse() => $_ensure(0);
}

class UpdateTrainingCourseRequest extends $pb.GeneratedMessage {
  factory UpdateTrainingCourseRequest({
    $core.String? courseId,
    TrainingCourse? courseData,
  }) {
    final $result = create();
    if (courseId != null) {
      $result.courseId = courseId;
    }
    if (courseData != null) {
      $result.courseData = courseData;
    }
    return $result;
  }
  UpdateTrainingCourseRequest._() : super();
  factory UpdateTrainingCourseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTrainingCourseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTrainingCourseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'courseId')
    ..aOM<TrainingCourse>(2, _omitFieldNames ? '' : 'courseData', subBuilder: TrainingCourse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTrainingCourseRequest clone() => UpdateTrainingCourseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTrainingCourseRequest copyWith(void Function(UpdateTrainingCourseRequest) updates) => super.copyWith((message) => updates(message as UpdateTrainingCourseRequest)) as UpdateTrainingCourseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTrainingCourseRequest create() => UpdateTrainingCourseRequest._();
  UpdateTrainingCourseRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTrainingCourseRequest> createRepeated() => $pb.PbList<UpdateTrainingCourseRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTrainingCourseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTrainingCourseRequest>(create);
  static UpdateTrainingCourseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get courseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set courseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCourseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCourseId() => $_clearField(1);

  @$pb.TagNumber(2)
  TrainingCourse get courseData => $_getN(1);
  @$pb.TagNumber(2)
  set courseData(TrainingCourse v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCourseData() => $_has(1);
  @$pb.TagNumber(2)
  void clearCourseData() => $_clearField(2);
  @$pb.TagNumber(2)
  TrainingCourse ensureCourseData() => $_ensure(1);
}

class UpdateTrainingCourseResponse extends $pb.GeneratedMessage {
  factory UpdateTrainingCourseResponse({
    TrainingCourse? trainingCourse,
  }) {
    final $result = create();
    if (trainingCourse != null) {
      $result.trainingCourse = trainingCourse;
    }
    return $result;
  }
  UpdateTrainingCourseResponse._() : super();
  factory UpdateTrainingCourseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTrainingCourseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTrainingCourseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<TrainingCourse>(1, _omitFieldNames ? '' : 'trainingCourse', subBuilder: TrainingCourse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTrainingCourseResponse clone() => UpdateTrainingCourseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTrainingCourseResponse copyWith(void Function(UpdateTrainingCourseResponse) updates) => super.copyWith((message) => updates(message as UpdateTrainingCourseResponse)) as UpdateTrainingCourseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTrainingCourseResponse create() => UpdateTrainingCourseResponse._();
  UpdateTrainingCourseResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateTrainingCourseResponse> createRepeated() => $pb.PbList<UpdateTrainingCourseResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateTrainingCourseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTrainingCourseResponse>(create);
  static UpdateTrainingCourseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TrainingCourse get trainingCourse => $_getN(0);
  @$pb.TagNumber(1)
  set trainingCourse(TrainingCourse v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrainingCourse() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrainingCourse() => $_clearField(1);
  @$pb.TagNumber(1)
  TrainingCourse ensureTrainingCourse() => $_ensure(0);
}

class DeleteTrainingCourseRequest extends $pb.GeneratedMessage {
  factory DeleteTrainingCourseRequest({
    $core.String? courseId,
  }) {
    final $result = create();
    if (courseId != null) {
      $result.courseId = courseId;
    }
    return $result;
  }
  DeleteTrainingCourseRequest._() : super();
  factory DeleteTrainingCourseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTrainingCourseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTrainingCourseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'courseId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTrainingCourseRequest clone() => DeleteTrainingCourseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTrainingCourseRequest copyWith(void Function(DeleteTrainingCourseRequest) updates) => super.copyWith((message) => updates(message as DeleteTrainingCourseRequest)) as DeleteTrainingCourseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTrainingCourseRequest create() => DeleteTrainingCourseRequest._();
  DeleteTrainingCourseRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTrainingCourseRequest> createRepeated() => $pb.PbList<DeleteTrainingCourseRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTrainingCourseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTrainingCourseRequest>(create);
  static DeleteTrainingCourseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get courseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set courseId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCourseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCourseId() => $_clearField(1);
}

class DeleteTrainingCourseResponse extends $pb.GeneratedMessage {
  factory DeleteTrainingCourseResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteTrainingCourseResponse._() : super();
  factory DeleteTrainingCourseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTrainingCourseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTrainingCourseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTrainingCourseResponse clone() => DeleteTrainingCourseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTrainingCourseResponse copyWith(void Function(DeleteTrainingCourseResponse) updates) => super.copyWith((message) => updates(message as DeleteTrainingCourseResponse)) as DeleteTrainingCourseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTrainingCourseResponse create() => DeleteTrainingCourseResponse._();
  DeleteTrainingCourseResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTrainingCourseResponse> createRepeated() => $pb.PbList<DeleteTrainingCourseResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTrainingCourseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTrainingCourseResponse>(create);
  static DeleteTrainingCourseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListTrainingCoursesRequest extends $pb.GeneratedMessage {
  factory ListTrainingCoursesRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListTrainingCoursesRequest._() : super();
  factory ListTrainingCoursesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTrainingCoursesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTrainingCoursesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTrainingCoursesRequest clone() => ListTrainingCoursesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTrainingCoursesRequest copyWith(void Function(ListTrainingCoursesRequest) updates) => super.copyWith((message) => updates(message as ListTrainingCoursesRequest)) as ListTrainingCoursesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTrainingCoursesRequest create() => ListTrainingCoursesRequest._();
  ListTrainingCoursesRequest createEmptyInstance() => create();
  static $pb.PbList<ListTrainingCoursesRequest> createRepeated() => $pb.PbList<ListTrainingCoursesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTrainingCoursesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTrainingCoursesRequest>(create);
  static ListTrainingCoursesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListTrainingCoursesResponse extends $pb.GeneratedMessage {
  factory ListTrainingCoursesResponse({
    $core.Iterable<TrainingCourse>? trainingCourses,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (trainingCourses != null) {
      $result.trainingCourses.addAll(trainingCourses);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListTrainingCoursesResponse._() : super();
  factory ListTrainingCoursesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTrainingCoursesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTrainingCoursesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<TrainingCourse>(1, _omitFieldNames ? '' : 'trainingCourses', $pb.PbFieldType.PM, subBuilder: TrainingCourse.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTrainingCoursesResponse clone() => ListTrainingCoursesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTrainingCoursesResponse copyWith(void Function(ListTrainingCoursesResponse) updates) => super.copyWith((message) => updates(message as ListTrainingCoursesResponse)) as ListTrainingCoursesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTrainingCoursesResponse create() => ListTrainingCoursesResponse._();
  ListTrainingCoursesResponse createEmptyInstance() => create();
  static $pb.PbList<ListTrainingCoursesResponse> createRepeated() => $pb.PbList<ListTrainingCoursesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTrainingCoursesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTrainingCoursesResponse>(create);
  static ListTrainingCoursesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TrainingCourse> get trainingCourses => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Bank
class CreateBankRequest extends $pb.GeneratedMessage {
  factory CreateBankRequest({
    Bank? bank,
  }) {
    final $result = create();
    if (bank != null) {
      $result.bank = bank;
    }
    return $result;
  }
  CreateBankRequest._() : super();
  factory CreateBankRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBankRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBankRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Bank>(1, _omitFieldNames ? '' : 'bank', subBuilder: Bank.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBankRequest clone() => CreateBankRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBankRequest copyWith(void Function(CreateBankRequest) updates) => super.copyWith((message) => updates(message as CreateBankRequest)) as CreateBankRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBankRequest create() => CreateBankRequest._();
  CreateBankRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBankRequest> createRepeated() => $pb.PbList<CreateBankRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBankRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBankRequest>(create);
  static CreateBankRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Bank get bank => $_getN(0);
  @$pb.TagNumber(1)
  set bank(Bank v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBank() => $_has(0);
  @$pb.TagNumber(1)
  void clearBank() => $_clearField(1);
  @$pb.TagNumber(1)
  Bank ensureBank() => $_ensure(0);
}

class CreateBankResponse extends $pb.GeneratedMessage {
  factory CreateBankResponse({
    $core.String? bankId,
  }) {
    final $result = create();
    if (bankId != null) {
      $result.bankId = bankId;
    }
    return $result;
  }
  CreateBankResponse._() : super();
  factory CreateBankResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBankResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBankResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bankId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBankResponse clone() => CreateBankResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBankResponse copyWith(void Function(CreateBankResponse) updates) => super.copyWith((message) => updates(message as CreateBankResponse)) as CreateBankResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBankResponse create() => CreateBankResponse._();
  CreateBankResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBankResponse> createRepeated() => $pb.PbList<CreateBankResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBankResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBankResponse>(create);
  static CreateBankResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bankId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bankId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBankId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBankId() => $_clearField(1);
}

class GetBankRequest extends $pb.GeneratedMessage {
  factory GetBankRequest({
    $core.String? bankId,
  }) {
    final $result = create();
    if (bankId != null) {
      $result.bankId = bankId;
    }
    return $result;
  }
  GetBankRequest._() : super();
  factory GetBankRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBankRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBankRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bankId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBankRequest clone() => GetBankRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBankRequest copyWith(void Function(GetBankRequest) updates) => super.copyWith((message) => updates(message as GetBankRequest)) as GetBankRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBankRequest create() => GetBankRequest._();
  GetBankRequest createEmptyInstance() => create();
  static $pb.PbList<GetBankRequest> createRepeated() => $pb.PbList<GetBankRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBankRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBankRequest>(create);
  static GetBankRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bankId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bankId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBankId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBankId() => $_clearField(1);
}

class GetBankResponse extends $pb.GeneratedMessage {
  factory GetBankResponse({
    Bank? bank,
  }) {
    final $result = create();
    if (bank != null) {
      $result.bank = bank;
    }
    return $result;
  }
  GetBankResponse._() : super();
  factory GetBankResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBankResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBankResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Bank>(1, _omitFieldNames ? '' : 'bank', subBuilder: Bank.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBankResponse clone() => GetBankResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBankResponse copyWith(void Function(GetBankResponse) updates) => super.copyWith((message) => updates(message as GetBankResponse)) as GetBankResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBankResponse create() => GetBankResponse._();
  GetBankResponse createEmptyInstance() => create();
  static $pb.PbList<GetBankResponse> createRepeated() => $pb.PbList<GetBankResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBankResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBankResponse>(create);
  static GetBankResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Bank get bank => $_getN(0);
  @$pb.TagNumber(1)
  set bank(Bank v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBank() => $_has(0);
  @$pb.TagNumber(1)
  void clearBank() => $_clearField(1);
  @$pb.TagNumber(1)
  Bank ensureBank() => $_ensure(0);
}

class UpdateBankRequest extends $pb.GeneratedMessage {
  factory UpdateBankRequest({
    $core.String? bankId,
    Bank? bankData,
  }) {
    final $result = create();
    if (bankId != null) {
      $result.bankId = bankId;
    }
    if (bankData != null) {
      $result.bankData = bankData;
    }
    return $result;
  }
  UpdateBankRequest._() : super();
  factory UpdateBankRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBankRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBankRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bankId')
    ..aOM<Bank>(2, _omitFieldNames ? '' : 'bankData', subBuilder: Bank.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBankRequest clone() => UpdateBankRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBankRequest copyWith(void Function(UpdateBankRequest) updates) => super.copyWith((message) => updates(message as UpdateBankRequest)) as UpdateBankRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBankRequest create() => UpdateBankRequest._();
  UpdateBankRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBankRequest> createRepeated() => $pb.PbList<UpdateBankRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBankRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBankRequest>(create);
  static UpdateBankRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bankId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bankId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBankId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBankId() => $_clearField(1);

  @$pb.TagNumber(2)
  Bank get bankData => $_getN(1);
  @$pb.TagNumber(2)
  set bankData(Bank v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBankData() => $_has(1);
  @$pb.TagNumber(2)
  void clearBankData() => $_clearField(2);
  @$pb.TagNumber(2)
  Bank ensureBankData() => $_ensure(1);
}

class UpdateBankResponse extends $pb.GeneratedMessage {
  factory UpdateBankResponse({
    Bank? bank,
  }) {
    final $result = create();
    if (bank != null) {
      $result.bank = bank;
    }
    return $result;
  }
  UpdateBankResponse._() : super();
  factory UpdateBankResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBankResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBankResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Bank>(1, _omitFieldNames ? '' : 'bank', subBuilder: Bank.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBankResponse clone() => UpdateBankResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBankResponse copyWith(void Function(UpdateBankResponse) updates) => super.copyWith((message) => updates(message as UpdateBankResponse)) as UpdateBankResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBankResponse create() => UpdateBankResponse._();
  UpdateBankResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBankResponse> createRepeated() => $pb.PbList<UpdateBankResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBankResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBankResponse>(create);
  static UpdateBankResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Bank get bank => $_getN(0);
  @$pb.TagNumber(1)
  set bank(Bank v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBank() => $_has(0);
  @$pb.TagNumber(1)
  void clearBank() => $_clearField(1);
  @$pb.TagNumber(1)
  Bank ensureBank() => $_ensure(0);
}

class DeleteBankRequest extends $pb.GeneratedMessage {
  factory DeleteBankRequest({
    $core.String? bankId,
  }) {
    final $result = create();
    if (bankId != null) {
      $result.bankId = bankId;
    }
    return $result;
  }
  DeleteBankRequest._() : super();
  factory DeleteBankRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBankRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBankRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bankId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBankRequest clone() => DeleteBankRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBankRequest copyWith(void Function(DeleteBankRequest) updates) => super.copyWith((message) => updates(message as DeleteBankRequest)) as DeleteBankRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBankRequest create() => DeleteBankRequest._();
  DeleteBankRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBankRequest> createRepeated() => $pb.PbList<DeleteBankRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBankRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBankRequest>(create);
  static DeleteBankRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bankId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bankId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBankId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBankId() => $_clearField(1);
}

class DeleteBankResponse extends $pb.GeneratedMessage {
  factory DeleteBankResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteBankResponse._() : super();
  factory DeleteBankResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBankResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteBankResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBankResponse clone() => DeleteBankResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBankResponse copyWith(void Function(DeleteBankResponse) updates) => super.copyWith((message) => updates(message as DeleteBankResponse)) as DeleteBankResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBankResponse create() => DeleteBankResponse._();
  DeleteBankResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteBankResponse> createRepeated() => $pb.PbList<DeleteBankResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteBankResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBankResponse>(create);
  static DeleteBankResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListBanksRequest extends $pb.GeneratedMessage {
  factory ListBanksRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListBanksRequest._() : super();
  factory ListBanksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBanksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListBanksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBanksRequest clone() => ListBanksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBanksRequest copyWith(void Function(ListBanksRequest) updates) => super.copyWith((message) => updates(message as ListBanksRequest)) as ListBanksRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBanksRequest create() => ListBanksRequest._();
  ListBanksRequest createEmptyInstance() => create();
  static $pb.PbList<ListBanksRequest> createRepeated() => $pb.PbList<ListBanksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBanksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBanksRequest>(create);
  static ListBanksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListBanksResponse extends $pb.GeneratedMessage {
  factory ListBanksResponse({
    $core.Iterable<Bank>? banks,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (banks != null) {
      $result.banks.addAll(banks);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListBanksResponse._() : super();
  factory ListBanksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBanksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListBanksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Bank>(1, _omitFieldNames ? '' : 'banks', $pb.PbFieldType.PM, subBuilder: Bank.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBanksResponse clone() => ListBanksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBanksResponse copyWith(void Function(ListBanksResponse) updates) => super.copyWith((message) => updates(message as ListBanksResponse)) as ListBanksResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBanksResponse create() => ListBanksResponse._();
  ListBanksResponse createEmptyInstance() => create();
  static $pb.PbList<ListBanksResponse> createRepeated() => $pb.PbList<ListBanksResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBanksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBanksResponse>(create);
  static ListBanksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Bank> get banks => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Interaction
class CreateInteractionRequest extends $pb.GeneratedMessage {
  factory CreateInteractionRequest({
    Interaction? interaction,
  }) {
    final $result = create();
    if (interaction != null) {
      $result.interaction = interaction;
    }
    return $result;
  }
  CreateInteractionRequest._() : super();
  factory CreateInteractionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateInteractionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateInteractionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Interaction>(1, _omitFieldNames ? '' : 'interaction', subBuilder: Interaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateInteractionRequest clone() => CreateInteractionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateInteractionRequest copyWith(void Function(CreateInteractionRequest) updates) => super.copyWith((message) => updates(message as CreateInteractionRequest)) as CreateInteractionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInteractionRequest create() => CreateInteractionRequest._();
  CreateInteractionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateInteractionRequest> createRepeated() => $pb.PbList<CreateInteractionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateInteractionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateInteractionRequest>(create);
  static CreateInteractionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Interaction get interaction => $_getN(0);
  @$pb.TagNumber(1)
  set interaction(Interaction v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteraction() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteraction() => $_clearField(1);
  @$pb.TagNumber(1)
  Interaction ensureInteraction() => $_ensure(0);
}

class CreateInteractionResponse extends $pb.GeneratedMessage {
  factory CreateInteractionResponse({
    $core.String? interactionId,
  }) {
    final $result = create();
    if (interactionId != null) {
      $result.interactionId = interactionId;
    }
    return $result;
  }
  CreateInteractionResponse._() : super();
  factory CreateInteractionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateInteractionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateInteractionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interactionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateInteractionResponse clone() => CreateInteractionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateInteractionResponse copyWith(void Function(CreateInteractionResponse) updates) => super.copyWith((message) => updates(message as CreateInteractionResponse)) as CreateInteractionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInteractionResponse create() => CreateInteractionResponse._();
  CreateInteractionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateInteractionResponse> createRepeated() => $pb.PbList<CreateInteractionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateInteractionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateInteractionResponse>(create);
  static CreateInteractionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get interactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set interactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteractionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractionId() => $_clearField(1);
}

class GetInteractionRequest extends $pb.GeneratedMessage {
  factory GetInteractionRequest({
    $core.String? interactionId,
  }) {
    final $result = create();
    if (interactionId != null) {
      $result.interactionId = interactionId;
    }
    return $result;
  }
  GetInteractionRequest._() : super();
  factory GetInteractionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInteractionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInteractionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interactionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInteractionRequest clone() => GetInteractionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInteractionRequest copyWith(void Function(GetInteractionRequest) updates) => super.copyWith((message) => updates(message as GetInteractionRequest)) as GetInteractionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInteractionRequest create() => GetInteractionRequest._();
  GetInteractionRequest createEmptyInstance() => create();
  static $pb.PbList<GetInteractionRequest> createRepeated() => $pb.PbList<GetInteractionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetInteractionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInteractionRequest>(create);
  static GetInteractionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get interactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set interactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteractionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractionId() => $_clearField(1);
}

class GetInteractionResponse extends $pb.GeneratedMessage {
  factory GetInteractionResponse({
    Interaction? interaction,
  }) {
    final $result = create();
    if (interaction != null) {
      $result.interaction = interaction;
    }
    return $result;
  }
  GetInteractionResponse._() : super();
  factory GetInteractionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInteractionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInteractionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Interaction>(1, _omitFieldNames ? '' : 'interaction', subBuilder: Interaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInteractionResponse clone() => GetInteractionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInteractionResponse copyWith(void Function(GetInteractionResponse) updates) => super.copyWith((message) => updates(message as GetInteractionResponse)) as GetInteractionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInteractionResponse create() => GetInteractionResponse._();
  GetInteractionResponse createEmptyInstance() => create();
  static $pb.PbList<GetInteractionResponse> createRepeated() => $pb.PbList<GetInteractionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetInteractionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInteractionResponse>(create);
  static GetInteractionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Interaction get interaction => $_getN(0);
  @$pb.TagNumber(1)
  set interaction(Interaction v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteraction() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteraction() => $_clearField(1);
  @$pb.TagNumber(1)
  Interaction ensureInteraction() => $_ensure(0);
}

class UpdateInteractionRequest extends $pb.GeneratedMessage {
  factory UpdateInteractionRequest({
    $core.String? interactionId,
    Interaction? interactionData,
  }) {
    final $result = create();
    if (interactionId != null) {
      $result.interactionId = interactionId;
    }
    if (interactionData != null) {
      $result.interactionData = interactionData;
    }
    return $result;
  }
  UpdateInteractionRequest._() : super();
  factory UpdateInteractionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInteractionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInteractionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interactionId')
    ..aOM<Interaction>(2, _omitFieldNames ? '' : 'interactionData', subBuilder: Interaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInteractionRequest clone() => UpdateInteractionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInteractionRequest copyWith(void Function(UpdateInteractionRequest) updates) => super.copyWith((message) => updates(message as UpdateInteractionRequest)) as UpdateInteractionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInteractionRequest create() => UpdateInteractionRequest._();
  UpdateInteractionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateInteractionRequest> createRepeated() => $pb.PbList<UpdateInteractionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateInteractionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInteractionRequest>(create);
  static UpdateInteractionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get interactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set interactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteractionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractionId() => $_clearField(1);

  @$pb.TagNumber(2)
  Interaction get interactionData => $_getN(1);
  @$pb.TagNumber(2)
  set interactionData(Interaction v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInteractionData() => $_has(1);
  @$pb.TagNumber(2)
  void clearInteractionData() => $_clearField(2);
  @$pb.TagNumber(2)
  Interaction ensureInteractionData() => $_ensure(1);
}

class UpdateInteractionResponse extends $pb.GeneratedMessage {
  factory UpdateInteractionResponse({
    Interaction? interaction,
  }) {
    final $result = create();
    if (interaction != null) {
      $result.interaction = interaction;
    }
    return $result;
  }
  UpdateInteractionResponse._() : super();
  factory UpdateInteractionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInteractionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInteractionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Interaction>(1, _omitFieldNames ? '' : 'interaction', subBuilder: Interaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInteractionResponse clone() => UpdateInteractionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInteractionResponse copyWith(void Function(UpdateInteractionResponse) updates) => super.copyWith((message) => updates(message as UpdateInteractionResponse)) as UpdateInteractionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInteractionResponse create() => UpdateInteractionResponse._();
  UpdateInteractionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateInteractionResponse> createRepeated() => $pb.PbList<UpdateInteractionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateInteractionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInteractionResponse>(create);
  static UpdateInteractionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Interaction get interaction => $_getN(0);
  @$pb.TagNumber(1)
  set interaction(Interaction v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteraction() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteraction() => $_clearField(1);
  @$pb.TagNumber(1)
  Interaction ensureInteraction() => $_ensure(0);
}

class DeleteInteractionRequest extends $pb.GeneratedMessage {
  factory DeleteInteractionRequest({
    $core.String? interactionId,
  }) {
    final $result = create();
    if (interactionId != null) {
      $result.interactionId = interactionId;
    }
    return $result;
  }
  DeleteInteractionRequest._() : super();
  factory DeleteInteractionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteInteractionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteInteractionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interactionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteInteractionRequest clone() => DeleteInteractionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteInteractionRequest copyWith(void Function(DeleteInteractionRequest) updates) => super.copyWith((message) => updates(message as DeleteInteractionRequest)) as DeleteInteractionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteInteractionRequest create() => DeleteInteractionRequest._();
  DeleteInteractionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteInteractionRequest> createRepeated() => $pb.PbList<DeleteInteractionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteInteractionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteInteractionRequest>(create);
  static DeleteInteractionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get interactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set interactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInteractionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInteractionId() => $_clearField(1);
}

class DeleteInteractionResponse extends $pb.GeneratedMessage {
  factory DeleteInteractionResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeleteInteractionResponse._() : super();
  factory DeleteInteractionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteInteractionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteInteractionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteInteractionResponse clone() => DeleteInteractionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteInteractionResponse copyWith(void Function(DeleteInteractionResponse) updates) => super.copyWith((message) => updates(message as DeleteInteractionResponse)) as DeleteInteractionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteInteractionResponse create() => DeleteInteractionResponse._();
  DeleteInteractionResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteInteractionResponse> createRepeated() => $pb.PbList<DeleteInteractionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteInteractionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteInteractionResponse>(create);
  static DeleteInteractionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListInteractionsRequest extends $pb.GeneratedMessage {
  factory ListInteractionsRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListInteractionsRequest._() : super();
  factory ListInteractionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInteractionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInteractionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListInteractionsRequest clone() => ListInteractionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListInteractionsRequest copyWith(void Function(ListInteractionsRequest) updates) => super.copyWith((message) => updates(message as ListInteractionsRequest)) as ListInteractionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInteractionsRequest create() => ListInteractionsRequest._();
  ListInteractionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListInteractionsRequest> createRepeated() => $pb.PbList<ListInteractionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListInteractionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListInteractionsRequest>(create);
  static ListInteractionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListInteractionsResponse extends $pb.GeneratedMessage {
  factory ListInteractionsResponse({
    $core.Iterable<Interaction>? interactions,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (interactions != null) {
      $result.interactions.addAll(interactions);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListInteractionsResponse._() : super();
  factory ListInteractionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInteractionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInteractionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Interaction>(1, _omitFieldNames ? '' : 'interactions', $pb.PbFieldType.PM, subBuilder: Interaction.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListInteractionsResponse clone() => ListInteractionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListInteractionsResponse copyWith(void Function(ListInteractionsResponse) updates) => super.copyWith((message) => updates(message as ListInteractionsResponse)) as ListInteractionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInteractionsResponse create() => ListInteractionsResponse._();
  ListInteractionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListInteractionsResponse> createRepeated() => $pb.PbList<ListInteractionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListInteractionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListInteractionsResponse>(create);
  static ListInteractionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Interaction> get interactions => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Payment
class CreatePaymentRequest extends $pb.GeneratedMessage {
  factory CreatePaymentRequest({
    Payment? payment,
  }) {
    final $result = create();
    if (payment != null) {
      $result.payment = payment;
    }
    return $result;
  }
  CreatePaymentRequest._() : super();
  factory CreatePaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Payment>(1, _omitFieldNames ? '' : 'payment', subBuilder: Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePaymentRequest clone() => CreatePaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePaymentRequest copyWith(void Function(CreatePaymentRequest) updates) => super.copyWith((message) => updates(message as CreatePaymentRequest)) as CreatePaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePaymentRequest create() => CreatePaymentRequest._();
  CreatePaymentRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePaymentRequest> createRepeated() => $pb.PbList<CreatePaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePaymentRequest>(create);
  static CreatePaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment(Payment v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => $_clearField(1);
  @$pb.TagNumber(1)
  Payment ensurePayment() => $_ensure(0);
}

class CreatePaymentResponse extends $pb.GeneratedMessage {
  factory CreatePaymentResponse({
    $core.String? paymentId,
  }) {
    final $result = create();
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    return $result;
  }
  CreatePaymentResponse._() : super();
  factory CreatePaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'paymentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePaymentResponse clone() => CreatePaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePaymentResponse copyWith(void Function(CreatePaymentResponse) updates) => super.copyWith((message) => updates(message as CreatePaymentResponse)) as CreatePaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePaymentResponse create() => CreatePaymentResponse._();
  CreatePaymentResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePaymentResponse> createRepeated() => $pb.PbList<CreatePaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePaymentResponse>(create);
  static CreatePaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentId() => $_clearField(1);
}

class GetPaymentRequest extends $pb.GeneratedMessage {
  factory GetPaymentRequest({
    $core.String? paymentId,
  }) {
    final $result = create();
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    return $result;
  }
  GetPaymentRequest._() : super();
  factory GetPaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'paymentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPaymentRequest clone() => GetPaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPaymentRequest copyWith(void Function(GetPaymentRequest) updates) => super.copyWith((message) => updates(message as GetPaymentRequest)) as GetPaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest create() => GetPaymentRequest._();
  GetPaymentRequest createEmptyInstance() => create();
  static $pb.PbList<GetPaymentRequest> createRepeated() => $pb.PbList<GetPaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPaymentRequest>(create);
  static GetPaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentId() => $_clearField(1);
}

class GetPaymentResponse extends $pb.GeneratedMessage {
  factory GetPaymentResponse({
    Payment? payment,
  }) {
    final $result = create();
    if (payment != null) {
      $result.payment = payment;
    }
    return $result;
  }
  GetPaymentResponse._() : super();
  factory GetPaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Payment>(1, _omitFieldNames ? '' : 'payment', subBuilder: Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPaymentResponse clone() => GetPaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPaymentResponse copyWith(void Function(GetPaymentResponse) updates) => super.copyWith((message) => updates(message as GetPaymentResponse)) as GetPaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse create() => GetPaymentResponse._();
  GetPaymentResponse createEmptyInstance() => create();
  static $pb.PbList<GetPaymentResponse> createRepeated() => $pb.PbList<GetPaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPaymentResponse>(create);
  static GetPaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment(Payment v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => $_clearField(1);
  @$pb.TagNumber(1)
  Payment ensurePayment() => $_ensure(0);
}

class UpdatePaymentRequest extends $pb.GeneratedMessage {
  factory UpdatePaymentRequest({
    $core.String? paymentId,
    Payment? paymentData,
  }) {
    final $result = create();
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    if (paymentData != null) {
      $result.paymentData = paymentData;
    }
    return $result;
  }
  UpdatePaymentRequest._() : super();
  factory UpdatePaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'paymentId')
    ..aOM<Payment>(2, _omitFieldNames ? '' : 'paymentData', subBuilder: Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePaymentRequest clone() => UpdatePaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePaymentRequest copyWith(void Function(UpdatePaymentRequest) updates) => super.copyWith((message) => updates(message as UpdatePaymentRequest)) as UpdatePaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePaymentRequest create() => UpdatePaymentRequest._();
  UpdatePaymentRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePaymentRequest> createRepeated() => $pb.PbList<UpdatePaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePaymentRequest>(create);
  static UpdatePaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentId() => $_clearField(1);

  @$pb.TagNumber(2)
  Payment get paymentData => $_getN(1);
  @$pb.TagNumber(2)
  set paymentData(Payment v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaymentData() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentData() => $_clearField(2);
  @$pb.TagNumber(2)
  Payment ensurePaymentData() => $_ensure(1);
}

class UpdatePaymentResponse extends $pb.GeneratedMessage {
  factory UpdatePaymentResponse({
    Payment? payment,
  }) {
    final $result = create();
    if (payment != null) {
      $result.payment = payment;
    }
    return $result;
  }
  UpdatePaymentResponse._() : super();
  factory UpdatePaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<Payment>(1, _omitFieldNames ? '' : 'payment', subBuilder: Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePaymentResponse clone() => UpdatePaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePaymentResponse copyWith(void Function(UpdatePaymentResponse) updates) => super.copyWith((message) => updates(message as UpdatePaymentResponse)) as UpdatePaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePaymentResponse create() => UpdatePaymentResponse._();
  UpdatePaymentResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePaymentResponse> createRepeated() => $pb.PbList<UpdatePaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePaymentResponse>(create);
  static UpdatePaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment(Payment v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => $_clearField(1);
  @$pb.TagNumber(1)
  Payment ensurePayment() => $_ensure(0);
}

class DeletePaymentRequest extends $pb.GeneratedMessage {
  factory DeletePaymentRequest({
    $core.String? paymentId,
  }) {
    final $result = create();
    if (paymentId != null) {
      $result.paymentId = paymentId;
    }
    return $result;
  }
  DeletePaymentRequest._() : super();
  factory DeletePaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'paymentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePaymentRequest clone() => DeletePaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePaymentRequest copyWith(void Function(DeletePaymentRequest) updates) => super.copyWith((message) => updates(message as DeletePaymentRequest)) as DeletePaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePaymentRequest create() => DeletePaymentRequest._();
  DeletePaymentRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePaymentRequest> createRepeated() => $pb.PbList<DeletePaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePaymentRequest>(create);
  static DeletePaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentId() => $_clearField(1);
}

class DeletePaymentResponse extends $pb.GeneratedMessage {
  factory DeletePaymentResponse({
    $3.Empty? response,
  }) {
    final $result = create();
    if (response != null) {
      $result.response = response;
    }
    return $result;
  }
  DeletePaymentResponse._() : super();
  factory DeletePaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'response', subBuilder: $3.Empty.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePaymentResponse clone() => DeletePaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePaymentResponse copyWith(void Function(DeletePaymentResponse) updates) => super.copyWith((message) => updates(message as DeletePaymentResponse)) as DeletePaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePaymentResponse create() => DeletePaymentResponse._();
  DeletePaymentResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePaymentResponse> createRepeated() => $pb.PbList<DeletePaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePaymentResponse>(create);
  static DeletePaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Empty get response => $_getN(0);
  @$pb.TagNumber(1)
  set response($3.Empty v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponse() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureResponse() => $_ensure(0);
}

class ListPaymentsRequest extends $pb.GeneratedMessage {
  factory ListPaymentsRequest({
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageToken != null) {
      $result.pageToken = pageToken;
    }
    return $result;
  }
  ListPaymentsRequest._() : super();
  factory ListPaymentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPaymentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPaymentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPaymentsRequest clone() => ListPaymentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPaymentsRequest copyWith(void Function(ListPaymentsRequest) updates) => super.copyWith((message) => updates(message as ListPaymentsRequest)) as ListPaymentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPaymentsRequest create() => ListPaymentsRequest._();
  ListPaymentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListPaymentsRequest> createRepeated() => $pb.PbList<ListPaymentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPaymentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPaymentsRequest>(create);
  static ListPaymentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageToken() => $_clearField(2);
}

class ListPaymentsResponse extends $pb.GeneratedMessage {
  factory ListPaymentsResponse({
    $core.Iterable<Payment>? payments,
    $core.String? nextPageToken,
  }) {
    final $result = create();
    if (payments != null) {
      $result.payments.addAll(payments);
    }
    if (nextPageToken != null) {
      $result.nextPageToken = nextPageToken;
    }
    return $result;
  }
  ListPaymentsResponse._() : super();
  factory ListPaymentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPaymentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPaymentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Payment>(1, _omitFieldNames ? '' : 'payments', $pb.PbFieldType.PM, subBuilder: Payment.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPaymentsResponse clone() => ListPaymentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPaymentsResponse copyWith(void Function(ListPaymentsResponse) updates) => super.copyWith((message) => updates(message as ListPaymentsResponse)) as ListPaymentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPaymentsResponse create() => ListPaymentsResponse._();
  ListPaymentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListPaymentsResponse> createRepeated() => $pb.PbList<ListPaymentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPaymentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPaymentsResponse>(create);
  static ListPaymentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Payment> get payments => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

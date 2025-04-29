//
//  Generated code. Do not modify.
//  source: crm.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'crm.pb.dart' as $0;

export 'crm.pb.dart';

@$pb.GrpcServiceName('proto.CrmService')
class CrmServiceClient extends $grpc.Client {
  static final _$createClient = $grpc.ClientMethod<$0.CreateClientRequest, $0.CreateClientResponse>(
      '/proto.CrmService/CreateClient',
      ($0.CreateClientRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateClientResponse.fromBuffer(value));
  static final _$getClient = $grpc.ClientMethod<$0.GetClientRequest, $0.GetClientResponse>(
      '/proto.CrmService/GetClient',
      ($0.GetClientRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetClientResponse.fromBuffer(value));
  static final _$updateClient = $grpc.ClientMethod<$0.UpdateClientRequest, $0.UpdateClientResponse>(
      '/proto.CrmService/UpdateClient',
      ($0.UpdateClientRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateClientResponse.fromBuffer(value));
  static final _$deleteClient = $grpc.ClientMethod<$0.DeleteClientRequest, $0.DeleteClientResponse>(
      '/proto.CrmService/DeleteClient',
      ($0.DeleteClientRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteClientResponse.fromBuffer(value));
  static final _$listClients = $grpc.ClientMethod<$0.ListClientsRequest, $0.ListClientsResponse>(
      '/proto.CrmService/ListClients',
      ($0.ListClientsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListClientsResponse.fromBuffer(value));
  static final _$createEmployee = $grpc.ClientMethod<$0.CreateEmployeeRequest, $0.CreateEmployeeResponse>(
      '/proto.CrmService/CreateEmployee',
      ($0.CreateEmployeeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateEmployeeResponse.fromBuffer(value));
  static final _$getEmployee = $grpc.ClientMethod<$0.GetEmployeeRequest, $0.GetEmployeeResponse>(
      '/proto.CrmService/GetEmployee',
      ($0.GetEmployeeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetEmployeeResponse.fromBuffer(value));
  static final _$updateEmployee = $grpc.ClientMethod<$0.UpdateEmployeeRequest, $0.UpdateEmployeeResponse>(
      '/proto.CrmService/UpdateEmployee',
      ($0.UpdateEmployeeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateEmployeeResponse.fromBuffer(value));
  static final _$deleteEmployee = $grpc.ClientMethod<$0.DeleteEmployeeRequest, $0.DeleteEmployeeResponse>(
      '/proto.CrmService/DeleteEmployee',
      ($0.DeleteEmployeeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteEmployeeResponse.fromBuffer(value));
  static final _$listEmployees = $grpc.ClientMethod<$0.ListEmployeesRequest, $0.ListEmployeesResponse>(
      '/proto.CrmService/ListEmployees',
      ($0.ListEmployeesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListEmployeesResponse.fromBuffer(value));
  static final _$createUser = $grpc.ClientMethod<$0.CreateUserRequest, $0.CreateUserResponse>(
      '/proto.CrmService/CreateUser',
      ($0.CreateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateUserResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.GetUserResponse>(
      '/proto.CrmService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserResponse.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UpdateUserRequest, $0.UpdateUserResponse>(
      '/proto.CrmService/UpdateUser',
      ($0.UpdateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateUserResponse.fromBuffer(value));
  static final _$deleteUser = $grpc.ClientMethod<$0.DeleteUserRequest, $0.DeleteUserResponse>(
      '/proto.CrmService/DeleteUser',
      ($0.DeleteUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteUserResponse.fromBuffer(value));
  static final _$listUsers = $grpc.ClientMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
      '/proto.CrmService/ListUsers',
      ($0.ListUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListUsersResponse.fromBuffer(value));
  static final _$createOffice = $grpc.ClientMethod<$0.CreateOfficeRequest, $0.CreateOfficeResponse>(
      '/proto.CrmService/CreateOffice',
      ($0.CreateOfficeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateOfficeResponse.fromBuffer(value));
  static final _$getOffice = $grpc.ClientMethod<$0.GetOfficeRequest, $0.GetOfficeResponse>(
      '/proto.CrmService/GetOffice',
      ($0.GetOfficeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetOfficeResponse.fromBuffer(value));
  static final _$updateOffice = $grpc.ClientMethod<$0.UpdateOfficeRequest, $0.UpdateOfficeResponse>(
      '/proto.CrmService/UpdateOffice',
      ($0.UpdateOfficeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateOfficeResponse.fromBuffer(value));
  static final _$deleteOffice = $grpc.ClientMethod<$0.DeleteOfficeRequest, $0.DeleteOfficeResponse>(
      '/proto.CrmService/DeleteOffice',
      ($0.DeleteOfficeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteOfficeResponse.fromBuffer(value));
  static final _$listOffices = $grpc.ClientMethod<$0.ListOfficesRequest, $0.ListOfficesResponse>(
      '/proto.CrmService/ListOffices',
      ($0.ListOfficesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListOfficesResponse.fromBuffer(value));
  static final _$createLegalCase = $grpc.ClientMethod<$0.CreateLegalCaseRequest, $0.CreateLegalCaseResponse>(
      '/proto.CrmService/CreateLegalCase',
      ($0.CreateLegalCaseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateLegalCaseResponse.fromBuffer(value));
  static final _$getLegalCase = $grpc.ClientMethod<$0.GetLegalCaseRequest, $0.GetLegalCaseResponse>(
      '/proto.CrmService/GetLegalCase',
      ($0.GetLegalCaseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetLegalCaseResponse.fromBuffer(value));
  static final _$updateLegalCase = $grpc.ClientMethod<$0.UpdateLegalCaseRequest, $0.UpdateLegalCaseResponse>(
      '/proto.CrmService/UpdateLegalCase',
      ($0.UpdateLegalCaseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateLegalCaseResponse.fromBuffer(value));
  static final _$deleteLegalCase = $grpc.ClientMethod<$0.DeleteLegalCaseRequest, $0.DeleteLegalCaseResponse>(
      '/proto.CrmService/DeleteLegalCase',
      ($0.DeleteLegalCaseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteLegalCaseResponse.fromBuffer(value));
  static final _$listLegalCases = $grpc.ClientMethod<$0.ListLegalCasesRequest, $0.ListLegalCasesResponse>(
      '/proto.CrmService/ListLegalCases',
      ($0.ListLegalCasesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListLegalCasesResponse.fromBuffer(value));
  static final _$createTranslationOrder = $grpc.ClientMethod<$0.CreateTranslationOrderRequest, $0.CreateTranslationOrderResponse>(
      '/proto.CrmService/CreateTranslationOrder',
      ($0.CreateTranslationOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateTranslationOrderResponse.fromBuffer(value));
  static final _$getTranslationOrder = $grpc.ClientMethod<$0.GetTranslationOrderRequest, $0.GetTranslationOrderResponse>(
      '/proto.CrmService/GetTranslationOrder',
      ($0.GetTranslationOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTranslationOrderResponse.fromBuffer(value));
  static final _$updateTranslationOrder = $grpc.ClientMethod<$0.UpdateTranslationOrderRequest, $0.UpdateTranslationOrderResponse>(
      '/proto.CrmService/UpdateTranslationOrder',
      ($0.UpdateTranslationOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateTranslationOrderResponse.fromBuffer(value));
  static final _$deleteTranslationOrder = $grpc.ClientMethod<$0.DeleteTranslationOrderRequest, $0.DeleteTranslationOrderResponse>(
      '/proto.CrmService/DeleteTranslationOrder',
      ($0.DeleteTranslationOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteTranslationOrderResponse.fromBuffer(value));
  static final _$listTranslationOrders = $grpc.ClientMethod<$0.ListTranslationOrdersRequest, $0.ListTranslationOrdersResponse>(
      '/proto.CrmService/ListTranslationOrders',
      ($0.ListTranslationOrdersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListTranslationOrdersResponse.fromBuffer(value));
  static final _$createInsurancePolicy = $grpc.ClientMethod<$0.CreateInsurancePolicyRequest, $0.CreateInsurancePolicyResponse>(
      '/proto.CrmService/CreateInsurancePolicy',
      ($0.CreateInsurancePolicyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateInsurancePolicyResponse.fromBuffer(value));
  static final _$getInsurancePolicy = $grpc.ClientMethod<$0.GetInsurancePolicyRequest, $0.GetInsurancePolicyResponse>(
      '/proto.CrmService/GetInsurancePolicy',
      ($0.GetInsurancePolicyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetInsurancePolicyResponse.fromBuffer(value));
  static final _$updateInsurancePolicy = $grpc.ClientMethod<$0.UpdateInsurancePolicyRequest, $0.UpdateInsurancePolicyResponse>(
      '/proto.CrmService/UpdateInsurancePolicy',
      ($0.UpdateInsurancePolicyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateInsurancePolicyResponse.fromBuffer(value));
  static final _$deleteInsurancePolicy = $grpc.ClientMethod<$0.DeleteInsurancePolicyRequest, $0.DeleteInsurancePolicyResponse>(
      '/proto.CrmService/DeleteInsurancePolicy',
      ($0.DeleteInsurancePolicyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteInsurancePolicyResponse.fromBuffer(value));
  static final _$listInsurancePolicies = $grpc.ClientMethod<$0.ListInsurancePoliciesRequest, $0.ListInsurancePoliciesResponse>(
      '/proto.CrmService/ListInsurancePolicies',
      ($0.ListInsurancePoliciesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListInsurancePoliciesResponse.fromBuffer(value));
  static final _$createTrainingEnrollment = $grpc.ClientMethod<$0.CreateTrainingEnrollmentRequest, $0.CreateTrainingEnrollmentResponse>(
      '/proto.CrmService/CreateTrainingEnrollment',
      ($0.CreateTrainingEnrollmentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateTrainingEnrollmentResponse.fromBuffer(value));
  static final _$getTrainingEnrollment = $grpc.ClientMethod<$0.GetTrainingEnrollmentRequest, $0.GetTrainingEnrollmentResponse>(
      '/proto.CrmService/GetTrainingEnrollment',
      ($0.GetTrainingEnrollmentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTrainingEnrollmentResponse.fromBuffer(value));
  static final _$updateTrainingEnrollment = $grpc.ClientMethod<$0.UpdateTrainingEnrollmentRequest, $0.UpdateTrainingEnrollmentResponse>(
      '/proto.CrmService/UpdateTrainingEnrollment',
      ($0.UpdateTrainingEnrollmentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateTrainingEnrollmentResponse.fromBuffer(value));
  static final _$deleteTrainingEnrollment = $grpc.ClientMethod<$0.DeleteTrainingEnrollmentRequest, $0.DeleteTrainingEnrollmentResponse>(
      '/proto.CrmService/DeleteTrainingEnrollment',
      ($0.DeleteTrainingEnrollmentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteTrainingEnrollmentResponse.fromBuffer(value));
  static final _$listTrainingEnrollments = $grpc.ClientMethod<$0.ListTrainingEnrollmentsRequest, $0.ListTrainingEnrollmentsResponse>(
      '/proto.CrmService/ListTrainingEnrollments',
      ($0.ListTrainingEnrollmentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListTrainingEnrollmentsResponse.fromBuffer(value));
  static final _$createAccountOpeningRequest = $grpc.ClientMethod<$0.CreateAccountOpeningRequestRequest, $0.CreateAccountOpeningRequestResponse>(
      '/proto.CrmService/CreateAccountOpeningRequest',
      ($0.CreateAccountOpeningRequestRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateAccountOpeningRequestResponse.fromBuffer(value));
  static final _$getAccountOpeningRequest = $grpc.ClientMethod<$0.GetAccountOpeningRequestRequest, $0.GetAccountOpeningRequestResponse>(
      '/proto.CrmService/GetAccountOpeningRequest',
      ($0.GetAccountOpeningRequestRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAccountOpeningRequestResponse.fromBuffer(value));
  static final _$updateAccountOpeningRequest = $grpc.ClientMethod<$0.UpdateAccountOpeningRequestRequest, $0.UpdateAccountOpeningRequestResponse>(
      '/proto.CrmService/UpdateAccountOpeningRequest',
      ($0.UpdateAccountOpeningRequestRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateAccountOpeningRequestResponse.fromBuffer(value));
  static final _$deleteAccountOpeningRequest = $grpc.ClientMethod<$0.DeleteAccountOpeningRequestRequest, $0.DeleteAccountOpeningRequestResponse>(
      '/proto.CrmService/DeleteAccountOpeningRequest',
      ($0.DeleteAccountOpeningRequestRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteAccountOpeningRequestResponse.fromBuffer(value));
  static final _$listAccountOpeningRequests = $grpc.ClientMethod<$0.ListAccountOpeningRequestsRequest, $0.ListAccountOpeningRequestsResponse>(
      '/proto.CrmService/ListAccountOpeningRequests',
      ($0.ListAccountOpeningRequestsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListAccountOpeningRequestsResponse.fromBuffer(value));
  static final _$createBusinessRegistration = $grpc.ClientMethod<$0.CreateBusinessRegistrationRequest, $0.CreateBusinessRegistrationResponse>(
      '/proto.CrmService/CreateBusinessRegistration',
      ($0.CreateBusinessRegistrationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateBusinessRegistrationResponse.fromBuffer(value));
  static final _$getBusinessRegistration = $grpc.ClientMethod<$0.GetBusinessRegistrationRequest, $0.GetBusinessRegistrationResponse>(
      '/proto.CrmService/GetBusinessRegistration',
      ($0.GetBusinessRegistrationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBusinessRegistrationResponse.fromBuffer(value));
  static final _$updateBusinessRegistration = $grpc.ClientMethod<$0.UpdateBusinessRegistrationRequest, $0.UpdateBusinessRegistrationResponse>(
      '/proto.CrmService/UpdateBusinessRegistration',
      ($0.UpdateBusinessRegistrationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateBusinessRegistrationResponse.fromBuffer(value));
  static final _$deleteBusinessRegistration = $grpc.ClientMethod<$0.DeleteBusinessRegistrationRequest, $0.DeleteBusinessRegistrationResponse>(
      '/proto.CrmService/DeleteBusinessRegistration',
      ($0.DeleteBusinessRegistrationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteBusinessRegistrationResponse.fromBuffer(value));
  static final _$listBusinessRegistrations = $grpc.ClientMethod<$0.ListBusinessRegistrationsRequest, $0.ListBusinessRegistrationsResponse>(
      '/proto.CrmService/ListBusinessRegistrations',
      ($0.ListBusinessRegistrationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListBusinessRegistrationsResponse.fromBuffer(value));
  static final _$createLendingApplication = $grpc.ClientMethod<$0.CreateLendingApplicationRequest, $0.CreateLendingApplicationResponse>(
      '/proto.CrmService/CreateLendingApplication',
      ($0.CreateLendingApplicationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateLendingApplicationResponse.fromBuffer(value));
  static final _$getLendingApplication = $grpc.ClientMethod<$0.GetLendingApplicationRequest, $0.GetLendingApplicationResponse>(
      '/proto.CrmService/GetLendingApplication',
      ($0.GetLendingApplicationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetLendingApplicationResponse.fromBuffer(value));
  static final _$updateLendingApplication = $grpc.ClientMethod<$0.UpdateLendingApplicationRequest, $0.UpdateLendingApplicationResponse>(
      '/proto.CrmService/UpdateLendingApplication',
      ($0.UpdateLendingApplicationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateLendingApplicationResponse.fromBuffer(value));
  static final _$deleteLendingApplication = $grpc.ClientMethod<$0.DeleteLendingApplicationRequest, $0.DeleteLendingApplicationResponse>(
      '/proto.CrmService/DeleteLendingApplication',
      ($0.DeleteLendingApplicationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteLendingApplicationResponse.fromBuffer(value));
  static final _$listLendingApplications = $grpc.ClientMethod<$0.ListLendingApplicationsRequest, $0.ListLendingApplicationsResponse>(
      '/proto.CrmService/ListLendingApplications',
      ($0.ListLendingApplicationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListLendingApplicationsResponse.fromBuffer(value));
  static final _$createPartner = $grpc.ClientMethod<$0.CreatePartnerRequest, $0.CreatePartnerResponse>(
      '/proto.CrmService/CreatePartner',
      ($0.CreatePartnerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreatePartnerResponse.fromBuffer(value));
  static final _$getPartner = $grpc.ClientMethod<$0.GetPartnerRequest, $0.GetPartnerResponse>(
      '/proto.CrmService/GetPartner',
      ($0.GetPartnerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPartnerResponse.fromBuffer(value));
  static final _$updatePartner = $grpc.ClientMethod<$0.UpdatePartnerRequest, $0.UpdatePartnerResponse>(
      '/proto.CrmService/UpdatePartner',
      ($0.UpdatePartnerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdatePartnerResponse.fromBuffer(value));
  static final _$deletePartner = $grpc.ClientMethod<$0.DeletePartnerRequest, $0.DeletePartnerResponse>(
      '/proto.CrmService/DeletePartner',
      ($0.DeletePartnerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeletePartnerResponse.fromBuffer(value));
  static final _$listPartners = $grpc.ClientMethod<$0.ListPartnersRequest, $0.ListPartnersResponse>(
      '/proto.CrmService/ListPartners',
      ($0.ListPartnersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListPartnersResponse.fromBuffer(value));
  static final _$createLegalIssueType = $grpc.ClientMethod<$0.CreateLegalIssueTypeRequest, $0.CreateLegalIssueTypeResponse>(
      '/proto.CrmService/CreateLegalIssueType',
      ($0.CreateLegalIssueTypeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateLegalIssueTypeResponse.fromBuffer(value));
  static final _$getLegalIssueType = $grpc.ClientMethod<$0.GetLegalIssueTypeRequest, $0.GetLegalIssueTypeResponse>(
      '/proto.CrmService/GetLegalIssueType',
      ($0.GetLegalIssueTypeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetLegalIssueTypeResponse.fromBuffer(value));
  static final _$updateLegalIssueType = $grpc.ClientMethod<$0.UpdateLegalIssueTypeRequest, $0.UpdateLegalIssueTypeResponse>(
      '/proto.CrmService/UpdateLegalIssueType',
      ($0.UpdateLegalIssueTypeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateLegalIssueTypeResponse.fromBuffer(value));
  static final _$deleteLegalIssueType = $grpc.ClientMethod<$0.DeleteLegalIssueTypeRequest, $0.DeleteLegalIssueTypeResponse>(
      '/proto.CrmService/DeleteLegalIssueType',
      ($0.DeleteLegalIssueTypeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteLegalIssueTypeResponse.fromBuffer(value));
  static final _$listLegalIssueTypes = $grpc.ClientMethod<$0.ListLegalIssueTypesRequest, $0.ListLegalIssueTypesResponse>(
      '/proto.CrmService/ListLegalIssueTypes',
      ($0.ListLegalIssueTypesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListLegalIssueTypesResponse.fromBuffer(value));
  static final _$createTrainingCourse = $grpc.ClientMethod<$0.CreateTrainingCourseRequest, $0.CreateTrainingCourseResponse>(
      '/proto.CrmService/CreateTrainingCourse',
      ($0.CreateTrainingCourseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateTrainingCourseResponse.fromBuffer(value));
  static final _$getTrainingCourse = $grpc.ClientMethod<$0.GetTrainingCourseRequest, $0.GetTrainingCourseResponse>(
      '/proto.CrmService/GetTrainingCourse',
      ($0.GetTrainingCourseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTrainingCourseResponse.fromBuffer(value));
  static final _$updateTrainingCourse = $grpc.ClientMethod<$0.UpdateTrainingCourseRequest, $0.UpdateTrainingCourseResponse>(
      '/proto.CrmService/UpdateTrainingCourse',
      ($0.UpdateTrainingCourseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateTrainingCourseResponse.fromBuffer(value));
  static final _$deleteTrainingCourse = $grpc.ClientMethod<$0.DeleteTrainingCourseRequest, $0.DeleteTrainingCourseResponse>(
      '/proto.CrmService/DeleteTrainingCourse',
      ($0.DeleteTrainingCourseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteTrainingCourseResponse.fromBuffer(value));
  static final _$listTrainingCourses = $grpc.ClientMethod<$0.ListTrainingCoursesRequest, $0.ListTrainingCoursesResponse>(
      '/proto.CrmService/ListTrainingCourses',
      ($0.ListTrainingCoursesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListTrainingCoursesResponse.fromBuffer(value));
  static final _$createBank = $grpc.ClientMethod<$0.CreateBankRequest, $0.CreateBankResponse>(
      '/proto.CrmService/CreateBank',
      ($0.CreateBankRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateBankResponse.fromBuffer(value));
  static final _$getBank = $grpc.ClientMethod<$0.GetBankRequest, $0.GetBankResponse>(
      '/proto.CrmService/GetBank',
      ($0.GetBankRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBankResponse.fromBuffer(value));
  static final _$updateBank = $grpc.ClientMethod<$0.UpdateBankRequest, $0.UpdateBankResponse>(
      '/proto.CrmService/UpdateBank',
      ($0.UpdateBankRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateBankResponse.fromBuffer(value));
  static final _$deleteBank = $grpc.ClientMethod<$0.DeleteBankRequest, $0.DeleteBankResponse>(
      '/proto.CrmService/DeleteBank',
      ($0.DeleteBankRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteBankResponse.fromBuffer(value));
  static final _$listBanks = $grpc.ClientMethod<$0.ListBanksRequest, $0.ListBanksResponse>(
      '/proto.CrmService/ListBanks',
      ($0.ListBanksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListBanksResponse.fromBuffer(value));
  static final _$createInteraction = $grpc.ClientMethod<$0.CreateInteractionRequest, $0.CreateInteractionResponse>(
      '/proto.CrmService/CreateInteraction',
      ($0.CreateInteractionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateInteractionResponse.fromBuffer(value));
  static final _$getInteraction = $grpc.ClientMethod<$0.GetInteractionRequest, $0.GetInteractionResponse>(
      '/proto.CrmService/GetInteraction',
      ($0.GetInteractionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetInteractionResponse.fromBuffer(value));
  static final _$updateInteraction = $grpc.ClientMethod<$0.UpdateInteractionRequest, $0.UpdateInteractionResponse>(
      '/proto.CrmService/UpdateInteraction',
      ($0.UpdateInteractionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateInteractionResponse.fromBuffer(value));
  static final _$deleteInteraction = $grpc.ClientMethod<$0.DeleteInteractionRequest, $0.DeleteInteractionResponse>(
      '/proto.CrmService/DeleteInteraction',
      ($0.DeleteInteractionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteInteractionResponse.fromBuffer(value));
  static final _$listInteractions = $grpc.ClientMethod<$0.ListInteractionsRequest, $0.ListInteractionsResponse>(
      '/proto.CrmService/ListInteractions',
      ($0.ListInteractionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListInteractionsResponse.fromBuffer(value));
  static final _$createPayment = $grpc.ClientMethod<$0.CreatePaymentRequest, $0.CreatePaymentResponse>(
      '/proto.CrmService/CreatePayment',
      ($0.CreatePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreatePaymentResponse.fromBuffer(value));
  static final _$getPayment = $grpc.ClientMethod<$0.GetPaymentRequest, $0.GetPaymentResponse>(
      '/proto.CrmService/GetPayment',
      ($0.GetPaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPaymentResponse.fromBuffer(value));
  static final _$updatePayment = $grpc.ClientMethod<$0.UpdatePaymentRequest, $0.UpdatePaymentResponse>(
      '/proto.CrmService/UpdatePayment',
      ($0.UpdatePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdatePaymentResponse.fromBuffer(value));
  static final _$deletePayment = $grpc.ClientMethod<$0.DeletePaymentRequest, $0.DeletePaymentResponse>(
      '/proto.CrmService/DeletePayment',
      ($0.DeletePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeletePaymentResponse.fromBuffer(value));
  static final _$listPayments = $grpc.ClientMethod<$0.ListPaymentsRequest, $0.ListPaymentsResponse>(
      '/proto.CrmService/ListPayments',
      ($0.ListPaymentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListPaymentsResponse.fromBuffer(value));
  static final _$getFinancialReport = $grpc.ClientMethod<$0.GetFinancialReportRequest, $0.GetFinancialReportResponse>(
      '/proto.CrmService/GetFinancialReport',
      ($0.GetFinancialReportRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetFinancialReportResponse.fromBuffer(value));
  static final _$getSelfProfile = $grpc.ClientMethod<$0.GetSelfProfileRequest, $0.GetSelfProfileResponse>(
      '/proto.CrmService/GetSelfProfile',
      ($0.GetSelfProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSelfProfileResponse.fromBuffer(value));

  CrmServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateClientResponse> createClient($0.CreateClientRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createClient, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetClientResponse> getClient($0.GetClientRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getClient, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateClientResponse> updateClient($0.UpdateClientRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateClient, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteClientResponse> deleteClient($0.DeleteClientRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteClient, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListClientsResponse> listClients($0.ListClientsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listClients, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateEmployeeResponse> createEmployee($0.CreateEmployeeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEmployee, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetEmployeeResponse> getEmployee($0.GetEmployeeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEmployee, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateEmployeeResponse> updateEmployee($0.UpdateEmployeeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateEmployee, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteEmployeeResponse> deleteEmployee($0.DeleteEmployeeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteEmployee, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListEmployeesResponse> listEmployees($0.ListEmployeesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listEmployees, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateUserResponse> createUser($0.CreateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserResponse> getUser($0.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateUserResponse> updateUser($0.UpdateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteUserResponse> deleteUser($0.DeleteUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUsersResponse> listUsers($0.ListUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateOfficeResponse> createOffice($0.CreateOfficeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOffice, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetOfficeResponse> getOffice($0.GetOfficeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOffice, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateOfficeResponse> updateOffice($0.UpdateOfficeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOffice, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteOfficeResponse> deleteOffice($0.DeleteOfficeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOffice, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListOfficesResponse> listOffices($0.ListOfficesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOffices, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateLegalCaseResponse> createLegalCase($0.CreateLegalCaseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLegalCase, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetLegalCaseResponse> getLegalCase($0.GetLegalCaseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLegalCase, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateLegalCaseResponse> updateLegalCase($0.UpdateLegalCaseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLegalCase, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteLegalCaseResponse> deleteLegalCase($0.DeleteLegalCaseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteLegalCase, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListLegalCasesResponse> listLegalCases($0.ListLegalCasesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listLegalCases, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateTranslationOrderResponse> createTranslationOrder($0.CreateTranslationOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTranslationOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTranslationOrderResponse> getTranslationOrder($0.GetTranslationOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTranslationOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateTranslationOrderResponse> updateTranslationOrder($0.UpdateTranslationOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTranslationOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteTranslationOrderResponse> deleteTranslationOrder($0.DeleteTranslationOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTranslationOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListTranslationOrdersResponse> listTranslationOrders($0.ListTranslationOrdersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTranslationOrders, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateInsurancePolicyResponse> createInsurancePolicy($0.CreateInsurancePolicyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createInsurancePolicy, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetInsurancePolicyResponse> getInsurancePolicy($0.GetInsurancePolicyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInsurancePolicy, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateInsurancePolicyResponse> updateInsurancePolicy($0.UpdateInsurancePolicyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateInsurancePolicy, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteInsurancePolicyResponse> deleteInsurancePolicy($0.DeleteInsurancePolicyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteInsurancePolicy, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListInsurancePoliciesResponse> listInsurancePolicies($0.ListInsurancePoliciesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listInsurancePolicies, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateTrainingEnrollmentResponse> createTrainingEnrollment($0.CreateTrainingEnrollmentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTrainingEnrollment, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTrainingEnrollmentResponse> getTrainingEnrollment($0.GetTrainingEnrollmentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTrainingEnrollment, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateTrainingEnrollmentResponse> updateTrainingEnrollment($0.UpdateTrainingEnrollmentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTrainingEnrollment, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteTrainingEnrollmentResponse> deleteTrainingEnrollment($0.DeleteTrainingEnrollmentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTrainingEnrollment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListTrainingEnrollmentsResponse> listTrainingEnrollments($0.ListTrainingEnrollmentsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTrainingEnrollments, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateAccountOpeningRequestResponse> createAccountOpeningRequest($0.CreateAccountOpeningRequestRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccountOpeningRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAccountOpeningRequestResponse> getAccountOpeningRequest($0.GetAccountOpeningRequestRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccountOpeningRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateAccountOpeningRequestResponse> updateAccountOpeningRequest($0.UpdateAccountOpeningRequestRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAccountOpeningRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteAccountOpeningRequestResponse> deleteAccountOpeningRequest($0.DeleteAccountOpeningRequestRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteAccountOpeningRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListAccountOpeningRequestsResponse> listAccountOpeningRequests($0.ListAccountOpeningRequestsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAccountOpeningRequests, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateBusinessRegistrationResponse> createBusinessRegistration($0.CreateBusinessRegistrationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBusinessRegistration, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBusinessRegistrationResponse> getBusinessRegistration($0.GetBusinessRegistrationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBusinessRegistration, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateBusinessRegistrationResponse> updateBusinessRegistration($0.UpdateBusinessRegistrationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateBusinessRegistration, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteBusinessRegistrationResponse> deleteBusinessRegistration($0.DeleteBusinessRegistrationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteBusinessRegistration, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListBusinessRegistrationsResponse> listBusinessRegistrations($0.ListBusinessRegistrationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBusinessRegistrations, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateLendingApplicationResponse> createLendingApplication($0.CreateLendingApplicationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLendingApplication, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetLendingApplicationResponse> getLendingApplication($0.GetLendingApplicationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLendingApplication, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateLendingApplicationResponse> updateLendingApplication($0.UpdateLendingApplicationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLendingApplication, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteLendingApplicationResponse> deleteLendingApplication($0.DeleteLendingApplicationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteLendingApplication, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListLendingApplicationsResponse> listLendingApplications($0.ListLendingApplicationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listLendingApplications, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreatePartnerResponse> createPartner($0.CreatePartnerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPartner, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPartnerResponse> getPartner($0.GetPartnerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPartner, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePartnerResponse> updatePartner($0.UpdatePartnerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePartner, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePartnerResponse> deletePartner($0.DeletePartnerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePartner, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListPartnersResponse> listPartners($0.ListPartnersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPartners, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateLegalIssueTypeResponse> createLegalIssueType($0.CreateLegalIssueTypeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLegalIssueType, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetLegalIssueTypeResponse> getLegalIssueType($0.GetLegalIssueTypeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLegalIssueType, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateLegalIssueTypeResponse> updateLegalIssueType($0.UpdateLegalIssueTypeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLegalIssueType, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteLegalIssueTypeResponse> deleteLegalIssueType($0.DeleteLegalIssueTypeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteLegalIssueType, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListLegalIssueTypesResponse> listLegalIssueTypes($0.ListLegalIssueTypesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listLegalIssueTypes, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateTrainingCourseResponse> createTrainingCourse($0.CreateTrainingCourseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTrainingCourse, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTrainingCourseResponse> getTrainingCourse($0.GetTrainingCourseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTrainingCourse, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateTrainingCourseResponse> updateTrainingCourse($0.UpdateTrainingCourseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTrainingCourse, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteTrainingCourseResponse> deleteTrainingCourse($0.DeleteTrainingCourseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTrainingCourse, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListTrainingCoursesResponse> listTrainingCourses($0.ListTrainingCoursesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTrainingCourses, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateBankResponse> createBank($0.CreateBankRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBank, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBankResponse> getBank($0.GetBankRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBank, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateBankResponse> updateBank($0.UpdateBankRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateBank, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteBankResponse> deleteBank($0.DeleteBankRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteBank, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListBanksResponse> listBanks($0.ListBanksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBanks, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateInteractionResponse> createInteraction($0.CreateInteractionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createInteraction, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetInteractionResponse> getInteraction($0.GetInteractionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInteraction, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateInteractionResponse> updateInteraction($0.UpdateInteractionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateInteraction, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteInteractionResponse> deleteInteraction($0.DeleteInteractionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteInteraction, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListInteractionsResponse> listInteractions($0.ListInteractionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listInteractions, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreatePaymentResponse> createPayment($0.CreatePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPayment, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPaymentResponse> getPayment($0.GetPaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPayment, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePaymentResponse> updatePayment($0.UpdatePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePayment, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePaymentResponse> deletePayment($0.DeletePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePayment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListPaymentsResponse> listPayments($0.ListPaymentsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPayments, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFinancialReportResponse> getFinancialReport($0.GetFinancialReportRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFinancialReport, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSelfProfileResponse> getSelfProfile($0.GetSelfProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSelfProfile, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.CrmService')
abstract class CrmServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.CrmService';

  CrmServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateClientRequest, $0.CreateClientResponse>(
        'CreateClient',
        createClient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateClientRequest.fromBuffer(value),
        ($0.CreateClientResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetClientRequest, $0.GetClientResponse>(
        'GetClient',
        getClient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetClientRequest.fromBuffer(value),
        ($0.GetClientResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateClientRequest, $0.UpdateClientResponse>(
        'UpdateClient',
        updateClient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateClientRequest.fromBuffer(value),
        ($0.UpdateClientResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteClientRequest, $0.DeleteClientResponse>(
        'DeleteClient',
        deleteClient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteClientRequest.fromBuffer(value),
        ($0.DeleteClientResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListClientsRequest, $0.ListClientsResponse>(
        'ListClients',
        listClients_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListClientsRequest.fromBuffer(value),
        ($0.ListClientsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateEmployeeRequest, $0.CreateEmployeeResponse>(
        'CreateEmployee',
        createEmployee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateEmployeeRequest.fromBuffer(value),
        ($0.CreateEmployeeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetEmployeeRequest, $0.GetEmployeeResponse>(
        'GetEmployee',
        getEmployee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetEmployeeRequest.fromBuffer(value),
        ($0.GetEmployeeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateEmployeeRequest, $0.UpdateEmployeeResponse>(
        'UpdateEmployee',
        updateEmployee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateEmployeeRequest.fromBuffer(value),
        ($0.UpdateEmployeeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteEmployeeRequest, $0.DeleteEmployeeResponse>(
        'DeleteEmployee',
        deleteEmployee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteEmployeeRequest.fromBuffer(value),
        ($0.DeleteEmployeeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListEmployeesRequest, $0.ListEmployeesResponse>(
        'ListEmployees',
        listEmployees_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListEmployeesRequest.fromBuffer(value),
        ($0.ListEmployeesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateUserRequest, $0.CreateUserResponse>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserRequest.fromBuffer(value),
        ($0.CreateUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserRequest, $0.UpdateUserResponse>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateUserRequest.fromBuffer(value),
        ($0.UpdateUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUserRequest, $0.DeleteUserResponse>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteUserRequest.fromBuffer(value),
        ($0.DeleteUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListUsersRequest.fromBuffer(value),
        ($0.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateOfficeRequest, $0.CreateOfficeResponse>(
        'CreateOffice',
        createOffice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateOfficeRequest.fromBuffer(value),
        ($0.CreateOfficeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOfficeRequest, $0.GetOfficeResponse>(
        'GetOffice',
        getOffice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOfficeRequest.fromBuffer(value),
        ($0.GetOfficeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateOfficeRequest, $0.UpdateOfficeResponse>(
        'UpdateOffice',
        updateOffice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateOfficeRequest.fromBuffer(value),
        ($0.UpdateOfficeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteOfficeRequest, $0.DeleteOfficeResponse>(
        'DeleteOffice',
        deleteOffice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteOfficeRequest.fromBuffer(value),
        ($0.DeleteOfficeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListOfficesRequest, $0.ListOfficesResponse>(
        'ListOffices',
        listOffices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListOfficesRequest.fromBuffer(value),
        ($0.ListOfficesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateLegalCaseRequest, $0.CreateLegalCaseResponse>(
        'CreateLegalCase',
        createLegalCase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateLegalCaseRequest.fromBuffer(value),
        ($0.CreateLegalCaseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLegalCaseRequest, $0.GetLegalCaseResponse>(
        'GetLegalCase',
        getLegalCase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetLegalCaseRequest.fromBuffer(value),
        ($0.GetLegalCaseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateLegalCaseRequest, $0.UpdateLegalCaseResponse>(
        'UpdateLegalCase',
        updateLegalCase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateLegalCaseRequest.fromBuffer(value),
        ($0.UpdateLegalCaseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteLegalCaseRequest, $0.DeleteLegalCaseResponse>(
        'DeleteLegalCase',
        deleteLegalCase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteLegalCaseRequest.fromBuffer(value),
        ($0.DeleteLegalCaseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListLegalCasesRequest, $0.ListLegalCasesResponse>(
        'ListLegalCases',
        listLegalCases_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListLegalCasesRequest.fromBuffer(value),
        ($0.ListLegalCasesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTranslationOrderRequest, $0.CreateTranslationOrderResponse>(
        'CreateTranslationOrder',
        createTranslationOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTranslationOrderRequest.fromBuffer(value),
        ($0.CreateTranslationOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTranslationOrderRequest, $0.GetTranslationOrderResponse>(
        'GetTranslationOrder',
        getTranslationOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTranslationOrderRequest.fromBuffer(value),
        ($0.GetTranslationOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTranslationOrderRequest, $0.UpdateTranslationOrderResponse>(
        'UpdateTranslationOrder',
        updateTranslationOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTranslationOrderRequest.fromBuffer(value),
        ($0.UpdateTranslationOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTranslationOrderRequest, $0.DeleteTranslationOrderResponse>(
        'DeleteTranslationOrder',
        deleteTranslationOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTranslationOrderRequest.fromBuffer(value),
        ($0.DeleteTranslationOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTranslationOrdersRequest, $0.ListTranslationOrdersResponse>(
        'ListTranslationOrders',
        listTranslationOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTranslationOrdersRequest.fromBuffer(value),
        ($0.ListTranslationOrdersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateInsurancePolicyRequest, $0.CreateInsurancePolicyResponse>(
        'CreateInsurancePolicy',
        createInsurancePolicy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateInsurancePolicyRequest.fromBuffer(value),
        ($0.CreateInsurancePolicyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetInsurancePolicyRequest, $0.GetInsurancePolicyResponse>(
        'GetInsurancePolicy',
        getInsurancePolicy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetInsurancePolicyRequest.fromBuffer(value),
        ($0.GetInsurancePolicyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateInsurancePolicyRequest, $0.UpdateInsurancePolicyResponse>(
        'UpdateInsurancePolicy',
        updateInsurancePolicy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateInsurancePolicyRequest.fromBuffer(value),
        ($0.UpdateInsurancePolicyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteInsurancePolicyRequest, $0.DeleteInsurancePolicyResponse>(
        'DeleteInsurancePolicy',
        deleteInsurancePolicy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteInsurancePolicyRequest.fromBuffer(value),
        ($0.DeleteInsurancePolicyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListInsurancePoliciesRequest, $0.ListInsurancePoliciesResponse>(
        'ListInsurancePolicies',
        listInsurancePolicies_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListInsurancePoliciesRequest.fromBuffer(value),
        ($0.ListInsurancePoliciesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTrainingEnrollmentRequest, $0.CreateTrainingEnrollmentResponse>(
        'CreateTrainingEnrollment',
        createTrainingEnrollment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTrainingEnrollmentRequest.fromBuffer(value),
        ($0.CreateTrainingEnrollmentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTrainingEnrollmentRequest, $0.GetTrainingEnrollmentResponse>(
        'GetTrainingEnrollment',
        getTrainingEnrollment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTrainingEnrollmentRequest.fromBuffer(value),
        ($0.GetTrainingEnrollmentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTrainingEnrollmentRequest, $0.UpdateTrainingEnrollmentResponse>(
        'UpdateTrainingEnrollment',
        updateTrainingEnrollment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTrainingEnrollmentRequest.fromBuffer(value),
        ($0.UpdateTrainingEnrollmentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTrainingEnrollmentRequest, $0.DeleteTrainingEnrollmentResponse>(
        'DeleteTrainingEnrollment',
        deleteTrainingEnrollment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTrainingEnrollmentRequest.fromBuffer(value),
        ($0.DeleteTrainingEnrollmentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTrainingEnrollmentsRequest, $0.ListTrainingEnrollmentsResponse>(
        'ListTrainingEnrollments',
        listTrainingEnrollments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTrainingEnrollmentsRequest.fromBuffer(value),
        ($0.ListTrainingEnrollmentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateAccountOpeningRequestRequest, $0.CreateAccountOpeningRequestResponse>(
        'CreateAccountOpeningRequest',
        createAccountOpeningRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateAccountOpeningRequestRequest.fromBuffer(value),
        ($0.CreateAccountOpeningRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAccountOpeningRequestRequest, $0.GetAccountOpeningRequestResponse>(
        'GetAccountOpeningRequest',
        getAccountOpeningRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAccountOpeningRequestRequest.fromBuffer(value),
        ($0.GetAccountOpeningRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateAccountOpeningRequestRequest, $0.UpdateAccountOpeningRequestResponse>(
        'UpdateAccountOpeningRequest',
        updateAccountOpeningRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateAccountOpeningRequestRequest.fromBuffer(value),
        ($0.UpdateAccountOpeningRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteAccountOpeningRequestRequest, $0.DeleteAccountOpeningRequestResponse>(
        'DeleteAccountOpeningRequest',
        deleteAccountOpeningRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteAccountOpeningRequestRequest.fromBuffer(value),
        ($0.DeleteAccountOpeningRequestResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListAccountOpeningRequestsRequest, $0.ListAccountOpeningRequestsResponse>(
        'ListAccountOpeningRequests',
        listAccountOpeningRequests_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListAccountOpeningRequestsRequest.fromBuffer(value),
        ($0.ListAccountOpeningRequestsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateBusinessRegistrationRequest, $0.CreateBusinessRegistrationResponse>(
        'CreateBusinessRegistration',
        createBusinessRegistration_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateBusinessRegistrationRequest.fromBuffer(value),
        ($0.CreateBusinessRegistrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBusinessRegistrationRequest, $0.GetBusinessRegistrationResponse>(
        'GetBusinessRegistration',
        getBusinessRegistration_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBusinessRegistrationRequest.fromBuffer(value),
        ($0.GetBusinessRegistrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateBusinessRegistrationRequest, $0.UpdateBusinessRegistrationResponse>(
        'UpdateBusinessRegistration',
        updateBusinessRegistration_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateBusinessRegistrationRequest.fromBuffer(value),
        ($0.UpdateBusinessRegistrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteBusinessRegistrationRequest, $0.DeleteBusinessRegistrationResponse>(
        'DeleteBusinessRegistration',
        deleteBusinessRegistration_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteBusinessRegistrationRequest.fromBuffer(value),
        ($0.DeleteBusinessRegistrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListBusinessRegistrationsRequest, $0.ListBusinessRegistrationsResponse>(
        'ListBusinessRegistrations',
        listBusinessRegistrations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListBusinessRegistrationsRequest.fromBuffer(value),
        ($0.ListBusinessRegistrationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateLendingApplicationRequest, $0.CreateLendingApplicationResponse>(
        'CreateLendingApplication',
        createLendingApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateLendingApplicationRequest.fromBuffer(value),
        ($0.CreateLendingApplicationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLendingApplicationRequest, $0.GetLendingApplicationResponse>(
        'GetLendingApplication',
        getLendingApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetLendingApplicationRequest.fromBuffer(value),
        ($0.GetLendingApplicationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateLendingApplicationRequest, $0.UpdateLendingApplicationResponse>(
        'UpdateLendingApplication',
        updateLendingApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateLendingApplicationRequest.fromBuffer(value),
        ($0.UpdateLendingApplicationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteLendingApplicationRequest, $0.DeleteLendingApplicationResponse>(
        'DeleteLendingApplication',
        deleteLendingApplication_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteLendingApplicationRequest.fromBuffer(value),
        ($0.DeleteLendingApplicationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListLendingApplicationsRequest, $0.ListLendingApplicationsResponse>(
        'ListLendingApplications',
        listLendingApplications_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListLendingApplicationsRequest.fromBuffer(value),
        ($0.ListLendingApplicationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreatePartnerRequest, $0.CreatePartnerResponse>(
        'CreatePartner',
        createPartner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePartnerRequest.fromBuffer(value),
        ($0.CreatePartnerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPartnerRequest, $0.GetPartnerResponse>(
        'GetPartner',
        getPartner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPartnerRequest.fromBuffer(value),
        ($0.GetPartnerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePartnerRequest, $0.UpdatePartnerResponse>(
        'UpdatePartner',
        updatePartner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePartnerRequest.fromBuffer(value),
        ($0.UpdatePartnerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePartnerRequest, $0.DeletePartnerResponse>(
        'DeletePartner',
        deletePartner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePartnerRequest.fromBuffer(value),
        ($0.DeletePartnerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListPartnersRequest, $0.ListPartnersResponse>(
        'ListPartners',
        listPartners_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListPartnersRequest.fromBuffer(value),
        ($0.ListPartnersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateLegalIssueTypeRequest, $0.CreateLegalIssueTypeResponse>(
        'CreateLegalIssueType',
        createLegalIssueType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateLegalIssueTypeRequest.fromBuffer(value),
        ($0.CreateLegalIssueTypeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLegalIssueTypeRequest, $0.GetLegalIssueTypeResponse>(
        'GetLegalIssueType',
        getLegalIssueType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetLegalIssueTypeRequest.fromBuffer(value),
        ($0.GetLegalIssueTypeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateLegalIssueTypeRequest, $0.UpdateLegalIssueTypeResponse>(
        'UpdateLegalIssueType',
        updateLegalIssueType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateLegalIssueTypeRequest.fromBuffer(value),
        ($0.UpdateLegalIssueTypeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteLegalIssueTypeRequest, $0.DeleteLegalIssueTypeResponse>(
        'DeleteLegalIssueType',
        deleteLegalIssueType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteLegalIssueTypeRequest.fromBuffer(value),
        ($0.DeleteLegalIssueTypeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListLegalIssueTypesRequest, $0.ListLegalIssueTypesResponse>(
        'ListLegalIssueTypes',
        listLegalIssueTypes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListLegalIssueTypesRequest.fromBuffer(value),
        ($0.ListLegalIssueTypesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTrainingCourseRequest, $0.CreateTrainingCourseResponse>(
        'CreateTrainingCourse',
        createTrainingCourse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTrainingCourseRequest.fromBuffer(value),
        ($0.CreateTrainingCourseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTrainingCourseRequest, $0.GetTrainingCourseResponse>(
        'GetTrainingCourse',
        getTrainingCourse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTrainingCourseRequest.fromBuffer(value),
        ($0.GetTrainingCourseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTrainingCourseRequest, $0.UpdateTrainingCourseResponse>(
        'UpdateTrainingCourse',
        updateTrainingCourse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTrainingCourseRequest.fromBuffer(value),
        ($0.UpdateTrainingCourseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTrainingCourseRequest, $0.DeleteTrainingCourseResponse>(
        'DeleteTrainingCourse',
        deleteTrainingCourse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTrainingCourseRequest.fromBuffer(value),
        ($0.DeleteTrainingCourseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTrainingCoursesRequest, $0.ListTrainingCoursesResponse>(
        'ListTrainingCourses',
        listTrainingCourses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTrainingCoursesRequest.fromBuffer(value),
        ($0.ListTrainingCoursesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateBankRequest, $0.CreateBankResponse>(
        'CreateBank',
        createBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateBankRequest.fromBuffer(value),
        ($0.CreateBankResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBankRequest, $0.GetBankResponse>(
        'GetBank',
        getBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBankRequest.fromBuffer(value),
        ($0.GetBankResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateBankRequest, $0.UpdateBankResponse>(
        'UpdateBank',
        updateBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateBankRequest.fromBuffer(value),
        ($0.UpdateBankResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteBankRequest, $0.DeleteBankResponse>(
        'DeleteBank',
        deleteBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteBankRequest.fromBuffer(value),
        ($0.DeleteBankResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListBanksRequest, $0.ListBanksResponse>(
        'ListBanks',
        listBanks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListBanksRequest.fromBuffer(value),
        ($0.ListBanksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateInteractionRequest, $0.CreateInteractionResponse>(
        'CreateInteraction',
        createInteraction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateInteractionRequest.fromBuffer(value),
        ($0.CreateInteractionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetInteractionRequest, $0.GetInteractionResponse>(
        'GetInteraction',
        getInteraction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetInteractionRequest.fromBuffer(value),
        ($0.GetInteractionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateInteractionRequest, $0.UpdateInteractionResponse>(
        'UpdateInteraction',
        updateInteraction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateInteractionRequest.fromBuffer(value),
        ($0.UpdateInteractionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteInteractionRequest, $0.DeleteInteractionResponse>(
        'DeleteInteraction',
        deleteInteraction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteInteractionRequest.fromBuffer(value),
        ($0.DeleteInteractionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListInteractionsRequest, $0.ListInteractionsResponse>(
        'ListInteractions',
        listInteractions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListInteractionsRequest.fromBuffer(value),
        ($0.ListInteractionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreatePaymentRequest, $0.CreatePaymentResponse>(
        'CreatePayment',
        createPayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePaymentRequest.fromBuffer(value),
        ($0.CreatePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPaymentRequest, $0.GetPaymentResponse>(
        'GetPayment',
        getPayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPaymentRequest.fromBuffer(value),
        ($0.GetPaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePaymentRequest, $0.UpdatePaymentResponse>(
        'UpdatePayment',
        updatePayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePaymentRequest.fromBuffer(value),
        ($0.UpdatePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePaymentRequest, $0.DeletePaymentResponse>(
        'DeletePayment',
        deletePayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePaymentRequest.fromBuffer(value),
        ($0.DeletePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListPaymentsRequest, $0.ListPaymentsResponse>(
        'ListPayments',
        listPayments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListPaymentsRequest.fromBuffer(value),
        ($0.ListPaymentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFinancialReportRequest, $0.GetFinancialReportResponse>(
        'GetFinancialReport',
        getFinancialReport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetFinancialReportRequest.fromBuffer(value),
        ($0.GetFinancialReportResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSelfProfileRequest, $0.GetSelfProfileResponse>(
        'GetSelfProfile',
        getSelfProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSelfProfileRequest.fromBuffer(value),
        ($0.GetSelfProfileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateClientResponse> createClient_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateClientRequest> $request) async {
    return createClient($call, await $request);
  }

  $async.Future<$0.GetClientResponse> getClient_Pre($grpc.ServiceCall $call, $async.Future<$0.GetClientRequest> $request) async {
    return getClient($call, await $request);
  }

  $async.Future<$0.UpdateClientResponse> updateClient_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateClientRequest> $request) async {
    return updateClient($call, await $request);
  }

  $async.Future<$0.DeleteClientResponse> deleteClient_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteClientRequest> $request) async {
    return deleteClient($call, await $request);
  }

  $async.Future<$0.ListClientsResponse> listClients_Pre($grpc.ServiceCall $call, $async.Future<$0.ListClientsRequest> $request) async {
    return listClients($call, await $request);
  }

  $async.Future<$0.CreateEmployeeResponse> createEmployee_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateEmployeeRequest> $request) async {
    return createEmployee($call, await $request);
  }

  $async.Future<$0.GetEmployeeResponse> getEmployee_Pre($grpc.ServiceCall $call, $async.Future<$0.GetEmployeeRequest> $request) async {
    return getEmployee($call, await $request);
  }

  $async.Future<$0.UpdateEmployeeResponse> updateEmployee_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateEmployeeRequest> $request) async {
    return updateEmployee($call, await $request);
  }

  $async.Future<$0.DeleteEmployeeResponse> deleteEmployee_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteEmployeeRequest> $request) async {
    return deleteEmployee($call, await $request);
  }

  $async.Future<$0.ListEmployeesResponse> listEmployees_Pre($grpc.ServiceCall $call, $async.Future<$0.ListEmployeesRequest> $request) async {
    return listEmployees($call, await $request);
  }

  $async.Future<$0.CreateUserResponse> createUser_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateUserRequest> $request) async {
    return createUser($call, await $request);
  }

  $async.Future<$0.GetUserResponse> getUser_Pre($grpc.ServiceCall $call, $async.Future<$0.GetUserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$0.UpdateUserResponse> updateUser_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateUserRequest> $request) async {
    return updateUser($call, await $request);
  }

  $async.Future<$0.DeleteUserResponse> deleteUser_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteUserRequest> $request) async {
    return deleteUser($call, await $request);
  }

  $async.Future<$0.ListUsersResponse> listUsers_Pre($grpc.ServiceCall $call, $async.Future<$0.ListUsersRequest> $request) async {
    return listUsers($call, await $request);
  }

  $async.Future<$0.CreateOfficeResponse> createOffice_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateOfficeRequest> $request) async {
    return createOffice($call, await $request);
  }

  $async.Future<$0.GetOfficeResponse> getOffice_Pre($grpc.ServiceCall $call, $async.Future<$0.GetOfficeRequest> $request) async {
    return getOffice($call, await $request);
  }

  $async.Future<$0.UpdateOfficeResponse> updateOffice_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateOfficeRequest> $request) async {
    return updateOffice($call, await $request);
  }

  $async.Future<$0.DeleteOfficeResponse> deleteOffice_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteOfficeRequest> $request) async {
    return deleteOffice($call, await $request);
  }

  $async.Future<$0.ListOfficesResponse> listOffices_Pre($grpc.ServiceCall $call, $async.Future<$0.ListOfficesRequest> $request) async {
    return listOffices($call, await $request);
  }

  $async.Future<$0.CreateLegalCaseResponse> createLegalCase_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateLegalCaseRequest> $request) async {
    return createLegalCase($call, await $request);
  }

  $async.Future<$0.GetLegalCaseResponse> getLegalCase_Pre($grpc.ServiceCall $call, $async.Future<$0.GetLegalCaseRequest> $request) async {
    return getLegalCase($call, await $request);
  }

  $async.Future<$0.UpdateLegalCaseResponse> updateLegalCase_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateLegalCaseRequest> $request) async {
    return updateLegalCase($call, await $request);
  }

  $async.Future<$0.DeleteLegalCaseResponse> deleteLegalCase_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteLegalCaseRequest> $request) async {
    return deleteLegalCase($call, await $request);
  }

  $async.Future<$0.ListLegalCasesResponse> listLegalCases_Pre($grpc.ServiceCall $call, $async.Future<$0.ListLegalCasesRequest> $request) async {
    return listLegalCases($call, await $request);
  }

  $async.Future<$0.CreateTranslationOrderResponse> createTranslationOrder_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateTranslationOrderRequest> $request) async {
    return createTranslationOrder($call, await $request);
  }

  $async.Future<$0.GetTranslationOrderResponse> getTranslationOrder_Pre($grpc.ServiceCall $call, $async.Future<$0.GetTranslationOrderRequest> $request) async {
    return getTranslationOrder($call, await $request);
  }

  $async.Future<$0.UpdateTranslationOrderResponse> updateTranslationOrder_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateTranslationOrderRequest> $request) async {
    return updateTranslationOrder($call, await $request);
  }

  $async.Future<$0.DeleteTranslationOrderResponse> deleteTranslationOrder_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteTranslationOrderRequest> $request) async {
    return deleteTranslationOrder($call, await $request);
  }

  $async.Future<$0.ListTranslationOrdersResponse> listTranslationOrders_Pre($grpc.ServiceCall $call, $async.Future<$0.ListTranslationOrdersRequest> $request) async {
    return listTranslationOrders($call, await $request);
  }

  $async.Future<$0.CreateInsurancePolicyResponse> createInsurancePolicy_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateInsurancePolicyRequest> $request) async {
    return createInsurancePolicy($call, await $request);
  }

  $async.Future<$0.GetInsurancePolicyResponse> getInsurancePolicy_Pre($grpc.ServiceCall $call, $async.Future<$0.GetInsurancePolicyRequest> $request) async {
    return getInsurancePolicy($call, await $request);
  }

  $async.Future<$0.UpdateInsurancePolicyResponse> updateInsurancePolicy_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateInsurancePolicyRequest> $request) async {
    return updateInsurancePolicy($call, await $request);
  }

  $async.Future<$0.DeleteInsurancePolicyResponse> deleteInsurancePolicy_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteInsurancePolicyRequest> $request) async {
    return deleteInsurancePolicy($call, await $request);
  }

  $async.Future<$0.ListInsurancePoliciesResponse> listInsurancePolicies_Pre($grpc.ServiceCall $call, $async.Future<$0.ListInsurancePoliciesRequest> $request) async {
    return listInsurancePolicies($call, await $request);
  }

  $async.Future<$0.CreateTrainingEnrollmentResponse> createTrainingEnrollment_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateTrainingEnrollmentRequest> $request) async {
    return createTrainingEnrollment($call, await $request);
  }

  $async.Future<$0.GetTrainingEnrollmentResponse> getTrainingEnrollment_Pre($grpc.ServiceCall $call, $async.Future<$0.GetTrainingEnrollmentRequest> $request) async {
    return getTrainingEnrollment($call, await $request);
  }

  $async.Future<$0.UpdateTrainingEnrollmentResponse> updateTrainingEnrollment_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateTrainingEnrollmentRequest> $request) async {
    return updateTrainingEnrollment($call, await $request);
  }

  $async.Future<$0.DeleteTrainingEnrollmentResponse> deleteTrainingEnrollment_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteTrainingEnrollmentRequest> $request) async {
    return deleteTrainingEnrollment($call, await $request);
  }

  $async.Future<$0.ListTrainingEnrollmentsResponse> listTrainingEnrollments_Pre($grpc.ServiceCall $call, $async.Future<$0.ListTrainingEnrollmentsRequest> $request) async {
    return listTrainingEnrollments($call, await $request);
  }

  $async.Future<$0.CreateAccountOpeningRequestResponse> createAccountOpeningRequest_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateAccountOpeningRequestRequest> $request) async {
    return createAccountOpeningRequest($call, await $request);
  }

  $async.Future<$0.GetAccountOpeningRequestResponse> getAccountOpeningRequest_Pre($grpc.ServiceCall $call, $async.Future<$0.GetAccountOpeningRequestRequest> $request) async {
    return getAccountOpeningRequest($call, await $request);
  }

  $async.Future<$0.UpdateAccountOpeningRequestResponse> updateAccountOpeningRequest_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateAccountOpeningRequestRequest> $request) async {
    return updateAccountOpeningRequest($call, await $request);
  }

  $async.Future<$0.DeleteAccountOpeningRequestResponse> deleteAccountOpeningRequest_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteAccountOpeningRequestRequest> $request) async {
    return deleteAccountOpeningRequest($call, await $request);
  }

  $async.Future<$0.ListAccountOpeningRequestsResponse> listAccountOpeningRequests_Pre($grpc.ServiceCall $call, $async.Future<$0.ListAccountOpeningRequestsRequest> $request) async {
    return listAccountOpeningRequests($call, await $request);
  }

  $async.Future<$0.CreateBusinessRegistrationResponse> createBusinessRegistration_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateBusinessRegistrationRequest> $request) async {
    return createBusinessRegistration($call, await $request);
  }

  $async.Future<$0.GetBusinessRegistrationResponse> getBusinessRegistration_Pre($grpc.ServiceCall $call, $async.Future<$0.GetBusinessRegistrationRequest> $request) async {
    return getBusinessRegistration($call, await $request);
  }

  $async.Future<$0.UpdateBusinessRegistrationResponse> updateBusinessRegistration_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateBusinessRegistrationRequest> $request) async {
    return updateBusinessRegistration($call, await $request);
  }

  $async.Future<$0.DeleteBusinessRegistrationResponse> deleteBusinessRegistration_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteBusinessRegistrationRequest> $request) async {
    return deleteBusinessRegistration($call, await $request);
  }

  $async.Future<$0.ListBusinessRegistrationsResponse> listBusinessRegistrations_Pre($grpc.ServiceCall $call, $async.Future<$0.ListBusinessRegistrationsRequest> $request) async {
    return listBusinessRegistrations($call, await $request);
  }

  $async.Future<$0.CreateLendingApplicationResponse> createLendingApplication_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateLendingApplicationRequest> $request) async {
    return createLendingApplication($call, await $request);
  }

  $async.Future<$0.GetLendingApplicationResponse> getLendingApplication_Pre($grpc.ServiceCall $call, $async.Future<$0.GetLendingApplicationRequest> $request) async {
    return getLendingApplication($call, await $request);
  }

  $async.Future<$0.UpdateLendingApplicationResponse> updateLendingApplication_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateLendingApplicationRequest> $request) async {
    return updateLendingApplication($call, await $request);
  }

  $async.Future<$0.DeleteLendingApplicationResponse> deleteLendingApplication_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteLendingApplicationRequest> $request) async {
    return deleteLendingApplication($call, await $request);
  }

  $async.Future<$0.ListLendingApplicationsResponse> listLendingApplications_Pre($grpc.ServiceCall $call, $async.Future<$0.ListLendingApplicationsRequest> $request) async {
    return listLendingApplications($call, await $request);
  }

  $async.Future<$0.CreatePartnerResponse> createPartner_Pre($grpc.ServiceCall $call, $async.Future<$0.CreatePartnerRequest> $request) async {
    return createPartner($call, await $request);
  }

  $async.Future<$0.GetPartnerResponse> getPartner_Pre($grpc.ServiceCall $call, $async.Future<$0.GetPartnerRequest> $request) async {
    return getPartner($call, await $request);
  }

  $async.Future<$0.UpdatePartnerResponse> updatePartner_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdatePartnerRequest> $request) async {
    return updatePartner($call, await $request);
  }

  $async.Future<$0.DeletePartnerResponse> deletePartner_Pre($grpc.ServiceCall $call, $async.Future<$0.DeletePartnerRequest> $request) async {
    return deletePartner($call, await $request);
  }

  $async.Future<$0.ListPartnersResponse> listPartners_Pre($grpc.ServiceCall $call, $async.Future<$0.ListPartnersRequest> $request) async {
    return listPartners($call, await $request);
  }

  $async.Future<$0.CreateLegalIssueTypeResponse> createLegalIssueType_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateLegalIssueTypeRequest> $request) async {
    return createLegalIssueType($call, await $request);
  }

  $async.Future<$0.GetLegalIssueTypeResponse> getLegalIssueType_Pre($grpc.ServiceCall $call, $async.Future<$0.GetLegalIssueTypeRequest> $request) async {
    return getLegalIssueType($call, await $request);
  }

  $async.Future<$0.UpdateLegalIssueTypeResponse> updateLegalIssueType_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateLegalIssueTypeRequest> $request) async {
    return updateLegalIssueType($call, await $request);
  }

  $async.Future<$0.DeleteLegalIssueTypeResponse> deleteLegalIssueType_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteLegalIssueTypeRequest> $request) async {
    return deleteLegalIssueType($call, await $request);
  }

  $async.Future<$0.ListLegalIssueTypesResponse> listLegalIssueTypes_Pre($grpc.ServiceCall $call, $async.Future<$0.ListLegalIssueTypesRequest> $request) async {
    return listLegalIssueTypes($call, await $request);
  }

  $async.Future<$0.CreateTrainingCourseResponse> createTrainingCourse_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateTrainingCourseRequest> $request) async {
    return createTrainingCourse($call, await $request);
  }

  $async.Future<$0.GetTrainingCourseResponse> getTrainingCourse_Pre($grpc.ServiceCall $call, $async.Future<$0.GetTrainingCourseRequest> $request) async {
    return getTrainingCourse($call, await $request);
  }

  $async.Future<$0.UpdateTrainingCourseResponse> updateTrainingCourse_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateTrainingCourseRequest> $request) async {
    return updateTrainingCourse($call, await $request);
  }

  $async.Future<$0.DeleteTrainingCourseResponse> deleteTrainingCourse_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteTrainingCourseRequest> $request) async {
    return deleteTrainingCourse($call, await $request);
  }

  $async.Future<$0.ListTrainingCoursesResponse> listTrainingCourses_Pre($grpc.ServiceCall $call, $async.Future<$0.ListTrainingCoursesRequest> $request) async {
    return listTrainingCourses($call, await $request);
  }

  $async.Future<$0.CreateBankResponse> createBank_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateBankRequest> $request) async {
    return createBank($call, await $request);
  }

  $async.Future<$0.GetBankResponse> getBank_Pre($grpc.ServiceCall $call, $async.Future<$0.GetBankRequest> $request) async {
    return getBank($call, await $request);
  }

  $async.Future<$0.UpdateBankResponse> updateBank_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateBankRequest> $request) async {
    return updateBank($call, await $request);
  }

  $async.Future<$0.DeleteBankResponse> deleteBank_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteBankRequest> $request) async {
    return deleteBank($call, await $request);
  }

  $async.Future<$0.ListBanksResponse> listBanks_Pre($grpc.ServiceCall $call, $async.Future<$0.ListBanksRequest> $request) async {
    return listBanks($call, await $request);
  }

  $async.Future<$0.CreateInteractionResponse> createInteraction_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateInteractionRequest> $request) async {
    return createInteraction($call, await $request);
  }

  $async.Future<$0.GetInteractionResponse> getInteraction_Pre($grpc.ServiceCall $call, $async.Future<$0.GetInteractionRequest> $request) async {
    return getInteraction($call, await $request);
  }

  $async.Future<$0.UpdateInteractionResponse> updateInteraction_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateInteractionRequest> $request) async {
    return updateInteraction($call, await $request);
  }

  $async.Future<$0.DeleteInteractionResponse> deleteInteraction_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteInteractionRequest> $request) async {
    return deleteInteraction($call, await $request);
  }

  $async.Future<$0.ListInteractionsResponse> listInteractions_Pre($grpc.ServiceCall $call, $async.Future<$0.ListInteractionsRequest> $request) async {
    return listInteractions($call, await $request);
  }

  $async.Future<$0.CreatePaymentResponse> createPayment_Pre($grpc.ServiceCall $call, $async.Future<$0.CreatePaymentRequest> $request) async {
    return createPayment($call, await $request);
  }

  $async.Future<$0.GetPaymentResponse> getPayment_Pre($grpc.ServiceCall $call, $async.Future<$0.GetPaymentRequest> $request) async {
    return getPayment($call, await $request);
  }

  $async.Future<$0.UpdatePaymentResponse> updatePayment_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdatePaymentRequest> $request) async {
    return updatePayment($call, await $request);
  }

  $async.Future<$0.DeletePaymentResponse> deletePayment_Pre($grpc.ServiceCall $call, $async.Future<$0.DeletePaymentRequest> $request) async {
    return deletePayment($call, await $request);
  }

  $async.Future<$0.ListPaymentsResponse> listPayments_Pre($grpc.ServiceCall $call, $async.Future<$0.ListPaymentsRequest> $request) async {
    return listPayments($call, await $request);
  }

  $async.Future<$0.GetFinancialReportResponse> getFinancialReport_Pre($grpc.ServiceCall $call, $async.Future<$0.GetFinancialReportRequest> $request) async {
    return getFinancialReport($call, await $request);
  }

  $async.Future<$0.GetSelfProfileResponse> getSelfProfile_Pre($grpc.ServiceCall $call, $async.Future<$0.GetSelfProfileRequest> $request) async {
    return getSelfProfile($call, await $request);
  }

  $async.Future<$0.CreateClientResponse> createClient($grpc.ServiceCall call, $0.CreateClientRequest request);
  $async.Future<$0.GetClientResponse> getClient($grpc.ServiceCall call, $0.GetClientRequest request);
  $async.Future<$0.UpdateClientResponse> updateClient($grpc.ServiceCall call, $0.UpdateClientRequest request);
  $async.Future<$0.DeleteClientResponse> deleteClient($grpc.ServiceCall call, $0.DeleteClientRequest request);
  $async.Future<$0.ListClientsResponse> listClients($grpc.ServiceCall call, $0.ListClientsRequest request);
  $async.Future<$0.CreateEmployeeResponse> createEmployee($grpc.ServiceCall call, $0.CreateEmployeeRequest request);
  $async.Future<$0.GetEmployeeResponse> getEmployee($grpc.ServiceCall call, $0.GetEmployeeRequest request);
  $async.Future<$0.UpdateEmployeeResponse> updateEmployee($grpc.ServiceCall call, $0.UpdateEmployeeRequest request);
  $async.Future<$0.DeleteEmployeeResponse> deleteEmployee($grpc.ServiceCall call, $0.DeleteEmployeeRequest request);
  $async.Future<$0.ListEmployeesResponse> listEmployees($grpc.ServiceCall call, $0.ListEmployeesRequest request);
  $async.Future<$0.CreateUserResponse> createUser($grpc.ServiceCall call, $0.CreateUserRequest request);
  $async.Future<$0.GetUserResponse> getUser($grpc.ServiceCall call, $0.GetUserRequest request);
  $async.Future<$0.UpdateUserResponse> updateUser($grpc.ServiceCall call, $0.UpdateUserRequest request);
  $async.Future<$0.DeleteUserResponse> deleteUser($grpc.ServiceCall call, $0.DeleteUserRequest request);
  $async.Future<$0.ListUsersResponse> listUsers($grpc.ServiceCall call, $0.ListUsersRequest request);
  $async.Future<$0.CreateOfficeResponse> createOffice($grpc.ServiceCall call, $0.CreateOfficeRequest request);
  $async.Future<$0.GetOfficeResponse> getOffice($grpc.ServiceCall call, $0.GetOfficeRequest request);
  $async.Future<$0.UpdateOfficeResponse> updateOffice($grpc.ServiceCall call, $0.UpdateOfficeRequest request);
  $async.Future<$0.DeleteOfficeResponse> deleteOffice($grpc.ServiceCall call, $0.DeleteOfficeRequest request);
  $async.Future<$0.ListOfficesResponse> listOffices($grpc.ServiceCall call, $0.ListOfficesRequest request);
  $async.Future<$0.CreateLegalCaseResponse> createLegalCase($grpc.ServiceCall call, $0.CreateLegalCaseRequest request);
  $async.Future<$0.GetLegalCaseResponse> getLegalCase($grpc.ServiceCall call, $0.GetLegalCaseRequest request);
  $async.Future<$0.UpdateLegalCaseResponse> updateLegalCase($grpc.ServiceCall call, $0.UpdateLegalCaseRequest request);
  $async.Future<$0.DeleteLegalCaseResponse> deleteLegalCase($grpc.ServiceCall call, $0.DeleteLegalCaseRequest request);
  $async.Future<$0.ListLegalCasesResponse> listLegalCases($grpc.ServiceCall call, $0.ListLegalCasesRequest request);
  $async.Future<$0.CreateTranslationOrderResponse> createTranslationOrder($grpc.ServiceCall call, $0.CreateTranslationOrderRequest request);
  $async.Future<$0.GetTranslationOrderResponse> getTranslationOrder($grpc.ServiceCall call, $0.GetTranslationOrderRequest request);
  $async.Future<$0.UpdateTranslationOrderResponse> updateTranslationOrder($grpc.ServiceCall call, $0.UpdateTranslationOrderRequest request);
  $async.Future<$0.DeleteTranslationOrderResponse> deleteTranslationOrder($grpc.ServiceCall call, $0.DeleteTranslationOrderRequest request);
  $async.Future<$0.ListTranslationOrdersResponse> listTranslationOrders($grpc.ServiceCall call, $0.ListTranslationOrdersRequest request);
  $async.Future<$0.CreateInsurancePolicyResponse> createInsurancePolicy($grpc.ServiceCall call, $0.CreateInsurancePolicyRequest request);
  $async.Future<$0.GetInsurancePolicyResponse> getInsurancePolicy($grpc.ServiceCall call, $0.GetInsurancePolicyRequest request);
  $async.Future<$0.UpdateInsurancePolicyResponse> updateInsurancePolicy($grpc.ServiceCall call, $0.UpdateInsurancePolicyRequest request);
  $async.Future<$0.DeleteInsurancePolicyResponse> deleteInsurancePolicy($grpc.ServiceCall call, $0.DeleteInsurancePolicyRequest request);
  $async.Future<$0.ListInsurancePoliciesResponse> listInsurancePolicies($grpc.ServiceCall call, $0.ListInsurancePoliciesRequest request);
  $async.Future<$0.CreateTrainingEnrollmentResponse> createTrainingEnrollment($grpc.ServiceCall call, $0.CreateTrainingEnrollmentRequest request);
  $async.Future<$0.GetTrainingEnrollmentResponse> getTrainingEnrollment($grpc.ServiceCall call, $0.GetTrainingEnrollmentRequest request);
  $async.Future<$0.UpdateTrainingEnrollmentResponse> updateTrainingEnrollment($grpc.ServiceCall call, $0.UpdateTrainingEnrollmentRequest request);
  $async.Future<$0.DeleteTrainingEnrollmentResponse> deleteTrainingEnrollment($grpc.ServiceCall call, $0.DeleteTrainingEnrollmentRequest request);
  $async.Future<$0.ListTrainingEnrollmentsResponse> listTrainingEnrollments($grpc.ServiceCall call, $0.ListTrainingEnrollmentsRequest request);
  $async.Future<$0.CreateAccountOpeningRequestResponse> createAccountOpeningRequest($grpc.ServiceCall call, $0.CreateAccountOpeningRequestRequest request);
  $async.Future<$0.GetAccountOpeningRequestResponse> getAccountOpeningRequest($grpc.ServiceCall call, $0.GetAccountOpeningRequestRequest request);
  $async.Future<$0.UpdateAccountOpeningRequestResponse> updateAccountOpeningRequest($grpc.ServiceCall call, $0.UpdateAccountOpeningRequestRequest request);
  $async.Future<$0.DeleteAccountOpeningRequestResponse> deleteAccountOpeningRequest($grpc.ServiceCall call, $0.DeleteAccountOpeningRequestRequest request);
  $async.Future<$0.ListAccountOpeningRequestsResponse> listAccountOpeningRequests($grpc.ServiceCall call, $0.ListAccountOpeningRequestsRequest request);
  $async.Future<$0.CreateBusinessRegistrationResponse> createBusinessRegistration($grpc.ServiceCall call, $0.CreateBusinessRegistrationRequest request);
  $async.Future<$0.GetBusinessRegistrationResponse> getBusinessRegistration($grpc.ServiceCall call, $0.GetBusinessRegistrationRequest request);
  $async.Future<$0.UpdateBusinessRegistrationResponse> updateBusinessRegistration($grpc.ServiceCall call, $0.UpdateBusinessRegistrationRequest request);
  $async.Future<$0.DeleteBusinessRegistrationResponse> deleteBusinessRegistration($grpc.ServiceCall call, $0.DeleteBusinessRegistrationRequest request);
  $async.Future<$0.ListBusinessRegistrationsResponse> listBusinessRegistrations($grpc.ServiceCall call, $0.ListBusinessRegistrationsRequest request);
  $async.Future<$0.CreateLendingApplicationResponse> createLendingApplication($grpc.ServiceCall call, $0.CreateLendingApplicationRequest request);
  $async.Future<$0.GetLendingApplicationResponse> getLendingApplication($grpc.ServiceCall call, $0.GetLendingApplicationRequest request);
  $async.Future<$0.UpdateLendingApplicationResponse> updateLendingApplication($grpc.ServiceCall call, $0.UpdateLendingApplicationRequest request);
  $async.Future<$0.DeleteLendingApplicationResponse> deleteLendingApplication($grpc.ServiceCall call, $0.DeleteLendingApplicationRequest request);
  $async.Future<$0.ListLendingApplicationsResponse> listLendingApplications($grpc.ServiceCall call, $0.ListLendingApplicationsRequest request);
  $async.Future<$0.CreatePartnerResponse> createPartner($grpc.ServiceCall call, $0.CreatePartnerRequest request);
  $async.Future<$0.GetPartnerResponse> getPartner($grpc.ServiceCall call, $0.GetPartnerRequest request);
  $async.Future<$0.UpdatePartnerResponse> updatePartner($grpc.ServiceCall call, $0.UpdatePartnerRequest request);
  $async.Future<$0.DeletePartnerResponse> deletePartner($grpc.ServiceCall call, $0.DeletePartnerRequest request);
  $async.Future<$0.ListPartnersResponse> listPartners($grpc.ServiceCall call, $0.ListPartnersRequest request);
  $async.Future<$0.CreateLegalIssueTypeResponse> createLegalIssueType($grpc.ServiceCall call, $0.CreateLegalIssueTypeRequest request);
  $async.Future<$0.GetLegalIssueTypeResponse> getLegalIssueType($grpc.ServiceCall call, $0.GetLegalIssueTypeRequest request);
  $async.Future<$0.UpdateLegalIssueTypeResponse> updateLegalIssueType($grpc.ServiceCall call, $0.UpdateLegalIssueTypeRequest request);
  $async.Future<$0.DeleteLegalIssueTypeResponse> deleteLegalIssueType($grpc.ServiceCall call, $0.DeleteLegalIssueTypeRequest request);
  $async.Future<$0.ListLegalIssueTypesResponse> listLegalIssueTypes($grpc.ServiceCall call, $0.ListLegalIssueTypesRequest request);
  $async.Future<$0.CreateTrainingCourseResponse> createTrainingCourse($grpc.ServiceCall call, $0.CreateTrainingCourseRequest request);
  $async.Future<$0.GetTrainingCourseResponse> getTrainingCourse($grpc.ServiceCall call, $0.GetTrainingCourseRequest request);
  $async.Future<$0.UpdateTrainingCourseResponse> updateTrainingCourse($grpc.ServiceCall call, $0.UpdateTrainingCourseRequest request);
  $async.Future<$0.DeleteTrainingCourseResponse> deleteTrainingCourse($grpc.ServiceCall call, $0.DeleteTrainingCourseRequest request);
  $async.Future<$0.ListTrainingCoursesResponse> listTrainingCourses($grpc.ServiceCall call, $0.ListTrainingCoursesRequest request);
  $async.Future<$0.CreateBankResponse> createBank($grpc.ServiceCall call, $0.CreateBankRequest request);
  $async.Future<$0.GetBankResponse> getBank($grpc.ServiceCall call, $0.GetBankRequest request);
  $async.Future<$0.UpdateBankResponse> updateBank($grpc.ServiceCall call, $0.UpdateBankRequest request);
  $async.Future<$0.DeleteBankResponse> deleteBank($grpc.ServiceCall call, $0.DeleteBankRequest request);
  $async.Future<$0.ListBanksResponse> listBanks($grpc.ServiceCall call, $0.ListBanksRequest request);
  $async.Future<$0.CreateInteractionResponse> createInteraction($grpc.ServiceCall call, $0.CreateInteractionRequest request);
  $async.Future<$0.GetInteractionResponse> getInteraction($grpc.ServiceCall call, $0.GetInteractionRequest request);
  $async.Future<$0.UpdateInteractionResponse> updateInteraction($grpc.ServiceCall call, $0.UpdateInteractionRequest request);
  $async.Future<$0.DeleteInteractionResponse> deleteInteraction($grpc.ServiceCall call, $0.DeleteInteractionRequest request);
  $async.Future<$0.ListInteractionsResponse> listInteractions($grpc.ServiceCall call, $0.ListInteractionsRequest request);
  $async.Future<$0.CreatePaymentResponse> createPayment($grpc.ServiceCall call, $0.CreatePaymentRequest request);
  $async.Future<$0.GetPaymentResponse> getPayment($grpc.ServiceCall call, $0.GetPaymentRequest request);
  $async.Future<$0.UpdatePaymentResponse> updatePayment($grpc.ServiceCall call, $0.UpdatePaymentRequest request);
  $async.Future<$0.DeletePaymentResponse> deletePayment($grpc.ServiceCall call, $0.DeletePaymentRequest request);
  $async.Future<$0.ListPaymentsResponse> listPayments($grpc.ServiceCall call, $0.ListPaymentsRequest request);
  $async.Future<$0.GetFinancialReportResponse> getFinancialReport($grpc.ServiceCall call, $0.GetFinancialReportRequest request);
  $async.Future<$0.GetSelfProfileResponse> getSelfProfile($grpc.ServiceCall call, $0.GetSelfProfileRequest request);
}
@$pb.GrpcServiceName('proto.AuthService')
class AuthServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/proto.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre($grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.LoginResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get employeeListScreenTitle => 'Employees';

  @override
  String employeeListScreenErrorLoading(String error) {
    return 'Error loading employees: $error';
  }

  @override
  String get employeeListScreenConfirmDeleteTitle => 'Confirm Deletion';

  @override
  String employeeListScreenConfirmDeleteContent(String name) {
    return 'Are you sure you want to delete employee \"$name\"?';
  }

  @override
  String get employeeListScreenConfirmDeleteActionCancel => 'Cancel';

  @override
  String get employeeListScreenConfirmDeleteActionDelete => 'Delete';

  @override
  String employeeListScreenFeedbackSuccessDelete(String name) {
    return 'Employee \"$name\" deleted successfully';
  }

  @override
  String employeeListScreenFeedbackErrorDelete(String error) {
    return 'Error deleting employee: $error';
  }

  @override
  String get employeeListScreenColumnName => 'Name';

  @override
  String get employeeListScreenColumnEmail => 'Email';

  @override
  String get employeeListScreenColumnRole => 'Role';

  @override
  String get employeeListScreenColumnOfficeId => 'Office ID';

  @override
  String get employeeListScreenColumnActive => 'Active';

  @override
  String get employeeListScreenColumnActions => 'Actions';

  @override
  String get employeeListScreenTooltipEdit => 'Edit Employee';

  @override
  String get employeeListScreenTooltipDelete => 'Delete Employee';

  @override
  String get employeeListScreenTooltipRefresh => 'Refresh List';

  @override
  String get employeeListScreenTooltipAdd => 'Add Employee';

  @override
  String get employeeListScreenButtonRetry => 'Retry';

  @override
  String get employeeListScreenNoEmployeesFound => 'No employees found.';

  @override
  String get employeeListScreenButtonAddFirst => 'Add First Employee';

  @override
  String get loginScreenTitle => 'Login';

  @override
  String get usernameHint => 'Username';

  @override
  String get passwordHint => 'Password';

  @override
  String get loginButtonText => 'Login';

  @override
  String get appTitle => 'Flutter Admin Panel';

  @override
  String get signupScreenTitle => 'Sign Up';

  @override
  String get signupButtonText => 'Sign Up';

  @override
  String get createCrmAccountTitle => 'Create CRM Account';

  @override
  String get loginLabelText => 'Login';

  @override
  String get notesLabelText => 'Notes (Optional)';

  @override
  String get confirmPasswordHint => 'Confirm Password';

  @override
  String get pleaseEnterLoginNameError => 'Please enter a login name';

  @override
  String get loginMinLengthError => 'Login must be at least 3 characters';

  @override
  String get pleaseEnterPasswordError => 'Please enter a password';

  @override
  String get passwordMinLengthError => 'Password must be at least 6 characters';

  @override
  String get pleaseConfirmPasswordError => 'Please confirm your password';

  @override
  String get passwordsDoNotMatchError => 'Passwords do not match';

  @override
  String get alreadyHaveAccountButtonText => 'Already have an account? Log In';

  @override
  String userCreatedSuccessMessage(Object userId) {
    return 'User $userId created successfully! Please log in.';
  }

  @override
  String get userFormScreenTitle => 'Create New User';

  @override
  String get loginEmailLabelText => 'Login (Email)';

  @override
  String get loginEmailHintText => 'user@example.com';

  @override
  String get pleaseEnterLoginEmailError => 'Please enter a login email';

  @override
  String get pleaseEnterValidEmailError => 'Please enter a valid email';

  @override
  String get createUserButtonText => 'Create User';

  @override
  String userCreatedSuccessIdMessage(Object userId) {
    return 'User created successfully with ID: $userId';
  }

  @override
  String grpcErrorCreatingUserMessage(Object errorMessage) {
    return 'gRPC Error creating user: $errorMessage';
  }

  @override
  String errorCreatingUserMessage(Object errorMessage) {
    return 'Error creating user: $errorMessage';
  }

  @override
  String get editLendingApplicationTitle => 'Edit Lending Application';

  @override
  String get addLendingApplicationTitle => 'Add Lending Application';

  @override
  String get saveApplicationTooltip => 'Save Application';

  @override
  String get clientLabelText => 'Client';

  @override
  String get pleaseSelectClientError => 'Please select a client';

  @override
  String get managerLabelText => 'Manager';

  @override
  String get pleaseSelectManagerError => 'Please select a manager';

  @override
  String get bankLabelText => 'Bank';

  @override
  String get pleaseSelectBankError => 'Please select a bank';

  @override
  String get requestedAmountLabelText => 'Requested Amount';

  @override
  String get enterRequestedAmountError => 'Enter requested amount';

  @override
  String get approvedAmountLabelText => 'Approved Amount';

  @override
  String applicationDateLabelText(Object date) {
    return 'Application Date: $date';
  }

  @override
  String get pickDateButtonText => 'Pick';

  @override
  String approvalDateLabelText(Object date) {
    return 'Approval Date: $date';
  }

  @override
  String fundsReceivedDateLabelText(Object date) {
    return 'Funds Received Date: $date';
  }

  @override
  String companyContractDateLabelText(Object date) {
    return 'Company Contract Date: $date';
  }

  @override
  String get expectedCommissionLabelText => 'Expected Commission';

  @override
  String get statusLabelText => 'Status';

  @override
  String get pleaseSelectStatusError => 'Please select a status';

  @override
  String get paymentIdLabelText => 'Payment ID';

  @override
  String get notesLabelTextShort => 'Notes';

  @override
  String get companyCommissionPercentLabelText => 'Company Commission Percent';

  @override
  String get calculatedCommissionAmountLabelText =>
      'Calculated Commission Amount';

  @override
  String get commissionPaidLabelText => 'Commission Paid';

  @override
  String get agentCommissionReceivedLabelText => 'Agent Commission Received';

  @override
  String get updateApplicationButtonText => 'Update Application';

  @override
  String get createApplicationButtonText => 'Create Application';

  @override
  String errorLoadingDropdownMessage(Object errorMessage) {
    return 'Error loading dropdown data: $errorMessage';
  }

  @override
  String errorLoadingApplicationMessage(Object errorMessage) {
    return 'Error loading application: $errorMessage';
  }

  @override
  String get applicationUpdatedSuccessMessage =>
      'Application updated successfully';

  @override
  String get applicationCreatedSuccessMessage =>
      'Application created successfully';

  @override
  String errorSavingApplicationMessage(Object errorMessage) {
    return 'Error saving application: $errorMessage';
  }

  @override
  String lendingApplicationFormScreenFeedbackErrorCreating(Object error) {
    return 'Error creating lending application: $error';
  }

  @override
  String lendingApplicationFormScreenFeedbackErrorUpdating(Object error) {
    return 'Error updating lending application: $error';
  }

  @override
  String get clientFormScreenTitleEdit => 'Edit Client';

  @override
  String get clientFormScreenTitleAdd => 'Add Client';

  @override
  String get clientFormScreenSaveTooltip => 'Save Client';

  @override
  String get clientFormScreenLabelFirstName => 'First Name';

  @override
  String get clientFormScreenLabelLastName => 'Last Name';

  @override
  String get clientFormScreenLabelEmail => 'Email';

  @override
  String get clientFormScreenLabelPhone => 'Phone';

  @override
  String get clientFormScreenLabelTelegramId => 'Telegram ID';

  @override
  String get clientFormScreenLabelWhatsappNumber => 'WhatsApp Number';

  @override
  String get clientFormScreenLabelSource => 'Source';

  @override
  String get clientFormScreenHintSource => 'Select Source';

  @override
  String get clientFormScreenLabelPassportData => 'Passport Data (JSON)';

  @override
  String get clientFormScreenLabelNotes => 'Notes';

  @override
  String get clientFormScreenValidationFirstNameRequired =>
      'Please enter a first name';

  @override
  String get clientFormScreenValidationFirstNameMinLength =>
      'First name must be at least 2 characters';

  @override
  String get clientFormScreenValidationLastNameRequired =>
      'Please enter a last name';

  @override
  String get clientFormScreenValidationLastNameMinLength =>
      'Last name must be at least 2 characters';

  @override
  String get clientFormScreenValidationEmailRequired =>
      'Please enter an email address';

  @override
  String get clientFormScreenValidationEmailInvalid =>
      'Please enter a valid email address';

  @override
  String get clientFormScreenValidationPhoneRequired =>
      'Please enter a phone number';

  @override
  String get clientFormScreenValidationSourceRequired =>
      'Please select a source';

  @override
  String get clientFormScreenButtonUpdate => 'Update Client';

  @override
  String get clientFormScreenButtonCreate => 'Create Client';

  @override
  String clientFormScreenFeedbackErrorLoading(String error) {
    return 'Error loading client data: $error';
  }

  @override
  String clientFormScreenFeedbackErrorInvalidJson(String error) {
    return 'Invalid JSON for passport data: $error';
  }

  @override
  String get clientFormScreenFeedbackSuccessUpdate =>
      'Client updated successfully';

  @override
  String get clientFormScreenFeedbackSuccessCreate =>
      'Client created successfully';

  @override
  String clientFormScreenFeedbackErrorGrpc(String errorMessage) {
    return 'gRPC Error saving client: $errorMessage';
  }

  @override
  String clientFormScreenFeedbackErrorGeneric(String error) {
    return 'Error saving client: $error';
  }

  @override
  String get clientListScreenTitle => 'Clients';

  @override
  String get clientListScreenTooltipAdd => 'Add Client';

  @override
  String get clientListScreenTooltipEdit => 'Edit Client';

  @override
  String get clientListScreenTooltipDelete => 'Delete Client';

  @override
  String get translationOrderListScreenColumnActions => 'Actions';

  @override
  String get translationOrderListScreenTooltipEdit => 'Edit Order';

  @override
  String get translationOrderListScreenTooltipDelete => 'Delete Order';

  @override
  String get clientListScreenConfirmDeleteTitle => 'Confirm Delete';

  @override
  String clientListScreenConfirmDeleteContent(String clientName) {
    return 'Are you sure you want to delete client $clientName?';
  }

  @override
  String get clientListScreenConfirmDeleteActionCancel => 'Cancel';

  @override
  String get clientListScreenConfirmDeleteActionDelete => 'Delete';

  @override
  String clientListScreenFeedbackSuccessDelete(String clientName) {
    return 'Client $clientName deleted successfully';
  }

  @override
  String clientListScreenFeedbackErrorDelete(String clientId, String error) {
    return 'Error deleting client $clientId: $error';
  }

  @override
  String clientListScreenErrorLoading(String error) {
    return 'Error loading clients: $error';
  }

  @override
  String get clientListScreenButtonRetry => 'Retry';

  @override
  String get clientListScreenNoClientsFound =>
      'No clients found. Tap + to add a new client or pull down to refresh.';

  @override
  String get clientListScreenColumnId => 'ID';

  @override
  String get clientListScreenColumnFirstName => 'First Name';

  @override
  String get clientListScreenColumnLastName => 'Last Name';

  @override
  String get clientListScreenColumnPhone => 'Phone';

  @override
  String get clientListScreenColumnEmail => 'Email';

  @override
  String get clientListScreenColumnTelegramId => 'Telegram ID';

  @override
  String get clientListScreenColumnWhatsapp => 'WhatsApp';

  @override
  String get clientListScreenColumnSource => 'Source';

  @override
  String get clientListScreenColumnPassportData => 'Passport Data';

  @override
  String get clientListScreenColumnNotes => 'Notes';

  @override
  String get clientListScreenColumnActions => 'Actions';

  @override
  String get clientListScreenDefaultClientName => 'this client';

  @override
  String get clientListScreenSourceUnspecified => 'Unspecified';

  @override
  String get lendingApplicationListScreenTitle => 'Lending Applications';

  @override
  String get lendingApplicationListScreenTooltipAdd => 'Add Application';

  @override
  String get lendingApplicationListScreenTooltipEdit => 'Edit Application';

  @override
  String get lendingApplicationListScreenTooltipDelete => 'Delete Application';

  @override
  String get lendingApplicationListScreenConfirmDeleteTitle =>
      'Delete Application?';

  @override
  String get lendingApplicationListScreenConfirmDeleteContent =>
      'Are you sure you want to delete this application?';

  @override
  String get lendingApplicationListScreenActionCancel => 'Cancel';

  @override
  String get lendingApplicationListScreenActionDelete => 'Delete';

  @override
  String get lendingApplicationListScreenFeedbackSuccessDelete =>
      'Application deleted successfully';

  @override
  String lendingApplicationListScreenFeedbackErrorDelete(String error) {
    return 'Error deleting application: $error';
  }

  @override
  String lendingApplicationListScreenErrorLoading(String error) {
    return 'Error: $error';
  }

  @override
  String get lendingApplicationListScreenNoApplicationsFound =>
      'No lending applications found.';

  @override
  String get lendingApplicationListScreenListItemNoId => 'No ID';

  @override
  String lendingApplicationListScreenListItemSubtitle(
      String clientId, String managerId, String bankId) {
    return 'Client: $clientId\nManager: $managerId\nBank: $bankId';
  }

  @override
  String get trainingCourseFormScreenTitleEdit => 'Edit Course';

  @override
  String get trainingCourseFormScreenTitleAdd => 'Add Course';

  @override
  String get trainingCourseFormScreenLabelName => 'Course Name';

  @override
  String get trainingCourseFormScreenLabelPrice => 'Price';

  @override
  String get trainingCourseFormScreenLabelCommission => 'Commission Percent';

  @override
  String get trainingCourseFormScreenLabelDescription => 'Description';

  @override
  String get trainingCourseFormScreenLabelNotes => 'Notes';

  @override
  String get trainingCourseFormScreenValidationRequired => 'Required';

  @override
  String get trainingCourseFormScreenButtonUpdate => 'Update Course';

  @override
  String get trainingCourseFormScreenButtonCreate => 'Create Course';

  @override
  String trainingCourseFormScreenFeedbackErrorLoading(String error) {
    return 'Error loading course: $error';
  }

  @override
  String get trainingCourseFormScreenFeedbackSuccessUpdate =>
      'Course updated successfully';

  @override
  String get trainingCourseFormScreenFeedbackSuccessCreate =>
      'Course created successfully';

  @override
  String trainingCourseFormScreenFeedbackErrorSaving(Object error) {
    return 'Error saving course: $error';
  }

  @override
  String get trainingCourseListScreenTitle => 'Training Courses';

  @override
  String get trainingCourseListScreenTooltipAdd => 'Add Course';

  @override
  String get trainingCourseListScreenTooltipEdit => 'Edit Course';

  @override
  String get trainingCourseListScreenTooltipDelete => 'Delete Course';

  @override
  String get trainingCourseListScreenConfirmDeleteTitle => 'Delete Course?';

  @override
  String get trainingCourseListScreenConfirmDeleteContent =>
      'Are you sure you want to delete this course?';

  @override
  String get trainingCourseListScreenActionCancel => 'Cancel';

  @override
  String get trainingCourseListScreenActionDelete => 'Delete';

  @override
  String get trainingCourseListScreenFeedbackSuccessDelete =>
      'Course deleted successfully';

  @override
  String trainingCourseListScreenFeedbackErrorDelete(String error) {
    return 'Error deleting course: $error';
  }

  @override
  String trainingCourseListScreenErrorLoading(String error) {
    return 'Error: $error';
  }

  @override
  String get trainingCourseListScreenNoCoursesFound =>
      'No training courses found.';

  @override
  String get trainingCourseListScreenListItemNoName => 'No Name';

  @override
  String trainingCourseListScreenListItemSubtitle(
      String price, String commission) {
    return 'Price: $price\nCommission: $commission%';
  }

  @override
  String get mainScreenNotLoggedIn => 'Not logged in';

  @override
  String mainScreenRoleLabel(String roleName) {
    return 'Role: $roleName';
  }

  @override
  String get mainScreenUserLoginDefault => 'User';

  @override
  String get sideMenuDashboard => 'Dashboard';

  @override
  String get sideMenuClients => 'Clients';

  @override
  String get sideMenuEmployees => 'Employees';

  @override
  String get sideMenuTranslations => 'Translations';

  @override
  String get sideMenuInsurancePolicies => 'Insurance Policies';

  @override
  String get sideMenuTrainingCourses => 'Training Courses';

  @override
  String get sideMenuBusinessRegistrations => 'Business Registrations';

  @override
  String get sideMenuLendingApplications => 'Lending Applications';

  @override
  String get sideMenuAdminTools => 'Admin Tools';

  @override
  String get sideMenuCreateUser => 'Create User';

  @override
  String get sideMenuTask => 'Task';

  @override
  String get sideMenuStore => 'Store';

  @override
  String get sideMenuNotification => 'Notification';

  @override
  String get sideMenuProfile => 'Profile';

  @override
  String get sideMenuSettings => 'Settings';

  @override
  String get sideMenuLogout => 'Logout';

  @override
  String get dashboardHeaderTitle => 'Dashboard';

  @override
  String get dashboardHeaderProfileCardUserDefault => 'User';

  @override
  String get dashboardHeaderProfileCardNotLoggedIn => 'Not Logged In';

  @override
  String get dashboardHeaderSearchHint => 'Search';

  @override
  String get dashboardMyFilesTitle => 'My Files';

  @override
  String get dashboardMyFilesAddNewButton => 'Add New';

  @override
  String get dashboardRecentFilesTitle => 'Recent Files';

  @override
  String get dashboardRecentFilesColumnFileName => 'File Name';

  @override
  String get dashboardRecentFilesColumnDate => 'Date';

  @override
  String get dashboardRecentFilesColumnSize => 'Size';

  @override
  String get dashboardStorageDetailsTitle => 'Storage Details';

  @override
  String get dashboardStorageDetailsDocumentsFiles => 'Documents Files';

  @override
  String get dashboardStorageDetailsMediaFiles => 'Media Files';

  @override
  String get dashboardStorageDetailsOtherFiles => 'Other Files';

  @override
  String get dashboardStorageDetailsUnknown => 'Unknown';

  @override
  String get translationOrderListScreenTitle => 'Translation Orders';

  @override
  String get translationOrderListScreenDeleteOrderDialogTitle =>
      'Delete Order?';

  @override
  String get translationOrderListScreenDeleteOrderDialogContent =>
      'Are you sure you want to delete this order?';

  @override
  String get translationOrderListScreenDeleteOrderDialogCancelButton =>
      'Cancel';

  @override
  String get translationOrderListScreenDeleteOrderDialogDeleteButton =>
      'Delete';

  @override
  String get translationOrderListScreenOrderDeletedSuccess =>
      'Order deleted successfully';

  @override
  String translationOrderListScreenErrorDeletingOrder(String error) {
    return 'Error deleting order: $error';
  }

  @override
  String translationOrderListScreenErrorLoading(String error) {
    return 'Error: $error';
  }

  @override
  String get translationOrderListScreenNoOrdersFound =>
      'No translation orders found.';

  @override
  String get translationOrderListScreenUntitledOrder => 'Untitled Order';

  @override
  String translationOrderListScreenOrderIdLabel(String orderId) {
    return 'Order ID: $orderId';
  }

  @override
  String translationOrderListScreenOrderTitleLabel(String title) {
    return 'Title: $title';
  }

  @override
  String translationOrderListScreenOrderStatusLabel(String status) {
    return 'Status: $status';
  }

  @override
  String translationOrderListScreenOrderCreatedLabel(String date) {
    return 'Created: $date';
  }

  @override
  String translationOrderListScreenOrderDoneLabel(String date) {
    return 'Done: $date';
  }

  @override
  String get translationOrderListScreenCreateNewOrderTooltip =>
      'Create New Order';

  @override
  String get translationOrderListScreenCustomerNameLabel => 'Customer Name';

  @override
  String get translationOrderFormScreenSectionTitleOrderDetails =>
      'Order Details';

  @override
  String get translationOrderFormScreenSectionTitleDocumentDetails =>
      'Document Details';

  @override
  String get translationOrderFormScreenSectionTitleFinancialDetails =>
      'Financial Details';

  @override
  String get translationOrderFormScreenSectionTitleAdditionalInformation =>
      'Additional Information';

  @override
  String get translationOrderFormScreenCreateTitle => 'Create Order';

  @override
  String get translationOrderFormScreenEditTitle => 'Edit Order';

  @override
  String get translationOrderFormScreenSaveChangesTooltip => 'Save Order';

  @override
  String translationOrderFormScreenErrorLoadingData(String error) {
    return 'Error loading initial data: $error';
  }

  @override
  String translationOrderFormScreenErrorSavingOrder(String error) {
    return 'Error saving order: $error';
  }

  @override
  String get translationOrderFormScreenOrderCreatedSuccess =>
      'Order created successfully';

  @override
  String get translationOrderFormScreenOrderUpdatedSuccess =>
      'Order updated successfully';

  @override
  String get translationOrderFormScreenOrderDeletedSuccess =>
      'Order deleted successfully';

  @override
  String translationOrderFormScreenErrorDeletingOrder(String error) {
    return 'Error deleting order: $error';
  }

  @override
  String get translationOrderFormScreenFieldTitleLabel => 'Title *';

  @override
  String get translationOrderFormScreenFieldTitleValidation =>
      'Please enter a title';

  @override
  String get translationOrderFormScreenFieldDoneAtLabel =>
      'Done At (Completion Date)';

  @override
  String get translationOrderFormScreenFieldClientLabel => 'Client *';

  @override
  String get translationOrderFormScreenFieldClientHint => 'Select Client';

  @override
  String get translationOrderFormScreenFieldClientValidation =>
      'Please select a client';

  @override
  String get translationOrderFormScreenFieldManagerLabel => 'Manager *';

  @override
  String get translationOrderFormScreenFieldManagerHint => 'Select Manager';

  @override
  String get translationOrderFormScreenFieldManagerValidation =>
      'Please select a manager';

  @override
  String get translationOrderFormScreenFieldOfficeLabel => 'Office *';

  @override
  String get translationOrderFormScreenFieldOfficeHint => 'Select Office';

  @override
  String get translationOrderFormScreenFieldOfficeValidation =>
      'Please select an office';

  @override
  String get translationOrderFormScreenFieldSourceLanguageLabel =>
      'Source Language';

  @override
  String get translationOrderFormScreenFieldTargetLanguageLabel =>
      'Target Language';

  @override
  String get translationOrderFormScreenFieldDocumentTypeLabel =>
      'Document Type';

  @override
  String get translationOrderFormScreenFieldDocumentTypeHint =>
      'Select Document Type';

  @override
  String get translationOrderFormScreenFieldPageCountLabel => 'Page Count';

  @override
  String get translationOrderFormScreenFieldNotarialSumLabel =>
      'Notarial Sum *';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationRequired =>
      'Please enter notarial sum';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationNumber =>
      'Please enter a valid number';

  @override
  String get translationOrderFormScreenFieldPriorityLabel => 'Priority *';

  @override
  String get translationOrderFormScreenFieldPriorityHint => 'Select Priority';

  @override
  String get translationOrderFormScreenFieldPriorityValidation =>
      'Please select priority';

  @override
  String get translationOrderFormScreenFieldPaymentIdLabel => 'Payment ID';

  @override
  String get translationOrderFormScreenFieldTranslatorLabel => 'Translator';

  @override
  String get translationOrderFormScreenFieldTranslatorHint =>
      'Select Translator (Optional)';

  @override
  String get translationOrderFormScreenFieldStatusLabel => 'Status (Read-Only)';

  @override
  String get translationOrderFormScreenFieldNotesLabel => 'Notes';

  @override
  String get translationOrderFormScreenSwitchUrgent => 'Urgent';

  @override
  String get translationOrderFormScreenSwitchSemiUrgent => 'Semi-Urgent';

  @override
  String get translationOrderFormScreenSwitchClientNotified =>
      'Client Notified';

  @override
  String get translationOrderFormScreenDeleteButton => 'Delete Order';

  @override
  String get translationOrderFormScreenDeleteDialogTitle => 'Delete Order?';

  @override
  String get translationOrderFormScreenDeleteDialogContent =>
      'Are you sure you want to delete this order?';

  @override
  String get translationOrderFormScreenDeleteDialogCancelButton => 'Cancel';

  @override
  String get translationOrderFormScreenDeleteDialogDeleteButton => 'Delete';

  @override
  String translationOrderFormScreenDisplayEmployee(String name, String id) {
    return '$name ($id...)';
  }

  @override
  String translationOrderFormScreenDisplayOffice(String city, String id) {
    return '$city ($id...)';
  }

  @override
  String translationOrderFormScreenDisplayClient(
      String firstName, String lastName, String id) {
    return '$firstName $lastName ($id...)';
  }

  @override
  String get translationOrderFormScreenStatusNotAvailable => 'N/A';

  @override
  String get insurancePolicyListScreenTitle => 'Insurance Policies';

  @override
  String get insurancePolicyListScreenAddPolicyTooltip => 'Add Policy';

  @override
  String get insurancePolicyListScreenDeleteDialogTitle => 'Delete Policy?';

  @override
  String get insurancePolicyListScreenDeleteDialogContent =>
      'Are you sure you want to delete this policy?';

  @override
  String get insurancePolicyListScreenDeleteDialogCancelButton => 'Cancel';

  @override
  String get insurancePolicyListScreenDeleteDialogDeleteButton => 'Delete';

  @override
  String get insurancePolicyListScreenPolicyDeletedSuccess =>
      'Policy deleted successfully';

  @override
  String insurancePolicyListScreenErrorDeletingPolicy(String error) {
    return 'Error deleting policy: $error';
  }

  @override
  String insurancePolicyListScreenErrorLoading(String error) {
    return 'Error: $error';
  }

  @override
  String get insurancePolicyListScreenNoPoliciesFound =>
      'No insurance policies found.';

  @override
  String get insurancePolicyListScreenNoPolicyNumber => 'No Policy Number';

  @override
  String insurancePolicyListScreenListItemSubtitle(
      String clientId, String managerId, String amount) {
    return 'Client: $clientId\nManager: $managerId\nAmount: $amount';
  }

  @override
  String get insurancePolicyListScreenEditPolicyTooltip => 'Edit Policy';

  @override
  String get insurancePolicyListScreenDeletePolicyTooltip => 'Delete Policy';

  @override
  String get insurancePolicyId => 'ID';

  @override
  String get insurancePolicyClient => 'Client';

  @override
  String get insurancePolicyPolicyNumber => 'Policy Number';

  @override
  String get insurancePolicyType => 'Type';

  @override
  String get insurancePolicyStartDate => 'Start Date';

  @override
  String get insurancePolicyEndDate => 'End Date';

  @override
  String get insurancePolicyPremium => 'Premium';

  @override
  String get insurancePolicyStatus => 'Status';

  @override
  String get insurancePolicyCoverageDetails => 'Coverage Details';

  @override
  String get confirmDeleteInsurancePolicyTitle => 'Confirm Delete';

  @override
  String get confirmDeleteInsurancePolicyMessage =>
      'Are you sure you want to delete this insurance policy?';

  @override
  String get insurancePolicyDeletedSuccess =>
      'Insurance policy deleted successfully';

  @override
  String errorDeletingInsurancePolicy(Object error) {
    return 'Error deleting insurance policy: $error';
  }

  @override
  String get noInsurancePoliciesFound => 'No insurance policies found';

  @override
  String get interactionListUnspecifiedType => 'Unspecified';

  @override
  String get interactionTypeCall => 'Call';

  @override
  String get interactionTypeEmail => 'Email';

  @override
  String get interactionTypeMeeting => 'Meeting';

  @override
  String get interactionListConfirmDeleteTitle => 'Confirm Delete';

  @override
  String get interactionListConfirmDeleteMessage => 'Delete this interaction?';

  @override
  String get interactionListCancelButton => 'Cancel';

  @override
  String get interactionListDeleteButton => 'Delete';

  @override
  String get interactionListDeletedSuccess => 'Deleted';

  @override
  String interactionListErrorDeleting(Object error) {
    return 'Error deleting: $error';
  }

  @override
  String get interactionListTitle => 'All Interactions';

  @override
  String interactionListErrorLoading(Object error) {
    return 'Error loading interactions: $error';
  }

  @override
  String get interactionListNoInteractionsFound => 'No interactions found.';

  @override
  String get interactionListManagerHeader => 'Manager';

  @override
  String get interactionListSummaryHeader => 'Summary';

  @override
  String get interactionListIdHeader => 'ID';

  @override
  String get interactionListClientHeader => 'Client';

  @override
  String get interactionListEmployeeHeader => 'Employee';

  @override
  String get interactionListDateHeader => 'Date';

  @override
  String get interactionListTypeHeader => 'Type';

  @override
  String get interactionListDescriptionHeader => 'Description';

  @override
  String get interactionListSubjectHeader => 'Subject';

  @override
  String get interactionListEndTimeHeader => 'End Time';

  @override
  String get interactionListScheduledHeader => 'Scheduled';

  @override
  String get interactionListCompletedHeader => 'Completed';

  @override
  String get interactionListNotesHeader => 'Notes';

  @override
  String get interactionListActionsHeader => 'Actions';

  @override
  String get interactionListYes => 'Yes';

  @override
  String get interactionListNo => 'No';

  @override
  String get interactionListEditInteractionTooltip => 'Edit Interaction';

  @override
  String get interactionListDeleteInteractionTooltip => 'Delete Interaction';

  @override
  String get interactionListDetailsDialogTitle => 'Interaction Details';

  @override
  String get interactionListCloseButton => 'Close';

  @override
  String get insurancePolicyFormEditPolicyTitle => 'Edit Policy';

  @override
  String get insurancePolicyFormAddPolicyTitle => 'Add Policy';

  @override
  String insurancePolicyFormErrorLoadingPolicy(Object error) {
    return 'Error loading policy: $error';
  }

  @override
  String get insurancePolicyFormPolicyUpdatedSuccess =>
      'Policy updated successfully';

  @override
  String get insurancePolicyFormPolicyCreatedSuccess =>
      'Policy created successfully';

  @override
  String insurancePolicyFormErrorSavingPolicy(Object error) {
    return 'Error saving policy: $error';
  }

  @override
  String get insurancePolicyFormPolicyNumberLabel => 'Policy Number';

  @override
  String get insurancePolicyFormClientIdLabel => 'Client ID';

  @override
  String get insurancePolicyFormManagerIdLabel => 'Manager ID';

  @override
  String get insurancePolicyFormAmountLabel => 'Amount';

  @override
  String get insurancePolicyFormStartDateLabel => 'Start Date';

  @override
  String insurancePolicyFormStartDatePickerPrefix(Object date) {
    return 'Start: $date';
  }

  @override
  String get insurancePolicyFormExpiryDateLabel => 'Expiry Date';

  @override
  String insurancePolicyFormExpiryDatePickerPrefix(Object date) {
    return 'Expiry: $date';
  }

  @override
  String get insurancePolicyFormPickDateButton => 'Pick';

  @override
  String get insurancePolicyFormStatusLabel => 'Status';

  @override
  String get insurancePolicyFormRenewalStatusLabel => 'Renewal Status';

  @override
  String get insurancePolicyFormNotesLabel => 'Notes';

  @override
  String get insurancePolicyFormUpdatePolicyButton => 'Update Policy';

  @override
  String get insurancePolicyFormCreatePolicyButton => 'Create Policy';

  @override
  String get insurancePolicyFormRequiredField => 'Required';

  @override
  String get insurancePolicyFormScreenTitleEdit => 'Edit Policy';

  @override
  String get insurancePolicyFormScreenTitleAdd => 'Add Policy';

  @override
  String insurancePolicyFormScreenFeedbackErrorLoading(String error) {
    return 'Error loading policy: $error';
  }

  @override
  String get insurancePolicyFormScreenFeedbackSuccessUpdate =>
      'Policy updated successfully';

  @override
  String get insurancePolicyFormScreenFeedbackSuccessCreate =>
      'Policy created successfully';

  @override
  String insurancePolicyFormScreenFeedbackErrorSaving(String error) {
    return 'Error saving policy: $error';
  }

  @override
  String get insurancePolicyFormScreenValidationRequired => 'Required';

  @override
  String get insurancePolicyFormScreenLabelPolicyNumber => 'Policy Number';

  @override
  String get insurancePolicyFormScreenLabelClientId => 'Client ID';

  @override
  String get insurancePolicyFormScreenLabelManagerId => 'Manager ID';

  @override
  String get insurancePolicyFormScreenLabelAmount => 'Amount';

  @override
  String insurancePolicyFormScreenLabelStartDateWithValue(String date) {
    return 'Start Date: $date';
  }

  @override
  String get insurancePolicyFormScreenLabelStartDate => 'Start Date';

  @override
  String insurancePolicyFormScreenLabelExpiryDateWithValue(String date) {
    return 'Expiry Date: $date';
  }

  @override
  String get insurancePolicyFormScreenLabelExpiryDate => 'Expiry Date';

  @override
  String get insurancePolicyFormScreenPickDateButton => 'Pick';

  @override
  String get insurancePolicyFormScreenLabelStatus => 'Status';

  @override
  String get insurancePolicyFormScreenLabelRenewalStatus => 'Renewal Status';

  @override
  String get insurancePolicyFormScreenLabelNotes => 'Notes';

  @override
  String get insurancePolicyFormScreenButtonUpdate => 'Update Policy';

  @override
  String get insurancePolicyFormScreenButtonCreate => 'Create Policy';

  @override
  String signupScreenErrorSignupFailed(String errorMessage) {
    return 'Signup failed: $errorMessage';
  }

  @override
  String signupScreenErrorUnexpected(String error) {
    return 'An unexpected error occurred: $error';
  }

  @override
  String get loginScreenSignUpPromptText => 'Don\'t have an account? Sign Up';

  @override
  String get loginScreenUsernameValidationEmpty => 'Please enter your username';

  @override
  String get loginScreenPasswordValidationEmpty => 'Please enter your password';

  @override
  String get loginScreenErrorLoginFailed => 'Login failed. Please try again.';

  @override
  String loginScreenErrorLoginFailedWithDetails(String details) {
    return 'Login failed: $details';
  }

  @override
  String loginScreenErrorUnexpected(String error) {
    return 'An unexpected error occurred: $error';
  }

  @override
  String get interactionFormScreenTitleAdd => 'Add Interaction';

  @override
  String get interactionFormScreenTitleEdit => 'Edit Interaction';

  @override
  String get interactionFormScreenLabelClient => 'Client';

  @override
  String get interactionFormScreenLabelEmployee => 'Employee';

  @override
  String get interactionFormScreenLabelInteractionType => 'Interaction Type';

  @override
  String get interactionFormScreenValidationSelectClient =>
      'Please select a client';

  @override
  String get interactionFormScreenValidationSelectEmployee =>
      'Please select an employee';

  @override
  String get interactionFormScreenValidationSelectType =>
      'Please select a type';

  @override
  String interactionFormScreenLabelInteractionDate(String date) {
    return 'Interaction Date: $date';
  }

  @override
  String get interactionFormScreenLabelDateNotSet => 'Not set';

  @override
  String interactionFormScreenLabelEndTime(String time) {
    return 'End Time: $time';
  }

  @override
  String get interactionFormScreenLabelSubject => 'Subject';

  @override
  String get interactionFormScreenValidationEnterSubject =>
      'Please enter a subject';

  @override
  String get interactionFormScreenLabelDescription => 'Description';

  @override
  String get interactionFormScreenLabelNotes => 'Notes';

  @override
  String get interactionFormScreenCheckboxScheduled => 'Scheduled';

  @override
  String get interactionFormScreenCheckboxCompleted => 'Completed';

  @override
  String interactionFormScreenFeedbackErrorLoading(String error) {
    return 'Failed to load initial data: $error';
  }

  @override
  String get interactionFormScreenFeedbackSuccessCreate =>
      'Interaction created successfully';

  @override
  String get interactionFormScreenFeedbackSuccessUpdate =>
      'Interaction updated successfully';

  @override
  String interactionFormScreenFeedbackErrorSaving(String error) {
    return 'Failed to save interaction: $error';
  }

  @override
  String interactionFormScreenFeedbackErrorUnexpected(String error) {
    return 'An unexpected error occurred: $error';
  }
}

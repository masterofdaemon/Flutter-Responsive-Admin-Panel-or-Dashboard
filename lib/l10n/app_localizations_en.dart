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
  String get employeeLoginScreenTitle => 'Employee Login';

  @override
  String get loginAsEmployee => 'Login as Employee';

  @override
  String get loginAsUser => 'Login as User';

  @override
  String get employeeUsernameHint => 'Employee Username';

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
  String get clientFormScreenLabelMiddleName => 'Middle Name (Optional)';

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
  String get clientFormScreenValidationPhoneInvalid =>
      'Please enter a valid Russian phone number (+7 format)';

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
  String get translationOrderListScreenTooltipEdit => 'Edit Translation Order';

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
  String get sideMenuOffices => 'Offices';

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
  String get sideMenuBanks => 'Banks';

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
  String get logoutConfirmationTitle => 'Logout';

  @override
  String get logoutConfirmationMessage => 'Are you sure you want to logout?';

  @override
  String get logoutConfirmationCancel => 'Cancel';

  @override
  String get logoutConfirmationConfirm => 'Logout';

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
  String get translationOrderFormScreenFieldClientNameLabel => 'Client Name';

  @override
  String get translationOrderFormScreenFieldClientNameHint =>
      'Enter client name (optional)';

  @override
  String get translationOrderFormScreenFieldManagerLabel => 'Manager *';

  @override
  String get translationOrderFormScreenFieldManagerHint => 'Assign manager';

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
  String get translationOrderFormScreenFieldNotarialSumLabel => 'Notarial Sum';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationRequired =>
      'Notarial sum is required.';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationNumber =>
      'Please enter a valid number for the notarial sum';

  @override
  String get priorityNormal => 'Normal';

  @override
  String get priorityUrgent => 'Urgent';

  @override
  String get prioritySemiUrgent => 'Semi-Urgent';

  @override
  String get clientSourceReferral => 'Referral';

  @override
  String get clientSourceOnline => 'Online';

  @override
  String get clientSourceWalkIn => 'Walk-In';

  @override
  String get clientSourcePartner => 'Partner';

  @override
  String get clientSourceOther => 'Other';

  @override
  String get clientSourceUnspecified => 'Unspecified';

  @override
  String get clientSourceColumnTitle => 'Source';

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
  String get translationOrderFormScreenFieldTranslationProgressLabel =>
      'Translation Progress (Read-Only)';

  @override
  String get translationOrderFormScreenTranslationProgressNotAvailable =>
      'Translation Progress Not Available';

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
  String get translationOrderFormScreenFieldCompletionDateLabel =>
      'Completion Date';

  @override
  String get translationOrderFormScreenFieldCompletionDateHint =>
      'Select completion date';

  @override
  String get translationOrderFormScreenFieldNotarialSumHint =>
      'Enter notarial sum';

  @override
  String get translationOrderFormScreenFieldPaymentIdHint =>
      'Enter payment reference';

  @override
  String get translationOrderFormScreenFieldTotalSumLabel => 'Total Sum';

  @override
  String get translationOrderFormScreenFieldTotalSumHint =>
      'Calculated automatically from pricing';

  @override
  String get translationOrderFormScreenSectionTitleActions => 'Actions';

  @override
  String get translationOrderFormScreenSectionTitlePricingPayment =>
      'Pricing & Payment';

  @override
  String get translationOrderFormScreenButtonSaving => 'Saving...';

  @override
  String get translationOrderFormScreenButtonSaveOrder => 'Save Order';

  @override
  String get translationOrderFormScreenDialogConfirmDeleteTitle =>
      'Confirm Deletion';

  @override
  String get translationOrderFormScreenDialogConfirmDeleteMessage =>
      'Are you sure you want to delete this order? This action cannot be undone.';

  @override
  String get translationOrderFormScreenDialogButtonCancel => 'Cancel';

  @override
  String get translationOrderFormScreenDialogButtonDelete => 'Delete';

  @override
  String get translationOrderFormScreenButtonDeleteOrder => 'Delete Order';

  @override
  String get translationOrderFormScreenAppBarTitleCreate => 'Create Order';

  @override
  String get translationOrderFormScreenAppBarTitleUpdate => 'Update Order';

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

  @override
  String get translationOrderListScreenColumnBlank => 'Blank';

  @override
  String get translationOrderListScreenColumnIncorrectBlank =>
      'Incorrect Blank';

  @override
  String get translationOrderListScreenColumnTotalSum => 'Total Sum';

  @override
  String get translationOrderListScreenColumnDocumentType => 'Document Type';

  @override
  String get translationOrderListScreenColumnCreatedAt => 'Created At';

  @override
  String get translationOrderListScreenColumnDoneAt => 'Done At';

  @override
  String get translationOrderListScreenColumnNotariallyCertified =>
      'Notarially Certified';

  @override
  String get translationOrderListScreenValueYes => 'Yes';

  @override
  String get translationOrderListScreenValueNo => 'No';

  @override
  String get translationOrderListScreenTooltipAdd =>
      'Add new translation order';

  @override
  String get documentTypePassport => 'Passport';

  @override
  String get documentTypeDiploma => 'Diploma';

  @override
  String get documentTypeBirthCertificate => 'Birth Certificate';

  @override
  String get documentTypeContract => 'Contract';

  @override
  String get documentTypeOther => 'Other';

  @override
  String get documentTypePassportRf => 'Russian Passport';

  @override
  String get documentTypePassportForeign => 'Foreign Passport';

  @override
  String get documentTypePassportInternal => 'Internal Passport';

  @override
  String get documentTypeDriverLicense => 'Driver\'s License';

  @override
  String get documentTypeMarriageCertificate => 'Marriage Certificate';

  @override
  String get documentTypeDivorceCertificate => 'Divorce Certificate';

  @override
  String get documentTypeDeathCertificate => 'Death Certificate';

  @override
  String get documentTypeDiplomaHigher => 'Higher Education Diploma';

  @override
  String get documentTypeDiplomaSecondary => 'Secondary Education Diploma';

  @override
  String get documentTypeTranscript => 'Academic Transcript';

  @override
  String get documentTypeCertificateCourse => 'Course Certificate';

  @override
  String get documentTypeMedicalCertificate => 'Medical Certificate';

  @override
  String get documentTypeVaccinationRecord => 'Vaccination Record';

  @override
  String get documentTypePowerOfAttorney => 'Power of Attorney';

  @override
  String get documentTypeCourtDecision => 'Court Decision';

  @override
  String get documentTypeApostille => 'Apostille';

  @override
  String get documentTypeBankStatement => 'Bank Statement';

  @override
  String get documentTypeIncomeCertificate => 'Income Certificate';

  @override
  String get employeeFormScreenTitleEdit => 'Edit Employee';

  @override
  String get employeeFormScreenTitleAdd => 'Add Employee';

  @override
  String get employeeFormScreenLabelSelectUser => 'Select User';

  @override
  String get employeeFormScreenValidationUserRequired => 'User is required';

  @override
  String get employeeFormScreenLabelUserAccount => 'User Account';

  @override
  String get employeeFormScreenErrorCannotChangeUser =>
      'Cannot change user for existing employee.';

  @override
  String get employeeFormScreenLabelEmployeeLogin => 'Employee Login';

  @override
  String get employeeFormScreenValidationLoginRequired =>
      'Please enter an employee login';

  @override
  String get employeeFormScreenLabelEmployeePassword => 'Employee Password';

  @override
  String get employeeFormScreenValidationPasswordRequired =>
      'Please enter a password';

  @override
  String get employeeFormScreenValidationPasswordMinLength =>
      'Password must be at least 6 characters';

  @override
  String get employeeFormScreenLabelFullName => 'Full Name';

  @override
  String get employeeFormScreenValidationNameRequired =>
      'Please enter employee name';

  @override
  String get employeeFormScreenLabelEmail => 'Email';

  @override
  String get employeeFormScreenValidationEmailRequired =>
      'Please enter an email';

  @override
  String get employeeFormScreenValidationEmailInvalid =>
      'Please enter a valid email';

  @override
  String get employeeFormScreenLabelSelectRole => 'Select Role';

  @override
  String get employeeFormScreenValidationRoleRequired => 'Role is required';

  @override
  String get employeeFormScreenLabelRole => 'Role';

  @override
  String get employeeFormScreenLabelSelectOffice => 'Select Office';

  @override
  String get employeeFormScreenValidationOfficeRequired => 'Office is required';

  @override
  String get employeeFormScreenLabelOffice => 'Office';

  @override
  String get employeeFormScreenLabelTelegramId => 'Telegram ID';

  @override
  String get employeeFormScreenLabelWhatsappNumber => 'WhatsApp Number';

  @override
  String get employeeFormScreenLabelNotes => 'Notes';

  @override
  String get employeeFormScreenLabelActive => 'Active';

  @override
  String get employeeFormScreenButtonUpdate => 'Update Employee';

  @override
  String get employeeFormScreenButtonCreate => 'Create Employee';

  @override
  String employeeFormScreenFeedbackErrorLoading(String error) {
    return 'Error loading employee: $error';
  }

  @override
  String get employeeFormScreenFeedbackSuccessUpdate =>
      'Employee updated successfully';

  @override
  String get employeeFormScreenFeedbackSuccessCreate =>
      'Employee created successfully';

  @override
  String employeeFormScreenFeedbackErrorSaving(String error) {
    return 'Error saving employee: $error';
  }

  @override
  String employeeFormScreenFeedbackErrorLoadingDropdowns(String error) {
    return 'Error loading dropdown data: $error';
  }

  @override
  String get employeeFormScreenValidationWhatsappInvalid =>
      'Please enter a valid Russian phone number (+7XXXXXXXXXX)';

  @override
  String get employeeFormScreenHintWhatsappNumber => '+7XXXXXXXXXX';

  @override
  String get translationOrderFormScreenCreateNewTitle =>
      'Create New Translation Order';

  @override
  String get translationOrderFormScreenEditTitleFull =>
      'Edit Translation Order';

  @override
  String get translationOrderFormScreenCreateDescription =>
      'Fill in the details to create a new translation order';

  @override
  String get translationOrderFormScreenEditDescription =>
      'Update the order details and status';

  @override
  String get translationOrderFormScreenFieldTitleHint =>
      'Enter a descriptive title for this order';

  @override
  String get translationOrderFormScreenFieldTranslatorHintSelect =>
      'Assign translator';

  @override
  String get translationOrderFormScreenFieldBlankNumberLabel => 'Blank Number';

  @override
  String get translationOrderFormScreenSectionTitleTranslation =>
      'Translation Details';

  @override
  String get translationOrderFormScreenFieldSourceLanguageHint =>
      'e.g., English';

  @override
  String get translationOrderFormScreenFieldSourceLanguageValidationRequired =>
      'Source language is required';

  @override
  String get translationOrderFormScreenFieldTargetLanguageHint =>
      'e.g., Russian';

  @override
  String get translationOrderFormScreenFieldTargetLanguageValidationRequired =>
      'Target language is required';

  @override
  String get translationOrderFormScreenFieldPageCountHint => '1';

  @override
  String get translationOrderFormScreenSectionTitleNotes => 'Notes';

  @override
  String get translationOrderFormScreenSectionTitleStatus =>
      'Status & Progress';

  @override
  String get translationOrderFormScreenSectionTitlePricing => 'Pricing';

  @override
  String get translationOrderFormScreenFieldIncorrectBlankLabel =>
      'Incorrect Blank Number';

  @override
  String get translationOrderFormScreenFieldIncorrectBlankHint =>
      'Enter incorrect blank number if applicable';

  @override
  String get translationOrderFormScreenFieldNotesHint =>
      'Add any additional notes or special instructions...';

  @override
  String get translationOrderFormScreenStatusCurrentLabel => 'Current Status';

  @override
  String get translationOrderFormScreenStatusUpdateLabel => 'Update Status';

  @override
  String get translationProgressStatusPendingAssignment => 'Pending Assignment';

  @override
  String get translationProgressStatusInProgress => 'In Progress';

  @override
  String get translationProgressStatusTranslated => 'Translation Complete';

  @override
  String get translationProgressStatusCheckedByManager => 'Manager Approved';

  @override
  String get translationProgressStatusClientNotified => 'Client Notified';

  @override
  String get translationProgressStatusDelivered => 'Delivered';

  @override
  String get translationOrderFormScreenNewOrderStatusInfo =>
      'This order will be created with \"Pending Assignment\" status';

  @override
  String translationOrderFormScreenOrderIdLabel(String orderId) {
    return 'ID: $orderId';
  }

  @override
  String get officesScreenTitle => 'Offices Management';

  @override
  String get officesScreenSearchHint => 'Search Offices (City, Address, Phone)';

  @override
  String get officesScreenTooltipAdd => 'Add New Office';

  @override
  String get officesScreenTooltipEdit => 'Edit Office';

  @override
  String get officesScreenTooltipDelete => 'Delete Office';

  @override
  String officesScreenErrorLoading(String error) {
    return 'Failed to load offices: $error';
  }

  @override
  String officesScreenErrorDeleting(String error) {
    return 'Failed to delete office: $error';
  }

  @override
  String officesScreenSuccessDeleted(String city) {
    return 'Office \"$city\" deleted successfully';
  }

  @override
  String get officesScreenConfirmDeleteTitle => 'Delete Office';

  @override
  String officesScreenConfirmDeleteMessage(String city) {
    return 'Are you sure you want to delete the office in \"$city\"?';
  }

  @override
  String get officesScreenConfirmDeleteCancel => 'Cancel';

  @override
  String get officesScreenConfirmDeleteConfirm => 'Delete';

  @override
  String get officeFormScreenTitleAdd => 'Add New Office';

  @override
  String get officeFormScreenTitleEdit => 'Edit Office';

  @override
  String get officeFormScreenLabelCity => 'City';

  @override
  String get officeFormScreenLabelAddress => 'Address (Optional)';

  @override
  String get officeFormScreenLabelPhone => 'Phone (Optional)';

  @override
  String get officeFormScreenLabelNotes => 'Notes (Optional)';

  @override
  String get officeFormScreenValidationCityRequired => 'City is required';

  @override
  String get officeFormScreenButtonCreate => 'Create Office';

  @override
  String get officeFormScreenButtonUpdate => 'Update Office';

  @override
  String officeFormScreenErrorLoading(String error) {
    return 'Error loading office: $error';
  }

  @override
  String officeFormScreenErrorSaving(String error) {
    return 'Error saving office: $error';
  }

  @override
  String get officeFormScreenSuccessCreated => 'Office created successfully';

  @override
  String get officeFormScreenSuccessUpdated => 'Office updated successfully';

  @override
  String get plutoGridFilterAllColumns => 'All Columns';

  @override
  String get plutoGridFilterContains => 'Contains';

  @override
  String get plutoGridFilterEquals => 'Equals';

  @override
  String get plutoGridFilterStartsWith => 'Starts with';

  @override
  String get plutoGridFilterEndsWith => 'Ends with';

  @override
  String get plutoGridFilterGreaterThan => 'Greater than';

  @override
  String get plutoGridFilterGreaterThanOrEqualTo => 'Greater than or equal to';

  @override
  String get plutoGridFilterLessThan => 'Less than';

  @override
  String get plutoGridFilterLessThanOrEqualTo => 'Less than or equal to';

  @override
  String get plutoGridFilterApply => 'Apply';

  @override
  String get plutoGridFilterClear => 'Clear';

  @override
  String get plutoGridFilterPopupTitle => 'Filter';

  @override
  String get plutoGridFilterColumn => 'Column';

  @override
  String get plutoGridFilterType => 'Type';

  @override
  String get plutoGridFilterValue => 'Value';

  @override
  String translationOrderFormScreenErrorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get currencySymbolRuble => '₽';

  @override
  String get defaultCityName => 'Moscow';

  @override
  String get managerLevelRegular => 'regular';

  @override
  String get documentTypeDropdownSelectTitle => 'Select Document Type';

  @override
  String get documentTypeDropdownCustomOption => 'Other (specify)...';

  @override
  String get documentTypeDropdownCustomSubtitle => 'Enter custom document type';

  @override
  String documentTypeDropdownBasePriceLabel(
      String currencySymbol, String price) {
    return '$currencySymbol$price base price';
  }

  @override
  String get documentTypeDropdownCustomDialogTitle => 'Custom Document Type';

  @override
  String get documentTypeDropdownCustomDialogLabel => 'Document Type';

  @override
  String get documentTypeDropdownCustomDialogHint => 'Enter document type name';

  @override
  String get buttonCancel => 'Cancel';

  @override
  String get buttonSelect => 'Select';

  @override
  String get translationPricingBasePriceLabel => 'Base Price (per page)';

  @override
  String get translationPricingNumberOfPagesLabel => 'Number of Pages';

  @override
  String get translationPricingTranslationSumLabel => 'Translation Sum';

  @override
  String get translationPricingUrgentTranslationSumLabel =>
      'Urgent Translation Sum';

  @override
  String get translationPricingNotarialSumLabel =>
      'Notarial/Legal Certification';

  @override
  String get translationPricingTotalLabel => 'TOTAL';

  @override
  String get translationPricingUrgentSurcharge => 'Urgent (+100%)';

  @override
  String get translationPricingSemiUrgentSurcharge => 'Semi-Urgent (+50%)';

  @override
  String get translationPricingPriorityMultiplier => 'Priority Multiplier';

  @override
  String get translationPricingInformationTitle => 'Pricing Information';

  @override
  String get translationPricingUrgentSurchargeInfo =>
      'Urgent orders require 100% surcharge';

  @override
  String get translationPricingSemiUrgentSurchargeInfo =>
      'Semi-urgent orders require 50% surcharge';

  @override
  String translationPricingLocationDiscountInfo(String cityName, int discount) {
    return '$cityName location provides $discount% discount';
  }

  @override
  String translationPricingLocationSurchargeInfo(
      String cityName, int surcharge) {
    return '$cityName location adds $surcharge% surcharge';
  }

  @override
  String translationPricingComplexityBonusInfo(int percentage) {
    return 'Complexity bonus: $percentage%';
  }

  @override
  String get translationPricingStandardPricing => 'Standard pricing applies';

  @override
  String get translationPricingCalculationTitle => 'Pricing Calculation';

  @override
  String get translationPricingSelectDocumentTypeMessage =>
      'Please select a document type to see pricing';

  @override
  String get translationPricingCalculatingMessage => 'Calculating pricing...';

  @override
  String translationPricingCityMultiplierText(
      double multiplier, String cityName) {
    return 'City: ${multiplier}x ($cityName)';
  }

  @override
  String translationPricingManagerMultiplierText(
      double multiplier, String managerLevel) {
    return 'Manager: ${multiplier}x ($managerLevel)';
  }

  @override
  String get blankNumberFieldHintText => 'Enter 6-digit number (e.g., 123456)';

  @override
  String get blankNumberFieldGenerateTooltip => 'Generate blank number';

  @override
  String get blankNumberFieldSuggestTooltip => 'Suggest next number';

  @override
  String get blankNumberFieldHelperText => 'Format: 6 digits (000000-999999)';

  @override
  String get blankNumberFieldRequiredError => 'Blank number is required';

  @override
  String get blankNumberFieldInvalidFormatError =>
      'Invalid format. Must be exactly 6 digits';

  @override
  String get blankNumberFieldDuplicateError =>
      'This blank number is already used';

  @override
  String blankNumberFieldGeneratedMessage(String action, String number) {
    return '$action blank number: $number';
  }

  @override
  String get blankNumberFieldActionGenerated => 'Generated';

  @override
  String get blankNumberFieldActionSuggested => 'Suggested';

  @override
  String get blankNumbersWidgetTitle => 'Blank Numbers';

  @override
  String get blankNumbersWidgetMainLabel => 'Main Blank Number *';

  @override
  String get blankNumbersWidgetDamagedCheckbox => 'Add Damaged/Spoiled Blank';

  @override
  String get blankNumbersWidgetDamagedSubtitle =>
      'Check if a blank was damaged and needs replacement';

  @override
  String get blankNumbersWidgetDamagedLabel => 'Damaged Blank Number';

  @override
  String get blankNumbersWidgetDamagedHint =>
      'Number of the damaged blank being replaced';

  @override
  String get blankNumbersWidgetDamagedWarning =>
      'Record the damaged blank number for tracking and audit purposes. This helps maintain blank inventory accuracy.';

  @override
  String get blankNumbersWidgetGuidelinesTitle => 'Blank Number Guidelines';

  @override
  String get blankNumbersWidgetGuidelinesText =>
      '• Use exactly 6 digits (e.g., 123456)\n• Each blank number must be unique\n• Use \"Generate\" for timestamp-based numbers\n• Use \"Suggest\" for sequential numbering\n• Record damaged blanks for audit trail';

  @override
  String get searchableDropdownHint => 'Select an option...';

  @override
  String get searchableDropdownSearchHint => 'Search...';

  @override
  String get searchableDropdownNoResults => 'No results found';

  @override
  String get topActionButtonsApplications => 'Applications';

  @override
  String get topActionButtonsClients => 'Clients';

  @override
  String get sideMenuDirections => 'Directions';

  @override
  String get sideMenuAdminPanel => 'Admin Panel';

  @override
  String get sideMenuAllApplications => 'All Applications';

  @override
  String get sideMenuPartners => 'Partners';

  @override
  String get sideMenuActs => 'Acts';

  @override
  String get directionTranslationAgency => 'Translation Agency';

  @override
  String get directionLegalServices => 'Legal Services';

  @override
  String get directionInsuranceServices => 'Insurance Services';

  @override
  String get directionLending => 'Lending';

  @override
  String get directionOpeningAccounts => 'Opening Accounts';

  @override
  String get directionAdvancedTraining => 'Advanced Training';

  @override
  String get directionCopyrightProtection => 'Copyright Protection';

  @override
  String get directionPropertyValuation => 'Property Valuation';

  @override
  String get rightSidebarCalendarHeader => 'Calendar';

  @override
  String get rightSidebarNotificationsHeader => 'Notifications';

  @override
  String get calendarToday => 'Today';

  @override
  String get calendarViewAll => 'View All Events';

  @override
  String get calendarUpcomingEvents => 'Upcoming Events';

  @override
  String get calendarNoEvents => 'No events scheduled';

  @override
  String get notificationsMarkAllRead => 'Mark All Read';

  @override
  String get notificationsViewAll => 'View All';

  @override
  String get notificationsNoNew => 'No new notifications';

  @override
  String get notificationApplicationSubmitted => 'New application submitted';

  @override
  String get notificationClientRegistered => 'New client registered';

  @override
  String get notificationDocumentUploaded => 'Document uploaded';

  @override
  String get notificationPaymentReceived => 'Payment received';

  @override
  String get notificationsMins => 'mins';

  @override
  String get rightSidebarTitle => 'Information Panel';

  @override
  String get rightSidebarCloseTooltip => 'Close sidebar';

  @override
  String get calendarTitle => 'Calendar';

  @override
  String get calendarAddEventTooltip => 'Add new event';

  @override
  String get calendarTodaysEvents => 'Today\'s Events';

  @override
  String get calendarNoEventsToday => 'No events scheduled for today';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsUnreadOnly => 'Unread only';

  @override
  String get notificationsEmpty => 'No notifications';
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @employeeListScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employeeListScreenTitle;

  /// No description provided for @employeeListScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading employees: {error}'**
  String employeeListScreenErrorLoading(String error);

  /// No description provided for @employeeListScreenConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get employeeListScreenConfirmDeleteTitle;

  /// No description provided for @employeeListScreenConfirmDeleteContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete employee \"{name}\"?'**
  String employeeListScreenConfirmDeleteContent(String name);

  /// No description provided for @employeeListScreenConfirmDeleteActionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get employeeListScreenConfirmDeleteActionCancel;

  /// No description provided for @employeeListScreenConfirmDeleteActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get employeeListScreenConfirmDeleteActionDelete;

  /// No description provided for @employeeListScreenFeedbackSuccessDelete.
  ///
  /// In en, this message translates to:
  /// **'Employee \"{name}\" deleted successfully'**
  String employeeListScreenFeedbackSuccessDelete(String name);

  /// No description provided for @employeeListScreenFeedbackErrorDelete.
  ///
  /// In en, this message translates to:
  /// **'Error deleting employee: {error}'**
  String employeeListScreenFeedbackErrorDelete(String error);

  /// No description provided for @employeeListScreenColumnName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get employeeListScreenColumnName;

  /// No description provided for @employeeListScreenColumnEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get employeeListScreenColumnEmail;

  /// No description provided for @employeeListScreenColumnRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get employeeListScreenColumnRole;

  /// No description provided for @employeeListScreenColumnOfficeId.
  ///
  /// In en, this message translates to:
  /// **'Office ID'**
  String get employeeListScreenColumnOfficeId;

  /// No description provided for @employeeListScreenColumnActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get employeeListScreenColumnActive;

  /// No description provided for @employeeListScreenColumnActions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get employeeListScreenColumnActions;

  /// No description provided for @employeeListScreenTooltipEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Employee'**
  String get employeeListScreenTooltipEdit;

  /// No description provided for @employeeListScreenTooltipDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Employee'**
  String get employeeListScreenTooltipDelete;

  /// No description provided for @employeeListScreenTooltipRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh List'**
  String get employeeListScreenTooltipRefresh;

  /// No description provided for @employeeListScreenTooltipAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Employee'**
  String get employeeListScreenTooltipAdd;

  /// No description provided for @employeeListScreenButtonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get employeeListScreenButtonRetry;

  /// No description provided for @employeeListScreenNoEmployeesFound.
  ///
  /// In en, this message translates to:
  /// **'No employees found.'**
  String get employeeListScreenNoEmployeesFound;

  /// No description provided for @employeeListScreenButtonAddFirst.
  ///
  /// In en, this message translates to:
  /// **'Add First Employee'**
  String get employeeListScreenButtonAddFirst;

  /// Title for the employee login screen
  ///
  /// In en, this message translates to:
  /// **'Employee Login'**
  String get employeeLoginScreenTitle;

  /// Toggle to login as employee
  ///
  /// In en, this message translates to:
  /// **'Login as Employee'**
  String get loginAsEmployee;

  /// Toggle to login as user
  ///
  /// In en, this message translates to:
  /// **'Login as User'**
  String get loginAsUser;

  /// Hint for employee username input
  ///
  /// In en, this message translates to:
  /// **'Employee Username'**
  String get employeeUsernameHint;

  /// No description provided for @loginScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginScreenTitle;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// No description provided for @loginButtonText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButtonText;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Admin Panel'**
  String get appTitle;

  /// No description provided for @signupScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupScreenTitle;

  /// No description provided for @signupButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupButtonText;

  /// No description provided for @createCrmAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create CRM Account'**
  String get createCrmAccountTitle;

  /// No description provided for @loginLabelText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginLabelText;

  /// No description provided for @notesLabelText.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get notesLabelText;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordHint;

  /// No description provided for @pleaseEnterLoginNameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a login name'**
  String get pleaseEnterLoginNameError;

  /// No description provided for @loginMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Login must be at least 3 characters'**
  String get loginMinLengthError;

  /// No description provided for @pleaseEnterPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get pleaseEnterPasswordError;

  /// No description provided for @passwordMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLengthError;

  /// No description provided for @pleaseConfirmPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get pleaseConfirmPasswordError;

  /// No description provided for @passwordsDoNotMatchError.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatchError;

  /// No description provided for @alreadyHaveAccountButtonText.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log In'**
  String get alreadyHaveAccountButtonText;

  /// No description provided for @userCreatedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'User {userId} created successfully! Please log in.'**
  String userCreatedSuccessMessage(Object userId);

  /// No description provided for @userFormScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Create New User'**
  String get userFormScreenTitle;

  /// No description provided for @loginEmailLabelText.
  ///
  /// In en, this message translates to:
  /// **'Login (Email)'**
  String get loginEmailLabelText;

  /// No description provided for @loginEmailHintText.
  ///
  /// In en, this message translates to:
  /// **'user@example.com'**
  String get loginEmailHintText;

  /// No description provided for @pleaseEnterLoginEmailError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a login email'**
  String get pleaseEnterLoginEmailError;

  /// No description provided for @pleaseEnterValidEmailError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmailError;

  /// No description provided for @createUserButtonText.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get createUserButtonText;

  /// No description provided for @userCreatedSuccessIdMessage.
  ///
  /// In en, this message translates to:
  /// **'User created successfully with ID: {userId}'**
  String userCreatedSuccessIdMessage(Object userId);

  /// No description provided for @grpcErrorCreatingUserMessage.
  ///
  /// In en, this message translates to:
  /// **'gRPC Error creating user: {errorMessage}'**
  String grpcErrorCreatingUserMessage(Object errorMessage);

  /// No description provided for @errorCreatingUserMessage.
  ///
  /// In en, this message translates to:
  /// **'Error creating user: {errorMessage}'**
  String errorCreatingUserMessage(Object errorMessage);

  /// No description provided for @editLendingApplicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Lending Application'**
  String get editLendingApplicationTitle;

  /// No description provided for @addLendingApplicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Lending Application'**
  String get addLendingApplicationTitle;

  /// No description provided for @saveApplicationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Save Application'**
  String get saveApplicationTooltip;

  /// No description provided for @clientLabelText.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get clientLabelText;

  /// No description provided for @pleaseSelectClientError.
  ///
  /// In en, this message translates to:
  /// **'Please select a client'**
  String get pleaseSelectClientError;

  /// No description provided for @managerLabelText.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get managerLabelText;

  /// No description provided for @pleaseSelectManagerError.
  ///
  /// In en, this message translates to:
  /// **'Please select a manager'**
  String get pleaseSelectManagerError;

  /// No description provided for @bankLabelText.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bankLabelText;

  /// No description provided for @pleaseSelectBankError.
  ///
  /// In en, this message translates to:
  /// **'Please select a bank'**
  String get pleaseSelectBankError;

  /// No description provided for @requestedAmountLabelText.
  ///
  /// In en, this message translates to:
  /// **'Requested Amount'**
  String get requestedAmountLabelText;

  /// No description provided for @enterRequestedAmountError.
  ///
  /// In en, this message translates to:
  /// **'Enter requested amount'**
  String get enterRequestedAmountError;

  /// No description provided for @approvedAmountLabelText.
  ///
  /// In en, this message translates to:
  /// **'Approved Amount'**
  String get approvedAmountLabelText;

  /// No description provided for @applicationDateLabelText.
  ///
  /// In en, this message translates to:
  /// **'Application Date: {date}'**
  String applicationDateLabelText(Object date);

  /// No description provided for @pickDateButtonText.
  ///
  /// In en, this message translates to:
  /// **'Pick'**
  String get pickDateButtonText;

  /// No description provided for @approvalDateLabelText.
  ///
  /// In en, this message translates to:
  /// **'Approval Date: {date}'**
  String approvalDateLabelText(Object date);

  /// No description provided for @fundsReceivedDateLabelText.
  ///
  /// In en, this message translates to:
  /// **'Funds Received Date: {date}'**
  String fundsReceivedDateLabelText(Object date);

  /// No description provided for @companyContractDateLabelText.
  ///
  /// In en, this message translates to:
  /// **'Company Contract Date: {date}'**
  String companyContractDateLabelText(Object date);

  /// No description provided for @expectedCommissionLabelText.
  ///
  /// In en, this message translates to:
  /// **'Expected Commission'**
  String get expectedCommissionLabelText;

  /// No description provided for @statusLabelText.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusLabelText;

  /// No description provided for @pleaseSelectStatusError.
  ///
  /// In en, this message translates to:
  /// **'Please select a status'**
  String get pleaseSelectStatusError;

  /// No description provided for @paymentIdLabelText.
  ///
  /// In en, this message translates to:
  /// **'Payment ID'**
  String get paymentIdLabelText;

  /// No description provided for @notesLabelTextShort.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabelTextShort;

  /// No description provided for @companyCommissionPercentLabelText.
  ///
  /// In en, this message translates to:
  /// **'Company Commission Percent'**
  String get companyCommissionPercentLabelText;

  /// No description provided for @calculatedCommissionAmountLabelText.
  ///
  /// In en, this message translates to:
  /// **'Calculated Commission Amount'**
  String get calculatedCommissionAmountLabelText;

  /// No description provided for @commissionPaidLabelText.
  ///
  /// In en, this message translates to:
  /// **'Commission Paid'**
  String get commissionPaidLabelText;

  /// No description provided for @agentCommissionReceivedLabelText.
  ///
  /// In en, this message translates to:
  /// **'Agent Commission Received'**
  String get agentCommissionReceivedLabelText;

  /// No description provided for @updateApplicationButtonText.
  ///
  /// In en, this message translates to:
  /// **'Update Application'**
  String get updateApplicationButtonText;

  /// No description provided for @createApplicationButtonText.
  ///
  /// In en, this message translates to:
  /// **'Create Application'**
  String get createApplicationButtonText;

  /// No description provided for @errorLoadingDropdownMessage.
  ///
  /// In en, this message translates to:
  /// **'Error loading dropdown data: {errorMessage}'**
  String errorLoadingDropdownMessage(Object errorMessage);

  /// No description provided for @errorLoadingApplicationMessage.
  ///
  /// In en, this message translates to:
  /// **'Error loading application: {errorMessage}'**
  String errorLoadingApplicationMessage(Object errorMessage);

  /// No description provided for @applicationUpdatedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Application updated successfully'**
  String get applicationUpdatedSuccessMessage;

  /// No description provided for @applicationCreatedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Application created successfully'**
  String get applicationCreatedSuccessMessage;

  /// No description provided for @errorSavingApplicationMessage.
  ///
  /// In en, this message translates to:
  /// **'Error saving application: {errorMessage}'**
  String errorSavingApplicationMessage(Object errorMessage);

  /// No description provided for @lendingApplicationFormScreenFeedbackErrorCreating.
  ///
  /// In en, this message translates to:
  /// **'Error creating lending application: {error}'**
  String lendingApplicationFormScreenFeedbackErrorCreating(Object error);

  /// No description provided for @lendingApplicationFormScreenFeedbackErrorUpdating.
  ///
  /// In en, this message translates to:
  /// **'Error updating lending application: {error}'**
  String lendingApplicationFormScreenFeedbackErrorUpdating(Object error);

  /// No description provided for @clientFormScreenTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Client'**
  String get clientFormScreenTitleEdit;

  /// No description provided for @clientFormScreenTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Client'**
  String get clientFormScreenTitleAdd;

  /// No description provided for @clientFormScreenSaveTooltip.
  ///
  /// In en, this message translates to:
  /// **'Save Client'**
  String get clientFormScreenSaveTooltip;

  /// No description provided for @clientFormScreenLabelFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get clientFormScreenLabelFirstName;

  /// No description provided for @clientFormScreenLabelLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get clientFormScreenLabelLastName;

  /// No description provided for @clientFormScreenLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get clientFormScreenLabelEmail;

  /// No description provided for @clientFormScreenLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get clientFormScreenLabelPhone;

  /// No description provided for @clientFormScreenLabelTelegramId.
  ///
  /// In en, this message translates to:
  /// **'Telegram ID'**
  String get clientFormScreenLabelTelegramId;

  /// No description provided for @clientFormScreenLabelWhatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Number'**
  String get clientFormScreenLabelWhatsappNumber;

  /// No description provided for @clientFormScreenLabelSource.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get clientFormScreenLabelSource;

  /// No description provided for @clientFormScreenHintSource.
  ///
  /// In en, this message translates to:
  /// **'Select Source'**
  String get clientFormScreenHintSource;

  /// No description provided for @clientFormScreenLabelPassportData.
  ///
  /// In en, this message translates to:
  /// **'Passport Data (JSON)'**
  String get clientFormScreenLabelPassportData;

  /// No description provided for @clientFormScreenLabelNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get clientFormScreenLabelNotes;

  /// No description provided for @clientFormScreenValidationFirstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a first name'**
  String get clientFormScreenValidationFirstNameRequired;

  /// No description provided for @clientFormScreenValidationFirstNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'First name must be at least 2 characters'**
  String get clientFormScreenValidationFirstNameMinLength;

  /// No description provided for @clientFormScreenValidationLastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a last name'**
  String get clientFormScreenValidationLastNameRequired;

  /// No description provided for @clientFormScreenValidationLastNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Last name must be at least 2 characters'**
  String get clientFormScreenValidationLastNameMinLength;

  /// No description provided for @clientFormScreenValidationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email address'**
  String get clientFormScreenValidationEmailRequired;

  /// No description provided for @clientFormScreenValidationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get clientFormScreenValidationEmailInvalid;

  /// No description provided for @clientFormScreenValidationPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a phone number'**
  String get clientFormScreenValidationPhoneRequired;

  /// No description provided for @clientFormScreenValidationSourceRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a source'**
  String get clientFormScreenValidationSourceRequired;

  /// No description provided for @clientFormScreenButtonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Client'**
  String get clientFormScreenButtonUpdate;

  /// No description provided for @clientFormScreenButtonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Client'**
  String get clientFormScreenButtonCreate;

  /// No description provided for @clientFormScreenFeedbackErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading client data: {error}'**
  String clientFormScreenFeedbackErrorLoading(String error);

  /// No description provided for @clientFormScreenFeedbackErrorInvalidJson.
  ///
  /// In en, this message translates to:
  /// **'Invalid JSON for passport data: {error}'**
  String clientFormScreenFeedbackErrorInvalidJson(String error);

  /// No description provided for @clientFormScreenFeedbackSuccessUpdate.
  ///
  /// In en, this message translates to:
  /// **'Client updated successfully'**
  String get clientFormScreenFeedbackSuccessUpdate;

  /// No description provided for @clientFormScreenFeedbackSuccessCreate.
  ///
  /// In en, this message translates to:
  /// **'Client created successfully'**
  String get clientFormScreenFeedbackSuccessCreate;

  /// No description provided for @clientFormScreenFeedbackErrorGrpc.
  ///
  /// In en, this message translates to:
  /// **'gRPC Error saving client: {errorMessage}'**
  String clientFormScreenFeedbackErrorGrpc(String errorMessage);

  /// No description provided for @clientFormScreenFeedbackErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error saving client: {error}'**
  String clientFormScreenFeedbackErrorGeneric(String error);

  /// No description provided for @clientListScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get clientListScreenTitle;

  /// No description provided for @clientListScreenTooltipAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Client'**
  String get clientListScreenTooltipAdd;

  /// No description provided for @clientListScreenTooltipEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Client'**
  String get clientListScreenTooltipEdit;

  /// Tooltip for the delete client icon button
  ///
  /// In en, this message translates to:
  /// **'Delete Client'**
  String get clientListScreenTooltipDelete;

  /// Actions column title in the translation order list screen
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get translationOrderListScreenColumnActions;

  /// Tooltip for the edit translation order icon button
  ///
  /// In en, this message translates to:
  /// **'Edit Translation Order'**
  String get translationOrderListScreenTooltipEdit;

  /// Tooltip for the delete translation order icon button
  ///
  /// In en, this message translates to:
  /// **'Delete Order'**
  String get translationOrderListScreenTooltipDelete;

  /// No description provided for @clientListScreenConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get clientListScreenConfirmDeleteTitle;

  /// No description provided for @clientListScreenConfirmDeleteContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete client {clientName}?'**
  String clientListScreenConfirmDeleteContent(String clientName);

  /// No description provided for @clientListScreenConfirmDeleteActionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get clientListScreenConfirmDeleteActionCancel;

  /// No description provided for @clientListScreenConfirmDeleteActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get clientListScreenConfirmDeleteActionDelete;

  /// No description provided for @clientListScreenFeedbackSuccessDelete.
  ///
  /// In en, this message translates to:
  /// **'Client {clientName} deleted successfully'**
  String clientListScreenFeedbackSuccessDelete(String clientName);

  /// No description provided for @clientListScreenFeedbackErrorDelete.
  ///
  /// In en, this message translates to:
  /// **'Error deleting client {clientId}: {error}'**
  String clientListScreenFeedbackErrorDelete(String clientId, String error);

  /// No description provided for @clientListScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading clients: {error}'**
  String clientListScreenErrorLoading(String error);

  /// No description provided for @clientListScreenButtonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get clientListScreenButtonRetry;

  /// No description provided for @clientListScreenNoClientsFound.
  ///
  /// In en, this message translates to:
  /// **'No clients found. Tap + to add a new client or pull down to refresh.'**
  String get clientListScreenNoClientsFound;

  /// No description provided for @clientListScreenColumnId.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get clientListScreenColumnId;

  /// No description provided for @clientListScreenColumnFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get clientListScreenColumnFirstName;

  /// No description provided for @clientListScreenColumnLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get clientListScreenColumnLastName;

  /// No description provided for @clientListScreenColumnPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get clientListScreenColumnPhone;

  /// No description provided for @clientListScreenColumnEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get clientListScreenColumnEmail;

  /// No description provided for @clientListScreenColumnTelegramId.
  ///
  /// In en, this message translates to:
  /// **'Telegram ID'**
  String get clientListScreenColumnTelegramId;

  /// No description provided for @clientListScreenColumnWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get clientListScreenColumnWhatsapp;

  /// No description provided for @clientListScreenColumnSource.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get clientListScreenColumnSource;

  /// No description provided for @clientListScreenColumnPassportData.
  ///
  /// In en, this message translates to:
  /// **'Passport Data'**
  String get clientListScreenColumnPassportData;

  /// No description provided for @clientListScreenColumnNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get clientListScreenColumnNotes;

  /// No description provided for @clientListScreenColumnActions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get clientListScreenColumnActions;

  /// No description provided for @clientListScreenDefaultClientName.
  ///
  /// In en, this message translates to:
  /// **'this client'**
  String get clientListScreenDefaultClientName;

  /// No description provided for @clientListScreenSourceUnspecified.
  ///
  /// In en, this message translates to:
  /// **'Unspecified'**
  String get clientListScreenSourceUnspecified;

  /// No description provided for @lendingApplicationListScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Lending Applications'**
  String get lendingApplicationListScreenTitle;

  /// No description provided for @lendingApplicationListScreenTooltipAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Application'**
  String get lendingApplicationListScreenTooltipAdd;

  /// No description provided for @lendingApplicationListScreenTooltipEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Application'**
  String get lendingApplicationListScreenTooltipEdit;

  /// No description provided for @lendingApplicationListScreenTooltipDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Application'**
  String get lendingApplicationListScreenTooltipDelete;

  /// No description provided for @lendingApplicationListScreenConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Application?'**
  String get lendingApplicationListScreenConfirmDeleteTitle;

  /// No description provided for @lendingApplicationListScreenConfirmDeleteContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this application?'**
  String get lendingApplicationListScreenConfirmDeleteContent;

  /// No description provided for @lendingApplicationListScreenActionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get lendingApplicationListScreenActionCancel;

  /// No description provided for @lendingApplicationListScreenActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get lendingApplicationListScreenActionDelete;

  /// No description provided for @lendingApplicationListScreenFeedbackSuccessDelete.
  ///
  /// In en, this message translates to:
  /// **'Application deleted successfully'**
  String get lendingApplicationListScreenFeedbackSuccessDelete;

  /// No description provided for @lendingApplicationListScreenFeedbackErrorDelete.
  ///
  /// In en, this message translates to:
  /// **'Error deleting application: {error}'**
  String lendingApplicationListScreenFeedbackErrorDelete(String error);

  /// No description provided for @lendingApplicationListScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String lendingApplicationListScreenErrorLoading(String error);

  /// No description provided for @lendingApplicationListScreenNoApplicationsFound.
  ///
  /// In en, this message translates to:
  /// **'No lending applications found.'**
  String get lendingApplicationListScreenNoApplicationsFound;

  /// No description provided for @lendingApplicationListScreenListItemNoId.
  ///
  /// In en, this message translates to:
  /// **'No ID'**
  String get lendingApplicationListScreenListItemNoId;

  /// No description provided for @lendingApplicationListScreenListItemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Client: {clientId}\nManager: {managerId}\nBank: {bankId}'**
  String lendingApplicationListScreenListItemSubtitle(
      String clientId, String managerId, String bankId);

  /// No description provided for @trainingCourseFormScreenTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Course'**
  String get trainingCourseFormScreenTitleEdit;

  /// No description provided for @trainingCourseFormScreenTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Course'**
  String get trainingCourseFormScreenTitleAdd;

  /// No description provided for @trainingCourseFormScreenLabelName.
  ///
  /// In en, this message translates to:
  /// **'Course Name'**
  String get trainingCourseFormScreenLabelName;

  /// No description provided for @trainingCourseFormScreenLabelPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get trainingCourseFormScreenLabelPrice;

  /// No description provided for @trainingCourseFormScreenLabelCommission.
  ///
  /// In en, this message translates to:
  /// **'Commission Percent'**
  String get trainingCourseFormScreenLabelCommission;

  /// No description provided for @trainingCourseFormScreenLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get trainingCourseFormScreenLabelDescription;

  /// No description provided for @trainingCourseFormScreenLabelNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get trainingCourseFormScreenLabelNotes;

  /// No description provided for @trainingCourseFormScreenValidationRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get trainingCourseFormScreenValidationRequired;

  /// No description provided for @trainingCourseFormScreenButtonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Course'**
  String get trainingCourseFormScreenButtonUpdate;

  /// No description provided for @trainingCourseFormScreenButtonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Course'**
  String get trainingCourseFormScreenButtonCreate;

  /// No description provided for @trainingCourseFormScreenFeedbackErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading course: {error}'**
  String trainingCourseFormScreenFeedbackErrorLoading(String error);

  /// No description provided for @trainingCourseFormScreenFeedbackSuccessUpdate.
  ///
  /// In en, this message translates to:
  /// **'Course updated successfully'**
  String get trainingCourseFormScreenFeedbackSuccessUpdate;

  /// No description provided for @trainingCourseFormScreenFeedbackSuccessCreate.
  ///
  /// In en, this message translates to:
  /// **'Course created successfully'**
  String get trainingCourseFormScreenFeedbackSuccessCreate;

  /// No description provided for @trainingCourseFormScreenFeedbackErrorSaving.
  ///
  /// In en, this message translates to:
  /// **'Error saving course: {error}'**
  String trainingCourseFormScreenFeedbackErrorSaving(Object error);

  /// No description provided for @trainingCourseListScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Training Courses'**
  String get trainingCourseListScreenTitle;

  /// No description provided for @trainingCourseListScreenTooltipAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Course'**
  String get trainingCourseListScreenTooltipAdd;

  /// No description provided for @trainingCourseListScreenTooltipEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Course'**
  String get trainingCourseListScreenTooltipEdit;

  /// No description provided for @trainingCourseListScreenTooltipDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Course'**
  String get trainingCourseListScreenTooltipDelete;

  /// No description provided for @trainingCourseListScreenConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Course?'**
  String get trainingCourseListScreenConfirmDeleteTitle;

  /// No description provided for @trainingCourseListScreenConfirmDeleteContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this course?'**
  String get trainingCourseListScreenConfirmDeleteContent;

  /// No description provided for @trainingCourseListScreenActionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get trainingCourseListScreenActionCancel;

  /// No description provided for @trainingCourseListScreenActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get trainingCourseListScreenActionDelete;

  /// No description provided for @trainingCourseListScreenFeedbackSuccessDelete.
  ///
  /// In en, this message translates to:
  /// **'Course deleted successfully'**
  String get trainingCourseListScreenFeedbackSuccessDelete;

  /// No description provided for @trainingCourseListScreenFeedbackErrorDelete.
  ///
  /// In en, this message translates to:
  /// **'Error deleting course: {error}'**
  String trainingCourseListScreenFeedbackErrorDelete(String error);

  /// No description provided for @trainingCourseListScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String trainingCourseListScreenErrorLoading(String error);

  /// No description provided for @trainingCourseListScreenNoCoursesFound.
  ///
  /// In en, this message translates to:
  /// **'No training courses found.'**
  String get trainingCourseListScreenNoCoursesFound;

  /// No description provided for @trainingCourseListScreenListItemNoName.
  ///
  /// In en, this message translates to:
  /// **'No Name'**
  String get trainingCourseListScreenListItemNoName;

  /// No description provided for @trainingCourseListScreenListItemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Price: {price}\nCommission: {commission}%'**
  String trainingCourseListScreenListItemSubtitle(
      String price, String commission);

  /// No description provided for @mainScreenNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Not logged in'**
  String get mainScreenNotLoggedIn;

  /// No description provided for @mainScreenRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role: {roleName}'**
  String mainScreenRoleLabel(String roleName);

  /// No description provided for @mainScreenUserLoginDefault.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get mainScreenUserLoginDefault;

  /// No description provided for @sideMenuDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get sideMenuDashboard;

  /// No description provided for @sideMenuClients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get sideMenuClients;

  /// No description provided for @sideMenuEmployees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get sideMenuEmployees;

  /// No description provided for @sideMenuTranslations.
  ///
  /// In en, this message translates to:
  /// **'Translations'**
  String get sideMenuTranslations;

  /// No description provided for @sideMenuInsurancePolicies.
  ///
  /// In en, this message translates to:
  /// **'Insurance Policies'**
  String get sideMenuInsurancePolicies;

  /// No description provided for @sideMenuTrainingCourses.
  ///
  /// In en, this message translates to:
  /// **'Training Courses'**
  String get sideMenuTrainingCourses;

  /// No description provided for @sideMenuBusinessRegistrations.
  ///
  /// In en, this message translates to:
  /// **'Business Registrations'**
  String get sideMenuBusinessRegistrations;

  /// No description provided for @sideMenuLendingApplications.
  ///
  /// In en, this message translates to:
  /// **'Lending Applications'**
  String get sideMenuLendingApplications;

  /// No description provided for @sideMenuAdminTools.
  ///
  /// In en, this message translates to:
  /// **'Admin Tools'**
  String get sideMenuAdminTools;

  /// No description provided for @sideMenuCreateUser.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get sideMenuCreateUser;

  /// No description provided for @sideMenuTask.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get sideMenuTask;

  /// No description provided for @sideMenuStore.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get sideMenuStore;

  /// No description provided for @sideMenuNotification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get sideMenuNotification;

  /// No description provided for @sideMenuProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get sideMenuProfile;

  /// No description provided for @sideMenuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get sideMenuSettings;

  /// No description provided for @sideMenuLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get sideMenuLogout;

  /// No description provided for @dashboardHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardHeaderTitle;

  /// No description provided for @dashboardHeaderProfileCardUserDefault.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get dashboardHeaderProfileCardUserDefault;

  /// No description provided for @dashboardHeaderProfileCardNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Not Logged In'**
  String get dashboardHeaderProfileCardNotLoggedIn;

  /// No description provided for @dashboardHeaderSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get dashboardHeaderSearchHint;

  /// No description provided for @dashboardMyFilesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Files'**
  String get dashboardMyFilesTitle;

  /// No description provided for @dashboardMyFilesAddNewButton.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get dashboardMyFilesAddNewButton;

  /// No description provided for @dashboardRecentFilesTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent Files'**
  String get dashboardRecentFilesTitle;

  /// No description provided for @dashboardRecentFilesColumnFileName.
  ///
  /// In en, this message translates to:
  /// **'File Name'**
  String get dashboardRecentFilesColumnFileName;

  /// No description provided for @dashboardRecentFilesColumnDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dashboardRecentFilesColumnDate;

  /// No description provided for @dashboardRecentFilesColumnSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get dashboardRecentFilesColumnSize;

  /// No description provided for @dashboardStorageDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Storage Details'**
  String get dashboardStorageDetailsTitle;

  /// No description provided for @dashboardStorageDetailsDocumentsFiles.
  ///
  /// In en, this message translates to:
  /// **'Documents Files'**
  String get dashboardStorageDetailsDocumentsFiles;

  /// No description provided for @dashboardStorageDetailsMediaFiles.
  ///
  /// In en, this message translates to:
  /// **'Media Files'**
  String get dashboardStorageDetailsMediaFiles;

  /// No description provided for @dashboardStorageDetailsOtherFiles.
  ///
  /// In en, this message translates to:
  /// **'Other Files'**
  String get dashboardStorageDetailsOtherFiles;

  /// No description provided for @dashboardStorageDetailsUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get dashboardStorageDetailsUnknown;

  /// No description provided for @translationOrderListScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Translation Orders'**
  String get translationOrderListScreenTitle;

  /// No description provided for @translationOrderListScreenDeleteOrderDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Order?'**
  String get translationOrderListScreenDeleteOrderDialogTitle;

  /// No description provided for @translationOrderListScreenDeleteOrderDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this order?'**
  String get translationOrderListScreenDeleteOrderDialogContent;

  /// No description provided for @translationOrderListScreenDeleteOrderDialogCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get translationOrderListScreenDeleteOrderDialogCancelButton;

  /// No description provided for @translationOrderListScreenDeleteOrderDialogDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get translationOrderListScreenDeleteOrderDialogDeleteButton;

  /// No description provided for @translationOrderListScreenOrderDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order deleted successfully'**
  String get translationOrderListScreenOrderDeletedSuccess;

  /// No description provided for @translationOrderListScreenErrorDeletingOrder.
  ///
  /// In en, this message translates to:
  /// **'Error deleting order: {error}'**
  String translationOrderListScreenErrorDeletingOrder(String error);

  /// No description provided for @translationOrderListScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String translationOrderListScreenErrorLoading(String error);

  /// No description provided for @translationOrderListScreenNoOrdersFound.
  ///
  /// In en, this message translates to:
  /// **'No translation orders found.'**
  String get translationOrderListScreenNoOrdersFound;

  /// No description provided for @translationOrderListScreenUntitledOrder.
  ///
  /// In en, this message translates to:
  /// **'Untitled Order'**
  String get translationOrderListScreenUntitledOrder;

  /// No description provided for @translationOrderListScreenOrderIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Order ID: {orderId}'**
  String translationOrderListScreenOrderIdLabel(String orderId);

  /// No description provided for @translationOrderListScreenOrderTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title: {title}'**
  String translationOrderListScreenOrderTitleLabel(String title);

  /// No description provided for @translationOrderListScreenOrderStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String translationOrderListScreenOrderStatusLabel(String status);

  /// No description provided for @translationOrderListScreenOrderCreatedLabel.
  ///
  /// In en, this message translates to:
  /// **'Created: {date}'**
  String translationOrderListScreenOrderCreatedLabel(String date);

  /// No description provided for @translationOrderListScreenOrderDoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Done: {date}'**
  String translationOrderListScreenOrderDoneLabel(String date);

  /// No description provided for @translationOrderListScreenCreateNewOrderTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create New Order'**
  String get translationOrderListScreenCreateNewOrderTooltip;

  /// No description provided for @translationOrderListScreenCustomerNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get translationOrderListScreenCustomerNameLabel;

  /// No description provided for @translationOrderFormScreenSectionTitleOrderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get translationOrderFormScreenSectionTitleOrderDetails;

  /// No description provided for @translationOrderFormScreenSectionTitleDocumentDetails.
  ///
  /// In en, this message translates to:
  /// **'Document Details'**
  String get translationOrderFormScreenSectionTitleDocumentDetails;

  /// No description provided for @translationOrderFormScreenSectionTitleFinancialDetails.
  ///
  /// In en, this message translates to:
  /// **'Financial Details'**
  String get translationOrderFormScreenSectionTitleFinancialDetails;

  /// No description provided for @translationOrderFormScreenSectionTitleAdditionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get translationOrderFormScreenSectionTitleAdditionalInformation;

  /// No description provided for @translationOrderFormScreenCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Order'**
  String get translationOrderFormScreenCreateTitle;

  /// No description provided for @translationOrderFormScreenEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Order'**
  String get translationOrderFormScreenEditTitle;

  /// No description provided for @translationOrderFormScreenSaveChangesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Save Order'**
  String get translationOrderFormScreenSaveChangesTooltip;

  /// No description provided for @translationOrderFormScreenErrorLoadingData.
  ///
  /// In en, this message translates to:
  /// **'Error loading initial data: {error}'**
  String translationOrderFormScreenErrorLoadingData(String error);

  /// No description provided for @translationOrderFormScreenErrorSavingOrder.
  ///
  /// In en, this message translates to:
  /// **'Error saving order: {error}'**
  String translationOrderFormScreenErrorSavingOrder(String error);

  /// No description provided for @translationOrderFormScreenOrderCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order created successfully'**
  String get translationOrderFormScreenOrderCreatedSuccess;

  /// No description provided for @translationOrderFormScreenOrderUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order updated successfully'**
  String get translationOrderFormScreenOrderUpdatedSuccess;

  /// No description provided for @translationOrderFormScreenOrderDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order deleted successfully'**
  String get translationOrderFormScreenOrderDeletedSuccess;

  /// No description provided for @translationOrderFormScreenErrorDeletingOrder.
  ///
  /// In en, this message translates to:
  /// **'Error deleting order: {error}'**
  String translationOrderFormScreenErrorDeletingOrder(String error);

  /// No description provided for @translationOrderFormScreenFieldTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title *'**
  String get translationOrderFormScreenFieldTitleLabel;

  /// No description provided for @translationOrderFormScreenFieldTitleValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get translationOrderFormScreenFieldTitleValidation;

  /// No description provided for @translationOrderFormScreenFieldDoneAtLabel.
  ///
  /// In en, this message translates to:
  /// **'Done At (Completion Date)'**
  String get translationOrderFormScreenFieldDoneAtLabel;

  /// No description provided for @translationOrderFormScreenFieldClientLabel.
  ///
  /// In en, this message translates to:
  /// **'Client *'**
  String get translationOrderFormScreenFieldClientLabel;

  /// No description provided for @translationOrderFormScreenFieldClientHint.
  ///
  /// In en, this message translates to:
  /// **'Select Client'**
  String get translationOrderFormScreenFieldClientHint;

  /// No description provided for @translationOrderFormScreenFieldClientValidation.
  ///
  /// In en, this message translates to:
  /// **'Please select a client'**
  String get translationOrderFormScreenFieldClientValidation;

  /// No description provided for @translationOrderFormScreenFieldManagerLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager *'**
  String get translationOrderFormScreenFieldManagerLabel;

  /// No description provided for @translationOrderFormScreenFieldManagerHint.
  ///
  /// In en, this message translates to:
  /// **'Select Manager'**
  String get translationOrderFormScreenFieldManagerHint;

  /// No description provided for @translationOrderFormScreenFieldManagerValidation.
  ///
  /// In en, this message translates to:
  /// **'Please select a manager'**
  String get translationOrderFormScreenFieldManagerValidation;

  /// No description provided for @translationOrderFormScreenFieldOfficeLabel.
  ///
  /// In en, this message translates to:
  /// **'Office *'**
  String get translationOrderFormScreenFieldOfficeLabel;

  /// No description provided for @translationOrderFormScreenFieldOfficeHint.
  ///
  /// In en, this message translates to:
  /// **'Select Office'**
  String get translationOrderFormScreenFieldOfficeHint;

  /// No description provided for @translationOrderFormScreenFieldOfficeValidation.
  ///
  /// In en, this message translates to:
  /// **'Please select an office'**
  String get translationOrderFormScreenFieldOfficeValidation;

  /// No description provided for @translationOrderFormScreenFieldSourceLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'Source Language'**
  String get translationOrderFormScreenFieldSourceLanguageLabel;

  /// No description provided for @translationOrderFormScreenFieldTargetLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'Target Language'**
  String get translationOrderFormScreenFieldTargetLanguageLabel;

  /// No description provided for @translationOrderFormScreenFieldDocumentTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get translationOrderFormScreenFieldDocumentTypeLabel;

  /// No description provided for @translationOrderFormScreenFieldDocumentTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Select Document Type'**
  String get translationOrderFormScreenFieldDocumentTypeHint;

  /// No description provided for @translationOrderFormScreenFieldPageCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Page Count'**
  String get translationOrderFormScreenFieldPageCountLabel;

  /// No description provided for @translationOrderFormScreenFieldNotarialSumLabel.
  ///
  /// In en, this message translates to:
  /// **'Notarial Sum *'**
  String get translationOrderFormScreenFieldNotarialSumLabel;

  /// No description provided for @translationOrderFormScreenFieldNotarialSumValidationRequired.
  ///
  /// In en, this message translates to:
  /// **'Notarial sum is required.'**
  String get translationOrderFormScreenFieldNotarialSumValidationRequired;

  /// No description provided for @translationOrderFormScreenFieldNotarialSumValidationNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number for the notarial sum'**
  String get translationOrderFormScreenFieldNotarialSumValidationNumber;

  /// No description provided for @priorityNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get priorityNormal;

  /// No description provided for @priorityUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get priorityUrgent;

  /// No description provided for @prioritySemiUrgent.
  ///
  /// In en, this message translates to:
  /// **'Semi-Urgent'**
  String get prioritySemiUrgent;

  /// No description provided for @clientSourceReferral.
  ///
  /// In en, this message translates to:
  /// **'Referral'**
  String get clientSourceReferral;

  /// No description provided for @clientSourceOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get clientSourceOnline;

  /// No description provided for @clientSourceWalkIn.
  ///
  /// In en, this message translates to:
  /// **'Walk-In'**
  String get clientSourceWalkIn;

  /// No description provided for @clientSourcePartner.
  ///
  /// In en, this message translates to:
  /// **'Partner'**
  String get clientSourcePartner;

  /// No description provided for @clientSourceOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get clientSourceOther;

  /// No description provided for @clientSourceUnspecified.
  ///
  /// In en, this message translates to:
  /// **'Unspecified'**
  String get clientSourceUnspecified;

  /// No description provided for @clientSourceColumnTitle.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get clientSourceColumnTitle;

  /// No description provided for @translationOrderFormScreenFieldPriorityLabel.
  ///
  /// In en, this message translates to:
  /// **'Priority *'**
  String get translationOrderFormScreenFieldPriorityLabel;

  /// No description provided for @translationOrderFormScreenFieldPriorityHint.
  ///
  /// In en, this message translates to:
  /// **'Select Priority'**
  String get translationOrderFormScreenFieldPriorityHint;

  /// No description provided for @translationOrderFormScreenFieldPriorityValidation.
  ///
  /// In en, this message translates to:
  /// **'Please select priority'**
  String get translationOrderFormScreenFieldPriorityValidation;

  /// No description provided for @translationOrderFormScreenFieldPaymentIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Payment ID'**
  String get translationOrderFormScreenFieldPaymentIdLabel;

  /// No description provided for @translationOrderFormScreenFieldTranslatorLabel.
  ///
  /// In en, this message translates to:
  /// **'Translator'**
  String get translationOrderFormScreenFieldTranslatorLabel;

  /// No description provided for @translationOrderFormScreenFieldTranslatorHint.
  ///
  /// In en, this message translates to:
  /// **'Select Translator (Optional)'**
  String get translationOrderFormScreenFieldTranslatorHint;

  /// No description provided for @translationOrderFormScreenFieldStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status (Read-Only)'**
  String get translationOrderFormScreenFieldStatusLabel;

  /// No description provided for @translationOrderFormScreenFieldTranslationProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Translation Progress (Read-Only)'**
  String get translationOrderFormScreenFieldTranslationProgressLabel;

  /// No description provided for @translationOrderFormScreenTranslationProgressNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Translation Progress Not Available'**
  String get translationOrderFormScreenTranslationProgressNotAvailable;

  /// No description provided for @translationOrderFormScreenFieldNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get translationOrderFormScreenFieldNotesLabel;

  /// No description provided for @translationOrderFormScreenSwitchUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get translationOrderFormScreenSwitchUrgent;

  /// No description provided for @translationOrderFormScreenSwitchSemiUrgent.
  ///
  /// In en, this message translates to:
  /// **'Semi-Urgent'**
  String get translationOrderFormScreenSwitchSemiUrgent;

  /// No description provided for @translationOrderFormScreenSwitchClientNotified.
  ///
  /// In en, this message translates to:
  /// **'Client Notified'**
  String get translationOrderFormScreenSwitchClientNotified;

  /// No description provided for @translationOrderFormScreenDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete Order'**
  String get translationOrderFormScreenDeleteButton;

  /// No description provided for @translationOrderFormScreenDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Order?'**
  String get translationOrderFormScreenDeleteDialogTitle;

  /// No description provided for @translationOrderFormScreenDeleteDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this order?'**
  String get translationOrderFormScreenDeleteDialogContent;

  /// No description provided for @translationOrderFormScreenDeleteDialogCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get translationOrderFormScreenDeleteDialogCancelButton;

  /// No description provided for @translationOrderFormScreenDeleteDialogDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get translationOrderFormScreenDeleteDialogDeleteButton;

  /// No description provided for @translationOrderFormScreenDisplayEmployee.
  ///
  /// In en, this message translates to:
  /// **'{name} ({id}...)'**
  String translationOrderFormScreenDisplayEmployee(String name, String id);

  /// No description provided for @translationOrderFormScreenDisplayOffice.
  ///
  /// In en, this message translates to:
  /// **'{city} ({id}...)'**
  String translationOrderFormScreenDisplayOffice(String city, String id);

  /// No description provided for @translationOrderFormScreenDisplayClient.
  ///
  /// In en, this message translates to:
  /// **'{firstName} {lastName} ({id}...)'**
  String translationOrderFormScreenDisplayClient(
      String firstName, String lastName, String id);

  /// No description provided for @translationOrderFormScreenStatusNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get translationOrderFormScreenStatusNotAvailable;

  /// No description provided for @insurancePolicyListScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Insurance Policies'**
  String get insurancePolicyListScreenTitle;

  /// No description provided for @insurancePolicyListScreenAddPolicyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Policy'**
  String get insurancePolicyListScreenAddPolicyTooltip;

  /// No description provided for @insurancePolicyListScreenDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Policy?'**
  String get insurancePolicyListScreenDeleteDialogTitle;

  /// No description provided for @insurancePolicyListScreenDeleteDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this policy?'**
  String get insurancePolicyListScreenDeleteDialogContent;

  /// No description provided for @insurancePolicyListScreenDeleteDialogCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get insurancePolicyListScreenDeleteDialogCancelButton;

  /// No description provided for @insurancePolicyListScreenDeleteDialogDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get insurancePolicyListScreenDeleteDialogDeleteButton;

  /// No description provided for @insurancePolicyListScreenPolicyDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Policy deleted successfully'**
  String get insurancePolicyListScreenPolicyDeletedSuccess;

  /// No description provided for @insurancePolicyListScreenErrorDeletingPolicy.
  ///
  /// In en, this message translates to:
  /// **'Error deleting policy: {error}'**
  String insurancePolicyListScreenErrorDeletingPolicy(String error);

  /// No description provided for @insurancePolicyListScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String insurancePolicyListScreenErrorLoading(String error);

  /// No description provided for @insurancePolicyListScreenNoPoliciesFound.
  ///
  /// In en, this message translates to:
  /// **'No insurance policies found.'**
  String get insurancePolicyListScreenNoPoliciesFound;

  /// No description provided for @insurancePolicyListScreenNoPolicyNumber.
  ///
  /// In en, this message translates to:
  /// **'No Policy Number'**
  String get insurancePolicyListScreenNoPolicyNumber;

  /// No description provided for @insurancePolicyListScreenListItemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Client: {clientId}\nManager: {managerId}\nAmount: {amount}'**
  String insurancePolicyListScreenListItemSubtitle(
      String clientId, String managerId, String amount);

  /// No description provided for @insurancePolicyListScreenEditPolicyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Policy'**
  String get insurancePolicyListScreenEditPolicyTooltip;

  /// No description provided for @insurancePolicyListScreenDeletePolicyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Policy'**
  String get insurancePolicyListScreenDeletePolicyTooltip;

  /// No description provided for @insurancePolicyId.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get insurancePolicyId;

  /// No description provided for @insurancePolicyClient.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get insurancePolicyClient;

  /// No description provided for @insurancePolicyPolicyNumber.
  ///
  /// In en, this message translates to:
  /// **'Policy Number'**
  String get insurancePolicyPolicyNumber;

  /// No description provided for @insurancePolicyType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get insurancePolicyType;

  /// No description provided for @insurancePolicyStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get insurancePolicyStartDate;

  /// No description provided for @insurancePolicyEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get insurancePolicyEndDate;

  /// No description provided for @insurancePolicyPremium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get insurancePolicyPremium;

  /// No description provided for @insurancePolicyStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get insurancePolicyStatus;

  /// No description provided for @insurancePolicyCoverageDetails.
  ///
  /// In en, this message translates to:
  /// **'Coverage Details'**
  String get insurancePolicyCoverageDetails;

  /// No description provided for @confirmDeleteInsurancePolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDeleteInsurancePolicyTitle;

  /// No description provided for @confirmDeleteInsurancePolicyMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this insurance policy?'**
  String get confirmDeleteInsurancePolicyMessage;

  /// No description provided for @insurancePolicyDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Insurance policy deleted successfully'**
  String get insurancePolicyDeletedSuccess;

  /// No description provided for @errorDeletingInsurancePolicy.
  ///
  /// In en, this message translates to:
  /// **'Error deleting insurance policy: {error}'**
  String errorDeletingInsurancePolicy(Object error);

  /// No description provided for @noInsurancePoliciesFound.
  ///
  /// In en, this message translates to:
  /// **'No insurance policies found'**
  String get noInsurancePoliciesFound;

  /// No description provided for @interactionListUnspecifiedType.
  ///
  /// In en, this message translates to:
  /// **'Unspecified'**
  String get interactionListUnspecifiedType;

  /// Interaction type: Call
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get interactionTypeCall;

  /// Interaction type: Email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get interactionTypeEmail;

  /// Interaction type: Meeting
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get interactionTypeMeeting;

  /// No description provided for @interactionListConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get interactionListConfirmDeleteTitle;

  /// No description provided for @interactionListConfirmDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete this interaction?'**
  String get interactionListConfirmDeleteMessage;

  /// No description provided for @interactionListCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get interactionListCancelButton;

  /// No description provided for @interactionListDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get interactionListDeleteButton;

  /// No description provided for @interactionListDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get interactionListDeletedSuccess;

  /// No description provided for @interactionListErrorDeleting.
  ///
  /// In en, this message translates to:
  /// **'Error deleting: {error}'**
  String interactionListErrorDeleting(Object error);

  /// No description provided for @interactionListTitle.
  ///
  /// In en, this message translates to:
  /// **'All Interactions'**
  String get interactionListTitle;

  /// No description provided for @interactionListErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading interactions: {error}'**
  String interactionListErrorLoading(Object error);

  /// No description provided for @interactionListNoInteractionsFound.
  ///
  /// In en, this message translates to:
  /// **'No interactions found.'**
  String get interactionListNoInteractionsFound;

  /// Header for Manager column in interaction list
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get interactionListManagerHeader;

  /// Header for Summary column in interaction list
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get interactionListSummaryHeader;

  /// No description provided for @interactionListIdHeader.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get interactionListIdHeader;

  /// No description provided for @interactionListClientHeader.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get interactionListClientHeader;

  /// No description provided for @interactionListEmployeeHeader.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get interactionListEmployeeHeader;

  /// No description provided for @interactionListDateHeader.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get interactionListDateHeader;

  /// No description provided for @interactionListTypeHeader.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get interactionListTypeHeader;

  /// No description provided for @interactionListDescriptionHeader.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get interactionListDescriptionHeader;

  /// No description provided for @interactionListSubjectHeader.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get interactionListSubjectHeader;

  /// No description provided for @interactionListEndTimeHeader.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get interactionListEndTimeHeader;

  /// No description provided for @interactionListScheduledHeader.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get interactionListScheduledHeader;

  /// No description provided for @interactionListCompletedHeader.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get interactionListCompletedHeader;

  /// No description provided for @interactionListNotesHeader.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get interactionListNotesHeader;

  /// No description provided for @interactionListActionsHeader.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get interactionListActionsHeader;

  /// No description provided for @interactionListYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get interactionListYes;

  /// No description provided for @interactionListNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get interactionListNo;

  /// No description provided for @interactionListEditInteractionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Interaction'**
  String get interactionListEditInteractionTooltip;

  /// No description provided for @interactionListDeleteInteractionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Interaction'**
  String get interactionListDeleteInteractionTooltip;

  /// No description provided for @interactionListDetailsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Interaction Details'**
  String get interactionListDetailsDialogTitle;

  /// No description provided for @interactionListCloseButton.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get interactionListCloseButton;

  /// No description provided for @insurancePolicyFormEditPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Policy'**
  String get insurancePolicyFormEditPolicyTitle;

  /// No description provided for @insurancePolicyFormAddPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Policy'**
  String get insurancePolicyFormAddPolicyTitle;

  /// No description provided for @insurancePolicyFormErrorLoadingPolicy.
  ///
  /// In en, this message translates to:
  /// **'Error loading policy: {error}'**
  String insurancePolicyFormErrorLoadingPolicy(Object error);

  /// No description provided for @insurancePolicyFormPolicyUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Policy updated successfully'**
  String get insurancePolicyFormPolicyUpdatedSuccess;

  /// No description provided for @insurancePolicyFormPolicyCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Policy created successfully'**
  String get insurancePolicyFormPolicyCreatedSuccess;

  /// No description provided for @insurancePolicyFormErrorSavingPolicy.
  ///
  /// In en, this message translates to:
  /// **'Error saving policy: {error}'**
  String insurancePolicyFormErrorSavingPolicy(Object error);

  /// No description provided for @insurancePolicyFormPolicyNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Policy Number'**
  String get insurancePolicyFormPolicyNumberLabel;

  /// No description provided for @insurancePolicyFormClientIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Client ID'**
  String get insurancePolicyFormClientIdLabel;

  /// No description provided for @insurancePolicyFormManagerIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager ID'**
  String get insurancePolicyFormManagerIdLabel;

  /// No description provided for @insurancePolicyFormAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get insurancePolicyFormAmountLabel;

  /// No description provided for @insurancePolicyFormStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get insurancePolicyFormStartDateLabel;

  /// No description provided for @insurancePolicyFormStartDatePickerPrefix.
  ///
  /// In en, this message translates to:
  /// **'Start: {date}'**
  String insurancePolicyFormStartDatePickerPrefix(Object date);

  /// No description provided for @insurancePolicyFormExpiryDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get insurancePolicyFormExpiryDateLabel;

  /// No description provided for @insurancePolicyFormExpiryDatePickerPrefix.
  ///
  /// In en, this message translates to:
  /// **'Expiry: {date}'**
  String insurancePolicyFormExpiryDatePickerPrefix(Object date);

  /// No description provided for @insurancePolicyFormPickDateButton.
  ///
  /// In en, this message translates to:
  /// **'Pick'**
  String get insurancePolicyFormPickDateButton;

  /// No description provided for @insurancePolicyFormStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get insurancePolicyFormStatusLabel;

  /// No description provided for @insurancePolicyFormRenewalStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Renewal Status'**
  String get insurancePolicyFormRenewalStatusLabel;

  /// No description provided for @insurancePolicyFormNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get insurancePolicyFormNotesLabel;

  /// No description provided for @insurancePolicyFormUpdatePolicyButton.
  ///
  /// In en, this message translates to:
  /// **'Update Policy'**
  String get insurancePolicyFormUpdatePolicyButton;

  /// No description provided for @insurancePolicyFormCreatePolicyButton.
  ///
  /// In en, this message translates to:
  /// **'Create Policy'**
  String get insurancePolicyFormCreatePolicyButton;

  /// No description provided for @insurancePolicyFormRequiredField.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get insurancePolicyFormRequiredField;

  /// No description provided for @insurancePolicyFormScreenTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Policy'**
  String get insurancePolicyFormScreenTitleEdit;

  /// No description provided for @insurancePolicyFormScreenTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Policy'**
  String get insurancePolicyFormScreenTitleAdd;

  /// No description provided for @insurancePolicyFormScreenFeedbackErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading policy: {error}'**
  String insurancePolicyFormScreenFeedbackErrorLoading(String error);

  /// No description provided for @insurancePolicyFormScreenFeedbackSuccessUpdate.
  ///
  /// In en, this message translates to:
  /// **'Policy updated successfully'**
  String get insurancePolicyFormScreenFeedbackSuccessUpdate;

  /// No description provided for @insurancePolicyFormScreenFeedbackSuccessCreate.
  ///
  /// In en, this message translates to:
  /// **'Policy created successfully'**
  String get insurancePolicyFormScreenFeedbackSuccessCreate;

  /// No description provided for @insurancePolicyFormScreenFeedbackErrorSaving.
  ///
  /// In en, this message translates to:
  /// **'Error saving policy: {error}'**
  String insurancePolicyFormScreenFeedbackErrorSaving(String error);

  /// No description provided for @insurancePolicyFormScreenValidationRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get insurancePolicyFormScreenValidationRequired;

  /// No description provided for @insurancePolicyFormScreenLabelPolicyNumber.
  ///
  /// In en, this message translates to:
  /// **'Policy Number'**
  String get insurancePolicyFormScreenLabelPolicyNumber;

  /// No description provided for @insurancePolicyFormScreenLabelClientId.
  ///
  /// In en, this message translates to:
  /// **'Client ID'**
  String get insurancePolicyFormScreenLabelClientId;

  /// No description provided for @insurancePolicyFormScreenLabelManagerId.
  ///
  /// In en, this message translates to:
  /// **'Manager ID'**
  String get insurancePolicyFormScreenLabelManagerId;

  /// No description provided for @insurancePolicyFormScreenLabelAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get insurancePolicyFormScreenLabelAmount;

  /// No description provided for @insurancePolicyFormScreenLabelStartDateWithValue.
  ///
  /// In en, this message translates to:
  /// **'Start Date: {date}'**
  String insurancePolicyFormScreenLabelStartDateWithValue(String date);

  /// No description provided for @insurancePolicyFormScreenLabelStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get insurancePolicyFormScreenLabelStartDate;

  /// No description provided for @insurancePolicyFormScreenLabelExpiryDateWithValue.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date: {date}'**
  String insurancePolicyFormScreenLabelExpiryDateWithValue(String date);

  /// No description provided for @insurancePolicyFormScreenLabelExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get insurancePolicyFormScreenLabelExpiryDate;

  /// No description provided for @insurancePolicyFormScreenPickDateButton.
  ///
  /// In en, this message translates to:
  /// **'Pick'**
  String get insurancePolicyFormScreenPickDateButton;

  /// No description provided for @insurancePolicyFormScreenLabelStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get insurancePolicyFormScreenLabelStatus;

  /// No description provided for @insurancePolicyFormScreenLabelRenewalStatus.
  ///
  /// In en, this message translates to:
  /// **'Renewal Status'**
  String get insurancePolicyFormScreenLabelRenewalStatus;

  /// No description provided for @insurancePolicyFormScreenLabelNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get insurancePolicyFormScreenLabelNotes;

  /// No description provided for @insurancePolicyFormScreenButtonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Policy'**
  String get insurancePolicyFormScreenButtonUpdate;

  /// No description provided for @insurancePolicyFormScreenButtonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Policy'**
  String get insurancePolicyFormScreenButtonCreate;

  /// No description provided for @signupScreenErrorSignupFailed.
  ///
  /// In en, this message translates to:
  /// **'Signup failed: {errorMessage}'**
  String signupScreenErrorSignupFailed(String errorMessage);

  /// No description provided for @signupScreenErrorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred: {error}'**
  String signupScreenErrorUnexpected(String error);

  /// No description provided for @loginScreenSignUpPromptText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign Up'**
  String get loginScreenSignUpPromptText;

  /// No description provided for @loginScreenUsernameValidationEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get loginScreenUsernameValidationEmpty;

  /// No description provided for @loginScreenPasswordValidationEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get loginScreenPasswordValidationEmpty;

  /// No description provided for @loginScreenErrorLoginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginScreenErrorLoginFailed;

  /// No description provided for @loginScreenErrorLoginFailedWithDetails.
  ///
  /// In en, this message translates to:
  /// **'Login failed: {details}'**
  String loginScreenErrorLoginFailedWithDetails(String details);

  /// No description provided for @loginScreenErrorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred: {error}'**
  String loginScreenErrorUnexpected(String error);

  /// No description provided for @interactionFormScreenTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Interaction'**
  String get interactionFormScreenTitleAdd;

  /// No description provided for @interactionFormScreenTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Interaction'**
  String get interactionFormScreenTitleEdit;

  /// No description provided for @interactionFormScreenLabelClient.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get interactionFormScreenLabelClient;

  /// No description provided for @interactionFormScreenLabelEmployee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get interactionFormScreenLabelEmployee;

  /// No description provided for @interactionFormScreenLabelInteractionType.
  ///
  /// In en, this message translates to:
  /// **'Interaction Type'**
  String get interactionFormScreenLabelInteractionType;

  /// No description provided for @interactionFormScreenValidationSelectClient.
  ///
  /// In en, this message translates to:
  /// **'Please select a client'**
  String get interactionFormScreenValidationSelectClient;

  /// No description provided for @interactionFormScreenValidationSelectEmployee.
  ///
  /// In en, this message translates to:
  /// **'Please select an employee'**
  String get interactionFormScreenValidationSelectEmployee;

  /// No description provided for @interactionFormScreenValidationSelectType.
  ///
  /// In en, this message translates to:
  /// **'Please select a type'**
  String get interactionFormScreenValidationSelectType;

  /// No description provided for @interactionFormScreenLabelInteractionDate.
  ///
  /// In en, this message translates to:
  /// **'Interaction Date: {date}'**
  String interactionFormScreenLabelInteractionDate(String date);

  /// No description provided for @interactionFormScreenLabelDateNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get interactionFormScreenLabelDateNotSet;

  /// No description provided for @interactionFormScreenLabelEndTime.
  ///
  /// In en, this message translates to:
  /// **'End Time: {time}'**
  String interactionFormScreenLabelEndTime(String time);

  /// No description provided for @interactionFormScreenLabelSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get interactionFormScreenLabelSubject;

  /// No description provided for @interactionFormScreenValidationEnterSubject.
  ///
  /// In en, this message translates to:
  /// **'Please enter a subject'**
  String get interactionFormScreenValidationEnterSubject;

  /// No description provided for @interactionFormScreenLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get interactionFormScreenLabelDescription;

  /// No description provided for @interactionFormScreenLabelNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get interactionFormScreenLabelNotes;

  /// No description provided for @interactionFormScreenCheckboxScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get interactionFormScreenCheckboxScheduled;

  /// No description provided for @interactionFormScreenCheckboxCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get interactionFormScreenCheckboxCompleted;

  /// No description provided for @interactionFormScreenFeedbackErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Failed to load initial data: {error}'**
  String interactionFormScreenFeedbackErrorLoading(String error);

  /// No description provided for @interactionFormScreenFeedbackSuccessCreate.
  ///
  /// In en, this message translates to:
  /// **'Interaction created successfully'**
  String get interactionFormScreenFeedbackSuccessCreate;

  /// No description provided for @interactionFormScreenFeedbackSuccessUpdate.
  ///
  /// In en, this message translates to:
  /// **'Interaction updated successfully'**
  String get interactionFormScreenFeedbackSuccessUpdate;

  /// No description provided for @interactionFormScreenFeedbackErrorSaving.
  ///
  /// In en, this message translates to:
  /// **'Failed to save interaction: {error}'**
  String interactionFormScreenFeedbackErrorSaving(String error);

  /// No description provided for @interactionFormScreenFeedbackErrorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred: {error}'**
  String interactionFormScreenFeedbackErrorUnexpected(String error);

  /// No description provided for @translationOrderListScreenColumnBlank.
  ///
  /// In en, this message translates to:
  /// **'Blank'**
  String get translationOrderListScreenColumnBlank;

  /// No description provided for @translationOrderListScreenColumnIncorrectBlank.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Blank'**
  String get translationOrderListScreenColumnIncorrectBlank;

  /// No description provided for @translationOrderListScreenColumnTotalSum.
  ///
  /// In en, this message translates to:
  /// **'Total Sum'**
  String get translationOrderListScreenColumnTotalSum;

  /// No description provided for @translationOrderListScreenColumnDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get translationOrderListScreenColumnDocumentType;

  /// No description provided for @translationOrderListScreenColumnCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get translationOrderListScreenColumnCreatedAt;

  /// No description provided for @translationOrderListScreenColumnDoneAt.
  ///
  /// In en, this message translates to:
  /// **'Done At'**
  String get translationOrderListScreenColumnDoneAt;

  /// No description provided for @translationOrderListScreenColumnNotariallyCertified.
  ///
  /// In en, this message translates to:
  /// **'Notarially Certified'**
  String get translationOrderListScreenColumnNotariallyCertified;

  /// No description provided for @translationOrderListScreenValueYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get translationOrderListScreenValueYes;

  /// No description provided for @translationOrderListScreenValueNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get translationOrderListScreenValueNo;

  /// No description provided for @employeeFormScreenTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Employee'**
  String get employeeFormScreenTitleEdit;

  /// No description provided for @employeeFormScreenTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Employee'**
  String get employeeFormScreenTitleAdd;

  /// No description provided for @employeeFormScreenLabelSelectUser.
  ///
  /// In en, this message translates to:
  /// **'Select User'**
  String get employeeFormScreenLabelSelectUser;

  /// No description provided for @employeeFormScreenValidationUserRequired.
  ///
  /// In en, this message translates to:
  /// **'User is required'**
  String get employeeFormScreenValidationUserRequired;

  /// No description provided for @employeeFormScreenLabelUserAccount.
  ///
  /// In en, this message translates to:
  /// **'User Account'**
  String get employeeFormScreenLabelUserAccount;

  /// No description provided for @employeeFormScreenErrorCannotChangeUser.
  ///
  /// In en, this message translates to:
  /// **'Cannot change user for existing employee.'**
  String get employeeFormScreenErrorCannotChangeUser;

  /// No description provided for @employeeFormScreenLabelEmployeeLogin.
  ///
  /// In en, this message translates to:
  /// **'Employee Login'**
  String get employeeFormScreenLabelEmployeeLogin;

  /// No description provided for @employeeFormScreenValidationLoginRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter an employee login'**
  String get employeeFormScreenValidationLoginRequired;

  /// No description provided for @employeeFormScreenLabelEmployeePassword.
  ///
  /// In en, this message translates to:
  /// **'Employee Password'**
  String get employeeFormScreenLabelEmployeePassword;

  /// No description provided for @employeeFormScreenValidationPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get employeeFormScreenValidationPasswordRequired;

  /// No description provided for @employeeFormScreenValidationPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get employeeFormScreenValidationPasswordMinLength;

  /// No description provided for @employeeFormScreenLabelFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get employeeFormScreenLabelFullName;

  /// No description provided for @employeeFormScreenValidationNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter employee name'**
  String get employeeFormScreenValidationNameRequired;

  /// No description provided for @employeeFormScreenLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get employeeFormScreenLabelEmail;

  /// No description provided for @employeeFormScreenValidationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email'**
  String get employeeFormScreenValidationEmailRequired;

  /// No description provided for @employeeFormScreenValidationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get employeeFormScreenValidationEmailInvalid;

  /// No description provided for @employeeFormScreenLabelSelectRole.
  ///
  /// In en, this message translates to:
  /// **'Select Role'**
  String get employeeFormScreenLabelSelectRole;

  /// No description provided for @employeeFormScreenValidationRoleRequired.
  ///
  /// In en, this message translates to:
  /// **'Role is required'**
  String get employeeFormScreenValidationRoleRequired;

  /// No description provided for @employeeFormScreenLabelRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get employeeFormScreenLabelRole;

  /// No description provided for @employeeFormScreenLabelSelectOffice.
  ///
  /// In en, this message translates to:
  /// **'Select Office'**
  String get employeeFormScreenLabelSelectOffice;

  /// No description provided for @employeeFormScreenValidationOfficeRequired.
  ///
  /// In en, this message translates to:
  /// **'Office is required'**
  String get employeeFormScreenValidationOfficeRequired;

  /// No description provided for @employeeFormScreenLabelOffice.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get employeeFormScreenLabelOffice;

  /// No description provided for @employeeFormScreenLabelTelegramId.
  ///
  /// In en, this message translates to:
  /// **'Telegram ID'**
  String get employeeFormScreenLabelTelegramId;

  /// No description provided for @employeeFormScreenLabelWhatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Number'**
  String get employeeFormScreenLabelWhatsappNumber;

  /// No description provided for @employeeFormScreenLabelNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get employeeFormScreenLabelNotes;

  /// No description provided for @employeeFormScreenLabelActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get employeeFormScreenLabelActive;

  /// No description provided for @employeeFormScreenButtonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Employee'**
  String get employeeFormScreenButtonUpdate;

  /// No description provided for @employeeFormScreenButtonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Employee'**
  String get employeeFormScreenButtonCreate;

  /// No description provided for @employeeFormScreenFeedbackErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading employee: {error}'**
  String employeeFormScreenFeedbackErrorLoading(String error);

  /// No description provided for @employeeFormScreenFeedbackSuccessUpdate.
  ///
  /// In en, this message translates to:
  /// **'Employee updated successfully'**
  String get employeeFormScreenFeedbackSuccessUpdate;

  /// No description provided for @employeeFormScreenFeedbackSuccessCreate.
  ///
  /// In en, this message translates to:
  /// **'Employee created successfully'**
  String get employeeFormScreenFeedbackSuccessCreate;

  /// No description provided for @employeeFormScreenFeedbackErrorSaving.
  ///
  /// In en, this message translates to:
  /// **'Error saving employee: {error}'**
  String employeeFormScreenFeedbackErrorSaving(String error);

  /// No description provided for @employeeFormScreenFeedbackErrorLoadingDropdowns.
  ///
  /// In en, this message translates to:
  /// **'Error loading dropdown data: {error}'**
  String employeeFormScreenFeedbackErrorLoadingDropdowns(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

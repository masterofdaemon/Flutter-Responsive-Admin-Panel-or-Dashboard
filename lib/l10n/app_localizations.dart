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

  /// No description provided for @clientFormScreenLabelMiddleName.
  ///
  /// In en, this message translates to:
  /// **'Middle Name (Optional)'**
  String get clientFormScreenLabelMiddleName;

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

  /// No description provided for @clientFormScreenValidationPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Russian phone number (+7 format)'**
  String get clientFormScreenValidationPhoneInvalid;

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

  /// No description provided for @sideMenuOffices.
  ///
  /// In en, this message translates to:
  /// **'Offices'**
  String get sideMenuOffices;

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

  /// No description provided for @sideMenuBanks.
  ///
  /// In en, this message translates to:
  /// **'Banks'**
  String get sideMenuBanks;

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

  /// No description provided for @sideMenuUserManagement.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get sideMenuUserManagement;

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

  /// No description provided for @logoutConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutConfirmationTitle;

  /// No description provided for @logoutConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmationMessage;

  /// No description provided for @logoutConfirmationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get logoutConfirmationCancel;

  /// No description provided for @logoutConfirmationConfirm.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutConfirmationConfirm;

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

  /// No description provided for @translationOrderFormScreenFieldClientNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Client Name'**
  String get translationOrderFormScreenFieldClientNameLabel;

  /// No description provided for @translationOrderFormScreenFieldClientNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter client name (optional)'**
  String get translationOrderFormScreenFieldClientNameHint;

  /// No description provided for @translationOrderFormScreenFieldManagerLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager *'**
  String get translationOrderFormScreenFieldManagerLabel;

  /// No description provided for @translationOrderFormScreenFieldManagerHint.
  ///
  /// In en, this message translates to:
  /// **'Assign manager'**
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
  /// **'Notarial Sum'**
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

  /// No description provided for @translationOrderFormScreenFieldCompletionDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Completion Date'**
  String get translationOrderFormScreenFieldCompletionDateLabel;

  /// No description provided for @translationOrderFormScreenFieldCompletionDateHint.
  ///
  /// In en, this message translates to:
  /// **'Select completion date'**
  String get translationOrderFormScreenFieldCompletionDateHint;

  /// No description provided for @translationOrderFormScreenFieldNotarialSumHint.
  ///
  /// In en, this message translates to:
  /// **'Enter notarial sum'**
  String get translationOrderFormScreenFieldNotarialSumHint;

  /// No description provided for @translationOrderFormScreenFieldPaymentIdHint.
  ///
  /// In en, this message translates to:
  /// **'Enter payment reference'**
  String get translationOrderFormScreenFieldPaymentIdHint;

  /// No description provided for @translationOrderFormScreenFieldTotalSumLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Sum'**
  String get translationOrderFormScreenFieldTotalSumLabel;

  /// No description provided for @translationOrderFormScreenFieldTotalSumHint.
  ///
  /// In en, this message translates to:
  /// **'Calculated automatically from pricing'**
  String get translationOrderFormScreenFieldTotalSumHint;

  /// No description provided for @translationOrderFormScreenSectionTitleActions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get translationOrderFormScreenSectionTitleActions;

  /// No description provided for @translationOrderFormScreenSectionTitlePricingPayment.
  ///
  /// In en, this message translates to:
  /// **'Pricing & Payment'**
  String get translationOrderFormScreenSectionTitlePricingPayment;

  /// No description provided for @translationOrderFormScreenButtonSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get translationOrderFormScreenButtonSaving;

  /// No description provided for @translationOrderFormScreenButtonSaveOrder.
  ///
  /// In en, this message translates to:
  /// **'Save Order'**
  String get translationOrderFormScreenButtonSaveOrder;

  /// No description provided for @translationOrderFormScreenDialogConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get translationOrderFormScreenDialogConfirmDeleteTitle;

  /// No description provided for @translationOrderFormScreenDialogConfirmDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this order? This action cannot be undone.'**
  String get translationOrderFormScreenDialogConfirmDeleteMessage;

  /// No description provided for @translationOrderFormScreenDialogButtonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get translationOrderFormScreenDialogButtonCancel;

  /// No description provided for @translationOrderFormScreenDialogButtonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get translationOrderFormScreenDialogButtonDelete;

  /// No description provided for @translationOrderFormScreenButtonDeleteOrder.
  ///
  /// In en, this message translates to:
  /// **'Delete Order'**
  String get translationOrderFormScreenButtonDeleteOrder;

  /// No description provided for @translationOrderFormScreenAppBarTitleCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Order'**
  String get translationOrderFormScreenAppBarTitleCreate;

  /// No description provided for @translationOrderFormScreenAppBarTitleUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Order'**
  String get translationOrderFormScreenAppBarTitleUpdate;

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

  /// Tooltip for the add new translation order button
  ///
  /// In en, this message translates to:
  /// **'Add new translation order'**
  String get translationOrderListScreenTooltipAdd;

  /// No description provided for @documentTypePassport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get documentTypePassport;

  /// No description provided for @documentTypeDiploma.
  ///
  /// In en, this message translates to:
  /// **'Diploma'**
  String get documentTypeDiploma;

  /// No description provided for @documentTypeBirthCertificate.
  ///
  /// In en, this message translates to:
  /// **'Birth Certificate'**
  String get documentTypeBirthCertificate;

  /// No description provided for @documentTypeContract.
  ///
  /// In en, this message translates to:
  /// **'Contract'**
  String get documentTypeContract;

  /// No description provided for @documentTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get documentTypeOther;

  /// No description provided for @documentTypePassportRf.
  ///
  /// In en, this message translates to:
  /// **'Russian Passport'**
  String get documentTypePassportRf;

  /// No description provided for @documentTypePassportForeign.
  ///
  /// In en, this message translates to:
  /// **'Foreign Passport'**
  String get documentTypePassportForeign;

  /// No description provided for @documentTypePassportInternal.
  ///
  /// In en, this message translates to:
  /// **'Internal Passport'**
  String get documentTypePassportInternal;

  /// No description provided for @documentTypeDriverLicense.
  ///
  /// In en, this message translates to:
  /// **'Driver\'s License'**
  String get documentTypeDriverLicense;

  /// No description provided for @documentTypeMarriageCertificate.
  ///
  /// In en, this message translates to:
  /// **'Marriage Certificate'**
  String get documentTypeMarriageCertificate;

  /// No description provided for @documentTypeDivorceCertificate.
  ///
  /// In en, this message translates to:
  /// **'Divorce Certificate'**
  String get documentTypeDivorceCertificate;

  /// No description provided for @documentTypeDeathCertificate.
  ///
  /// In en, this message translates to:
  /// **'Death Certificate'**
  String get documentTypeDeathCertificate;

  /// No description provided for @documentTypeDiplomaHigher.
  ///
  /// In en, this message translates to:
  /// **'Higher Education Diploma'**
  String get documentTypeDiplomaHigher;

  /// No description provided for @documentTypeDiplomaSecondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary Education Diploma'**
  String get documentTypeDiplomaSecondary;

  /// No description provided for @documentTypeTranscript.
  ///
  /// In en, this message translates to:
  /// **'Academic Transcript'**
  String get documentTypeTranscript;

  /// No description provided for @documentTypeCertificateCourse.
  ///
  /// In en, this message translates to:
  /// **'Course Certificate'**
  String get documentTypeCertificateCourse;

  /// No description provided for @documentTypeMedicalCertificate.
  ///
  /// In en, this message translates to:
  /// **'Medical Certificate'**
  String get documentTypeMedicalCertificate;

  /// No description provided for @documentTypeVaccinationRecord.
  ///
  /// In en, this message translates to:
  /// **'Vaccination Record'**
  String get documentTypeVaccinationRecord;

  /// No description provided for @documentTypePowerOfAttorney.
  ///
  /// In en, this message translates to:
  /// **'Power of Attorney'**
  String get documentTypePowerOfAttorney;

  /// No description provided for @documentTypeCourtDecision.
  ///
  /// In en, this message translates to:
  /// **'Court Decision'**
  String get documentTypeCourtDecision;

  /// No description provided for @documentTypeApostille.
  ///
  /// In en, this message translates to:
  /// **'Apostille'**
  String get documentTypeApostille;

  /// No description provided for @documentTypeBankStatement.
  ///
  /// In en, this message translates to:
  /// **'Bank Statement'**
  String get documentTypeBankStatement;

  /// No description provided for @documentTypeIncomeCertificate.
  ///
  /// In en, this message translates to:
  /// **'Income Certificate'**
  String get documentTypeIncomeCertificate;

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

  /// No description provided for @employeeFormScreenValidationWhatsappInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Russian phone number (+7XXXXXXXXXX)'**
  String get employeeFormScreenValidationWhatsappInvalid;

  /// No description provided for @employeeFormScreenHintWhatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'+7XXXXXXXXXX'**
  String get employeeFormScreenHintWhatsappNumber;

  /// No description provided for @translationOrderFormScreenCreateNewTitle.
  ///
  /// In en, this message translates to:
  /// **'Create New Translation Order'**
  String get translationOrderFormScreenCreateNewTitle;

  /// No description provided for @translationOrderFormScreenEditTitleFull.
  ///
  /// In en, this message translates to:
  /// **'Edit Translation Order'**
  String get translationOrderFormScreenEditTitleFull;

  /// No description provided for @translationOrderFormScreenCreateDescription.
  ///
  /// In en, this message translates to:
  /// **'Fill in the details to create a new translation order'**
  String get translationOrderFormScreenCreateDescription;

  /// No description provided for @translationOrderFormScreenEditDescription.
  ///
  /// In en, this message translates to:
  /// **'Update the order details and status'**
  String get translationOrderFormScreenEditDescription;

  /// No description provided for @translationOrderFormScreenFieldTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Enter a descriptive title for this order'**
  String get translationOrderFormScreenFieldTitleHint;

  /// No description provided for @translationOrderFormScreenFieldTranslatorHintSelect.
  ///
  /// In en, this message translates to:
  /// **'Assign translator'**
  String get translationOrderFormScreenFieldTranslatorHintSelect;

  /// No description provided for @translationOrderFormScreenFieldBlankNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Blank Number'**
  String get translationOrderFormScreenFieldBlankNumberLabel;

  /// No description provided for @translationOrderFormScreenSectionTitleTranslation.
  ///
  /// In en, this message translates to:
  /// **'Translation Details'**
  String get translationOrderFormScreenSectionTitleTranslation;

  /// No description provided for @translationOrderFormScreenFieldSourceLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., English'**
  String get translationOrderFormScreenFieldSourceLanguageHint;

  /// No description provided for @translationOrderFormScreenFieldSourceLanguageValidationRequired.
  ///
  /// In en, this message translates to:
  /// **'Source language is required'**
  String get translationOrderFormScreenFieldSourceLanguageValidationRequired;

  /// No description provided for @translationOrderFormScreenFieldTargetLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Russian'**
  String get translationOrderFormScreenFieldTargetLanguageHint;

  /// No description provided for @translationOrderFormScreenFieldTargetLanguageValidationRequired.
  ///
  /// In en, this message translates to:
  /// **'Target language is required'**
  String get translationOrderFormScreenFieldTargetLanguageValidationRequired;

  /// No description provided for @translationOrderFormScreenFieldPageCountHint.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get translationOrderFormScreenFieldPageCountHint;

  /// No description provided for @translationOrderFormScreenSectionTitleNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get translationOrderFormScreenSectionTitleNotes;

  /// No description provided for @translationOrderFormScreenSectionTitleStatus.
  ///
  /// In en, this message translates to:
  /// **'Status & Progress'**
  String get translationOrderFormScreenSectionTitleStatus;

  /// No description provided for @translationOrderFormScreenSectionTitlePricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get translationOrderFormScreenSectionTitlePricing;

  /// No description provided for @translationOrderFormScreenFieldIncorrectBlankLabel.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Blank Number'**
  String get translationOrderFormScreenFieldIncorrectBlankLabel;

  /// No description provided for @translationOrderFormScreenFieldIncorrectBlankHint.
  ///
  /// In en, this message translates to:
  /// **'Enter incorrect blank number if applicable'**
  String get translationOrderFormScreenFieldIncorrectBlankHint;

  /// No description provided for @translationOrderFormScreenFieldNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Add any additional notes or special instructions...'**
  String get translationOrderFormScreenFieldNotesHint;

  /// No description provided for @translationOrderFormScreenStatusCurrentLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Status'**
  String get translationOrderFormScreenStatusCurrentLabel;

  /// No description provided for @translationOrderFormScreenStatusUpdateLabel.
  ///
  /// In en, this message translates to:
  /// **'Update Status'**
  String get translationOrderFormScreenStatusUpdateLabel;

  /// No description provided for @translationProgressStatusPendingAssignment.
  ///
  /// In en, this message translates to:
  /// **'Pending Assignment'**
  String get translationProgressStatusPendingAssignment;

  /// No description provided for @translationProgressStatusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get translationProgressStatusInProgress;

  /// No description provided for @translationProgressStatusTranslated.
  ///
  /// In en, this message translates to:
  /// **'Translation Complete'**
  String get translationProgressStatusTranslated;

  /// No description provided for @translationProgressStatusCheckedByManager.
  ///
  /// In en, this message translates to:
  /// **'Manager Approved'**
  String get translationProgressStatusCheckedByManager;

  /// No description provided for @translationProgressStatusClientNotified.
  ///
  /// In en, this message translates to:
  /// **'Client Notified'**
  String get translationProgressStatusClientNotified;

  /// No description provided for @translationProgressStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get translationProgressStatusDelivered;

  /// No description provided for @translationOrderFormScreenNewOrderStatusInfo.
  ///
  /// In en, this message translates to:
  /// **'This order will be created with \"Pending Assignment\" status'**
  String get translationOrderFormScreenNewOrderStatusInfo;

  /// No description provided for @translationOrderFormScreenOrderIdLabel.
  ///
  /// In en, this message translates to:
  /// **'ID: {orderId}'**
  String translationOrderFormScreenOrderIdLabel(String orderId);

  /// No description provided for @officesScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Offices Management'**
  String get officesScreenTitle;

  /// No description provided for @officesScreenSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Offices (City, Address, Phone)'**
  String get officesScreenSearchHint;

  /// No description provided for @officesScreenTooltipAdd.
  ///
  /// In en, this message translates to:
  /// **'Add New Office'**
  String get officesScreenTooltipAdd;

  /// No description provided for @officesScreenTooltipEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Office'**
  String get officesScreenTooltipEdit;

  /// No description provided for @officesScreenTooltipDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Office'**
  String get officesScreenTooltipDelete;

  /// No description provided for @officesScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Failed to load offices: {error}'**
  String officesScreenErrorLoading(String error);

  /// No description provided for @officesScreenErrorDeleting.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete office: {error}'**
  String officesScreenErrorDeleting(String error);

  /// No description provided for @officesScreenSuccessDeleted.
  ///
  /// In en, this message translates to:
  /// **'Office \"{city}\" deleted successfully'**
  String officesScreenSuccessDeleted(String city);

  /// No description provided for @officesScreenConfirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Office'**
  String get officesScreenConfirmDeleteTitle;

  /// No description provided for @officesScreenConfirmDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the office in \"{city}\"?'**
  String officesScreenConfirmDeleteMessage(String city);

  /// No description provided for @officesScreenConfirmDeleteCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get officesScreenConfirmDeleteCancel;

  /// No description provided for @officesScreenConfirmDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get officesScreenConfirmDeleteConfirm;

  /// No description provided for @officeFormScreenTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add New Office'**
  String get officeFormScreenTitleAdd;

  /// No description provided for @officeFormScreenTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Office'**
  String get officeFormScreenTitleEdit;

  /// No description provided for @officeFormScreenLabelCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get officeFormScreenLabelCity;

  /// No description provided for @officeFormScreenLabelAddress.
  ///
  /// In en, this message translates to:
  /// **'Address (Optional)'**
  String get officeFormScreenLabelAddress;

  /// No description provided for @officeFormScreenLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone (Optional)'**
  String get officeFormScreenLabelPhone;

  /// No description provided for @officeFormScreenLabelNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get officeFormScreenLabelNotes;

  /// No description provided for @officeFormScreenValidationCityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get officeFormScreenValidationCityRequired;

  /// No description provided for @officeFormScreenButtonCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Office'**
  String get officeFormScreenButtonCreate;

  /// No description provided for @officeFormScreenButtonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Office'**
  String get officeFormScreenButtonUpdate;

  /// No description provided for @officeFormScreenErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading office: {error}'**
  String officeFormScreenErrorLoading(String error);

  /// No description provided for @officeFormScreenErrorSaving.
  ///
  /// In en, this message translates to:
  /// **'Error saving office: {error}'**
  String officeFormScreenErrorSaving(String error);

  /// No description provided for @officeFormScreenSuccessCreated.
  ///
  /// In en, this message translates to:
  /// **'Office created successfully'**
  String get officeFormScreenSuccessCreated;

  /// No description provided for @officeFormScreenSuccessUpdated.
  ///
  /// In en, this message translates to:
  /// **'Office updated successfully'**
  String get officeFormScreenSuccessUpdated;

  /// No description provided for @plutoGridFilterAllColumns.
  ///
  /// In en, this message translates to:
  /// **'All Columns'**
  String get plutoGridFilterAllColumns;

  /// No description provided for @plutoGridFilterContains.
  ///
  /// In en, this message translates to:
  /// **'Contains'**
  String get plutoGridFilterContains;

  /// No description provided for @plutoGridFilterEquals.
  ///
  /// In en, this message translates to:
  /// **'Equals'**
  String get plutoGridFilterEquals;

  /// No description provided for @plutoGridFilterStartsWith.
  ///
  /// In en, this message translates to:
  /// **'Starts with'**
  String get plutoGridFilterStartsWith;

  /// No description provided for @plutoGridFilterEndsWith.
  ///
  /// In en, this message translates to:
  /// **'Ends with'**
  String get plutoGridFilterEndsWith;

  /// No description provided for @plutoGridFilterGreaterThan.
  ///
  /// In en, this message translates to:
  /// **'Greater than'**
  String get plutoGridFilterGreaterThan;

  /// No description provided for @plutoGridFilterGreaterThanOrEqualTo.
  ///
  /// In en, this message translates to:
  /// **'Greater than or equal to'**
  String get plutoGridFilterGreaterThanOrEqualTo;

  /// No description provided for @plutoGridFilterLessThan.
  ///
  /// In en, this message translates to:
  /// **'Less than'**
  String get plutoGridFilterLessThan;

  /// No description provided for @plutoGridFilterLessThanOrEqualTo.
  ///
  /// In en, this message translates to:
  /// **'Less than or equal to'**
  String get plutoGridFilterLessThanOrEqualTo;

  /// No description provided for @plutoGridFilterApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get plutoGridFilterApply;

  /// No description provided for @plutoGridFilterClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get plutoGridFilterClear;

  /// No description provided for @plutoGridFilterPopupTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get plutoGridFilterPopupTitle;

  /// No description provided for @plutoGridFilterColumn.
  ///
  /// In en, this message translates to:
  /// **'Column'**
  String get plutoGridFilterColumn;

  /// No description provided for @plutoGridFilterType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get plutoGridFilterType;

  /// No description provided for @plutoGridFilterValue.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get plutoGridFilterValue;

  /// No description provided for @translationOrderFormScreenErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String translationOrderFormScreenErrorGeneric(String error);

  /// No description provided for @currencySymbolRuble.
  ///
  /// In en, this message translates to:
  /// **'₽'**
  String get currencySymbolRuble;

  /// No description provided for @defaultCityName.
  ///
  /// In en, this message translates to:
  /// **'Moscow'**
  String get defaultCityName;

  /// No description provided for @managerLevelRegular.
  ///
  /// In en, this message translates to:
  /// **'regular'**
  String get managerLevelRegular;

  /// No description provided for @documentTypeDropdownSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Document Type'**
  String get documentTypeDropdownSelectTitle;

  /// No description provided for @documentTypeDropdownCustomOption.
  ///
  /// In en, this message translates to:
  /// **'Other (specify)...'**
  String get documentTypeDropdownCustomOption;

  /// No description provided for @documentTypeDropdownCustomSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter custom document type'**
  String get documentTypeDropdownCustomSubtitle;

  /// No description provided for @documentTypeDropdownBasePriceLabel.
  ///
  /// In en, this message translates to:
  /// **'{currencySymbol}{price} base price'**
  String documentTypeDropdownBasePriceLabel(
      String currencySymbol, String price);

  /// No description provided for @documentTypeDropdownCustomDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Document Type'**
  String get documentTypeDropdownCustomDialogTitle;

  /// No description provided for @documentTypeDropdownCustomDialogLabel.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get documentTypeDropdownCustomDialogLabel;

  /// No description provided for @documentTypeDropdownCustomDialogHint.
  ///
  /// In en, this message translates to:
  /// **'Enter document type name'**
  String get documentTypeDropdownCustomDialogHint;

  /// No description provided for @buttonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get buttonCancel;

  /// No description provided for @buttonSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get buttonSelect;

  /// No description provided for @translationPricingBasePriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Base Price (per page)'**
  String get translationPricingBasePriceLabel;

  /// No description provided for @translationPricingNumberOfPagesLabel.
  ///
  /// In en, this message translates to:
  /// **'Number of Pages'**
  String get translationPricingNumberOfPagesLabel;

  /// No description provided for @translationPricingTranslationSumLabel.
  ///
  /// In en, this message translates to:
  /// **'Translation Sum'**
  String get translationPricingTranslationSumLabel;

  /// No description provided for @translationPricingUrgentTranslationSumLabel.
  ///
  /// In en, this message translates to:
  /// **'Urgent Translation Sum'**
  String get translationPricingUrgentTranslationSumLabel;

  /// No description provided for @translationPricingNotarialSumLabel.
  ///
  /// In en, this message translates to:
  /// **'Notarial/Legal Certification'**
  String get translationPricingNotarialSumLabel;

  /// No description provided for @translationPricingTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'TOTAL'**
  String get translationPricingTotalLabel;

  /// No description provided for @translationPricingUrgentSurcharge.
  ///
  /// In en, this message translates to:
  /// **'Urgent (+100%)'**
  String get translationPricingUrgentSurcharge;

  /// No description provided for @translationPricingSemiUrgentSurcharge.
  ///
  /// In en, this message translates to:
  /// **'Semi-Urgent (+50%)'**
  String get translationPricingSemiUrgentSurcharge;

  /// No description provided for @translationPricingPriorityMultiplier.
  ///
  /// In en, this message translates to:
  /// **'Priority Multiplier'**
  String get translationPricingPriorityMultiplier;

  /// No description provided for @translationPricingInformationTitle.
  ///
  /// In en, this message translates to:
  /// **'Pricing Information'**
  String get translationPricingInformationTitle;

  /// No description provided for @translationPricingUrgentSurchargeInfo.
  ///
  /// In en, this message translates to:
  /// **'Urgent orders require 100% surcharge'**
  String get translationPricingUrgentSurchargeInfo;

  /// No description provided for @translationPricingSemiUrgentSurchargeInfo.
  ///
  /// In en, this message translates to:
  /// **'Semi-urgent orders require 50% surcharge'**
  String get translationPricingSemiUrgentSurchargeInfo;

  /// No description provided for @translationPricingLocationDiscountInfo.
  ///
  /// In en, this message translates to:
  /// **'{cityName} location provides {discount}% discount'**
  String translationPricingLocationDiscountInfo(String cityName, int discount);

  /// No description provided for @translationPricingLocationSurchargeInfo.
  ///
  /// In en, this message translates to:
  /// **'{cityName} location adds {surcharge}% surcharge'**
  String translationPricingLocationSurchargeInfo(
      String cityName, int surcharge);

  /// No description provided for @translationPricingComplexityBonusInfo.
  ///
  /// In en, this message translates to:
  /// **'Complexity bonus: {percentage}%'**
  String translationPricingComplexityBonusInfo(int percentage);

  /// No description provided for @translationPricingStandardPricing.
  ///
  /// In en, this message translates to:
  /// **'Standard pricing applies'**
  String get translationPricingStandardPricing;

  /// No description provided for @translationPricingCalculationTitle.
  ///
  /// In en, this message translates to:
  /// **'Pricing Calculation'**
  String get translationPricingCalculationTitle;

  /// No description provided for @translationPricingSelectDocumentTypeMessage.
  ///
  /// In en, this message translates to:
  /// **'Please select a document type to see pricing'**
  String get translationPricingSelectDocumentTypeMessage;

  /// No description provided for @translationPricingCalculatingMessage.
  ///
  /// In en, this message translates to:
  /// **'Calculating pricing...'**
  String get translationPricingCalculatingMessage;

  /// No description provided for @translationPricingCityMultiplierText.
  ///
  /// In en, this message translates to:
  /// **'City: {multiplier}x ({cityName})'**
  String translationPricingCityMultiplierText(
      double multiplier, String cityName);

  /// No description provided for @translationPricingManagerMultiplierText.
  ///
  /// In en, this message translates to:
  /// **'Manager: {multiplier}x ({managerLevel})'**
  String translationPricingManagerMultiplierText(
      double multiplier, String managerLevel);

  /// No description provided for @blankNumberFieldHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digit number (e.g., 123456)'**
  String get blankNumberFieldHintText;

  /// No description provided for @blankNumberFieldGenerateTooltip.
  ///
  /// In en, this message translates to:
  /// **'Generate blank number'**
  String get blankNumberFieldGenerateTooltip;

  /// No description provided for @blankNumberFieldSuggestTooltip.
  ///
  /// In en, this message translates to:
  /// **'Suggest next number'**
  String get blankNumberFieldSuggestTooltip;

  /// No description provided for @blankNumberFieldHelperText.
  ///
  /// In en, this message translates to:
  /// **'Format: 6 digits (000000-999999)'**
  String get blankNumberFieldHelperText;

  /// No description provided for @blankNumberFieldRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Blank number is required'**
  String get blankNumberFieldRequiredError;

  /// No description provided for @blankNumberFieldInvalidFormatError.
  ///
  /// In en, this message translates to:
  /// **'Invalid format. Must be exactly 6 digits'**
  String get blankNumberFieldInvalidFormatError;

  /// No description provided for @blankNumberFieldDuplicateError.
  ///
  /// In en, this message translates to:
  /// **'This blank number is already used'**
  String get blankNumberFieldDuplicateError;

  /// No description provided for @blankNumberFieldGeneratedMessage.
  ///
  /// In en, this message translates to:
  /// **'{action} blank number: {number}'**
  String blankNumberFieldGeneratedMessage(String action, String number);

  /// No description provided for @blankNumberFieldActionGenerated.
  ///
  /// In en, this message translates to:
  /// **'Generated'**
  String get blankNumberFieldActionGenerated;

  /// No description provided for @blankNumberFieldActionSuggested.
  ///
  /// In en, this message translates to:
  /// **'Suggested'**
  String get blankNumberFieldActionSuggested;

  /// No description provided for @blankNumbersWidgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Blank Numbers'**
  String get blankNumbersWidgetTitle;

  /// No description provided for @blankNumbersWidgetMainLabel.
  ///
  /// In en, this message translates to:
  /// **'Main Blank Number *'**
  String get blankNumbersWidgetMainLabel;

  /// No description provided for @blankNumbersWidgetDamagedCheckbox.
  ///
  /// In en, this message translates to:
  /// **'Add Damaged/Spoiled Blank'**
  String get blankNumbersWidgetDamagedCheckbox;

  /// No description provided for @blankNumbersWidgetDamagedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check if a blank was damaged and needs replacement'**
  String get blankNumbersWidgetDamagedSubtitle;

  /// No description provided for @blankNumbersWidgetDamagedLabel.
  ///
  /// In en, this message translates to:
  /// **'Damaged Blank Number'**
  String get blankNumbersWidgetDamagedLabel;

  /// No description provided for @blankNumbersWidgetDamagedHint.
  ///
  /// In en, this message translates to:
  /// **'Number of the damaged blank being replaced'**
  String get blankNumbersWidgetDamagedHint;

  /// No description provided for @blankNumbersWidgetDamagedWarning.
  ///
  /// In en, this message translates to:
  /// **'Record the damaged blank number for tracking and audit purposes. This helps maintain blank inventory accuracy.'**
  String get blankNumbersWidgetDamagedWarning;

  /// No description provided for @blankNumbersWidgetGuidelinesTitle.
  ///
  /// In en, this message translates to:
  /// **'Blank Number Guidelines'**
  String get blankNumbersWidgetGuidelinesTitle;

  /// No description provided for @blankNumbersWidgetGuidelinesText.
  ///
  /// In en, this message translates to:
  /// **'• Use exactly 6 digits (e.g., 123456)\n• Each blank number must be unique\n• Use \"Generate\" for timestamp-based numbers\n• Use \"Suggest\" for sequential numbering\n• Record damaged blanks for audit trail'**
  String get blankNumbersWidgetGuidelinesText;

  /// No description provided for @searchableDropdownHint.
  ///
  /// In en, this message translates to:
  /// **'Select an option...'**
  String get searchableDropdownHint;

  /// No description provided for @searchableDropdownSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchableDropdownSearchHint;

  /// No description provided for @searchableDropdownNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get searchableDropdownNoResults;

  /// No description provided for @topActionButtonsApplications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get topActionButtonsApplications;

  /// No description provided for @topActionButtonsClients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get topActionButtonsClients;

  /// No description provided for @sideMenuDirections.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get sideMenuDirections;

  /// No description provided for @sideMenuAdminPanel.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get sideMenuAdminPanel;

  /// No description provided for @sideMenuAllApplications.
  ///
  /// In en, this message translates to:
  /// **'All Applications'**
  String get sideMenuAllApplications;

  /// No description provided for @sideMenuPartners.
  ///
  /// In en, this message translates to:
  /// **'Partners'**
  String get sideMenuPartners;

  /// No description provided for @sideMenuActs.
  ///
  /// In en, this message translates to:
  /// **'Acts'**
  String get sideMenuActs;

  /// No description provided for @directionTranslationAgency.
  ///
  /// In en, this message translates to:
  /// **'Translation Agency'**
  String get directionTranslationAgency;

  /// No description provided for @directionLegalServices.
  ///
  /// In en, this message translates to:
  /// **'Legal Services'**
  String get directionLegalServices;

  /// No description provided for @directionInsuranceServices.
  ///
  /// In en, this message translates to:
  /// **'Insurance Services'**
  String get directionInsuranceServices;

  /// No description provided for @directionLending.
  ///
  /// In en, this message translates to:
  /// **'Lending'**
  String get directionLending;

  /// No description provided for @directionOpeningAccounts.
  ///
  /// In en, this message translates to:
  /// **'Opening Accounts'**
  String get directionOpeningAccounts;

  /// No description provided for @directionAdvancedTraining.
  ///
  /// In en, this message translates to:
  /// **'Advanced Training'**
  String get directionAdvancedTraining;

  /// No description provided for @directionCopyrightProtection.
  ///
  /// In en, this message translates to:
  /// **'Copyright Protection'**
  String get directionCopyrightProtection;

  /// No description provided for @directionPropertyValuation.
  ///
  /// In en, this message translates to:
  /// **'Property Valuation'**
  String get directionPropertyValuation;

  /// No description provided for @rightSidebarCalendarHeader.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get rightSidebarCalendarHeader;

  /// No description provided for @rightSidebarNotificationsHeader.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get rightSidebarNotificationsHeader;

  /// No description provided for @calendarToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get calendarToday;

  /// No description provided for @calendarViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All Events'**
  String get calendarViewAll;

  /// No description provided for @calendarUpcomingEvents.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get calendarUpcomingEvents;

  /// No description provided for @calendarNoEvents.
  ///
  /// In en, this message translates to:
  /// **'No events scheduled'**
  String get calendarNoEvents;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All Read'**
  String get notificationsMarkAllRead;

  /// No description provided for @notificationsViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get notificationsViewAll;

  /// No description provided for @notificationsNoNew.
  ///
  /// In en, this message translates to:
  /// **'No new notifications'**
  String get notificationsNoNew;

  /// No description provided for @notificationApplicationSubmitted.
  ///
  /// In en, this message translates to:
  /// **'New application submitted'**
  String get notificationApplicationSubmitted;

  /// No description provided for @notificationClientRegistered.
  ///
  /// In en, this message translates to:
  /// **'New client registered'**
  String get notificationClientRegistered;

  /// No description provided for @notificationDocumentUploaded.
  ///
  /// In en, this message translates to:
  /// **'Document uploaded'**
  String get notificationDocumentUploaded;

  /// No description provided for @notificationPaymentReceived.
  ///
  /// In en, this message translates to:
  /// **'Payment received'**
  String get notificationPaymentReceived;

  /// No description provided for @notificationsMins.
  ///
  /// In en, this message translates to:
  /// **'mins'**
  String get notificationsMins;

  /// No description provided for @rightSidebarTitle.
  ///
  /// In en, this message translates to:
  /// **'Information Panel'**
  String get rightSidebarTitle;

  /// No description provided for @rightSidebarCloseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close sidebar'**
  String get rightSidebarCloseTooltip;

  /// No description provided for @calendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarTitle;

  /// No description provided for @calendarAddEventTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new event'**
  String get calendarAddEventTooltip;

  /// No description provided for @calendarTodaysEvents.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Events'**
  String get calendarTodaysEvents;

  /// No description provided for @calendarNoEventsToday.
  ///
  /// In en, this message translates to:
  /// **'No events scheduled for today'**
  String get calendarNoEventsToday;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsUnreadOnly.
  ///
  /// In en, this message translates to:
  /// **'Unread only'**
  String get notificationsUnreadOnly;

  /// No description provided for @notificationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get notificationsEmpty;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @userManagement.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get userManagement;

  /// No description provided for @userManagementDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage employees, roles, and access permissions'**
  String get userManagementDescription;

  /// No description provided for @addEmployee.
  ///
  /// In en, this message translates to:
  /// **'Add Employee'**
  String get addEmployee;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @searchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search users...'**
  String get searchUsers;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @allRoles.
  ///
  /// In en, this message translates to:
  /// **'All Roles'**
  String get allRoles;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @allStatuses.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get allStatuses;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @selectedItems.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedItems(int count);

  /// No description provided for @clearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear Selection'**
  String get clearSelection;

  /// No description provided for @disableSelected.
  ///
  /// In en, this message translates to:
  /// **'Disable Selected'**
  String get disableSelected;

  /// No description provided for @enableSelected.
  ///
  /// In en, this message translates to:
  /// **'Enable Selected'**
  String get enableSelected;

  /// No description provided for @noUsersFound.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get noUsersFound;

  /// No description provided for @tryAdjustingFilters.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search criteria or filters'**
  String get tryAdjustingFilters;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @lastLogin.
  ///
  /// In en, this message translates to:
  /// **'Last Login'**
  String get lastLogin;

  /// No description provided for @viewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfile;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @disableAccount.
  ///
  /// In en, this message translates to:
  /// **'Disable Account'**
  String get disableAccount;

  /// No description provided for @enableAccount.
  ///
  /// In en, this message translates to:
  /// **'Enable Account'**
  String get enableAccount;

  /// No description provided for @employeeDetails.
  ///
  /// In en, this message translates to:
  /// **'Employee Details'**
  String get employeeDetails;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @telegramId.
  ///
  /// In en, this message translates to:
  /// **'Telegram ID'**
  String get telegramId;

  /// No description provided for @whatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Number'**
  String get whatsappNumber;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @resetPasswordWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset the password for {name}? They will need to use the new password to log in.'**
  String resetPasswordWarning(String name);

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @reasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Reason is required'**
  String get reasonRequired;

  /// No description provided for @passwordResetFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to reset password'**
  String get passwordResetFailed;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successful'**
  String get passwordResetSuccess;

  /// No description provided for @newPasswordGenerated.
  ///
  /// In en, this message translates to:
  /// **'New password for {name}: {password}'**
  String newPasswordGenerated(String name, String password);

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Password copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @copyPassword.
  ///
  /// In en, this message translates to:
  /// **'Copy Password'**
  String get copyPassword;

  /// No description provided for @passwordResetInstructions.
  ///
  /// In en, this message translates to:
  /// **'The new password has been copied to your clipboard. Please share it securely with the employee.'**
  String get passwordResetInstructions;

  /// No description provided for @understood.
  ///
  /// In en, this message translates to:
  /// **'Understood'**
  String get understood;

  /// No description provided for @disableAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to disable the account for {name}?'**
  String disableAccountWarning(String name);

  /// No description provided for @disableAccountConsequences.
  ///
  /// In en, this message translates to:
  /// **'This will:\n• Change their password to a random value\n• Force logout from all active sessions\n• Block access until reactivated'**
  String get disableAccountConsequences;

  /// No description provided for @accountDisabledSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account for {name} has been disabled successfully'**
  String accountDisabledSuccess(String name);

  /// No description provided for @accountDisableFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to disable account'**
  String get accountDisableFailed;

  /// No description provided for @enableAccountConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to enable the account for {name}?'**
  String enableAccountConfirmation(String name);

  /// No description provided for @accountEnabledSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account for {name} has been enabled successfully'**
  String accountEnabledSuccess(String name);

  /// No description provided for @accountEnableFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to enable account'**
  String get accountEnableFailed;

  /// No description provided for @bulkDisableAccounts.
  ///
  /// In en, this message translates to:
  /// **'Disable Multiple Accounts'**
  String get bulkDisableAccounts;

  /// No description provided for @bulkDisableWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to disable {count} employee accounts?'**
  String bulkDisableWarning(int count);

  /// No description provided for @bulkOperationResult.
  ///
  /// In en, this message translates to:
  /// **'{successful} accounts processed successfully, {failed} failed'**
  String bulkOperationResult(int successful, int failed);

  /// No description provided for @bulkEnableAccounts.
  ///
  /// In en, this message translates to:
  /// **'Enable Multiple Accounts'**
  String get bulkEnableAccounts;

  /// No description provided for @bulkEnableConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to enable {count} employee accounts?'**
  String bulkEnableConfirmation(int count);
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

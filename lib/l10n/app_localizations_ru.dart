// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get employeeListScreenTitle => 'Сотрудники';

  @override
  String employeeListScreenErrorLoading(String error) {
    return 'Ошибка загрузки сотрудников: $error';
  }

  @override
  String get employeeListScreenConfirmDeleteTitle => 'Подтвердите удаление';

  @override
  String employeeListScreenConfirmDeleteContent(String name) {
    return 'Вы уверены, что хотите удалить сотрудника \"$name\"?';
  }

  @override
  String get employeeListScreenConfirmDeleteActionCancel => 'Отмена';

  @override
  String get employeeListScreenConfirmDeleteActionDelete => 'Удалить';

  @override
  String employeeListScreenFeedbackSuccessDelete(String name) {
    return 'Сотрудник \"$name\" успешно удалён';
  }

  @override
  String employeeListScreenFeedbackErrorDelete(String error) {
    return 'Ошибка удаления сотрудника: $error';
  }

  @override
  String get employeeListScreenColumnName => 'Имя';

  @override
  String get employeeListScreenColumnEmail => 'Email';

  @override
  String get employeeListScreenColumnRole => 'Роль';

  @override
  String get employeeListScreenColumnOfficeId => 'ID офиса';

  @override
  String get employeeListScreenColumnActive => 'Активен';

  @override
  String get employeeListScreenColumnActions => 'Действия';

  @override
  String get employeeListScreenTooltipEdit => 'Редактировать сотрудника';

  @override
  String get employeeListScreenTooltipDelete => 'Удалить сотрудника';

  @override
  String get employeeListScreenTooltipRefresh => 'Обновить список';

  @override
  String get employeeListScreenTooltipAdd => 'Добавить сотрудника';

  @override
  String get employeeListScreenButtonRetry => 'Повторить';

  @override
  String get employeeListScreenNoEmployeesFound => 'Сотрудники не найдены.';

  @override
  String get employeeListScreenButtonAddFirst => 'Добавить первого сотрудника';

  @override
  String get loginScreenTitle => 'Вход';

  @override
  String get usernameHint => 'Имя пользователя';

  @override
  String get passwordHint => 'Пароль';

  @override
  String get loginButtonText => 'Войти';

  @override
  String get appTitle => 'Flutter Панель Администратора';

  @override
  String get signupScreenTitle => 'Регистрация';

  @override
  String get signupButtonText => 'Зарегистрироваться';

  @override
  String get createCrmAccountTitle => 'Создать аккаунт CRM';

  @override
  String get loginLabelText => 'Логин';

  @override
  String get notesLabelText => 'Примечания (необязательно)';

  @override
  String get confirmPasswordHint => 'Подтвердите пароль';

  @override
  String get pleaseEnterLoginNameError => 'Пожалуйста, введите имя для входа';

  @override
  String get loginMinLengthError =>
      'Логин должен содержать не менее 3 символов';

  @override
  String get pleaseEnterPasswordError => 'Пожалуйста, введите пароль';

  @override
  String get passwordMinLengthError =>
      'Пароль должен содержать не менее 6 символов';

  @override
  String get pleaseConfirmPasswordError => 'Пожалуйста, подтвердите ваш пароль';

  @override
  String get passwordsDoNotMatchError => 'Пароли не совпадают';

  @override
  String get alreadyHaveAccountButtonText => 'Уже есть аккаунт? Войти';

  @override
  String userCreatedSuccessMessage(Object userId) {
    return 'Пользователь $userId успешно создан! Пожалуйста, войдите.';
  }

  @override
  String get userFormScreenTitle => 'Создать нового пользователя';

  @override
  String get loginEmailLabelText => 'Логин (Email)';

  @override
  String get loginEmailHintText => 'user@example.com';

  @override
  String get pleaseEnterLoginEmailError =>
      'Пожалуйста, введите email для входа';

  @override
  String get pleaseEnterValidEmailError =>
      'Пожалуйста, введите действующий email';

  @override
  String get createUserButtonText => 'Создать пользователя';

  @override
  String userCreatedSuccessIdMessage(Object userId) {
    return 'Пользователь успешно создан с ID: $userId';
  }

  @override
  String grpcErrorCreatingUserMessage(Object errorMessage) {
    return 'Ошибка gRPC при создании пользователя: $errorMessage';
  }

  @override
  String errorCreatingUserMessage(Object errorMessage) {
    return 'Ошибка при создании пользователя: $errorMessage';
  }

  @override
  String get editLendingApplicationTitle => 'Редактировать заявку на кредит';

  @override
  String get addLendingApplicationTitle => 'Добавить заявку на кредит';

  @override
  String get saveApplicationTooltip => 'Сохранить заявку';

  @override
  String get clientLabelText => 'Клиент';

  @override
  String get pleaseSelectClientError => 'Пожалуйста, выберите клиента';

  @override
  String get managerLabelText => 'Менеджер';

  @override
  String get pleaseSelectManagerError => 'Пожалуйста, выберите менеджера';

  @override
  String get bankLabelText => 'Банк';

  @override
  String get pleaseSelectBankError => 'Пожалуйста, выберите банк';

  @override
  String get requestedAmountLabelText => 'Запрашиваемая сумма';

  @override
  String get enterRequestedAmountError => 'Введите запрашиваемую сумму';

  @override
  String get approvedAmountLabelText => 'Одобренная сумма';

  @override
  String applicationDateLabelText(Object date) {
    return 'Дата заявки: $date';
  }

  @override
  String get pickDateButtonText => 'Выбрать';

  @override
  String approvalDateLabelText(Object date) {
    return 'Дата одобрения: $date';
  }

  @override
  String fundsReceivedDateLabelText(Object date) {
    return 'Дата получения средств: $date';
  }

  @override
  String companyContractDateLabelText(Object date) {
    return 'Дата договора с компанией: $date';
  }

  @override
  String get expectedCommissionLabelText => 'Ожидаемая комиссия';

  @override
  String get statusLabelText => 'Статус';

  @override
  String get pleaseSelectStatusError => 'Пожалуйста, выберите статус';

  @override
  String get paymentIdLabelText => 'ID платежа';

  @override
  String get notesLabelTextShort => 'Примечания';

  @override
  String get companyCommissionPercentLabelText => 'Процент комиссии компании';

  @override
  String get calculatedCommissionAmountLabelText =>
      'Рассчитанная сумма комиссии';

  @override
  String get commissionPaidLabelText => 'Комиссия выплачена';

  @override
  String get agentCommissionReceivedLabelText => 'Комиссия агента получена';

  @override
  String get updateApplicationButtonText => 'Обновить заявку';

  @override
  String get createApplicationButtonText => 'Создать заявку';

  @override
  String errorLoadingDropdownMessage(Object errorMessage) {
    return 'Ошибка загрузки выпадающих списков: $errorMessage';
  }

  @override
  String errorLoadingApplicationMessage(Object errorMessage) {
    return 'Ошибка загрузки заявки: $errorMessage';
  }

  @override
  String get applicationUpdatedSuccessMessage => 'Заявка успешно обновлена';

  @override
  String get applicationCreatedSuccessMessage => 'Заявка успешно создана';

  @override
  String errorSavingApplicationMessage(Object errorMessage) {
    return 'Ошибка сохранения заявки: $errorMessage';
  }

  @override
  String lendingApplicationFormScreenFeedbackErrorCreating(Object error) {
    return 'Ошибка при создании заявки на кредит: $error';
  }

  @override
  String lendingApplicationFormScreenFeedbackErrorUpdating(Object error) {
    return 'Ошибка при обновлении заявки на кредит: $error';
  }

  @override
  String get clientFormScreenTitleEdit => 'Редактировать клиента';

  @override
  String get clientFormScreenTitleAdd => 'Добавить клиента';

  @override
  String get clientFormScreenSaveTooltip => 'Сохранить клиента';

  @override
  String get clientFormScreenLabelFirstName => 'Имя';

  @override
  String get clientFormScreenLabelLastName => 'Фамилия';

  @override
  String get clientFormScreenLabelEmail => 'Электронная почта';

  @override
  String get clientFormScreenLabelPhone => 'Телефон';

  @override
  String get clientFormScreenLabelTelegramId => 'Telegram ID';

  @override
  String get clientFormScreenLabelWhatsappNumber => 'Номер WhatsApp';

  @override
  String get clientFormScreenLabelSource => 'Источник';

  @override
  String get clientFormScreenHintSource => 'Выберите источник';

  @override
  String get clientFormScreenLabelPassportData => 'Паспортные данные (JSON)';

  @override
  String get clientFormScreenLabelNotes => 'Примечания';

  @override
  String get clientFormScreenValidationFirstNameRequired =>
      'Пожалуйста, введите имя';

  @override
  String get clientFormScreenValidationFirstNameMinLength =>
      'Имя должно содержать не менее 2 символов';

  @override
  String get clientFormScreenValidationLastNameRequired =>
      'Пожалуйста, введите фамилию';

  @override
  String get clientFormScreenValidationLastNameMinLength =>
      'Фамилия должна содержать не менее 2 символов';

  @override
  String get clientFormScreenValidationEmailRequired =>
      'Пожалуйста, введите адрес электронной почты';

  @override
  String get clientFormScreenValidationEmailInvalid =>
      'Пожалуйста, введите действительный адрес электронной почты';

  @override
  String get clientFormScreenValidationPhoneRequired =>
      'Пожалуйста, введите номер телефона';

  @override
  String get clientFormScreenValidationSourceRequired =>
      'Пожалуйста, выберите источник';

  @override
  String get clientFormScreenButtonUpdate => 'Обновить клиента';

  @override
  String get clientFormScreenButtonCreate => 'Создать клиента';

  @override
  String clientFormScreenFeedbackErrorLoading(String error) {
    return 'Ошибка загрузки данных клиента: $error';
  }

  @override
  String clientFormScreenFeedbackErrorInvalidJson(String error) {
    return 'Неверный JSON для паспортных данных: $error';
  }

  @override
  String get clientFormScreenFeedbackSuccessUpdate => 'Клиент успешно обновлен';

  @override
  String get clientFormScreenFeedbackSuccessCreate => 'Клиент успешно создан';

  @override
  String clientFormScreenFeedbackErrorGrpc(String errorMessage) {
    return 'Ошибка gRPC при сохранении клиента: $errorMessage';
  }

  @override
  String clientFormScreenFeedbackErrorGeneric(String error) {
    return 'Ошибка при сохранении клиента: $error';
  }

  @override
  String get clientListScreenTitle => 'Клиенты';

  @override
  String get clientListScreenTooltipAdd => 'Добавить клиента';

  @override
  String get clientListScreenTooltipEdit => 'Редактировать клиента';

  @override
  String get clientListScreenTooltipDelete => 'Удалить клиента';

  @override
  String get translationOrderListScreenColumnActions => 'Действия';

  @override
  String get translationOrderListScreenTooltipEdit => 'Редактировать заказ';

  @override
  String get translationOrderListScreenTooltipDelete => 'Удалить заказ';

  @override
  String get clientListScreenConfirmDeleteTitle => 'Подтвердить удаление';

  @override
  String clientListScreenConfirmDeleteContent(String clientName) {
    return 'Вы уверены, что хотите удалить клиента $clientName?';
  }

  @override
  String get clientListScreenConfirmDeleteActionCancel => 'Отмена';

  @override
  String get clientListScreenConfirmDeleteActionDelete => 'Удалить';

  @override
  String clientListScreenFeedbackSuccessDelete(String clientName) {
    return 'Клиент $clientName успешно удален';
  }

  @override
  String clientListScreenFeedbackErrorDelete(String clientId, String error) {
    return 'Ошибка удаления клиента $clientId: $error';
  }

  @override
  String clientListScreenErrorLoading(String error) {
    return 'Ошибка загрузки клиентов: $error';
  }

  @override
  String get clientListScreenButtonRetry => 'Повторить';

  @override
  String get clientListScreenNoClientsFound =>
      'Клиенты не найдены. Нажмите +, чтобы добавить нового клиента, или потяните вниз для обновления.';

  @override
  String get clientListScreenColumnId => 'ID';

  @override
  String get clientListScreenColumnFirstName => 'Имя';

  @override
  String get clientListScreenColumnLastName => 'Фамилия';

  @override
  String get clientListScreenColumnPhone => 'Телефон';

  @override
  String get clientListScreenColumnEmail => 'Электронная почта';

  @override
  String get clientListScreenColumnTelegramId => 'Telegram ID';

  @override
  String get clientListScreenColumnWhatsapp => 'WhatsApp';

  @override
  String get clientListScreenColumnSource => 'Источник';

  @override
  String get clientListScreenColumnPassportData => 'Паспортные данные';

  @override
  String get clientListScreenColumnNotes => 'Примечания';

  @override
  String get clientListScreenColumnActions => 'Действия';

  @override
  String get clientListScreenDefaultClientName => 'этот клиент';

  @override
  String get clientListScreenSourceUnspecified => 'Не указан';

  @override
  String get lendingApplicationListScreenTitle => 'Заявки на кредит';

  @override
  String get lendingApplicationListScreenTooltipAdd => 'Добавить заявку';

  @override
  String get lendingApplicationListScreenTooltipEdit => 'Редактировать заявку';

  @override
  String get lendingApplicationListScreenTooltipDelete => 'Удалить заявку';

  @override
  String get lendingApplicationListScreenConfirmDeleteTitle =>
      'Удалить заявку?';

  @override
  String get lendingApplicationListScreenConfirmDeleteContent =>
      'Вы уверены, что хотите удалить эту заявку?';

  @override
  String get lendingApplicationListScreenActionCancel => 'Отмена';

  @override
  String get lendingApplicationListScreenActionDelete => 'Удалить';

  @override
  String get lendingApplicationListScreenFeedbackSuccessDelete =>
      'Заявка успешно удалена';

  @override
  String lendingApplicationListScreenFeedbackErrorDelete(String error) {
    return 'Ошибка удаления заявки: $error';
  }

  @override
  String lendingApplicationListScreenErrorLoading(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get lendingApplicationListScreenNoApplicationsFound =>
      'Заявок на кредит не найдено.';

  @override
  String get lendingApplicationListScreenListItemNoId => 'Нет ID';

  @override
  String lendingApplicationListScreenListItemSubtitle(
      String clientId, String managerId, String bankId) {
    return 'Клиент: $clientId\nМенеджер: $managerId\nБанк: $bankId';
  }

  @override
  String get trainingCourseFormScreenTitleEdit => 'Редактировать курс';

  @override
  String get trainingCourseFormScreenTitleAdd => 'Добавить курс';

  @override
  String get trainingCourseFormScreenLabelName => 'Название курса';

  @override
  String get trainingCourseFormScreenLabelPrice => 'Цена';

  @override
  String get trainingCourseFormScreenLabelCommission => 'Процент комиссии';

  @override
  String get trainingCourseFormScreenLabelDescription => 'Описание';

  @override
  String get trainingCourseFormScreenLabelNotes => 'Примечания';

  @override
  String get trainingCourseFormScreenValidationRequired => 'Обязательно';

  @override
  String get trainingCourseFormScreenButtonUpdate => 'Обновить курс';

  @override
  String get trainingCourseFormScreenButtonCreate => 'Создать курс';

  @override
  String trainingCourseFormScreenFeedbackErrorLoading(String error) {
    return 'Ошибка загрузки курса: $error';
  }

  @override
  String get trainingCourseFormScreenFeedbackSuccessUpdate =>
      'Курс успешно обновлен';

  @override
  String get trainingCourseFormScreenFeedbackSuccessCreate =>
      'Курс успешно создан';

  @override
  String trainingCourseFormScreenFeedbackErrorSaving(Object error) {
    return 'Ошибка сохранения курса: $error';
  }

  @override
  String get trainingCourseListScreenTitle => 'Учебные курсы';

  @override
  String get trainingCourseListScreenTooltipAdd => 'Добавить курс';

  @override
  String get trainingCourseListScreenTooltipEdit => 'Редактировать курс';

  @override
  String get trainingCourseListScreenTooltipDelete => 'Удалить курс';

  @override
  String get trainingCourseListScreenConfirmDeleteTitle => 'Удалить курс?';

  @override
  String get trainingCourseListScreenConfirmDeleteContent =>
      'Вы уверены, что хотите удалить этот курс?';

  @override
  String get trainingCourseListScreenActionCancel => 'Отмена';

  @override
  String get trainingCourseListScreenActionDelete => 'Удалить';

  @override
  String get trainingCourseListScreenFeedbackSuccessDelete =>
      'Курс успешно удален';

  @override
  String trainingCourseListScreenFeedbackErrorDelete(String error) {
    return 'Ошибка удаления курса: $error';
  }

  @override
  String trainingCourseListScreenErrorLoading(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get trainingCourseListScreenNoCoursesFound =>
      'Учебные курсы не найдены.';

  @override
  String get trainingCourseListScreenListItemNoName => 'Без названия';

  @override
  String trainingCourseListScreenListItemSubtitle(
      String price, String commission) {
    return 'Цена: $price\nКомиссия: $commission%';
  }

  @override
  String get mainScreenNotLoggedIn => 'Не авторизован';

  @override
  String mainScreenRoleLabel(String roleName) {
    return 'Роль: $roleName';
  }

  @override
  String get mainScreenUserLoginDefault => 'Пользователь';

  @override
  String get sideMenuDashboard => 'Панель управления';

  @override
  String get sideMenuClients => 'Клиенты';

  @override
  String get sideMenuEmployees => 'Сотрудники';

  @override
  String get sideMenuTranslations => 'Переводы';

  @override
  String get sideMenuInsurancePolicies => 'Страховые полисы';

  @override
  String get sideMenuTrainingCourses => 'Учебные курсы';

  @override
  String get sideMenuBusinessRegistrations => 'Регистрация бизнеса';

  @override
  String get sideMenuLendingApplications => 'Заявки на кредит';

  @override
  String get sideMenuAdminTools => 'Инструменты администратора';

  @override
  String get sideMenuCreateUser => 'Создать пользователя';

  @override
  String get sideMenuTask => 'Задача';

  @override
  String get sideMenuStore => 'Магазин';

  @override
  String get sideMenuNotification => 'Уведомление';

  @override
  String get sideMenuProfile => 'Профиль';

  @override
  String get sideMenuSettings => 'Настройки';

  @override
  String get sideMenuLogout => 'Выйти';

  @override
  String get dashboardHeaderTitle => 'Панель управления';

  @override
  String get dashboardHeaderProfileCardUserDefault => 'Пользователь';

  @override
  String get dashboardHeaderProfileCardNotLoggedIn => 'Не авторизован';

  @override
  String get dashboardHeaderSearchHint => 'Поиск';

  @override
  String get dashboardMyFilesTitle => 'Мои файлы';

  @override
  String get dashboardMyFilesAddNewButton => 'Добавить новый';

  @override
  String get dashboardRecentFilesTitle => 'Недавние файлы';

  @override
  String get dashboardRecentFilesColumnFileName => 'Имя файла';

  @override
  String get dashboardRecentFilesColumnDate => 'Дата';

  @override
  String get dashboardRecentFilesColumnSize => 'Размер';

  @override
  String get dashboardStorageDetailsTitle => 'Сведения о хранилище';

  @override
  String get dashboardStorageDetailsDocumentsFiles => 'Файлы документов';

  @override
  String get dashboardStorageDetailsMediaFiles => 'Медиафайлы';

  @override
  String get dashboardStorageDetailsOtherFiles => 'Другие файлы';

  @override
  String get dashboardStorageDetailsUnknown => 'Неизвестно';

  @override
  String get translationOrderListScreenTitle => 'Заказы на перевод';

  @override
  String get translationOrderListScreenDeleteOrderDialogTitle =>
      'Удалить заказ?';

  @override
  String get translationOrderListScreenDeleteOrderDialogContent =>
      'Вы уверены, что хотите удалить этот заказ?';

  @override
  String get translationOrderListScreenDeleteOrderDialogCancelButton =>
      'Отмена';

  @override
  String get translationOrderListScreenDeleteOrderDialogDeleteButton =>
      'Удалить';

  @override
  String get translationOrderListScreenOrderDeletedSuccess =>
      'Заказ успешно удален';

  @override
  String translationOrderListScreenErrorDeletingOrder(String error) {
    return 'Ошибка удаления заказа: $error';
  }

  @override
  String translationOrderListScreenErrorLoading(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get translationOrderListScreenNoOrdersFound =>
      'Заказы на перевод не найдены.';

  @override
  String get translationOrderListScreenUntitledOrder => 'Заказ без названия';

  @override
  String translationOrderListScreenOrderIdLabel(String orderId) {
    return 'ID заказа: $orderId';
  }

  @override
  String translationOrderListScreenOrderTitleLabel(String title) {
    return 'Название: $title';
  }

  @override
  String translationOrderListScreenOrderStatusLabel(String status) {
    return 'Статус: $status';
  }

  @override
  String translationOrderListScreenOrderCreatedLabel(String date) {
    return 'Создан: $date';
  }

  @override
  String translationOrderListScreenOrderDoneLabel(String date) {
    return 'Выполнен: $date';
  }

  @override
  String get translationOrderListScreenCreateNewOrderTooltip =>
      'Создать новый заказ';

  @override
  String get translationOrderListScreenCustomerNameLabel => 'Имя Клиента';

  @override
  String get translationOrderFormScreenSectionTitleOrderDetails =>
      'Детали заказа';

  @override
  String get translationOrderFormScreenSectionTitleDocumentDetails =>
      'Детали документа';

  @override
  String get translationOrderFormScreenSectionTitleFinancialDetails =>
      'Финансовые детали';

  @override
  String get translationOrderFormScreenSectionTitleAdditionalInformation =>
      'Дополнительная информация';

  @override
  String get translationOrderFormScreenCreateTitle => 'Создать заказ';

  @override
  String get translationOrderFormScreenEditTitle => 'Редактировать заказ';

  @override
  String get translationOrderFormScreenSaveChangesTooltip => 'Сохранить заказ';

  @override
  String translationOrderFormScreenErrorLoadingData(String error) {
    return 'Ошибка загрузки начальных данных: $error';
  }

  @override
  String translationOrderFormScreenErrorSavingOrder(String error) {
    return 'Ошибка сохранения заказа: $error';
  }

  @override
  String get translationOrderFormScreenOrderCreatedSuccess =>
      'Заказ успешно создан';

  @override
  String get translationOrderFormScreenOrderUpdatedSuccess =>
      'Заказ успешно обновлен';

  @override
  String get translationOrderFormScreenOrderDeletedSuccess =>
      'Заказ успешно удален';

  @override
  String translationOrderFormScreenErrorDeletingOrder(String error) {
    return 'Ошибка удаления заказа: $error';
  }

  @override
  String get translationOrderFormScreenFieldTitleLabel => 'Название *';

  @override
  String get translationOrderFormScreenFieldTitleValidation =>
      'Пожалуйста, введите название';

  @override
  String get translationOrderFormScreenFieldDoneAtLabel =>
      'Выполнен (Дата завершения)';

  @override
  String get translationOrderFormScreenFieldClientLabel => 'Клиент *';

  @override
  String get translationOrderFormScreenFieldClientHint => 'Выберите клиента';

  @override
  String get translationOrderFormScreenFieldClientValidation =>
      'Пожалуйста, выберите клиента';

  @override
  String get translationOrderFormScreenFieldManagerLabel => 'Менеджер *';

  @override
  String get translationOrderFormScreenFieldManagerHint => 'Выберите менеджера';

  @override
  String get translationOrderFormScreenFieldManagerValidation =>
      'Пожалуйста, выберите менеджера';

  @override
  String get translationOrderFormScreenFieldOfficeLabel => 'Офис *';

  @override
  String get translationOrderFormScreenFieldOfficeHint => 'Выберите офис';

  @override
  String get translationOrderFormScreenFieldOfficeValidation =>
      'Пожалуйста, выберите офис';

  @override
  String get translationOrderFormScreenFieldSourceLanguageLabel =>
      'Исходный язык';

  @override
  String get translationOrderFormScreenFieldTargetLanguageLabel =>
      'Целевой язык';

  @override
  String get translationOrderFormScreenFieldDocumentTypeLabel =>
      'Тип документа';

  @override
  String get translationOrderFormScreenFieldDocumentTypeHint =>
      'Выберите тип документа';

  @override
  String get translationOrderFormScreenFieldPageCountLabel =>
      'Количество страниц';

  @override
  String get translationOrderFormScreenFieldNotarialSumLabel =>
      'Нотариальная сумма *';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationRequired =>
      'Пожалуйста, введите нотариальную сумму';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationNumber =>
      'Пожалуйста, введите действительное число';

  @override
  String get translationOrderFormScreenFieldPriorityLabel => 'Приоритет *';

  @override
  String get translationOrderFormScreenFieldPriorityHint =>
      'Выберите приоритет';

  @override
  String get translationOrderFormScreenFieldPriorityValidation =>
      'Пожалуйста, выберите приоритет';

  @override
  String get translationOrderFormScreenFieldPaymentIdLabel => 'ID платежа';

  @override
  String get translationOrderFormScreenFieldTranslatorLabel => 'Переводчик';

  @override
  String get translationOrderFormScreenFieldTranslatorHint =>
      'Выберите переводчика (Необязательно)';

  @override
  String get translationOrderFormScreenFieldStatusLabel =>
      'Статус (Только чтение)';

  @override
  String get translationOrderFormScreenFieldNotesLabel => 'Примечания';

  @override
  String get translationOrderFormScreenSwitchUrgent => 'Срочный';

  @override
  String get translationOrderFormScreenSwitchSemiUrgent => 'Полу-срочный';

  @override
  String get translationOrderFormScreenSwitchClientNotified =>
      'Клиент уведомлен';

  @override
  String get translationOrderFormScreenDeleteButton => 'Удалить заказ';

  @override
  String get translationOrderFormScreenDeleteDialogTitle => 'Удалить заказ?';

  @override
  String get translationOrderFormScreenDeleteDialogContent =>
      'Вы уверены, что хотите удалить этот заказ?';

  @override
  String get translationOrderFormScreenDeleteDialogCancelButton => 'Отмена';

  @override
  String get translationOrderFormScreenDeleteDialogDeleteButton => 'Удалить';

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
  String get translationOrderFormScreenStatusNotAvailable => 'Н/Д';

  @override
  String get insurancePolicyListScreenTitle => 'Страховые полисы';

  @override
  String get insurancePolicyListScreenAddPolicyTooltip => 'Добавить полис';

  @override
  String get insurancePolicyListScreenDeleteDialogTitle => 'Удалить полис?';

  @override
  String get insurancePolicyListScreenDeleteDialogContent =>
      'Вы уверены, что хотите удалить этот полис?';

  @override
  String get insurancePolicyListScreenDeleteDialogCancelButton => 'Отмена';

  @override
  String get insurancePolicyListScreenDeleteDialogDeleteButton => 'Удалить';

  @override
  String get insurancePolicyListScreenPolicyDeletedSuccess =>
      'Полис успешно удален';

  @override
  String insurancePolicyListScreenErrorDeletingPolicy(String error) {
    return 'Ошибка удаления полиса: $error';
  }

  @override
  String insurancePolicyListScreenErrorLoading(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get insurancePolicyListScreenNoPoliciesFound =>
      'Страховые полисы не найдены.';

  @override
  String get insurancePolicyListScreenNoPolicyNumber => 'Нет номера полиса';

  @override
  String insurancePolicyListScreenListItemSubtitle(
      String clientId, String managerId, String amount) {
    return 'Клиент: $clientId\nМенеджер: $managerId\nСумма: $amount';
  }

  @override
  String get insurancePolicyListScreenEditPolicyTooltip =>
      'Редактировать полис';

  @override
  String get insurancePolicyListScreenDeletePolicyTooltip => 'Удалить полис';

  @override
  String get insurancePolicyId => 'ID';

  @override
  String get insurancePolicyClient => 'Клиент';

  @override
  String get insurancePolicyPolicyNumber => 'Номер полиса';

  @override
  String get insurancePolicyType => 'Тип';

  @override
  String get insurancePolicyStartDate => 'Дата начала';

  @override
  String get insurancePolicyEndDate => 'Дата окончания';

  @override
  String get insurancePolicyPremium => 'Премия';

  @override
  String get insurancePolicyStatus => 'Статус';

  @override
  String get insurancePolicyCoverageDetails => 'Детали покрытия';

  @override
  String get confirmDeleteInsurancePolicyTitle => 'Подтвердить удаление';

  @override
  String get confirmDeleteInsurancePolicyMessage =>
      'Вы уверены, что хотите удалить этот страховой полис?';

  @override
  String get insurancePolicyDeletedSuccess => 'Страховой полис успешно удален';

  @override
  String errorDeletingInsurancePolicy(Object error) {
    return 'Ошибка удаления страхового полиса: $error';
  }

  @override
  String get noInsurancePoliciesFound => 'Страховые полисы не найдены';

  @override
  String get interactionListUnspecifiedType => 'Не указан';

  @override
  String get interactionTypeCall => 'Тип взаимодействия: Звонок';

  @override
  String get interactionTypeEmail => 'Тип взаимодействия: Электронная почта';

  @override
  String get interactionTypeMeeting => 'Тип взаимодействия: Встреча';

  @override
  String get interactionListConfirmDeleteTitle => 'Подтвердить удаление';

  @override
  String get interactionListConfirmDeleteMessage =>
      'Удалить это взаимодействие?';

  @override
  String get interactionListCancelButton => 'Отмена';

  @override
  String get interactionListDeleteButton => 'Удалить';

  @override
  String get interactionListDeletedSuccess => 'Удалено';

  @override
  String interactionListErrorDeleting(Object error) {
    return 'Ошибка удаления: $error';
  }

  @override
  String get interactionListTitle => 'Все взаимодействия';

  @override
  String interactionListErrorLoading(Object error) {
    return 'Ошибка загрузки взаимодействий: $error';
  }

  @override
  String get interactionListNoInteractionsFound => 'Взаимодействия не найдены.';

  @override
  String get interactionListManagerHeader =>
      'Заголовок менеджера списка взаимодействий';

  @override
  String get interactionListSummaryHeader =>
      'Заголовок сводки списка взаимодействий';

  @override
  String get interactionListIdHeader => 'ID';

  @override
  String get interactionListClientHeader => 'Клиент';

  @override
  String get interactionListEmployeeHeader => 'Сотрудник';

  @override
  String get interactionListDateHeader => 'Дата';

  @override
  String get interactionListTypeHeader => 'Тип';

  @override
  String get interactionListDescriptionHeader => 'Описание';

  @override
  String get interactionListSubjectHeader => 'Тема';

  @override
  String get interactionListEndTimeHeader => 'Время окончания';

  @override
  String get interactionListScheduledHeader => 'Запланировано';

  @override
  String get interactionListCompletedHeader => 'Завершено';

  @override
  String get interactionListNotesHeader => 'Заметки';

  @override
  String get interactionListActionsHeader => 'Действия';

  @override
  String get interactionListYes => 'Да';

  @override
  String get interactionListNo => 'Нет';

  @override
  String get interactionListEditInteractionTooltip =>
      'Редактировать взаимодействие';

  @override
  String get interactionListDeleteInteractionTooltip =>
      'Удалить взаимодействие';

  @override
  String get interactionListDetailsDialogTitle => 'Детали взаимодействия';

  @override
  String get interactionListCloseButton => 'Закрыть';

  @override
  String get insurancePolicyFormEditPolicyTitle => 'Редактировать полис';

  @override
  String get insurancePolicyFormAddPolicyTitle => 'Добавить полис';

  @override
  String insurancePolicyFormErrorLoadingPolicy(Object error) {
    return 'Ошибка загрузки полиса: $error';
  }

  @override
  String get insurancePolicyFormPolicyUpdatedSuccess =>
      'Полис успешно обновлен';

  @override
  String get insurancePolicyFormPolicyCreatedSuccess => 'Полис успешно создан';

  @override
  String insurancePolicyFormErrorSavingPolicy(Object error) {
    return 'Ошибка сохранения полиса: $error';
  }

  @override
  String get insurancePolicyFormPolicyNumberLabel => 'Номер полиса';

  @override
  String get insurancePolicyFormClientIdLabel => 'ID клиента';

  @override
  String get insurancePolicyFormManagerIdLabel => 'ID менеджера';

  @override
  String get insurancePolicyFormAmountLabel => 'Сумма';

  @override
  String get insurancePolicyFormStartDateLabel => 'Дата начала';

  @override
  String insurancePolicyFormStartDatePickerPrefix(Object date) {
    return 'Начало: $date';
  }

  @override
  String get insurancePolicyFormExpiryDateLabel => 'Дата окончания';

  @override
  String insurancePolicyFormExpiryDatePickerPrefix(Object date) {
    return 'Окончание: $date';
  }

  @override
  String get insurancePolicyFormPickDateButton => 'Выбрать';

  @override
  String get insurancePolicyFormStatusLabel => 'Статус';

  @override
  String get insurancePolicyFormRenewalStatusLabel => 'Статус продления';

  @override
  String get insurancePolicyFormNotesLabel => 'Заметки';

  @override
  String get insurancePolicyFormUpdatePolicyButton => 'Обновить полис';

  @override
  String get insurancePolicyFormCreatePolicyButton => 'Создать полис';

  @override
  String get insurancePolicyFormRequiredField => 'Обязательное поле';

  @override
  String get insurancePolicyFormScreenTitleEdit => 'Редактировать полис';

  @override
  String get insurancePolicyFormScreenTitleAdd => 'Добавить полис';

  @override
  String insurancePolicyFormScreenFeedbackErrorLoading(String error) {
    return 'Ошибка загрузки полиса: $error';
  }

  @override
  String get insurancePolicyFormScreenFeedbackSuccessUpdate =>
      'Полис успешно обновлен';

  @override
  String get insurancePolicyFormScreenFeedbackSuccessCreate =>
      'Полис успешно создан';

  @override
  String insurancePolicyFormScreenFeedbackErrorSaving(String error) {
    return 'Ошибка сохранения полиса: $error';
  }

  @override
  String get insurancePolicyFormScreenValidationRequired => 'Обязательно';

  @override
  String get insurancePolicyFormScreenLabelPolicyNumber => 'Номер полиса';

  @override
  String get insurancePolicyFormScreenLabelClientId => 'ID клиента';

  @override
  String get insurancePolicyFormScreenLabelManagerId => 'ID менеджера';

  @override
  String get insurancePolicyFormScreenLabelAmount => 'Сумма';

  @override
  String insurancePolicyFormScreenLabelStartDateWithValue(String date) {
    return 'Дата начала: $date';
  }

  @override
  String get insurancePolicyFormScreenLabelStartDate => 'Дата начала';

  @override
  String insurancePolicyFormScreenLabelExpiryDateWithValue(String date) {
    return 'Дата окончания: $date';
  }

  @override
  String get insurancePolicyFormScreenLabelExpiryDate => 'Дата окончания';

  @override
  String get insurancePolicyFormScreenPickDateButton => 'Выбрать';

  @override
  String get insurancePolicyFormScreenLabelStatus => 'Статус';

  @override
  String get insurancePolicyFormScreenLabelRenewalStatus => 'Статус продления';

  @override
  String get insurancePolicyFormScreenLabelNotes => 'Примечания';

  @override
  String get insurancePolicyFormScreenButtonUpdate => 'Обновить полис';

  @override
  String get insurancePolicyFormScreenButtonCreate => 'Создать полис';

  @override
  String signupScreenErrorSignupFailed(String errorMessage) {
    return 'Ошибка регистрации: $errorMessage';
  }

  @override
  String signupScreenErrorUnexpected(String error) {
    return 'Произошла непредвиденная ошибка: $error';
  }

  @override
  String get loginScreenSignUpPromptText => 'Нет аккаунта? Зарегистрироваться';

  @override
  String get loginScreenUsernameValidationEmpty =>
      'Пожалуйста, введите имя пользователя';

  @override
  String get loginScreenPasswordValidationEmpty =>
      'Пожалуйста, введите ваш пароль';

  @override
  String get loginScreenErrorLoginFailed =>
      'Ошибка входа. Пожалуйста, попробуйте еще раз.';

  @override
  String loginScreenErrorLoginFailedWithDetails(String details) {
    return 'Ошибка входа: $details';
  }

  @override
  String loginScreenErrorUnexpected(String error) {
    return 'Произошла непредвиденная ошибка: $error';
  }

  @override
  String get interactionFormScreenTitleAdd => 'Добавить взаимодействие';

  @override
  String get interactionFormScreenTitleEdit => 'Редактировать взаимодействие';

  @override
  String get interactionFormScreenLabelClient => 'Клиент';

  @override
  String get interactionFormScreenLabelEmployee => 'Сотрудник';

  @override
  String get interactionFormScreenLabelInteractionType => 'Тип взаимодействия';

  @override
  String get interactionFormScreenValidationSelectClient =>
      'Пожалуйста, выберите клиента';

  @override
  String get interactionFormScreenValidationSelectEmployee =>
      'Пожалуйста, выберите сотрудника';

  @override
  String get interactionFormScreenValidationSelectType =>
      'Пожалуйста, выберите тип';

  @override
  String interactionFormScreenLabelInteractionDate(String date) {
    return 'Дата взаимодействия: $date';
  }

  @override
  String get interactionFormScreenLabelDateNotSet => 'Не установлено';

  @override
  String interactionFormScreenLabelEndTime(String time) {
    return 'Время окончания: $time';
  }

  @override
  String get interactionFormScreenLabelSubject => 'Тема';

  @override
  String get interactionFormScreenValidationEnterSubject =>
      'Пожалуйста, введите тему';

  @override
  String get interactionFormScreenLabelDescription => 'Описание';

  @override
  String get interactionFormScreenLabelNotes => 'Примечания';

  @override
  String get interactionFormScreenCheckboxScheduled => 'Запланировано';

  @override
  String get interactionFormScreenCheckboxCompleted => 'Завершено';

  @override
  String interactionFormScreenFeedbackErrorLoading(String error) {
    return 'Не удалось загрузить начальные данные: $error';
  }

  @override
  String get interactionFormScreenFeedbackSuccessCreate =>
      'Взаимодействие успешно создано';

  @override
  String get interactionFormScreenFeedbackSuccessUpdate =>
      'Взаимодействие успешно обновлено';

  @override
  String interactionFormScreenFeedbackErrorSaving(String error) {
    return 'Не удалось сохранить взаимодействие: $error';
  }

  @override
  String interactionFormScreenFeedbackErrorUnexpected(String error) {
    return 'Произошла непредвиденная ошибка: $error';
  }
}

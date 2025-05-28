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
  String get employeeLoginScreenTitle => 'Вход для сотрудника';

  @override
  String get loginAsEmployee => 'Войти как сотрудник';

  @override
  String get loginAsUser => 'Войти как пользователь';

  @override
  String get employeeUsernameHint => 'Имя пользователя сотрудника';

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
  String get clientLabelText => 'Ф.И.О клиента полностью';

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
  String get clientFormScreenLabelMiddleName => 'Отчество (необязательно)';

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
  String get clientFormScreenValidationPhoneInvalid =>
      'Пожалуйста, введите действительный российский номер телефона (формат +7)';

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
  String get translationOrderListScreenTooltipEdit =>
      'Редактировать заказ на перевод';

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
    return 'Клиент: $clientId Менеджер: $managerId Банк: $bankId';
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
    return 'Цена: $price Комиссия: $commission%';
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
  String get sideMenuOffices => 'Офисы';

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
  String get sideMenuBanks => 'Банки';

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
  String get translationOrderFormScreenFieldClientNameLabel =>
      'ФИО клиента из документа (сокр.)';

  @override
  String get translationOrderFormScreenFieldClientNameHint =>
      'Введите имя клиента в документе (необязательно)';

  @override
  String get translationOrderFormScreenFieldManagerLabel => 'Менеджер *';

  @override
  String get translationOrderFormScreenFieldManagerHint =>
      'Назначить менеджера';

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
      'Нотариальная сумма';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationRequired =>
      'Сумма нотариального заверения обязательна.';

  @override
  String get translationOrderFormScreenFieldNotarialSumValidationNumber =>
      'Пожалуйста, введите действительное число для нотариальной суммы';

  @override
  String get priorityNormal => 'Обычный';

  @override
  String get priorityUrgent => 'Срочный';

  @override
  String get prioritySemiUrgent => 'Полу-срочный';

  @override
  String get clientSourceReferral => 'Рекомендация';

  @override
  String get clientSourceOnline => 'Онлайн';

  @override
  String get clientSourceWalkIn => 'Самообращение';

  @override
  String get clientSourcePartner => 'Партнер';

  @override
  String get clientSourceOther => 'Другое';

  @override
  String get clientSourceUnspecified => 'Не указан';

  @override
  String get clientSourceColumnTitle => 'Источник рекламы';

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
  String get translationOrderFormScreenFieldTranslationProgressLabel =>
      'Ход перевода (Только чтение)';

  @override
  String get translationOrderFormScreenTranslationProgressNotAvailable =>
      'Ход перевода недоступен';

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
  String get translationOrderFormScreenFieldCompletionDateLabel =>
      'Дата завершения';

  @override
  String get translationOrderFormScreenFieldCompletionDateHint =>
      'Выберите дату завершения';

  @override
  String get translationOrderFormScreenFieldNotarialSumHint =>
      'Введите нотариальную сумму';

  @override
  String get translationOrderFormScreenFieldPaymentIdHint =>
      'Введите идентификатор платежа';

  @override
  String get translationOrderFormScreenFieldTotalSumLabel => 'Итоговая сумма';

  @override
  String get translationOrderFormScreenFieldTotalSumHint =>
      'Рассчитывается автоматически на основе ценообразования';

  @override
  String get translationOrderFormScreenSectionTitleActions => 'Действия';

  @override
  String get translationOrderFormScreenSectionTitlePricingPayment =>
      'Цены и оплата';

  @override
  String get translationOrderFormScreenButtonSaving => 'Сохранение...';

  @override
  String get translationOrderFormScreenButtonSaveOrder => 'Сохранить заказ';

  @override
  String get translationOrderFormScreenDialogConfirmDeleteTitle =>
      'Подтвердить удаление';

  @override
  String get translationOrderFormScreenDialogConfirmDeleteMessage =>
      'Вы уверены, что хотите удалить этот заказ? Это действие нельзя отменить.';

  @override
  String get translationOrderFormScreenDialogButtonCancel => 'Отмена';

  @override
  String get translationOrderFormScreenDialogButtonDelete => 'Удалить';

  @override
  String get translationOrderFormScreenButtonDeleteOrder => 'Удалить заказ';

  @override
  String get translationOrderFormScreenAppBarTitleCreate => 'Создать заказ';

  @override
  String get translationOrderFormScreenAppBarTitleUpdate => 'Обновить заказ';

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
    return 'Клиент: $clientId Менеджер: $managerId Сумма: $amount';
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

  @override
  String get translationOrderListScreenColumnBlank => 'Бланк';

  @override
  String get translationOrderListScreenColumnIncorrectBlank => 'Испорчен';

  @override
  String get translationOrderListScreenColumnTotalSum => 'Сумма оплаты';

  @override
  String get translationOrderListScreenColumnDocumentType => 'Тип документа';

  @override
  String get translationOrderListScreenColumnCreatedAt => 'Создано';

  @override
  String get translationOrderListScreenColumnDoneAt => 'Выполнено';

  @override
  String get translationOrderListScreenColumnNotariallyCertified =>
      'Заверенние';

  @override
  String get translationOrderListScreenValueYes => 'Да';

  @override
  String get translationOrderListScreenValueNo => 'Нет';

  @override
  String get translationOrderListScreenTooltipAdd =>
      'Добавить новый заказ на перевод';

  @override
  String get documentTypePassport => 'Паспорт';

  @override
  String get documentTypeDiploma => 'Диплом';

  @override
  String get documentTypeBirthCertificate => 'Свидетельство о рождении';

  @override
  String get documentTypeContract => 'Договор';

  @override
  String get documentTypeOther => 'Другое';

  @override
  String get documentTypePassportRf => 'Паспорт РФ';

  @override
  String get documentTypePassportForeign => 'Заграничный паспорт';

  @override
  String get documentTypePassportInternal => 'Внутренний паспорт';

  @override
  String get documentTypeDriverLicense => 'Водительское удостоверение';

  @override
  String get documentTypeMarriageCertificate => 'Свидетельство о браке';

  @override
  String get documentTypeDivorceCertificate => 'Свидетельство о разводе';

  @override
  String get documentTypeDeathCertificate => 'Свидетельство о смерти';

  @override
  String get documentTypeDiplomaHigher => 'Диплом о высшем образовании';

  @override
  String get documentTypeDiplomaSecondary => 'Аттестат о среднем образовании';

  @override
  String get documentTypeTranscript => 'Академическая выписка';

  @override
  String get documentTypeCertificateCourse => 'Сертификат о прохождении курса';

  @override
  String get documentTypeMedicalCertificate => 'Медицинская справка';

  @override
  String get documentTypeVaccinationRecord => 'Справка о вакцинации';

  @override
  String get documentTypePowerOfAttorney => 'Доверенность';

  @override
  String get documentTypeCourtDecision => 'Решение суда';

  @override
  String get documentTypeApostille => 'Апостиль';

  @override
  String get documentTypeBankStatement => 'Банковская справка';

  @override
  String get documentTypeIncomeCertificate => 'Справка о доходах';

  @override
  String get employeeFormScreenTitleEdit => 'Редактировать сотрудника';

  @override
  String get employeeFormScreenTitleAdd => 'Добавить сотрудника';

  @override
  String get employeeFormScreenLabelSelectUser => 'Выберите пользователя';

  @override
  String get employeeFormScreenValidationUserRequired =>
      'Требуется выбрать пользователя';

  @override
  String get employeeFormScreenLabelUserAccount => 'Аккаунт пользователя';

  @override
  String get employeeFormScreenErrorCannotChangeUser =>
      'Нельзя изменить пользователя для существующего сотрудника.';

  @override
  String get employeeFormScreenLabelEmployeeLogin => 'Логин сотрудника';

  @override
  String get employeeFormScreenValidationLoginRequired =>
      'Пожалуйста, введите логин сотрудника';

  @override
  String get employeeFormScreenLabelEmployeePassword => 'Пароль сотрудника';

  @override
  String get employeeFormScreenValidationPasswordRequired =>
      'Пожалуйста, введите пароль';

  @override
  String get employeeFormScreenValidationPasswordMinLength =>
      'Пароль должен содержать не менее 6 символов';

  @override
  String get employeeFormScreenLabelFullName => 'Полное имя';

  @override
  String get employeeFormScreenValidationNameRequired =>
      'Пожалуйста, введите имя сотрудника';

  @override
  String get employeeFormScreenLabelEmail => 'Email';

  @override
  String get employeeFormScreenValidationEmailRequired =>
      'Пожалуйста, введите email';

  @override
  String get employeeFormScreenValidationEmailInvalid =>
      'Пожалуйста, введите действительный email';

  @override
  String get employeeFormScreenLabelSelectRole => 'Выберите роль';

  @override
  String get employeeFormScreenValidationRoleRequired =>
      'Требуется выбрать роль';

  @override
  String get employeeFormScreenLabelRole => 'Роль';

  @override
  String get employeeFormScreenLabelSelectOffice => 'Выберите офис';

  @override
  String get employeeFormScreenValidationOfficeRequired =>
      'Требуется выбрать офис';

  @override
  String get employeeFormScreenLabelOffice => 'Офис';

  @override
  String get employeeFormScreenLabelTelegramId => 'ID Telegram';

  @override
  String get employeeFormScreenLabelWhatsappNumber => 'Номер WhatsApp';

  @override
  String get employeeFormScreenLabelNotes => 'Примечания';

  @override
  String get employeeFormScreenLabelActive => 'Активен';

  @override
  String get employeeFormScreenButtonUpdate => 'Обновить сотрудника';

  @override
  String get employeeFormScreenButtonCreate => 'Создать сотрудника';

  @override
  String employeeFormScreenFeedbackErrorLoading(String error) {
    return 'Ошибка загрузки сотрудника: $error';
  }

  @override
  String get employeeFormScreenFeedbackSuccessUpdate =>
      'Сотрудник успешно обновлён';

  @override
  String get employeeFormScreenFeedbackSuccessCreate =>
      'Сотрудник успешно создан';

  @override
  String employeeFormScreenFeedbackErrorSaving(String error) {
    return 'Ошибка сохранения сотрудника: $error';
  }

  @override
  String employeeFormScreenFeedbackErrorLoadingDropdowns(String error) {
    return 'Ошибка загрузки данных выпадающих списков: $error';
  }

  @override
  String get employeeFormScreenValidationWhatsappInvalid =>
      'Пожалуйста, введите действительный российский номер телефона (+7XXXXXXXXXX)';

  @override
  String get employeeFormScreenHintWhatsappNumber => '+7XXXXXXXXXX';

  @override
  String get translationOrderFormScreenCreateNewTitle =>
      'Создать новый заказ на перевод';

  @override
  String get translationOrderFormScreenEditTitleFull =>
      'Редактировать заказ на перевод';

  @override
  String get translationOrderFormScreenCreateDescription =>
      'Заполните детали для создания нового заказа на перевод';

  @override
  String get translationOrderFormScreenEditDescription =>
      'Обновите детали заказа и статус';

  @override
  String get translationOrderFormScreenFieldTitleHint =>
      'Введите описательное название для этого заказа';

  @override
  String get translationOrderFormScreenFieldTranslatorHintSelect =>
      'Назначить переводчика';

  @override
  String get translationOrderFormScreenFieldBlankNumberLabel => 'Номер бланка';

  @override
  String get translationOrderFormScreenSectionTitleTranslation =>
      'Детали перевода';

  @override
  String get translationOrderFormScreenFieldSourceLanguageHint =>
      'например, Английский';

  @override
  String get translationOrderFormScreenFieldSourceLanguageValidationRequired =>
      'Исходный язык обязателен';

  @override
  String get translationOrderFormScreenFieldTargetLanguageHint =>
      'например, Русский';

  @override
  String get translationOrderFormScreenFieldTargetLanguageValidationRequired =>
      'Целевой язык обязателен';

  @override
  String get translationOrderFormScreenFieldPageCountHint => '1';

  @override
  String get translationOrderFormScreenSectionTitleNotes => 'Примечания';

  @override
  String get translationOrderFormScreenSectionTitleStatus =>
      'Статус и прогресс';

  @override
  String get translationOrderFormScreenSectionTitlePricing =>
      'Расчет стоимости';

  @override
  String get translationOrderFormScreenFieldIncorrectBlankLabel =>
      'Номер неправильного бланка';

  @override
  String get translationOrderFormScreenFieldIncorrectBlankHint =>
      'Введите номер неправильного бланка, если применимо';

  @override
  String get translationOrderFormScreenFieldNotesHint =>
      'Добавьте любые дополнительные заметки или специальные инструкции...';

  @override
  String get translationOrderFormScreenStatusCurrentLabel => 'Текущий статус';

  @override
  String get translationOrderFormScreenStatusUpdateLabel => 'Обновить статус';

  @override
  String get translationProgressStatusPendingAssignment => 'Ожидает назначения';

  @override
  String get translationProgressStatusInProgress => 'В процессе';

  @override
  String get translationProgressStatusTranslated => 'Перевод завершен';

  @override
  String get translationProgressStatusCheckedByManager =>
      'Проверено менеджером';

  @override
  String get translationProgressStatusClientNotified => 'Клиент уведомлен';

  @override
  String get translationProgressStatusDelivered => 'Доставлен';

  @override
  String get translationOrderFormScreenNewOrderStatusInfo =>
      'Этот заказ будет создан со статусом \"Ожидает назначения\"';

  @override
  String translationOrderFormScreenOrderIdLabel(String orderId) {
    return 'ID: $orderId';
  }

  @override
  String get officesScreenTitle => 'Управление офисами';

  @override
  String get officesScreenSearchHint => 'Поиск офисов (Город, Адрес, Телефон)';

  @override
  String get officesScreenTooltipAdd => 'Добавить новый офис';

  @override
  String get officesScreenTooltipEdit => 'Редактировать офис';

  @override
  String get officesScreenTooltipDelete => 'Удалить офис';

  @override
  String officesScreenErrorLoading(String error) {
    return 'Ошибка загрузки офисов: $error';
  }

  @override
  String officesScreenErrorDeleting(String error) {
    return 'Ошибка удаления офиса: $error';
  }

  @override
  String officesScreenSuccessDeleted(String city) {
    return 'Офис \"$city\" успешно удален';
  }

  @override
  String get officesScreenConfirmDeleteTitle => 'Удаление офиса';

  @override
  String officesScreenConfirmDeleteMessage(String city) {
    return 'Вы уверены, что хотите удалить офис в \"$city\"?';
  }

  @override
  String get officesScreenConfirmDeleteCancel => 'Отмена';

  @override
  String get officesScreenConfirmDeleteConfirm => 'Удалить';

  @override
  String get officeFormScreenTitleAdd => 'Добавить новый офис';

  @override
  String get officeFormScreenTitleEdit => 'Редактировать офис';

  @override
  String get officeFormScreenLabelCity => 'Город';

  @override
  String get officeFormScreenLabelAddress => 'Адрес (необязательно)';

  @override
  String get officeFormScreenLabelPhone => 'Телефон (необязательно)';

  @override
  String get officeFormScreenLabelNotes => 'Заметки (необязательно)';

  @override
  String get officeFormScreenValidationCityRequired => 'Город обязателен';

  @override
  String get officeFormScreenButtonCreate => 'Создать офис';

  @override
  String get officeFormScreenButtonUpdate => 'Обновить офис';

  @override
  String officeFormScreenErrorLoading(String error) {
    return 'Ошибка загрузки офиса: $error';
  }

  @override
  String officeFormScreenErrorSaving(String error) {
    return 'Ошибка сохранения офиса: $error';
  }

  @override
  String get officeFormScreenSuccessCreated => 'Офис успешно создан';

  @override
  String get officeFormScreenSuccessUpdated => 'Офис успешно обновлен';

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
    return 'Ошибка: $error';
  }

  @override
  String get currencySymbolRuble => '₽';

  @override
  String get defaultCityName => 'Москва';

  @override
  String get managerLevelRegular => 'обычный';

  @override
  String get documentTypeDropdownSelectTitle => 'Выберите тип документа';

  @override
  String get documentTypeDropdownCustomOption => 'Другой (указать)...';

  @override
  String get documentTypeDropdownCustomSubtitle =>
      'Введите пользовательский тип документа';

  @override
  String documentTypeDropdownBasePriceLabel(
      String currencySymbol, String price) {
    return '$currencySymbol$price базовая цена';
  }

  @override
  String get documentTypeDropdownCustomDialogTitle =>
      'Пользовательский тип документа';

  @override
  String get documentTypeDropdownCustomDialogLabel => 'Тип документа';

  @override
  String get documentTypeDropdownCustomDialogHint =>
      'Введите название типа документа';

  @override
  String get buttonCancel => 'Отмена';

  @override
  String get buttonSelect => 'Выбрать';

  @override
  String get translationPricingBasePriceLabel => 'Базовая цена (за страницу)';

  @override
  String get translationPricingNumberOfPagesLabel => 'Количество страниц';

  @override
  String get translationPricingTranslationSumLabel => 'Сумма перевода';

  @override
  String get translationPricingUrgentTranslationSumLabel =>
      'Сумма срочного перевода';

  @override
  String get translationPricingNotarialSumLabel =>
      'Нотариальное/Юридическое заверение';

  @override
  String get translationPricingTotalLabel => 'ИТОГО';

  @override
  String get translationPricingUrgentSurcharge => 'Срочный (+100%)';

  @override
  String get translationPricingSemiUrgentSurcharge => 'Полусрочный (+50%)';

  @override
  String get translationPricingPriorityMultiplier => 'Множитель приоритета';

  @override
  String get translationPricingInformationTitle =>
      'Информация о ценообразовании';

  @override
  String get translationPricingUrgentSurchargeInfo =>
      'Срочные заказы требуют доплаты 100%';

  @override
  String get translationPricingSemiUrgentSurchargeInfo =>
      'Полу-срочные заказы требуют доплаты 50%';

  @override
  String translationPricingLocationDiscountInfo(String cityName, int discount) {
    return 'Локация $cityName предоставляет скидку $discount%';
  }

  @override
  String translationPricingLocationSurchargeInfo(
      String cityName, int surcharge) {
    return 'Локация $cityName добавляет наценку $surcharge%';
  }

  @override
  String translationPricingComplexityBonusInfo(int percentage) {
    return 'Бонус за сложность: $percentage%';
  }

  @override
  String get translationPricingStandardPricing =>
      'Применяется стандартное ценообразование';

  @override
  String get translationPricingCalculationTitle => 'Расчет стоимости';

  @override
  String get translationPricingSelectDocumentTypeMessage =>
      'Пожалуйста, выберите тип документа для просмотра стоимости';

  @override
  String get translationPricingCalculatingMessage => 'Расчет стоимости...';

  @override
  String translationPricingCityMultiplierText(
      double multiplier, String cityName) {
    return 'Город: ${multiplier}x ($cityName)';
  }

  @override
  String translationPricingManagerMultiplierText(
      double multiplier, String managerLevel) {
    return 'Менеджер: ${multiplier}x ($managerLevel)';
  }

  @override
  String get blankNumberFieldHintText =>
      'Введите 6-значный номер (например, 123456)';

  @override
  String get blankNumberFieldGenerateTooltip => 'Сгенерировать номер бланка';

  @override
  String get blankNumberFieldSuggestTooltip => 'Предложить следующий номер';

  @override
  String get blankNumberFieldHelperText => 'Формат: 6 цифр (000000-999999)';

  @override
  String get blankNumberFieldRequiredError => 'Номер бланка обязателен';

  @override
  String get blankNumberFieldInvalidFormatError =>
      'Неверный формат. Должно быть ровно 6 цифр';

  @override
  String get blankNumberFieldDuplicateError =>
      'Этот номер бланка уже используется';

  @override
  String blankNumberFieldGeneratedMessage(String action, String number) {
    return '$action номер бланка: $number';
  }

  @override
  String get blankNumberFieldActionGenerated => 'Сгенерирован';

  @override
  String get blankNumberFieldActionSuggested => 'Предложен';

  @override
  String get blankNumbersWidgetTitle => 'Номера бланков';

  @override
  String get blankNumbersWidgetMainLabel => 'Основной номер бланка *';

  @override
  String get blankNumbersWidgetDamagedCheckbox =>
      'Добавить поврежденный/испорченный бланк';

  @override
  String get blankNumbersWidgetDamagedSubtitle =>
      'Отметьте, если бланк был поврежден и требует замены';

  @override
  String get blankNumbersWidgetDamagedLabel => 'Номер поврежденного бланка';

  @override
  String get blankNumbersWidgetDamagedHint =>
      'Номер поврежденного бланка, который заменяется';

  @override
  String get blankNumbersWidgetDamagedWarning =>
      'Запишите номер поврежденного бланка для отслеживания и аудита. Это помогает поддерживать точность инвентаря бланков.';

  @override
  String get blankNumbersWidgetGuidelinesTitle => 'Правила номеров бланков';

  @override
  String get blankNumbersWidgetGuidelinesText =>
      '• Используйте ровно 6 цифр (например, 123456)\n• Каждый номер бланка должен быть уникальным\n• Используйте \"Сгенерировать\" для номеров на основе времени\n• Используйте \"Предложить\" для последовательной нумерации\n• Записывайте поврежденные бланки для аудита';

  @override
  String get searchableDropdownHint => 'Выберите опцию...';

  @override
  String get searchableDropdownSearchHint => 'Поиск...';

  @override
  String get searchableDropdownNoResults => 'Результаты не найдены';
}

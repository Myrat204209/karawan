// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get networkError => 'Нет подключения к интернету.';

  @override
  String get networkErrorDescription => 'Пожалуйста, попробуйте еще раз позже.';

  @override
  String get networkErrorButton => 'Повторить попытку';

  @override
  String get notification => 'Уведомление';

  @override
  String get unreadMessage => 'Новое';

  @override
  String get technicalSupportTitle => 'Техническая поддержка';

  @override
  String get technicalSupportDescription =>
      'Свяжитесь с нами для получения помощи';

  @override
  String get language => 'Язык';

  @override
  String get languageChangeTitle => 'Изменить язык';

  @override
  String get languageSelectDescription => 'Выберите язык приложения';

  @override
  String get searching => 'Поиск в магазине...';

  @override
  String get startShopping => 'Купить сейчас';

  @override
  String get loadMore => 'Загрузить еще';

  @override
  String get merchLabel => 'Для торговцев';

  @override
  String get merchTitle => 'Специальные предложения';

  @override
  String get merchSubtitle => 'Все товары, оптовая цена';

  @override
  String get viewAll => 'Посмотреть все';

  @override
  String get productDetails => 'Детали продукта';

  @override
  String get chooseColor => 'Выберите цвет';

  @override
  String get selectSize => 'Выберите размер';

  @override
  String get addToCart => 'Добавить в корзину';

  @override
  String get similarProducts => 'Похожие товары';

  @override
  String get filter => 'Фильтр';

  @override
  String get selectAll => 'Выбрать все';

  @override
  String productsAll(int products) {
    return 'Товары ($products)';
  }

  @override
  String get close => 'Закрыть';

  @override
  String get cart => 'Моя корзина';

  @override
  String get removeAll => 'Удалить все';

  @override
  String get cartConfirmation => 'Подтвердить корзину';

  @override
  String get totalPrice => 'Общая стоимость';

  @override
  String get price => 'Цена';

  @override
  String get totalCost => 'Общая стоимость товаров';

  @override
  String get deliverySerice => 'Служба доставки';

  @override
  String get discount => 'Скидка';

  @override
  String get cartClearTitle => 'Удалить товары';

  @override
  String get cartClearContent => 'Вы хотите удалить все товары?';

  @override
  String get neglection => 'Нет';

  @override
  String get affirmation => 'Да';

  @override
  String get checkOutCompleteTitle => 'Ваш заказ зарегистрирован.';

  @override
  String get checkOutCompleteContent =>
      'Завершенный торговый процесс будет добавлен к вам в указанное время. Спасибо за покупку!';

  @override
  String get continueShop => 'Продолжить покупки';

  @override
  String get paymentMethod => 'Способы оплаты';

  @override
  String get paymentMethodCash => 'Наличные';

  @override
  String get paymentMethodTerminal => 'Терминал';

  @override
  String get selectAddress => 'Выберите адрес';

  @override
  String get deliveryTime => 'Выберите время доставки';

  @override
  String get selectAddressEmpty => 'Не выбрано';

  @override
  String get addressesCreate => 'Добавить новый адрес';

  @override
  String get myAddresses => 'Мои адреса';

  @override
  String get address => 'Адрес';

  @override
  String get addressName => 'Название адреса';

  @override
  String get name => 'Имя';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get save => 'Сохранить';

  @override
  String get profile => 'Мой профиль';

  @override
  String get favorites => 'Избранное';

  @override
  String get account => 'Аккаунт';

  @override
  String get orders => 'Заказы';

  @override
  String get orderInformation => 'Информация о заказах';

  @override
  String get logout => 'Выйти';

  @override
  String get region => 'Регион';

  @override
  String get accepted => 'Принято';

  @override
  String get expected => 'Ожидается';

  @override
  String get success => 'Успешно';

  @override
  String get cancel => 'Отмена';

  @override
  String get cartEmptyTitle => 'Корзина пуста';

  @override
  String get cartEmptyDescription =>
      'Товары в вашей корзине отображаются здесь';

  @override
  String get productsEmptyTitle => 'Товары не найдены';

  @override
  String get productsEmptyDescription =>
      'В настоящее время нет доступных товаров.';

  @override
  String get submit => 'Отправить';

  @override
  String get phoneInput => 'Введите номер телефона!';

  @override
  String get otpSending => 'Мы отправим вам код OTP на ваш номер телефона!';

  @override
  String get acceptPolice =>
      'Продолжая, я принимаю политику конфиденциальности и условия использования';

  @override
  String get getCode => 'Получить код';

  @override
  String get otpEnter => 'Введите код OTP!';

  @override
  String otpSentInformation(String phoneNumber) {
    return 'Мы отправили код OTP на +$phoneNumber!';
  }

  @override
  String get otpError => 'Код не получен.';

  @override
  String get sendAgain => 'Отправить повторно';

  @override
  String get authSucess => 'Успешно создано!';

  @override
  String get ok => 'ОК';
}

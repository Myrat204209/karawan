import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_tk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'app_localizations/app_localizations.dart';
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
    Locale('ru'),
    Locale('tk'),
  ];

  /// No description provided for @networkError.
  ///
  /// In tk, this message translates to:
  /// **'Internet baglanyşygy ýok.'**
  String get networkError;

  /// No description provided for @networkErrorDescription.
  ///
  /// In tk, this message translates to:
  /// **'Biraz wagtdan täzeden synanyşyň.'**
  String get networkErrorDescription;

  /// No description provided for @networkErrorButton.
  ///
  /// In tk, this message translates to:
  /// **'Täzeden synanyş'**
  String get networkErrorButton;

  /// No description provided for @notification.
  ///
  /// In tk, this message translates to:
  /// **'Bildiriş'**
  String get notification;

  /// No description provided for @unreadMessage.
  ///
  /// In tk, this message translates to:
  /// **'Täze'**
  String get unreadMessage;

  /// No description provided for @technicalSupportTitle.
  ///
  /// In tk, this message translates to:
  /// **'Tehniki goldaw'**
  String get technicalSupportTitle;

  /// No description provided for @technicalSupportDescription.
  ///
  /// In tk, this message translates to:
  /// **'Kömek üçin bize ýüz tutuň'**
  String get technicalSupportDescription;

  /// No description provided for @language.
  ///
  /// In tk, this message translates to:
  /// **'Dil'**
  String get language;

  /// No description provided for @languageChangeTitle.
  ///
  /// In tk, this message translates to:
  /// **'Dili üýtgetmek'**
  String get languageChangeTitle;

  /// No description provided for @languageSelectDescription.
  ///
  /// In tk, this message translates to:
  /// **'Programmanyň dilini saýlaň'**
  String get languageSelectDescription;

  /// No description provided for @searching.
  ///
  /// In tk, this message translates to:
  /// **'Dükandan gözläň...'**
  String get searching;

  /// No description provided for @startShopping.
  ///
  /// In tk, this message translates to:
  /// **'Häzir satyn alyň'**
  String get startShopping;

  /// No description provided for @loadMore.
  ///
  /// In tk, this message translates to:
  /// **'Has köp görkez'**
  String get loadMore;

  /// No description provided for @merchLabel.
  ///
  /// In tk, this message translates to:
  /// **'Täjirler üçin'**
  String get merchLabel;

  /// No description provided for @merchTitle.
  ///
  /// In tk, this message translates to:
  /// **'Ýörite teklipler'**
  String get merchTitle;

  /// No description provided for @merchSubtitle.
  ///
  /// In tk, this message translates to:
  /// **'Ähli önümler, lomaý baha'**
  String get merchSubtitle;

  /// No description provided for @viewAll.
  ///
  /// In tk, this message translates to:
  /// **'Ählisini görmek'**
  String get viewAll;

  /// No description provided for @productDetails.
  ///
  /// In tk, this message translates to:
  /// **'Harydyň maglumatlary'**
  String get productDetails;

  /// No description provided for @chooseColor.
  ///
  /// In tk, this message translates to:
  /// **'Reňk saýlaň'**
  String get chooseColor;

  /// No description provided for @selectSize.
  ///
  /// In tk, this message translates to:
  /// **'Ölçegi saýlaň'**
  String get selectSize;

  /// No description provided for @addToCart.
  ///
  /// In tk, this message translates to:
  /// **'Sebede goş'**
  String get addToCart;

  /// No description provided for @similarProducts.
  ///
  /// In tk, this message translates to:
  /// **'Meňzeş önümler'**
  String get similarProducts;

  /// No description provided for @filter.
  ///
  /// In tk, this message translates to:
  /// **'Süzgüç'**
  String get filter;

  /// No description provided for @selectAll.
  ///
  /// In tk, this message translates to:
  /// **'Ählisini saýla'**
  String get selectAll;

  /// Tapylan önümleriň sany.
  ///
  /// In tk, this message translates to:
  /// **'Önümler ({products})'**
  String productsAll(int products);

  /// No description provided for @close.
  ///
  /// In tk, this message translates to:
  /// **'Ýap'**
  String get close;

  /// No description provided for @cart.
  ///
  /// In tk, this message translates to:
  /// **'Sebedim'**
  String get cart;

  /// No description provided for @removeAll.
  ///
  /// In tk, this message translates to:
  /// **'Ählisini aýyr'**
  String get removeAll;

  /// No description provided for @cartConfirmation.
  ///
  /// In tk, this message translates to:
  /// **'Sebedi tassykla'**
  String get cartConfirmation;

  /// No description provided for @totalPrice.
  ///
  /// In tk, this message translates to:
  /// **'Jemi baha'**
  String get totalPrice;

  /// No description provided for @price.
  ///
  /// In tk, this message translates to:
  /// **'Baha'**
  String get price;

  /// No description provided for @totalCost.
  ///
  /// In tk, this message translates to:
  /// **'Önümleriň jemi bahasy'**
  String get totalCost;

  /// No description provided for @deliverySerice.
  ///
  /// In tk, this message translates to:
  /// **'Eltip bermek hyzmaty'**
  String get deliverySerice;

  /// No description provided for @discount.
  ///
  /// In tk, this message translates to:
  /// **'Arzanladyş'**
  String get discount;

  /// No description provided for @cartClearTitle.
  ///
  /// In tk, this message translates to:
  /// **'Önümleri aýyrmak'**
  String get cartClearTitle;

  /// No description provided for @cartClearContent.
  ///
  /// In tk, this message translates to:
  /// **'Ähli önümleri aýyrmagy isleýärsiňizmi?'**
  String get cartClearContent;

  /// No description provided for @neglection.
  ///
  /// In tk, this message translates to:
  /// **'Ýok'**
  String get neglection;

  /// No description provided for @affirmation.
  ///
  /// In tk, this message translates to:
  /// **'Hawa'**
  String get affirmation;

  /// No description provided for @checkOutCompleteTitle.
  ///
  /// In tk, this message translates to:
  /// **'Sargydyňyz hasaba alyndy.'**
  String get checkOutCompleteTitle;

  /// No description provided for @checkOutCompleteContent.
  ///
  /// In tk, this message translates to:
  /// **'Tamamlanan söwda bellenen wagtda size gowşurylar. Satyn alşyňyz üçin sag boluň!'**
  String get checkOutCompleteContent;

  /// No description provided for @continueShop.
  ///
  /// In tk, this message translates to:
  /// **'Söwda etmegi dowam ediň'**
  String get continueShop;

  /// No description provided for @paymentMethod.
  ///
  /// In tk, this message translates to:
  /// **'Töleg görnüşleri'**
  String get paymentMethod;

  /// No description provided for @paymentMethodCash.
  ///
  /// In tk, this message translates to:
  /// **'Nagt'**
  String get paymentMethodCash;

  /// No description provided for @paymentMethodTerminal.
  ///
  /// In tk, this message translates to:
  /// **'Terminal'**
  String get paymentMethodTerminal;

  /// No description provided for @selectAddress.
  ///
  /// In tk, this message translates to:
  /// **'Salgy saýlaň'**
  String get selectAddress;

  /// No description provided for @deliveryTime.
  ///
  /// In tk, this message translates to:
  /// **'Eltip bermek wagtyny saýlaň'**
  String get deliveryTime;

  /// No description provided for @selectAddressEmpty.
  ///
  /// In tk, this message translates to:
  /// **'Saýlanmady'**
  String get selectAddressEmpty;

  /// No description provided for @addressesCreate.
  ///
  /// In tk, this message translates to:
  /// **'Täze salgy goş'**
  String get addressesCreate;

  /// No description provided for @myAddresses.
  ///
  /// In tk, this message translates to:
  /// **'Salgylarym'**
  String get myAddresses;

  /// No description provided for @address.
  ///
  /// In tk, this message translates to:
  /// **'Salgy'**
  String get address;

  /// No description provided for @addressName.
  ///
  /// In tk, this message translates to:
  /// **'Salgyň ady'**
  String get addressName;

  /// No description provided for @name.
  ///
  /// In tk, this message translates to:
  /// **'At'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In tk, this message translates to:
  /// **'Telefon belgisi'**
  String get phoneNumber;

  /// No description provided for @save.
  ///
  /// In tk, this message translates to:
  /// **'Ýatda sakla'**
  String get save;

  /// No description provided for @profile.
  ///
  /// In tk, this message translates to:
  /// **'Meniň profilim'**
  String get profile;

  /// No description provided for @favorites.
  ///
  /// In tk, this message translates to:
  /// **'Halanlarym'**
  String get favorites;

  /// No description provided for @account.
  ///
  /// In tk, this message translates to:
  /// **'Hasap'**
  String get account;

  /// No description provided for @orders.
  ///
  /// In tk, this message translates to:
  /// **'Sargytlar'**
  String get orders;

  /// No description provided for @orderInformation.
  ///
  /// In tk, this message translates to:
  /// **'Sargytlar hasabaty'**
  String get orderInformation;

  /// No description provided for @logout.
  ///
  /// In tk, this message translates to:
  /// **'Çyk'**
  String get logout;

  /// No description provided for @region.
  ///
  /// In tk, this message translates to:
  /// **'Sebit'**
  String get region;

  /// No description provided for @accepted.
  ///
  /// In tk, this message translates to:
  /// **'Kabul edildi'**
  String get accepted;

  /// No description provided for @expected.
  ///
  /// In tk, this message translates to:
  /// **'Garaşylýar'**
  String get expected;

  /// No description provided for @success.
  ///
  /// In tk, this message translates to:
  /// **'Üstünlik'**
  String get success;

  /// No description provided for @cancel.
  ///
  /// In tk, this message translates to:
  /// **'Ýatyr'**
  String get cancel;

  /// No description provided for @cartEmptyTitle.
  ///
  /// In tk, this message translates to:
  /// **'Sebet boş'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptyDescription.
  ///
  /// In tk, this message translates to:
  /// **'Sebediňizdäki önümler şu ýerde görkeziler'**
  String get cartEmptyDescription;

  /// No description provided for @productsEmptyTitle.
  ///
  /// In tk, this message translates to:
  /// **'Önüm tapylmady'**
  String get productsEmptyTitle;

  /// No description provided for @productsEmptyDescription.
  ///
  /// In tk, this message translates to:
  /// **'Häzirlikçe elýeterli önüm ýok.'**
  String get productsEmptyDescription;

  /// No description provided for @submit.
  ///
  /// In tk, this message translates to:
  /// **'Tabşyr'**
  String get submit;

  /// No description provided for @phoneInput.
  ///
  /// In tk, this message translates to:
  /// **'Telefon belgiňizi giriziň!'**
  String get phoneInput;

  /// No description provided for @otpSending.
  ///
  /// In tk, this message translates to:
  /// **'Telefon belgiňize SMS kody ibereris!'**
  String get otpSending;

  /// No description provided for @acceptPolice.
  ///
  /// In tk, this message translates to:
  /// **'Dowam etmek bilen gizlinlik syýasatyny we ulanyş şertlerini kabul edýärin'**
  String get acceptPolice;

  /// No description provided for @getCode.
  ///
  /// In tk, this message translates to:
  /// **'Kody al'**
  String get getCode;

  /// No description provided for @otpEnter.
  ///
  /// In tk, this message translates to:
  /// **'SMS kody giriziň!'**
  String get otpEnter;

  /// Onümi tapmak.
  ///
  /// In tk, this message translates to:
  /// **'SMS kody +{phoneNumber} belgisine iberdik!'**
  String otpSentInformation(String phoneNumber);

  /// No description provided for @otpError.
  ///
  /// In tk, this message translates to:
  /// **'Kod alynmady.'**
  String get otpError;

  /// No description provided for @sendAgain.
  ///
  /// In tk, this message translates to:
  /// **'Täzeden iber'**
  String get sendAgain;

  /// No description provided for @authSucess.
  ///
  /// In tk, this message translates to:
  /// **'Üstünlikli döredildi!'**
  String get authSucess;

  /// No description provided for @ok.
  ///
  /// In tk, this message translates to:
  /// **'Bolýar'**
  String get ok;
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
      <String>['ru', 'tk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
    case 'tk':
      return AppLocalizationsTk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

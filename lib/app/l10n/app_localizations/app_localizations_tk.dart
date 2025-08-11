// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkmen (`tk`).
class AppLocalizationsTk extends AppLocalizations {
  AppLocalizationsTk([String locale = 'tk']) : super(locale);

  @override
  String get networkError => 'Internet baglanyşygy ýok.';

  @override
  String get networkErrorDescription => 'Biraz wagtdan täzeden synanyşyň.';

  @override
  String get networkErrorButton => 'Täzeden synanyş';

  @override
  String get notification => 'Bildiriş';

  @override
  String get unreadMessage => 'Täze';

  @override
  String get technicalSupportTitle => 'Tehniki goldaw';

  @override
  String get technicalSupportDescription => 'Kömek üçin bize ýüz tutuň';

  @override
  String get language => 'Dil';

  @override
  String get languageChangeTitle => 'Dili üýtgetmek';

  @override
  String get languageSelectDescription => 'Programmanyň dilini saýlaň';

  @override
  String get searching => 'Dükandan gözläň...';

  @override
  String get startShopping => 'Häzir satyn alyň';

  @override
  String get loadMore => 'Has köp görkez';

  @override
  String get merchLabel => 'Täjirler üçin';

  @override
  String get merchTitle => 'Ýörite teklipler';

  @override
  String get merchSubtitle => 'Ähli önümler, lomaý baha';

  @override
  String get viewAll => 'Ählisini görmek';

  @override
  String get productDetails => 'Harydyň maglumatlary';

  @override
  String get chooseColor => 'Reňk saýlaň';

  @override
  String get selectSize => 'Ölçegi saýlaň';

  @override
  String get addToCart => 'Sebede goş';

  @override
  String get similarProducts => 'Meňzeş önümler';

  @override
  String get filter => 'Süzgüç';

  @override
  String get selectAll => 'Ählisini saýla';

  @override
  String productsAll(int products) {
    return 'Önümler ($products)';
  }

  @override
  String get close => 'Ýap';

  @override
  String get cart => 'Sebedim';

  @override
  String get removeAll => 'Ählisini aýyr';

  @override
  String get cartConfirmation => 'Sebedi tassykla';

  @override
  String get totalPrice => 'Jemi baha';

  @override
  String get price => 'Baha';

  @override
  String get totalCost => 'Önümleriň jemi bahasy';

  @override
  String get deliverySerice => 'Eltip bermek hyzmaty';

  @override
  String get discount => 'Arzanladyş';

  @override
  String get cartClearTitle => 'Önümleri aýyrmak';

  @override
  String get cartClearContent => 'Ähli önümleri aýyrmagy isleýärsiňizmi?';

  @override
  String get neglection => 'Ýok';

  @override
  String get affirmation => 'Hawa';

  @override
  String get checkOutCompleteTitle => 'Sargydyňyz hasaba alyndy.';

  @override
  String get checkOutCompleteContent =>
      'Tamamlanan söwda bellenen wagtda size gowşurylar. Satyn alşyňyz üçin sag boluň!';

  @override
  String get continueShop => 'Söwda etmegi dowam ediň';

  @override
  String get paymentMethod => 'Töleg görnüşleri';

  @override
  String get paymentMethodCash => 'Nagt';

  @override
  String get paymentMethodTerminal => 'Terminal';

  @override
  String get selectAddress => 'Salgy saýlaň';

  @override
  String get deliveryTime => 'Eltip bermek wagtyny saýlaň';

  @override
  String get selectAddressEmpty => 'Saýlanmady';

  @override
  String get addressesCreate => 'Täze salgy goş';

  @override
  String get myAddresses => 'Salgylarym';

  @override
  String get address => 'Salgy';

  @override
  String get addressName => 'Salgyň ady';

  @override
  String get name => 'At';

  @override
  String get phoneNumber => 'Telefon belgisi';

  @override
  String get save => 'Ýatda sakla';

  @override
  String get profile => 'Meniň profilim';

  @override
  String get favorites => 'Halanlarym';

  @override
  String get account => 'Hasap';

  @override
  String get orders => 'Sargytlar';

  @override
  String get orderInformation => 'Sargytlar hasabaty';

  @override
  String get logout => 'Çyk';

  @override
  String get region => 'Sebit';

  @override
  String get accepted => 'Kabul edildi';

  @override
  String get expected => 'Garaşylýar';

  @override
  String get success => 'Üstünlik';

  @override
  String get cancel => 'Ýatyr';

  @override
  String get cartEmptyTitle => 'Sebet boş';

  @override
  String get cartEmptyDescription =>
      'Sebediňizdäki önümler şu ýerde görkeziler';

  @override
  String get productsEmptyTitle => 'Önüm tapylmady';

  @override
  String get productsEmptyDescription => 'Häzirlikçe elýeterli önüm ýok.';

  @override
  String get submit => 'Tabşyr';

  @override
  String get phoneInput => 'Telefon belgiňizi giriziň!';

  @override
  String get otpSending => 'Telefon belgiňize SMS kody ibereris!';

  @override
  String get acceptPolice =>
      'Dowam etmek bilen gizlinlik syýasatyny we ulanyş şertlerini kabul edýärin';

  @override
  String get getCode => 'Kody al';

  @override
  String get otpEnter => 'SMS kody giriziň!';

  @override
  String otpSentInformation(String phoneNumber) {
    return 'SMS kody +$phoneNumber belgisine iberdik!';
  }

  @override
  String get otpError => 'Kod alynmady.';

  @override
  String get sendAgain => 'Täzeden iber';

  @override
  String get authSucess => 'Üstünlikli döredildi!';

  @override
  String get ok => 'Bolýar';
}

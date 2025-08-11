import 'package:flutter/material.dart' show Locale;
import 'package:hydrated_bloc/hydrated_bloc.dart';

const kDefaultLocale = Locale('tk');

class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(kDefaultLocale);

  void changeLanguage(Locale locale) => emit(locale);

  @override
  Locale fromJson(Map<String, dynamic> json) => Locale(json['languageCode']);

  @override
  Map<String, dynamic> toJson(Locale state) => {
    'languageCode': state.languageCode,
  };
}

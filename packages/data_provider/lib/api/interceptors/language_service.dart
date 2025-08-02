// // lib/language/language_service.dart
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final class LanguageService {
//   LanguageService({required SharedPreferences sharedPreferences})
//       : _prefs = sharedPreferences {
//     _loadInitialLanguage();
//   }

//   final SharedPreferences _prefs;
//   static const _languageCodeKey = '__language_code__';

//   // A reactive notifier that holds the current language code.
//   final ValueNotifier<String?> _currentLanguage = ValueNotifier(null);
  
//   // A public getter for other parts of the app to listen to changes (optional).
//   ValueListenable<String?> get languageListenable => _currentLanguage;
  
//   // A simple getter for the interceptor to synchronously read the latest value.
//   String? get currentLanguageCode => _currentLanguage.value;

//   void _loadInitialLanguage() {
//     _currentLanguage.value = _prefs.getString(_languageCodeKey);
//   }

//   Future<void> changeLanguage(String languageCode) async {
//     // Update the state in SharedPreferences for the next app launch.
//     await _prefs.setString(_languageCodeKey, languageCode);
//     // Update the value in the notifier for the current session.
//     _currentLanguage.value = languageCode;
//   }
// }
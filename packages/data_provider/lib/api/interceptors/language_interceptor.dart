// // lib/network/language_interceptor.dart
// import 'package:data_provider/data_provider.dart' show LanguageService;
// import 'package:dio/dio.dart';

// class LanguageInterceptor extends Interceptor {
//   LanguageInterceptor({required this.languageService});
//   final LanguageService languageService;

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // Synchronously read the latest language code from the service.
//     final language = languageService.currentLanguageCode;

//     if (language != null) {
//       options.headers['Accept-Language'] = language;
//     }

//     super.onRequest(options, handler);
//   }
// }

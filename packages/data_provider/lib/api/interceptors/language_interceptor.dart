import 'package:dio/dio.dart';

typedef LanguageProvider = Future<String?> Function();

/// Language adder for the request header
/// `Accept-Language`: `<language>`
///
class LanguageInterceptor extends Interceptor {
  final LanguageProvider _languageProvider;

  LanguageInterceptor({required LanguageProvider languageProvider})
    : _languageProvider = languageProvider;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final language = await _languageProvider() ?? 'tk';
    options.headers.addAll({'Accept-Language': language});
    return handler.next(options);
  }
}

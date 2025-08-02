import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

// typedef RefreshFunction = Future<OAuth2Token> Function(OAuth2Token?, Dio);

class Http extends DioForNative {
  final String _defaultBaseUrl;
  final Talker? _talker;

  Http({
    required String defaultBaseUrl,
    Talker? talker,
    required TokenStorage tokenStorage,
    // LanguageService? languageService,
    // ConnectivityService? connectivityService,
    bool enableLogger = true,
  }) : _defaultBaseUrl = defaultBaseUrl,
       _talker = talker,
       super(
         BaseOptions(
           baseUrl: defaultBaseUrl,
           connectTimeout: const Duration(seconds: 2),
           sendTimeout: const Duration(seconds: 2),
           receiveTimeout: const Duration(seconds: 2),
         ),
       ) {
    interceptors.addAll([
      // if (connectivityService != null)
      //   ErrorInterceptor(connectivityService: connectivityService),
      TokenHandleInterceptor(
        dio: this,
        tokenStorage: tokenStorage,
        baseUrl: defaultBaseUrl,
      ),
      // if (languageService != null)
      //   LanguageInterceptor(languageService: languageService),
      const AlwaysAcceptApplicationJsonInterceptor(),

      TalkerDioLogger(
        talker: _talker,
        settings: TalkerDioLoggerSettings(
          enabled: enableLogger,
          logLevel: LogLevel.debug,
          printResponseTime: true,
          printRequestData: true,
          printRequestExtra: true,
          printErrorHeaders: true,
          printErrorMessage: true,
          printResponseData: true,
          printResponseMessage: true,

          printErrorData: true,
          printRequestHeaders: true,
        ),
      ),
    ]);
  }

  /// If given value is null default is used
  void updateBaseUrl(String? baseUrl) {
    options.baseUrl = baseUrl ?? _defaultBaseUrl;
  }
}

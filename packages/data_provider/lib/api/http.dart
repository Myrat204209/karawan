import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Http extends DioForNative {
  final String _defaultBaseUrl;
  final Talker? _talker;

  Http({
    required String defaultBaseUrl,
    Talker? talker,
    TokenProvider? tokenProvider,
    LanguageProvider? languageProvider,
    bool enableLogger = true,
  }) : _defaultBaseUrl = defaultBaseUrl,
       _talker = talker,
       super(
         BaseOptions(
           baseUrl: defaultBaseUrl,
           connectTimeout: const Duration(milliseconds: 5000),
           receiveTimeout: const Duration(milliseconds: 5000),
         ),
       ) {
    interceptors.addAll([
      if (tokenProvider != null)
        TokenHandleInterceptor(tokenProvider: tokenProvider),
      if (languageProvider != null)
        LanguageInterceptor(languageProvider: languageProvider),
      const AlwaysAcceptApplicationJsonInterceptor(),
      TalkerDioLogger(
        talker: _talker,
        settings: TalkerDioLoggerSettings(enabled: enableLogger,logLevel: LogLevel.debug,printResponseTime: true,printRequestHeaders: true),
      ),
    ]);
  }

  /// If given value is null default is used
  void updateBaseUrl(String? baseUrl) {
    options.baseUrl = baseUrl ?? _defaultBaseUrl;
  }
}

import 'dart:developer' show log;

import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';

class TokenHandleInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;
  final Dio dio;
  final String _baseUrl;

  TokenHandleInterceptor({
    required this.dio,
    required TokenStorage tokenStorage,
    required String baseUrl,
  }) : _tokenStorage = tokenStorage,
       _baseUrl = baseUrl;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.readAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      log('✅ Interceptor: Detected 401. Locking Dio.');
      // Lock the dio instance to prevent other requests from being sent.

      // dio.lock();

      try {
        final refreshTokenString = await _tokenStorage.readRefreshToken();
        if (refreshTokenString == null) {
          log('❌ No refresh token found. Logging out.');
          await _tokenStorage.clearTokens();
          // Reject the error to let the original caller know it failed.
          return handler.reject(err);
        }

        // Make the refresh token API call.
        final refreshDio = Dio(BaseOptions(baseUrl: _baseUrl));
        final response = await refreshDio.post(
          '$kAV0/refresh', // Your refresh endpoint
          data: {'refresh_token': refreshTokenString},
        );

        if (response.statusCode == 200) {
          log('✅ Token refresh successful. Updating token.');
          // Extract and save new tokens.
          final newAccessToken = response.data['access_token'];
          final newRefreshToken = response.data['refresh_token'];
          await _tokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
          );

          log('🔑 Retrying original request...');
          // Retry the original request with the new token.
          final responseCloned = await _retryRequest(err.requestOptions);
          // Resolve the handler with the successful response.
          return handler.resolve(responseCloned);
        }
      } on DioException catch (e) {
        log('❌ CRITICAL: Failed to refresh token. Logging out.', error: e);
        // If refreshing fails, the refresh token is invalid.
        await _tokenStorage.clearTokens();
        // Reject the error to signal failure.
        return handler.reject(err);
      }
    }
    // If the error is not 401, just pass it along.
    super.onError(err, handler);
  }

  /// A helper method to retry a request after a token refresh.
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final newAccessToken = (await _tokenStorage.readAccessToken());
    requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

    // Use the main Dio instance to perform the retry.
    // This ensures it uses all the other interceptors.
    return dio.fetch(requestOptions);
  }
}

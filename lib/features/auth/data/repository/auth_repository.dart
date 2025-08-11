import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart' show GetIt;

part 'auth_failures.dart';

final _getIt = GetIt.I;

class AuthRepository {
  AuthRepository()
    : _authClient = _getIt<AuthClient>(),
      _tokenStorage = _getIt<TokenStorage>();
  final AuthClient _authClient;
  final TokenStorage _tokenStorage;

  Future<bool> isAuthenticated() async {
    final accessToken = await _tokenStorage.readAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  Future<SendOtpResponseItem> sendOtp({
    required String phone,
    required SendOtpPlatform platform,
  }) async {
    try {
      final response = await _authClient.sendOtp(
        body: SendOtpRequestBody(phone: phone, platform: platform),
      );

      return response;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PhoneSubmitException(error), stackTrace);
    }
  }

  Future<CheckUserItem> checkUser({required String phone}) async {
    try {
      final response = await _authClient.checkUser(
        body: SendOtpRequestBody(phone: phone),
      );

      return response;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PhoneSubmitException(error), stackTrace);
    }
  }

  Future<void> logOut() async {
    try {
      await _authClient.logout();
      await _tokenStorage.clearTokens();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogoutException(error), stackTrace);
    }
  }

  Future<LoginResponseItem> verifyOtp({
    required String otp,
    required String phone,
  }) async {
    try {
      final loginResponse = await _authClient.verifyOtp(
        body: VerifyOtpRequestBody(phone: phone, otp: otp),
      );

      final accessToken = loginResponse.accessToken;
      final refreshToken = loginResponse.refreshToken;

      if (accessToken != null && refreshToken != null) {
        await _tokenStorage.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
      } else {
        // Or handle the case where the token is unexpectedly null
        throw TokenAbsentException(
          'Login successful, but no token was provided.',
        );
      }
      return loginResponse;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(VerifyOtpException(error), stackTrace);
    }
  }
}

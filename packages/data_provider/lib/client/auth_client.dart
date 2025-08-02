import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AuthClient;

  @POST('$kAV1/login/send-otp')
  // Future<SendOtpResponseItem> sendOtp({
  //   @Body() required SendOtpRequestBody body,
  // });
  @POST('$kAV1/login/verify-otp')
  Future<LoginResponseItem> verifyOtp({
    @Body() required VerifyOtpRequestBody body,
  });

  @POST('$kAV0/logout')
  Future<String> logout();
}

import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_client.g.dart';

@RestApi()
abstract class ProfileClient {
  factory ProfileClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ProfileClient;

  @GET('$kAV0/me/profile')
  Future<ProfileItem> getMe();

  @DELETE('$kAV0/delete-user/{id}')
  Future<String> deleteUser(@Path('id') int id);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_response_item.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseItem {
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  const LoginResponseItem(this.accessToken, this.refreshToken);

  factory LoginResponseItem.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseItemFromJson(json);
}

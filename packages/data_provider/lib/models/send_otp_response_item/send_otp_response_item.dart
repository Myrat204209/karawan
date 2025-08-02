import 'package:json_annotation/json_annotation.dart';

part 'send_otp_response_item.g.dart';

@JsonSerializable(createToJson: false)
class SendOtpResponseItem {
  @JsonKey(name: 'is_success')
  final bool isSuccess;
  final String message;
  SendOtpResponseItem({required this.isSuccess, required this.message});

  factory SendOtpResponseItem.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseItemFromJson(json);
}

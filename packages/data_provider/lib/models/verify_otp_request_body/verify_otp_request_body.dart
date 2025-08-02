import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_body.g.dart';

@JsonSerializable(createFactory: false)
class VerifyOtpRequestBody {
  final String phone;
  final String otp;
  VerifyOtpRequestBody({required this.phone, required this.otp});

  Map<String, dynamic> toJson() => _$VerifyOtpRequestBodyToJson(this);
}

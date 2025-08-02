// In your data_provider package, e.g., models/send_otp_request_body.dart
import 'package:json_annotation/json_annotation.dart';

part 'send_otp_request_body.g.dart';

@JsonSerializable(createFactory: false)
final class SendOtpRequestBody {
  const SendOtpRequestBody({required this.phone});

  final String phone;

  Map<String, dynamic> toJson() => _$SendOtpRequestBodyToJson(this);
}

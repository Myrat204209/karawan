part of 'auth_repository.dart';

abstract class AuthFailure with EquatableMixin implements Exception {
  const AuthFailure(this.error);
  final Object error;

  @override
  List<Object?> get props => [error];
}

class PhoneSubmitException extends AuthFailure {
  const PhoneSubmitException(super.error);
}

class VerifyOtpException extends AuthFailure {
  const VerifyOtpException(super.error);
}

class LogoutException extends AuthFailure {
  const LogoutException(super.error);
}

class TokenAbsentException extends AuthFailure {
  const TokenAbsentException(super.error);
}

class TokenDeleteException extends AuthFailure {
  const TokenDeleteException(super.error);
}

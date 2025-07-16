part of 'login_bloc.dart';

enum LoginStatus { initial, failure, loading, success }

final class LoginState extends Equatable {
  const LoginState({this.status = LoginStatus.initial});

  const LoginState.initial() : this(status: LoginStatus.initial);
  final LoginStatus status;
  @override
  List<Object> get props => [];
}

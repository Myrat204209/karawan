part of 'app_bootstrap_bloc.dart';

enum AppStatus {
  initial,
  needsUpdate,
  needsLanguage,
  unauthenticated,
  authenticated,
  failure,
}

final class AppBootstrapState extends Equatable {
  const AppBootstrapState({this.status = AppStatus.initial, this.errorMessage});

  final AppStatus status;
  final String? errorMessage;

  AppBootstrapState copyWith({AppStatus? status, String? errorMessage}) {
    return AppBootstrapState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}

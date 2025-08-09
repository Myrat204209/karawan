part of 'app_bootstrap_bloc.dart';

sealed class AppBootstrapEvent extends Equatable {
  const AppBootstrapEvent();

  @override
  List<Object?> get props => [];
}

final class AppStarted extends AppBootstrapEvent {}

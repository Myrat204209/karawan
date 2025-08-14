part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeDataFetched extends HomeEvent {
  final AppSection section;
  const HomeDataFetched({required this.section});
}

// Suggested code for home_state.dart
part of 'home_bloc.dart';

// Using an enum for status is clear and robust
enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.items = const <HomeItem>[],
    this.activeSection,
  });

  final HomeStatus status;
  final List<HomeItem> items;
  final AppSection? activeSection;

  HomeState copyWith({
    HomeStatus? status,
    List<HomeItem>? items,
    AppSection? activeSection,
  }) {
    return HomeState(
      status: status ?? this.status,
      items: items ?? this.items,
      activeSection: activeSection ?? this.activeSection,
    );
  }

  @override
  List<Object?> get props => [status, items, activeSection];
}

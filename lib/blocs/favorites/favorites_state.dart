part of 'favorites_bloc.dart';

enum FavoritesStatus { initial, idle }

final class FavoritesState extends Equatable {
  const FavoritesState({
    this.status = FavoritesStatus.initial,
    this.favorites = const {},
  });

  final FavoritesStatus status;
  final Set<String> favorites;

  FavoritesState copyWith({FavoritesStatus? status, Set<String>? favorites}) {
    return FavoritesState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object?> get props => [status, favorites];
}

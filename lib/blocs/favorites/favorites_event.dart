part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class FavoritesInitialized extends FavoritesEvent {}

final class FavoriteToggled extends FavoritesEvent {
  const FavoriteToggled(this.productId);
  final String productId;

  @override
  List<Object?> get props => [productId];
}

final class FavoritesRehydrated extends FavoritesEvent {
  const FavoritesRehydrated(this.favorites);
  final Set<String> favorites;

  @override
  List<Object?> get props => [favorites];
}

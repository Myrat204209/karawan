part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object> get props => [];
}

/// Event to load the initial list of favorites from storage.
final class FavoritesFetched extends FavoritesEvent {}

/// Event to add or remove a favorite product.
final class FavoriteToggled extends FavoritesEvent {
  const FavoriteToggled(this.productId);
  final String productId;

  @override
  List<Object> get props => [productId];
}

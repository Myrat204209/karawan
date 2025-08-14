// Suggested code for lib/blocs/favorites/favorites_bloc.dart

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/repositories/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({required FavoritesRepository favoritesRepository})
    : _favoritesRepository = favoritesRepository,
      super(const FavoritesState()) {
    on<FavoritesFetched>(_onFavoritesFetched);
    on<FavoriteToggled>(_onFavoriteToggled);
  }

  final FavoritesRepository _favoritesRepository;

  void _onFavoritesFetched(
    FavoritesFetched event,
    Emitter<FavoritesState> emit,
  ) {
    // No async needed, SharedPreferences is synchronous
    try {
      final favorites = _favoritesRepository.getFavorites();
      emit(
        state.copyWith(
          status: FavoritesStatus.success,
          favorites: favorites.toSet(), // Convert List to Set
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FavoritesStatus.failure));
      addError(e);
    }
  }

  Future<void> _onFavoriteToggled(
    FavoriteToggled event,
    Emitter<FavoritesState> emit,
  ) async {
    // For a snappy UI, we don't show a loading indicator here.
    try {
      await _favoritesRepository.toggle(event.productId);

      // After toggling, get the new list from the repository.
      // This is how the BLoC stays in sync.
      final updatedFavorites = _favoritesRepository.getFavorites();
      emit(state.copyWith(favorites: updatedFavorites.toSet()));
    } catch (e) {
      // You could emit a failure state to show a snackbar, for example
      addError(e);
    }
  }
}

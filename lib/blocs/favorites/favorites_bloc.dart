import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show VoidCallback;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/repositories/repositories.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required FavoritesRepository repository,
    required AppSection section,
  }) : _repository = repository,
       _section = section,
       super(const FavoritesState()) {
    on<FavoritesInitialized>(_onInitialized);
    on<FavoriteToggled>(_onToggled);
    on<FavoritesRehydrated>(_onRehydrated);

    // Define the listener callback once and store it.
    _favoritesListener = () {
      if (!isClosed) {
        // Good practice to check if the BLoC is closed
        add(FavoritesRehydrated(_repository.getFavorites()));
      }
    };
  }

  final FavoritesRepository _repository;
  final AppSection _section;

  // A field to hold our listener function.
  late final VoidCallback _favoritesListener;

  Future<void> _onInitialized(
    FavoritesInitialized event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(favorites: _repository.getFavorites()));
    // Add the listener.
    _repository.favoritesListenable.addListener(_favoritesListener);
  }

  Future<void> _onToggled(
    FavoriteToggled event,
    Emitter<FavoritesState> emit,
  ) async {
    await _repository.toggle(event.productId);
    // No need to emit here, the listener will handle it.
  }

  void _onRehydrated(FavoritesRehydrated event, Emitter<FavoritesState> emit) {
    log('Favorites changed (${_section.name}): ${event.favorites.length}');
    emit(state.copyWith(favorites: event.favorites));
  }

  // Override the close method to clean up.
  @override
  Future<void> close() {
    // IMPORTANT: Remove the listener to prevent memory leaks and errors.
    _repository.favoritesListenable.removeListener(_favoritesListener);
    return super.close();
  }
}

import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/repositories/favorites_repository.dart';

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
  }

  final FavoritesRepository _repository;
  final AppSection _section;

  Future<void> _onInitialized(
    FavoritesInitialized event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(favorites: _repository.getFavorites()));
    _repository.favoritesListenable.addListener(() {
      add(FavoritesRehydrated(_repository.getFavorites()));
    });
  }

  Future<void> _onToggled(
    FavoriteToggled event,
    Emitter<FavoritesState> emit,
  ) async {
    await _repository.toggle(event.productId);
    emit(state.copyWith(favorites: _repository.getFavorites()));
  }

  void _onRehydrated(FavoritesRehydrated event, Emitter<FavoritesState> emit) {
    log('Favorites changed (${_section.name}): ${event.favorites.length}');
    emit(state.copyWith(favorites: event.favorites));
  }
}

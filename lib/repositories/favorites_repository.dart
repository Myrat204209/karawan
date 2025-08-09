import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';

/// Repository that encapsulates local favorites storage operations for a given section.
class FavoritesRepository {
  FavoritesRepository({
    required StorageProvider storageProvider,
    required AppSection section,
  }) : _storage = storageProvider,
       _section = section;

  final StorageProvider _storage;
  final AppSection _section;

  /// Reactive listenable for favorites set changes.
  ValueListenable<Set<String>> get favoritesListenable =>
      _section == AppSection.store
      ? _storage.storeFavorites
      : _storage.restaurantFavorites;

  Set<String> getFavorites() => _storage.getFavorites(_section);

  bool isFavorite(String productId) => _storage.isFavorite(productId, _section);

  Future<void> toggle(String productId) =>
      _storage.toggleFavorite(productId, _section);
}

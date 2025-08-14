// Suggested code for lib/repositories/favorites_repository.dart

import 'package:data_provider/data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepository {
  FavoritesRepository({required this.prefs, required this.section});

  final SharedPreferences prefs;
  final AppSection section;

  // Define the keys for storing the data
  static const _marketFavoritesKey = 'market_favorites';
  static const _restaurantFavoritesKey = 'restaurant_favorites';

  /// Selects the correct storage key based on the active section.
  String get _storageKey {
    return section == AppSection.market
        ? _marketFavoritesKey
        : _restaurantFavoritesKey;
  }

  /// Gets the current list of favorite IDs.
  List<String> getFavorites() {
    // getStringList returns a List<String>? or null.
    return prefs.getStringList(_storageKey) ?? [];
  }

  /// Checks if a specific product is in the favorites list.
  bool isFavorite(String productId) {
    return getFavorites().contains(productId);
  }

  /// Adds or removes a product ID and saves the updated list.
  /// This follows the "read-modify-write" pattern required by SharedPreferences.
  Future<void> toggle(String productId) async {
    // 1. Read the current list from storage.
    final currentFavorites = getFavorites();
    // 2. Create a mutable copy to modify.
    final updatedFavorites = List<String>.from(currentFavorites);

    // 3. Modify the copy.
    if (updatedFavorites.contains(productId)) {
      updatedFavorites.remove(productId);
    } else {
      updatedFavorites.add(productId);
    }

    // 4. Write the entire updated list back to storage.
    await prefs.setStringList(_storageKey, updatedFavorites);
  }
}

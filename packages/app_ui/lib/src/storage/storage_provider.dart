import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

enum AppSection { store, restaurant }

class StorageProvider extends ChangeNotifier {
  static final StorageProvider _instance = StorageProvider._internal();
  factory StorageProvider() => _instance;
  StorageProvider._internal();

  late Box<String> _favoritesStoreBox;
  late Box<String> _favoritesRestaurantBox;
  late Box<int> _cartStoreBox;
  late Box<int> _cartRestaurantBox;

  // Reactive state
  final ValueNotifier<Set<String>> _storeFavorites = ValueNotifier({});
  final ValueNotifier<Set<String>> _restaurantFavorites = ValueNotifier({});
  final ValueNotifier<Map<String, int>> _storeCart = ValueNotifier({});
  final ValueNotifier<Map<String, int>> _restaurantCart = ValueNotifier({});

  // Getters for reactive state
  ValueNotifier<Set<String>> get storeFavorites => _storeFavorites;
  ValueNotifier<Set<String>> get restaurantFavorites => _restaurantFavorites;
  ValueNotifier<Map<String, int>> get storeCart => _storeCart;
  ValueNotifier<Map<String, int>> get restaurantCart => _restaurantCart;

  Future<void> initialize() async {
    await Hive.initFlutter();

    _favoritesStoreBox = await Hive.openBox<String>('favorites_store');
    _favoritesRestaurantBox = await Hive.openBox<String>(
      'favorites_restaurant',
    );
    _cartStoreBox = await Hive.openBox<int>('cart_store');
    _cartRestaurantBox = await Hive.openBox<int>('cart_restaurant');

    // Load initial data
    _loadFavorites();
    _loadCart();

    if (kDebugMode) {
      print('StorageProvider initialized successfully');
    }
  }

  void _loadFavorites() {
    final storeFavs = _favoritesStoreBox.values.toSet();
    final restaurantFavs = _favoritesRestaurantBox.values.toSet();

    _storeFavorites.value = storeFavs;
    _restaurantFavorites.value = restaurantFavs;

    if (kDebugMode) {
      print(
        'Loaded favorites - Store: ${storeFavs.length}, Restaurant: ${restaurantFavs.length}',
      );
    }
  }

  void _loadCart() {
    final storeCartMap = <String, int>{};
    final restaurantCartMap = <String, int>{};

    // Load store cart
    for (final key in _cartStoreBox.keys) {
      final value = _cartStoreBox.get(key);
      if (value != null) {
        storeCartMap[key.toString()] = value;
      }
    }

    // Load restaurant cart
    for (final key in _cartRestaurantBox.keys) {
      final value = _cartRestaurantBox.get(key);
      if (value != null) {
        restaurantCartMap[key.toString()] = value;
      }
    }

    _storeCart.value = storeCartMap;
    _restaurantCart.value = restaurantCartMap;

    if (kDebugMode) {
      print(
        'Loaded cart - Store: ${storeCartMap.length} items, Restaurant: ${restaurantCartMap.length} items',
      );
    }
  }

  // Favorites methods
  bool isFavorite(String productId, AppSection section) {
    switch (section) {
      case AppSection.store:
        return _storeFavorites.value.contains(productId);
      case AppSection.restaurant:
        return _restaurantFavorites.value.contains(productId);
    }
  }

  Future<void> toggleFavorite(String productId, AppSection section) async {
    if (kDebugMode) {
      print('Toggling favorite: $productId in ${section.name}');
    }

    switch (section) {
      case AppSection.store:
        final newFavorites = Set<String>.from(_storeFavorites.value);
        if (newFavorites.contains(productId)) {
          newFavorites.remove(productId);
          await _favoritesStoreBox.delete(productId);
          if (kDebugMode) print('Removed from favorites: $productId');
        } else {
          newFavorites.add(productId);
          await _favoritesStoreBox.put(productId, productId);
          if (kDebugMode) print('Added to favorites: $productId');
        }
        _storeFavorites.value = newFavorites;
        break;

      case AppSection.restaurant:
        final newFavorites = Set<String>.from(_restaurantFavorites.value);
        if (newFavorites.contains(productId)) {
          newFavorites.remove(productId);
          await _favoritesRestaurantBox.delete(productId);
          if (kDebugMode) print('Removed from favorites: $productId');
        } else {
          newFavorites.add(productId);
          await _favoritesRestaurantBox.put(productId, productId);
          if (kDebugMode) print('Added to favorites: $productId');
        }
        _restaurantFavorites.value = newFavorites;
        break;
    }
  }

  Set<String> getFavorites(AppSection section) {
    switch (section) {
      case AppSection.store:
        return _storeFavorites.value;
      case AppSection.restaurant:
        return _restaurantFavorites.value;
    }
  }

  // Cart methods
  int getCartQuantity(String productId, AppSection section) {
    switch (section) {
      case AppSection.store:
        return _storeCart.value[productId] ?? 0;
      case AppSection.restaurant:
        return _restaurantCart.value[productId] ?? 0;
    }
  }

  Future<void> updateCartQuantity(
    String productId,
    int quantity,
    AppSection section,
  ) async {
    if (kDebugMode) {
      print('Updating cart: $productId quantity $quantity in ${section.name}');
    }

    switch (section) {
      case AppSection.store:
        final newCart = Map<String, int>.from(_storeCart.value);
        if (quantity <= 0) {
          newCart.remove(productId);
          await _cartStoreBox.delete(productId);
          if (kDebugMode) print('Removed from cart: $productId');
        } else {
          newCart[productId] = quantity;
          await _cartStoreBox.put(productId, quantity);
          if (kDebugMode) print('Updated cart: $productId quantity $quantity');
        }
        _storeCart.value = newCart;
        break;

      case AppSection.restaurant:
        final newCart = Map<String, int>.from(_restaurantCart.value);
        if (quantity <= 0) {
          newCart.remove(productId);
          await _cartRestaurantBox.delete(productId);
          if (kDebugMode) print('Removed from cart: $productId');
        } else {
          newCart[productId] = quantity;
          await _cartRestaurantBox.put(productId, quantity);
          if (kDebugMode) print('Updated cart: $productId quantity $quantity');
        }
        _restaurantCart.value = newCart;
        break;
    }
  }

  Map<String, int> getCart(AppSection section) {
    switch (section) {
      case AppSection.store:
        return _storeCart.value;
      case AppSection.restaurant:
        return _restaurantCart.value;
    }
  }

  int getCartItemCount(AppSection section) {
    switch (section) {
      case AppSection.store:
        return _storeCart.value.values.fold(
          0,
          (sum, quantity) => sum + quantity,
        );
      case AppSection.restaurant:
        return _restaurantCart.value.values.fold(
          0,
          (sum, quantity) => sum + quantity,
        );
    }
  }

  Future<void> clearCart(AppSection section) async {
    if (kDebugMode) {
      print('Clearing cart for ${section.name}');
    }

    switch (section) {
      case AppSection.store:
        await _cartStoreBox.clear();
        _storeCart.value = {};
        break;
      case AppSection.restaurant:
        await _cartRestaurantBox.clear();
        _restaurantCart.value = {};
        break;
    }
  }

  @override
  void dispose() {
    _storeFavorites.dispose();
    _restaurantFavorites.dispose();
    _storeCart.dispose();
    _restaurantCart.dispose();
    super.dispose();
  }
}

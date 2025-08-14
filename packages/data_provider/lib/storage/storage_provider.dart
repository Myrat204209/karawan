import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

enum AppSection { market, restaurant }

class StorageProvider {
  StorageProvider();

  late Box<int> _cartStoreBox;
  late Box<int> _cartRestaurantBox;

  (Box<int>, ValueNotifier<Map<String, int>>) _getCartDeps(AppSection section) {
    return switch (section) {
      AppSection.market => (_cartStoreBox, _storeCart),
      AppSection.restaurant => (_cartRestaurantBox, _restaurantCart),
    };
  }

  // Reactive state
  final ValueNotifier<Map<String, int>> _storeCart = ValueNotifier({});
  final ValueNotifier<Map<String, int>> _restaurantCart = ValueNotifier({});

  // Getters for reactive state
  ValueNotifier<Map<String, int>> get storeCart => _storeCart;
  ValueNotifier<Map<String, int>> get restaurantCart => _restaurantCart;

  Future<void> initialize() async {
    await Hive.initFlutter();

    _cartStoreBox = await Hive.openBox<int>('__cart_store__');
    _cartRestaurantBox = await Hive.openBox<int>('__cart_restaurant__');

    // Load initial data
    _loadCart();

    if (kDebugMode) {
      print('StorageProvider initialized successfully');
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

  // Cart methods
  int getCartQuantity(String productId, AppSection section) {
    switch (section) {
      case AppSection.market:
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
    final (box, notifier) = _getCartDeps(section);
    final newCart = Map<String, int>.from(notifier.value);

    if (quantity <= 0) {
      newCart.remove(productId);
      await box.delete(productId);
    } else {
      newCart[productId] = quantity;
      await box.put(productId, quantity);
    }
    notifier.value = newCart;
  }

  Map<String, int> getCart(AppSection section) {
    switch (section) {
      case AppSection.market:
        return _storeCart.value;
      case AppSection.restaurant:
        return _restaurantCart.value;
    }
  }

  int getCartItemCount(AppSection section) {
    switch (section) {
      case AppSection.market:
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
      case AppSection.market:
        await _cartStoreBox.clear();
        _storeCart.value = {};
        break;
      case AppSection.restaurant:
        await _cartRestaurantBox.clear();
        _restaurantCart.value = {};
        break;
    }
  }
}

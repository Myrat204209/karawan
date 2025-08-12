import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';

/// Repository that encapsulates local cart storage operations for a given section.
class CartRepository {
  CartRepository({
    required StorageProvider storageProvider,
    required AppSection section,
  }) : _storage = storageProvider,
       _section = section;

  final StorageProvider _storage;
  final AppSection _section;

  /// Reactive listenable for cart map changes.
  ValueListenable<Map<String, int>> get cartListenable =>
      _section == AppSection.market
      ? _storage.storeCart
      : _storage.restaurantCart;

  Map<String, int> getCart() => _storage.getCart(_section);

  int getQuantity(String productId) =>
      _storage.getCartQuantity(productId, _section);

  Future<void> updateQuantity(String productId, int quantity) =>
      _storage.updateCartQuantity(productId, quantity, _section);

  Future<void> clear() => _storage.clearCart(_section);
}

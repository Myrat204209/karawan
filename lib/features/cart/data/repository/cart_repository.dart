
// lib/repositories/cart_repository.dart

import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';

class CartRepository {
  CartRepository({
    required StorageProvider storageProvider,
    required AppSection section,
  })  : _storageProvider = storageProvider,
        _section = section;

  final StorageProvider _storageProvider;
  final AppSection _section;

  /// Exposes a listenable for the BLoC to react to data changes automatically.
  ValueListenable<Map<String, int>> get cartListenable {
    return _storageProvider.getCartNotifier(_section);
  }

  /// Gets the current state of the cart.
  Map<String, int> getCart() {
    return _storageProvider.getCart(_section);
  }

  /// Adds an item to the cart or updates its quantity.
  Future<void> addToCart(String productId, {int quantity = 1}) async {
    final currentQuantity = _storageProvider.getCartQuantity(productId, _section);
    final newQuantity = currentQuantity + quantity;
    await _storageProvider.updateCartQuantity(productId, newQuantity, _section);
  }

  /// Removes an item from the cart.
  Future<void> removeFromCart(String productId) async {
    await _storageProvider.updateCartQuantity(productId, 0, _section);
  }

  /// Clears all items from the cart for the current section.
  Future<void> clearCart() async {
    await _storageProvider.clearCart(_section);
  }
}
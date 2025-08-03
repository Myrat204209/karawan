import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _favoritesKey = 'favorites';
  static const String _cartKey = 'cart';

  // ValueNotifiers for reactive UI updates
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier = ValueNotifier([]);
  final ValueNotifier<List<CartItem>> cartNotifier = ValueNotifier([]);

  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    _loadFavorites();
    _loadCart();
  }

  // Favorites methods
  List<FavoriteItem> getFavorites(String section) {
    return favoritesNotifier.value
        .where((item) => item.section == section)
        .toList();
  }

  bool isFavorite(String id, String section) {
    return favoritesNotifier.value.any(
      (item) => item.id == id && item.section == section,
    );
  }

  Future<void> addToFavorites(FavoriteItem item) async {
    final favorites = List<FavoriteItem>.from(favoritesNotifier.value);
    if (!favorites.any((f) => f.id == item.id && f.section == item.section)) {
      favorites.add(item);
      favoritesNotifier.value = favorites;
      await _saveFavorites();
    }
  }

  Future<void> removeFromFavorites(String id, String section) async {
    final favorites = List<FavoriteItem>.from(favoritesNotifier.value);
    favorites.removeWhere((item) => item.id == id && item.section == section);
    favoritesNotifier.value = favorites;
    await _saveFavorites();
  }

  // Cart methods
  List<CartItem> getCartItems(String section) {
    return cartNotifier.value.where((item) => item.section == section).toList();
  }

  CartItem? getCartItem(String id, String section) {
    try {
      return cartNotifier.value.firstWhere(
        (item) => item.id == id && item.section == section,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> addToCart(CartItem item) async {
    final cart = List<CartItem>.from(cartNotifier.value);
    final existingIndex = cart.indexWhere(
      (c) => c.id == item.id && c.section == item.section,
    );

    if (existingIndex != -1) {
      cart[existingIndex].quantity += item.quantity;
    } else {
      cart.add(item);
    }

    cartNotifier.value = cart;
    await _saveCart();
  }

  Future<void> updateCartItemQuantity(
    String id,
    String section,
    int quantity,
  ) async {
    final cart = List<CartItem>.from(cartNotifier.value);
    final itemIndex = cart.indexWhere(
      (item) => item.id == id && item.section == section,
    );

    if (itemIndex != -1) {
      if (quantity <= 0) {
        cart.removeAt(itemIndex);
      } else {
        cart[itemIndex].quantity = quantity;
      }
      cartNotifier.value = cart;
      await _saveCart();
    }
  }

  Future<void> removeFromCart(String id, String section) async {
    final cart = List<CartItem>.from(cartNotifier.value);
    cart.removeWhere((item) => item.id == id && item.section == section);
    cartNotifier.value = cart;
    await _saveCart();
  }

  Future<void> clearCart(String section) async {
    final cart = List<CartItem>.from(cartNotifier.value);
    cart.removeWhere((item) => item.section == section);
    cartNotifier.value = cart;
    await _saveCart();
  }

  double getCartTotal(String section) {
    return getCartItems(
      section,
    ).fold(0.0, (total, item) => total + item.totalPrice);
  }

  int getCartItemCount(String section) {
    return getCartItems(
      section,
    ).fold(0, (total, item) => total + item.quantity);
  }

  // Private methods for persistence
  void _loadFavorites() {
    final favoritesJson = _prefs.getString(_favoritesKey);
    if (favoritesJson != null) {
      final List<dynamic> favoritesList = json.decode(favoritesJson);
      favoritesNotifier.value = favoritesList
          .map((json) => FavoriteItem.fromJson(json))
          .toList();
    }
  }

  void _loadCart() {
    final cartJson = _prefs.getString(_cartKey);
    if (cartJson != null) {
      final List<dynamic> cartList = json.decode(cartJson);
      cartNotifier.value = cartList
          .map((json) => CartItem.fromJson(json))
          .toList();
    }
  }

  Future<void> _saveFavorites() async {
    final favoritesJson = json.encode(
      favoritesNotifier.value.map((item) => item.toJson()).toList(),
    );
    await _prefs.setString(_favoritesKey, favoritesJson);
  }

  Future<void> _saveCart() async {
    final cartJson = json.encode(
      cartNotifier.value.map((item) => item.toJson()).toList(),
    );
    await _prefs.setString(_cartKey, cartJson);
  }

  void dispose() {
    favoritesNotifier.dispose();
    cartNotifier.dispose();
  }
}

// Model classes
class FavoriteItem {
  final String id;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String imagePath;
  final String section;
  final DateTime addedAt;

  FavoriteItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.imagePath,
    required this.section,
    required this.addedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'rating': rating,
      'imagePath': imagePath,
      'section': section,
      'addedAt': addedAt.millisecondsSinceEpoch,
    };
  }

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      rating: json['rating'].toDouble(),
      imagePath: json['imagePath'],
      section: json['section'],
      addedAt: DateTime.fromMillisecondsSinceEpoch(json['addedAt']),
    );
  }
}

class CartItem {
  final String id;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String imagePath;
  final String section;
  int quantity;
  final DateTime addedAt;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.imagePath,
    required this.section,
    required this.quantity,
    required this.addedAt,
  });

  double get totalPrice => price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'rating': rating,
      'imagePath': imagePath,
      'section': section,
      'quantity': quantity,
      'addedAt': addedAt.millisecondsSinceEpoch,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      rating: json['rating'].toDouble(),
      imagePath: json['imagePath'],
      section: json['section'],
      quantity: json['quantity'],
      addedAt: DateTime.fromMillisecondsSinceEpoch(json['addedAt']),
    );
  }
}

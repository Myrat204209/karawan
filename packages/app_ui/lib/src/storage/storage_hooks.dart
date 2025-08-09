import 'package:app_ui/src/storage/storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Generic hook for reactive state
T useReactiveValue<T>(ValueNotifier<T> notifier, T Function() computeValue) {
  useListenable(notifier);
  return useMemoized(computeValue, [notifier]);
}

// Favorites hooks
bool useIsFavorite(String productId, AppSection section) {
  final storage = useMemoized(() => StorageProvider());
  final favoritesNotifier =
      section == AppSection.store
          ? storage.storeFavorites
          : storage.restaurantFavorites;

  useListenable(favoritesNotifier);
  return favoritesNotifier.value.contains(productId);
}

Set<String> useFavorites(AppSection section) {
  final storage = useMemoized(() => StorageProvider());
  final favoritesNotifier =
      section == AppSection.store
          ? storage.storeFavorites
          : storage.restaurantFavorites;

  useListenable(favoritesNotifier);
  return favoritesNotifier.value;
}

// Cart hooks
int useCartQuantity(String productId, AppSection section) {
  final storage = useMemoized(() => StorageProvider());
  final cartNotifier =
      section == AppSection.store ? storage.storeCart : storage.restaurantCart;

  useListenable(cartNotifier);
  return cartNotifier.value[productId] ?? 0;
}

Map<String, int> useCart(AppSection section) {
  final storage = useMemoized(() => StorageProvider());
  final cartNotifier =
      section == AppSection.store ? storage.storeCart : storage.restaurantCart;

  useListenable(cartNotifier);
  return cartNotifier.value;
}

int useCartItemCount(AppSection section) {
  final storage = useMemoized(() => StorageProvider());
  final cartNotifier =
      section == AppSection.store ? storage.storeCart : storage.restaurantCart;

  useListenable(cartNotifier);
  return cartNotifier.value.values.fold(0, (sum, quantity) => sum + quantity);
}

import 'package:app_ui/src/storage/storage_provider.dart';
import 'package:app_ui/src/storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// The generic hook remains the same. It's the engine for all other hooks.
T useNotifiedValue<T>(
  ValueNotifier<dynamic> notifier,
  T Function() computeValue,
) {
  useListenable(notifier);
  // Re-run computeValue whenever the notifier triggers a rebuild or computeValue's identity changes.
  return useMemoized(computeValue, [notifier]);
}

// All your specific hooks now become clean, simple wrappers.
List<FavoriteItem> useFavorites(String section) {
  final service = useMemoized(() => StorageProvider.service);
  return useNotifiedValue(
      service.favoritesNotifier, () => service.getFavorites(section));
}

bool useIsFavorite(String id, String section) {
  final service = useMemoized(() => StorageProvider.service);
  return useNotifiedValue(
      service.favoritesNotifier, () => service.isFavorite(id, section));
}

List<CartItem> useCartItems(String section) {
  final service = useMemoized(() => StorageProvider.service);
  return useNotifiedValue(
      service.cartNotifier, () => service.getCartItems(section));
}

CartItem? useCartItem(String id, String section) {
  final service = useMemoized(() => StorageProvider.service);
  return useNotifiedValue(
      service.cartNotifier, () => service.getCartItem(id, section));
}

double useCartTotal(String section) {
  final service = useMemoized(() => StorageProvider.service);
  return useNotifiedValue(
      service.cartNotifier, () => service.getCartTotal(section));
}

int useCartItemCount(String section) {
  final service = useMemoized(() => StorageProvider.service);
  return useNotifiedValue(
      service.cartNotifier, () => service.getCartItemCount(section));
}
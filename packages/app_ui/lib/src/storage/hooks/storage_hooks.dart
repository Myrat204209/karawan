import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:app_ui/src/storage/storage_provider.dart';
import 'package:app_ui/src/storage/storage_service.dart';

class StorageHooks {
  static List<FavoriteItem> useFavorites(String section) {
    final storageService = useMemoized(() => StorageProvider.service, []);
    final favorites = useState<List<FavoriteItem>>([]);

    useEffect(() {
      void updateFavorites() {
        favorites.value = storageService.getFavorites(section);
      }

      updateFavorites();
      storageService.favoritesNotifier.addListener(updateFavorites);

      return () {
        storageService.favoritesNotifier.removeListener(updateFavorites);
      };
    }, [section]);

    return favorites.value;
  }

  static List<CartItem> useCartItems(String section) {
    final storageService = useMemoized(() => StorageProvider.service, []);
    final cartItems = useState<List<CartItem>>([]);

    useEffect(() {
      void updateCart() {
        cartItems.value = storageService.getCartItems(section);
      }

      updateCart();
      storageService.cartNotifier.addListener(updateCart);

      return () {
        storageService.cartNotifier.removeListener(updateCart);
      };
    }, [section]);

    return cartItems.value;
  }

  static bool useIsFavorite(String id, String section) {
    final storageService = useMemoized(() => StorageProvider.service, []);
    final isFavorite = useState<bool>(false);

    useEffect(() {
      void updateFavoriteStatus() {
        isFavorite.value = storageService.isFavorite(id, section);
      }

      updateFavoriteStatus();
      storageService.favoritesNotifier.addListener(updateFavoriteStatus);

      return () {
        storageService.favoritesNotifier.removeListener(updateFavoriteStatus);
      };
    }, [id, section]);

    return isFavorite.value;
  }

  static CartItem? useCartItem(String id, String section) {
    final storageService = useMemoized(() => StorageProvider.service, []);
    final cartItem = useState<CartItem?>(null);

    useEffect(() {
      void updateCartItem() {
        cartItem.value = storageService.getCartItem(id, section);
      }

      updateCartItem();
      storageService.cartNotifier.addListener(updateCartItem);

      return () {
        storageService.cartNotifier.removeListener(updateCartItem);
      };
    }, [id, section]);

    return cartItem.value;
  }

  static double useCartTotal(String section) {
    final storageService = useMemoized(() => StorageProvider.service, []);
    final cartTotal = useState<double>(0.0);

    useEffect(() {
      void updateCartTotal() {
        cartTotal.value = storageService.getCartTotal(section);
      }

      updateCartTotal();
      storageService.cartNotifier.addListener(updateCartTotal);

      return () {
        storageService.cartNotifier.removeListener(updateCartTotal);
      };
    }, [section]);

    return cartTotal.value;
  }

  static int useCartItemCount(String section) {
    final storageService = useMemoized(() => StorageProvider.service, []);
    final cartItemCount = useState<int>(0);

    useEffect(() {
      void updateCartItemCount() {
        cartItemCount.value = storageService.getCartItemCount(section);
      }

      updateCartItemCount();
      storageService.cartNotifier.addListener(updateCartItemCount);

      return () {
        storageService.cartNotifier.removeListener(updateCartItemCount);
      };
    }, [section]);

    return cartItemCount.value;
  }
}

// Suggested replacement for your current file content

import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';

class RouteNames {
  RouteNames._();
  static const String marketProductDetails = 'marketProductDetails';
  static const String restaurantProductDetails = 'restaurantProductDetails';
}

List<GoRouterNavigationItem> createNavigationItems({
  required String sectionPrefix,
}) {
  final isMarket = sectionPrefix == 'market';
  return [
    GoRouterNavigationItem(
      path: '/$sectionPrefix/home',
      label: 'Home',
      icon: HugeIcons.strokeRoundedHome01,
    ),
    GoRouterNavigationItem(
      path: '/$sectionPrefix/categories',
      label: 'Categories',
      icon: HugeIcons.strokeRoundedCatalogue,
    ),
    GoRouterNavigationItem(
      path: '/$sectionPrefix/favorites',
      label: 'Favorites',
      icon: HugeIcons.strokeRoundedFavourite,
    ),
    // Section-specific tab
    if (isMarket)
      GoRouterNavigationItem(
        path: '/$sectionPrefix/cart',
        label: 'Cart',
        icon: HugeIcons.strokeRoundedShoppingCart01,
      )
    else
      GoRouterNavigationItem(
        path: '/$sectionPrefix/order',
        label: 'Order',
        icon: HugeIcons.strokeRoundedCheckList,
      ),
    GoRouterNavigationItem(
      path: '/$sectionPrefix/profile',
      label: 'Profile',
      icon: HugeIcons.strokeRoundedUser03,
    ),
  ];
}

// Now, defining your lists is clean and simple.
final marketNavigationItems = createNavigationItems(sectionPrefix: 'market');
final restaurantNavigationItems = createNavigationItems(
  sectionPrefix: 'restaurant',
);

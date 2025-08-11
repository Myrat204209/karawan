import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';

class RouteNames {
  RouteNames._();

  static const String storeProductDetails = 'storeProductDetails';
  static const String restaurantProductDetails = 'restaurantProductDetails';
}

final marketNavigationItems = <GoRouterNavigationItem>[
  GoRouterNavigationItem(
    path: '/market/home',
    label: 'Home',
    icon: HugeIcons.strokeRoundedHome01,
    iconOn: HugeIcons.strokeRoundedHome01,
  ),
  GoRouterNavigationItem(
    path: '/market/categories',
    label: 'Categories',
    icon: HugeIcons.strokeRoundedCatalogue,
    iconOn: HugeIcons.strokeRoundedCatalogue,
  ),
  GoRouterNavigationItem(
    path: '/market/favorites',
    label: 'Favorites',
    icon: HugeIcons.strokeRoundedFavourite,
    iconOn: HugeIcons.strokeRoundedFavourite,
  ),
  GoRouterNavigationItem(
    path: '/market/cart',
    label: 'Cart',
    icon: HugeIcons.strokeRoundedShoppingCart01,
    iconOn: HugeIcons.strokeRoundedShoppingCart01,
  ),
  GoRouterNavigationItem(
    path: '/market/profile',
    label: 'Profile',
    icon: HugeIcons.strokeRoundedUser03,
    iconOn: HugeIcons.strokeRoundedUser03,
  ),
];

final restaurantNavigationItems = <GoRouterNavigationItem>[
  GoRouterNavigationItem(
    path: '/restaurant/home',
    label: 'Home',
    icon: HugeIcons.strokeRoundedHome01,
    iconOn: HugeIcons.strokeRoundedHome01,
  ),
  GoRouterNavigationItem(
    path: '/restaurant/category',
    label: 'Categories',
    icon: HugeIcons.strokeRoundedCatalogue,
    iconOn: HugeIcons.strokeRoundedCatalogue,
  ),
  GoRouterNavigationItem(
    path: '/restaurant/favorites',
    label: 'Favorites',
    icon: HugeIcons.strokeRoundedFavourite,
    iconOn: HugeIcons.strokeRoundedFavourite,
  ),
  GoRouterNavigationItem(
    path: '/restaurant/order',
    label: 'Order',
    icon: HugeIcons.strokeRoundedCheckList,
    iconOn: HugeIcons.strokeRoundedCheckList,
  ),
  GoRouterNavigationItem(
    path: '/restaurant/profile',
    label: 'Profile',
    icon: HugeIcons.strokeRoundedUser,
    iconOn: HugeIcons.strokeRoundedUser,
  ),
];

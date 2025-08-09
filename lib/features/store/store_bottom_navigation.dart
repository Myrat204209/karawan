import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';

final storeNavigationItems = [
  GoRouterNavigationItem(
    path: '/store/home',
    icon: HugeIcons.strokeRoundedHome01,
    iconOn: HugeIcons.strokeRoundedHome01,
    label: 'Home',
  ),
  GoRouterNavigationItem(
    path: '/store/categories',
    icon: HugeIcons.strokeRoundedCatalogue,
    iconOn: HugeIcons.strokeRoundedCatalogue,
    label: 'Category',
  ),
  GoRouterNavigationItem(
    path: '/store/favorites',
    icon: HugeIcons.strokeRoundedFavourite,
    iconOn: HugeIcons.strokeRoundedFavourite,
    label: 'Favorites',
  ),
  GoRouterNavigationItem(
    path: '/store/cart',
    icon: HugeIcons.strokeRoundedShoppingCart01,
    iconOn: HugeIcons.strokeRoundedShoppingCart01,
    label: 'Cart',
  ),
  GoRouterNavigationItem(
    path: '/store/profile',
    icon: HugeIcons.strokeRoundedUser03,
    iconOn: HugeIcons.strokeRoundedUser03,
    label: 'Profile',
  ),
];

class StoreBottomNavigation extends StatelessWidget {
  const StoreBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GoRouterSectionScaffold(
      navigationItems: storeNavigationItems,
      oppositePath: '/restaurant/home',
      isMarket: true,
      child: const SizedBox.shrink(), // This will be replaced by the navigation shell
    );
  }
} 
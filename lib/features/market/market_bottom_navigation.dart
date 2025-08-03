import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';

final marketNavigationItems = [
  GoRouterNavigationItem(
    path: '/market/home',
    icon: HugeIcons.strokeRoundedHome01,
    iconOn: HugeIcons.strokeRoundedHome01,
    label: 'Home',
  ),
  GoRouterNavigationItem(
    path: '/market/categories',
    icon: HugeIcons.strokeRoundedCatalogue,
    iconOn: HugeIcons.strokeRoundedCatalogue,
    label: 'Category',
  ),
  GoRouterNavigationItem(
    path: '/market/favorites',
    icon: HugeIcons.strokeRoundedFavourite,
    iconOn: HugeIcons.strokeRoundedFavourite,
    label: 'Favorites',
  ),
  GoRouterNavigationItem(
    path: '/market/cart',
    icon: HugeIcons.strokeRoundedShoppingCart01,
    iconOn: HugeIcons.strokeRoundedShoppingCart01,
    label: 'Cart',
  ),
  GoRouterNavigationItem(
    path: '/market/profile',
    icon: HugeIcons.strokeRoundedUser03,
    iconOn: HugeIcons.strokeRoundedUser03,
    label: 'Profile',
  ),
];

class MarketBottomNavigation extends StatelessWidget {
  const MarketBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GoRouterSectionScaffold(
      navigationItems: marketNavigationItems,
      oppositePath: '/restaurant/home',
      isMarket: true,
      child:
          const SizedBox.shrink(), // This will be replaced by the navigation shell
    );
  }
}

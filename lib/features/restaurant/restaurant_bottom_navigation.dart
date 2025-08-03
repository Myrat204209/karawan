import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';

final restaurantNavigationItems = [
  GoRouterNavigationItem(
    path: '/restaurant/home',
    icon: HugeIcons.strokeRoundedHome01,
    iconOn: HugeIcons.strokeRoundedHome01,
    label: 'Home',
  ),
  GoRouterNavigationItem(
    path: '/restaurant/favorites',
    icon: HugeIcons.strokeRoundedFavourite,
    iconOn: HugeIcons.strokeRoundedFavourite,
    label: 'Favorites',
  ),
  GoRouterNavigationItem(
    path: '/restaurant/order',
    icon: HugeIcons.strokeRoundedShoppingCart01,
    iconOn: HugeIcons.strokeRoundedShoppingCart01,
    label: 'Order',
  ),
  GoRouterNavigationItem(
    path: '/restaurant/profile',
    icon: HugeIcons.strokeRoundedUser03,
    iconOn: HugeIcons.strokeRoundedUser03,
    label: 'Profile',
  ),
];

class RestaurantBottomNavigation extends StatelessWidget {
  const RestaurantBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GoRouterSectionScaffold(
      navigationItems: restaurantNavigationItems,
      oppositePath: '/market/home',
      child:
          const SizedBox.shrink(), // This will be replaced by the navigation shell
    );
  }
}

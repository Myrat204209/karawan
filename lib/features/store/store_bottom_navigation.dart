import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/app.dart';

final storeNavigationItems = [
  NavigationItem(
    route: const StoreHomeRoute(),
    icon: HugeIcons.strokeRoundedHome01,
    iconOn: HugeIcons.strokeRoundedHome01,
    label: 'Home',
  ),
  NavigationItem(
    route: const StoreCategoriesRoute(),
    icon: HugeIcons.strokeRoundedCatalogue,
    iconOn: HugeIcons.strokeRoundedCatalogue,
    label: 'Category',
  ),
  NavigationItem(
    route: const StoreFavoritesRoute(),
    icon: HugeIcons.strokeRoundedFavourite,
    iconOn: HugeIcons.strokeRoundedFavourite,
    label: 'Favorites',
  ),
  NavigationItem(
    route: const StoreCartRoute(),
    icon: HugeIcons.strokeRoundedShoppingCart01,
    iconOn: HugeIcons.strokeRoundedShoppingCart01,
    label: 'Cart',
  ),
  NavigationItem(
    route: const StoreProfileRoute(),
    icon: HugeIcons.strokeRoundedUser03,
    iconOn: HugeIcons.strokeRoundedUser03,
    label: 'Profile',
  ),
];

@RoutePage()
class StoreBottomNavigation extends StatelessWidget {
  const StoreBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSectionScaffold(
      navigationItems: storeNavigationItems,
      isStore: true,
      oppositeRoute: RestaurantBottomRoute(),
    );
  }
}

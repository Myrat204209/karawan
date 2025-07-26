import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

final restaurantNavigationItems = [
  NavigationItem(
    route: const RestaurantHomeRoute(),
    icon: Assets.navBar.home,
    iconOn: Assets.navBar.homeOn,

    label: 'Home',
  ),
  NavigationItem(
    route: const RestaurantOrderRoute(),
    icon: Assets.navBar.cart,
    iconOn: Assets.navBar.cartOn,
    label: 'Order',
  ),

  NavigationItem(
    route: const RestaurantFavoritesRoute(),
    icon: Assets.navBar.favorites,
    iconOn: Assets.navBar.favoritesOn,
    label: 'Favorites',
  ),
  NavigationItem(
    route: const RestaurantProfileRoute(),
    icon: Assets.navBar.profile,
    iconOn: Assets.navBar.profileOn,
    label: 'Profile',
  ),
];

@RoutePage()
class RestaurantBottomNavigation extends StatelessWidget {
  const RestaurantBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the items specific to the Store section.

    return AppSectionScaffold(
      navigationItems: restaurantNavigationItems,
      oppositeRoute: StoreBottomRoute(),
    );
  }
}

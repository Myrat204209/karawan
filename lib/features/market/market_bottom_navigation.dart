import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/app.dart';

final marketNavigationItems = [
  NavigationItem(
    route: const MarketHomeRoute(),
    icon: HugeIcons.strokeRoundedHome01,
    iconOn: HugeIcons.strokeRoundedHome01,
    label: 'Home',
  ),
  NavigationItem(
    route: const MarketCategoriesRoute(),
    icon: HugeIcons.strokeRoundedCatalogue,
    iconOn: HugeIcons.strokeRoundedCatalogue,
    label: 'Category',
  ),
  NavigationItem(
    route: const MarketFavoritesRoute(),
    icon: HugeIcons.strokeRoundedFavourite,
    iconOn: HugeIcons.strokeRoundedFavourite,
    label: 'Favorites',
  ),
  NavigationItem(
    route: const MarketCartRoute(),
    icon: HugeIcons.strokeRoundedShoppingCart01,
    iconOn: HugeIcons.strokeRoundedShoppingCart01,
    label: 'Cart',
  ),
  NavigationItem(
    route: const MarketProfileRoute(),
    icon: HugeIcons.strokeRoundedUser03,
    iconOn: HugeIcons.strokeRoundedUser03,
    label: 'Profile',
  ),
];

@RoutePage()
class MarketBottomNavigation extends StatelessWidget {
  const MarketBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSectionScaffold(
      navigationItems: marketNavigationItems,
      isMarket: true,
      oppositeRoute: RestaurantRouter(),
    );
  }
}

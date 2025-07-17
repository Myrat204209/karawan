import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

@RoutePage()
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the items specific to the Restaurant section.
    final restaurantNavigationItems = [
      NavigationItem(
        route: const RestaurantHomeRoute(),
        icon: Icons.ramen_dining,
        label: 'Restaurants',
      ),
      NavigationItem(
        route: const RestaurantOrdersRoute(),
        icon: Icons.delivery_dining,
        label: 'Orders',
      ),
      NavigationItem(
        route: const RestaurantProfileRoute(),
        icon: Icons.account_circle_outlined,
        label: 'Profile',
      ),
    ];

    return AppSectionScaffold(navigationItems: restaurantNavigationItems);
  }
}

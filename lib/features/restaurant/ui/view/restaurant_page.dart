import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/router/router.dart';

@RoutePage()
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      
      backgroundColor: Colors.red,
      // Define the routes for the restaurant section's tabs
      routes: const [
        RestaurantHomeRoute(),
        RestaurantOrdersRoute(),
        RestaurantProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: (index) => tabsRouter.setActiveIndex(index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.ramen_dining), label: 'Restaurants'),
            NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Orders'),
            NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        );
      },
    );
  }
}
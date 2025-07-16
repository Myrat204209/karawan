import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/router/router.dart';

@RoutePage()
class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // Define the routes for the Store section's tabs
      routes: const [
        StoreHomeRoute(),
        StoreOrdersRoute(),
        StoreProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: (index) => tabsRouter.setActiveIndex(index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.ramen_dining), label: 'Stores'),
            NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Orders'),
            NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        );
      },
    );
  }
}
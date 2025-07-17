import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

final storeNavigationItems = [
  NavigationItem(
    route: const StoreHomeRoute(),
    icon: Icons.home_rounded,
    label: 'Home',
  ),
  NavigationItem(
    route: const StoreOrdersRoute(),
    icon: Icons.receipt_long,
    label: 'Orders',
  ),
  NavigationItem(
    route: const StoreProfileRoute(),
    icon: Icons.person_outline,
    label: 'Profile',
  ),
];

@RoutePage()
class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the items specific to the Store section.

    return AppSectionScaffold(navigationItems: storeNavigationItems);
  }
}

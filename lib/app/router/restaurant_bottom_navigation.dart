import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/router/router.dart';

@RoutePage()
class RestaurantBottomNavigation extends StatelessWidget {
  const RestaurantBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: AutoTabsScaffold(
            // 1. Define the routes for the restaurant section's tabs.
            // These are defined as children of RestaurantBottomRoute in your router.
            routes: const [
              RestaurantHomeRoute(),
              RestaurantFavoritesRoute(),
              RestaurantOrderRoute(),
              RestaurantProfileRoute(),
            ],
            // 2. Build the bottom navigation bar.
            bottomNavigationBuilder: (context, tabsRouter) {
              return NavigationBar(
                // 3. Connect the state of the router to the UI.
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                destinations: const [
                  // 4. Define the specific tabs for the restaurant section.
                  NavigationDestination(
                    icon: Icon(Icons.ramen_dining),
                    label: 'Restaurants',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.favorite_border),
                    label: 'Favorites',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.receipt_long),
                    label: 'Orders',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          left: 5,
          top: MediaQuery.sizeOf(context).height / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
              right: Radius.elliptical(30, 30),
            ),
            child: SizedBox(
              height: 100,
              width: 50,
              child: IconButton(
                onPressed: () {
                  context.router.replace(StoreBottomRoute());
                },
                icon: Icon(Icons.swipe_right_alt_rounded, size: 50),
              ).colorize(Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}

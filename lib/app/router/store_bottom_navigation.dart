import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

final storeNavigationItems = [
  NavigationItem(
    route: const StoreHomeRoute(),
    icon: Assets.navBar.home,
    iconOn: Assets.navBar.homeOn,

    label: 'Home',
  ),
  NavigationItem(
    route: const StoreCategoriesRoute(),
    icon: Assets.navBar.category,
    iconOn: Assets.navBar.categoryOn,
    label: 'Category',
  ),
  NavigationItem(
    route: const StoreFavoritesRoute(),
    icon: Assets.navBar.favorites,
    iconOn: Assets.navBar.favoritesOn,
    label: 'Favorites',
  ),
  NavigationItem(
    route: const StoreCartRoute(),
    icon: Assets.navBar.cart,
    iconOn: Assets.navBar.cartOn,
    label: 'Cart',
  ),
  NavigationItem(
    route: const StoreProfileRoute(),
    icon: Assets.navBar.profile,
    iconOn: Assets.navBar.profileOn,
    label: 'Profile',
  ),
];

@RoutePage()
class StoreBottomNavigation extends StatelessWidget {
  const StoreBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: AutoTabsScaffold(
            routes: const [
              StoreHomeRoute(),
              StoreCategoriesRoute(),
              StoreFavoritesRoute(),
              StoreCartRoute(),
              StoreProfileRoute(),
            ],
            bottomNavigationBuilder: (context, tabsRouter) {
              return NavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.store), label: 'Home'),
                  NavigationDestination(
                    icon: Icon(Icons.category),
                    label: 'Categories',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          right: 5,
          top: MediaQuery.sizeOf(context).height / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.elliptical(30, 30),
            ),
            child: SizedBox(
              height: 100,
              width: 50,
              child: IconButton(
                onPressed: () {
                  context.router.replace(RestaurantBottomRoute());
                },
                icon: Icon(Icons.swipe_left_alt_rounded, size: 50),
              ).colorize(Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}

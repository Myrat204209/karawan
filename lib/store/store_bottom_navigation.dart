// import 'package:app_ui/app_ui.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:karawan/app/app.dart';

// final storeNavigationItems = [
//   NavigationItem(
//     route: const StoreHomeRoute(),
//     icon: Assets.navBar.home,
//     iconOn: Assets.navBar.homeOn,

//     label: 'Home',
//   ),
//   NavigationItem(
//     route: const StoreCategoriesRoute(),
//     icon: Assets.navBar.category,
//     iconOn: Assets.navBar.categoryOn,
//     label: 'Category',
//   ),
//   NavigationItem(
//     route: const StoreFavoritesRoute(),
//     icon: Assets.navBar.favorites,
//     iconOn: Assets.navBar.favoritesOn,
//     label: 'Favorites',
//   ),
//   NavigationItem(
//     route: const StoreCartRoute(),
//     icon: Assets.navBar.cart,
//     iconOn: Assets.navBar.cartOn,
//     label: 'Cart',
//   ),
//   NavigationItem(
//     route: const StoreProfileRoute(),
//     icon: Assets.navBar.profile,
//     iconOn: Assets.navBar.profileOn,
//     label: 'Profile',
//   ),
// ];

// @RoutePage()
// class StoreBottomNavigation extends StatelessWidget {
//   const StoreBottomNavigation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppSectionScaffold(
//       navigationItems: storeNavigationItems,
//       isStore: true,
//       oppositeRoute: RestaurantBottomRoute(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/features/features.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/director',
      builder: (context, state) => const DirectorPage(),
    ),
    // Market section with bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => navigationShell.goBranch(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/market/home',
              builder: (context, state) => const MarketHomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/market/categories',
              builder: (context, state) => const MarketCategoriesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/market/favorites',
              builder: (context, state) => const MarketFavoritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/market/cart',
              builder: (context, state) => const MarketCartView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/market/profile',
              builder: (context, state) => const MarketProfileView(),
            ),
          ],
        ),
      ],
    ),
    // Restaurant section with bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => navigationShell.goBranch(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant/home',
              builder: (context, state) => const RestaurantHomeView(),
              routes: [
                GoRoute(
                  path: 'product/:productId',
                  builder: (context, state) => RestaurantProductsPage(
                    productId: state.pathParameters['productId']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant/order',
              builder: (context, state) => const RestaurantOrderView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant/favorites',
              builder: (context, state) => const RestaurantFavoritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant/profile',
              builder: (context, state) => const RestaurantProfileView(),
            ),
          ],
        ),
      ],
    ),
  ],
);

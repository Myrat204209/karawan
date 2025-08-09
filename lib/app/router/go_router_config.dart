import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';
import 'package:karawan/app/router/route_names.dart';
import 'package:karawan/features/features.dart';
import 'package:karawan/features/profile/view/profile_page.dart';
import 'package:karawan/features/store/store_bottom_navigation.dart';
import 'package:talker_flutter/talker_flutter.dart';

final goRouter = GoRouter(
  observers: [TalkerRouteObserver(GetIt.I<Talker>())],
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/director',
      builder: (context, state) => const DirectorPage(),
    ),
    // Store section with bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return GoRouterSectionScaffold(
          navigationItems: storeNavigationItems,
          oppositePath: '/restaurant/home',
          isMarket: true,
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/store/home',
              builder: (context, state) => const MarketHomePage(),
              routes: [
                GoRoute(
                  name: RouteNames.storeProductDetails,
                  path: 'products/:productId',
                  builder: (context, state) => MarketProductsPage(
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
              path: '/store/categories',
              builder: (context, state) => const MarketCategoriesPage(),
            ),
            GoRoute(
              path: '/store/sub-categories',
              builder: (context, state) => const MarketSubCategoriesPage(),
            ),
            GoRoute(
              path: '/store/filter',
              builder: (context, state) => const MarketFilterPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/store/favorites',
              builder: (context, state) => const MarketFavoritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/store/cart',
              builder: (context, state) => const MarketCartPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/store/profile',
              builder: (context, state) => const ProfilePage(),
            ),
            GoRoute(
              path: '/store/auth',
              builder: (context, state) => const MarketAuthPage(),
            ),
            GoRoute(
              path: '/store/notification',
              builder: (context, state) => const MarketNotificationPage(),
            ),
          ],
        ),
      ],
    ),
    // Restaurant section with bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return GoRouterSectionScaffold(
          navigationItems: restaurantNavigationItems,
          oppositePath: '/store/home',
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant/home',
              builder: (context, state) => const RestaurantHomePage(),
              routes: [
                GoRoute(
                  name: RouteNames.restaurantProductDetails,
                  path: 'products/:productId',
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
              builder: (context, state) => const RestaurantOrderPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant/favorites',
              builder: (context, state) => const RestaurantFavoritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant/profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

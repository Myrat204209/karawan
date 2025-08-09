import 'package:app_ui/app_ui.dart' show AppSection, StorageProvider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';
import 'package:karawan/app/router/route_names.dart';
import 'package:karawan/blocs/cart/cart_bloc.dart';
import 'package:karawan/blocs/favorites/favorites_bloc.dart';
import 'package:karawan/features/features.dart';
import 'package:karawan/features/profile/view/profile_page.dart';
import 'package:karawan/features/store/store_bottom_navigation.dart';
import 'package:karawan/repositories/cart_repository.dart';
import 'package:karawan/repositories/favorites_repository.dart';
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
        final storage = GetIt.I<StorageProvider>();
        return MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>(
              create: (_) => CartBloc(
                repository: CartRepository(
                  storageProvider: storage,
                  section: AppSection.store,
                ),
                section: AppSection.store,
              )..add(CartInitialized()),
            ),
            BlocProvider<FavoritesBloc>(
              create: (_) => FavoritesBloc(
                repository: FavoritesRepository(
                  storageProvider: storage,
                  section: AppSection.store,
                ),
                section: AppSection.store,
              )..add(FavoritesInitialized()),
            ),
          ],
          child: GoRouterSectionScaffold(
            navigationItems: storeNavigationItems,
            oppositePath: '/restaurant/home',
            isMarket: true,
            child: navigationShell,
          ),
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
        final storage = GetIt.I<StorageProvider>();
        return MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>(
              create: (_) => CartBloc(
                repository: CartRepository(
                  storageProvider: storage,
                  section: AppSection.restaurant,
                ),
                section: AppSection.restaurant,
              )..add(CartInitialized()),
            ),
            BlocProvider<FavoritesBloc>(
              create: (_) => FavoritesBloc(
                repository: FavoritesRepository(
                  storageProvider: storage,
                  section: AppSection.restaurant,
                ),
                section: AppSection.restaurant,
              )..add(FavoritesInitialized()),
            ),
          ],
          child: GoRouterSectionScaffold(
            navigationItems: restaurantNavigationItems,
            oppositePath: '/store/home',
            child: navigationShell,
          ),
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

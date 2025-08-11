// Suggested code for 'lib/app/router/go_router_config.dart' (or a new factory file)

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';
import 'package:karawan/app/router/route_names.dart';
import 'package:karawan/blocs/blocs.dart';
import 'package:karawan/features/features.dart';
import 'package:karawan/repositories/repositories.dart';
import 'package:talker_flutter/talker_flutter.dart';

StatefulShellRoute createTabbedSection({required SectionConfig config}) {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (_) => CartBloc(
              repository: GetIt.I.get<CartRepository>(
                param1: config.appSection,
              ),
              section: config.appSection,
            )..add(CartInitialized()),
          ),
          BlocProvider<FavoritesBloc>(
            create: (_) => FavoritesBloc(
              repository: GetIt.I.get<FavoritesRepository>(
                param1: config.appSection,
              ),
              section: config.appSection,
            )..add(FavoritesInitialized()),
          ),
        ],
        child: GoRouterSectionScaffold(config: config, child: navigationShell),
      );
    },
    branches: [
      for (final item in config.navigationItems)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: item.path,
              // Note: You would likely have a map or switch statement here
              // to return the correct page widget based on the item.path or label.
              // For simplicity, this example just returns a placeholder.
              builder: (context, state) {
                // In a real app, you'd map path to page:
                // if (item.path == '/market/home') return const MarketHomePage();
                return Center(child: Text('Page for ${item.path}'));
              },
              // Example of handling nested routes for the 'home' tab
              routes: item.path.endsWith('/home')
                  ? [
                      GoRoute(
                        name: config.productDetailsRouteName,
                        path: 'products/:productId',
                        builder: (context, state) => MarketProductsPage(
                          productId: state.pathParameters['productId']!,
                        ),
                      ),
                    ]
                  : [], // No nested routes for other tabs
            ),
          ],
        ),
    ],
  );
}

final marketConfig = SectionConfig(
  pathPrefix: 'market',
  appSection: AppSection.store,
  productDetailsRouteName: RouteNames.storeProductDetails,
  navigationItems: marketNavigationItems,
  oppositePath: '/restaurant/home',
);

final restaurantConfig = SectionConfig(
  pathPrefix: 'restaurant',
  appSection: AppSection.restaurant,
  productDetailsRouteName: RouteNames.restaurantProductDetails,
  navigationItems: restaurantNavigationItems,
  oppositePath: '/market/home',
);

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  observers: [TalkerRouteObserver(GetIt.I<Talker>())],
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/director',
      builder: (context, state) => const DirectorPage(),
    ),
    createTabbedSection(config: marketConfig),
    createTabbedSection(config: restaurantConfig),
  ],
);

// Suggested code for 'lib/app/router/go_router_config.dart' (or a new factory file)

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';
import 'package:karawan/app/router/route_names.dart';
import 'package:karawan/features/features.dart';
import 'package:karawan/repositories/repositories.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _getIt = GetIt.I;
final goRouter = GoRouter(
  debugLogDiagnostics: !kReleaseMode,
  observers: [TalkerRouteObserver(_getIt<Talker>())],
  initialLocation: '/splash',
  redirect: (BuildContext context, GoRouterState state) {
    if (state.matchedLocation != '/splash') {
      return null;
    }

    final pageCacher = _getIt<PageCacher>();
    final lastSection = pageCacher.getCurrentSection();
    if (lastSection == null) {
      return '/director';
    } else if (lastSection == AppSection.market) {
      return '/market/home';
    } else {
      // Otherwise, go to the restaurant home.
      return '/restaurant/home';
    }
  },
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
StatefulShellRoute createTabbedSection({required SectionConfig config}) {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (_) => CartBloc(
              repository: _getIt.get<CartRepository>(param1: config.appSection),
              section: config.appSection,
            )..add(CartInitialized()),
          ),
          BlocProvider<FavoritesBloc>(
            create: (_) => FavoritesBloc(
              repository: _getIt.get<FavoritesRepository>(
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
              builder: (context, state) {
                // In a real app, you'd map path to page:
                if (item.path.endsWith('/home')) {
                  return HomePage(section: config.appSection);
                }
                if (item.path.endsWith('/categories')) {
                  return const CategoriesPage();
                }
                if (item.path.endsWith('/favorites')) {
                  return const FavoritesPage();
                }
                if (item.path.endsWith('/cart')) return const CartPage();
                if (item.path.endsWith('/profile')) {
                  return const ProfilePage();
                }
                return SizedBox.shrink();
              },
              // Example of handling nested routes for the 'home' tab
              routes: item.path.endsWith('/home')
                  ? [
                      GoRoute(
                        name: config.productDetailsRouteName,
                        path: 'products/:productId',
                        builder: (context, state) => ProductDetailsPage(
                          productId: state.pathParameters['productId']!,
                          section: config.appSection,
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
  appSection: AppSection.market,
  productDetailsRouteName: RouteNames.marketProductDetails,
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

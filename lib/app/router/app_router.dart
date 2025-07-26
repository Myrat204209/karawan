import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Navigation,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // HomePage is the top-level container for our custom view.
    // Its children are the two parallel router outlets.
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      initial: true,
      children: [
        // The Store section's nested router.
        AutoRoute(
          path: 'store',
          page: StoreRouter.page, 
          initial: true,
          children: [
            AutoRoute(path: '', page: StoreHomeRoute.page),
            AutoRoute(path: 'categories', page: StoreCategoriesRoute.page),
            AutoRoute(path: 'favorites', page: StoreFavoritesRoute.page),
            AutoRoute(path: 'cart', page: StoreCartRoute.page),
            AutoRoute(path: 'profile', page: StoreProfileRoute.page),
          ],
        ),
        // The Restaurant section's parallel nested router.
        AutoRoute(
          path: 'restaurant',
          page: RestaurantRouter.page, 
          children: [
            AutoRoute(path: '', page: RestaurantHomeRoute.page),
            AutoRoute(path: 'order', page: RestaurantOrderRoute.page),
            AutoRoute(path: 'favorites', page: RestaurantFavoritesRoute.page),
            AutoRoute(path: 'profile', page: RestaurantProfileRoute.page),
          ],
        ),
      ],
    ),
  ];
}

// These shell pages provide the nested AutoRouter outlets.
// Add these class definitions at the end of your app_router.dart file.
@RoutePage(name: 'StoreRouter')
class StoreRouterPage extends AutoRouter {}

@RoutePage(name: 'RestaurantRouter')
class RestaurantRouterPage extends AutoRouter {}
import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Navigation,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // HomePage is the parent container.
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      initial: true,
      children: [
        // TODO: remove after finishing UI elements
        // The Store section is temporarily commented out.
        // AutoRoute(
        //   path: 'store',
        //   page: StoreRouter.page,
        //   children: [
        //     AutoRoute(path: '', page: StoreHomeRoute.page),
        //     AutoRoute(path: 'categories', page: StoreCategoriesRoute.page),
        //     AutoRoute(path: 'favorites', page: StoreFavoritesRoute.page),
        //     AutoRoute(path: 'cart', page: StoreCartRoute.page),
        //     AutoRoute(path: 'profile', page: StoreProfileRoute.page),
        //   ],
        // ),

        // The Restaurant section is now the initial and only child.
        AutoRoute(
          path: 'restaurant',
          page: RestaurantRouter.page,
          initial: true,
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

// Shell pages for the nested routers.
// We can leave StoreRouter here as it doesn't cause harm.
@RoutePage(name: 'StoreRouter')
class StoreRouterPage extends AutoRouter {
  const StoreRouterPage({super.key});
}

@RoutePage(name: 'RestaurantRouter')
class RestaurantRouterPage extends AutoRouter {
  const RestaurantRouterPage({super.key});
}

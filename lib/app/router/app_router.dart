import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Navigation,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();


  @override
  List<AutoRoute> get routes => [
    // HomePage is the initial route and has NO children.

    AutoRoute(page: HomeRoute.page, initial: true, path: '/'),
    AutoRoute(
      page: StoreBottomRoute.page,
      
      // path: 'store',
      children: [
        AutoRoute(page: StoreHomeRoute.page, initial: true, path: 'home'),
        AutoRoute(page: StoreCategoriesRoute.page, path: 'categories'),
        AutoRoute(page: StoreFavoritesRoute.page, path: 'favorites'),
        AutoRoute(page: StoreCartRoute.page, path: 'cart'),
        AutoRoute(page: StoreProfileRoute.page, path: 'profile'),
      ],
    ),
    AutoRoute(
      page: RestaurantBottomRoute.page,
      children: [
        AutoRoute(page: RestaurantHomeRoute.page, initial: true, path: ''),
        AutoRoute(page: RestaurantOrderRoute.page, path: 'orders'),
        AutoRoute(page: RestaurantFavoritesRoute.page, path: 'favorites'),
        AutoRoute(page: RestaurantProfileRoute.page, path: 'profile'),
      ],
    ),
    // The Store section is a self-contained navigation stack.
  ];
}

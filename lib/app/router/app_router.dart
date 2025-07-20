import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // // The splash screen is the only initial route.
    // AutoRoute(page: SplashRoute.page, initial: true),

    // StoreRoute is a top-level route that contains its own children (tabs).
    AutoRoute(
      initial: true,
      page: StoreBottomNavigation.page,
      children: [
        AutoRoute(page: StoreHomeRoute.page, initial: true),
        AutoRoute(page: StoreCategoriesRoute.page),
        AutoRoute(page: StoreFavoritesRoute.page),
        AutoRoute(page: StoreCartRoute.page),
        AutoRoute(page: StoreProfileRoute.page),
      ],
    ),
    AutoRoute(
      initial: true,
      page: RestaurantBottomNavigation.page,
      children: [
        AutoRoute(page: StoreHomeRoute.page, initial: true),
        AutoRoute(page: StoreCategoriesRoute.page),
        AutoRoute(page: StoreFavoritesRoute.page),
        AutoRoute(page: StoreCartRoute.page),
        AutoRoute(page: StoreProfileRoute.page),
      ],
    ),
  ];
}

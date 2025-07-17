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

        // // HomePage is a simple route that hosts the swipe view. It has NO children.
        // AutoRoute(page: HomeRoute.page),

        // StoreRoute is a top-level route that contains its own children (tabs).
        AutoRoute(
          initial: true,
          page: StoreRoute.page,
          children: [
            AutoRoute(page: StoreHomeRoute.page, initial: true),
            AutoRoute(page: StoreOrdersRoute.page),
            AutoRoute(page: StoreProfileRoute.page),
          ],
        ),

        // RestaurantRoute is also a top-level route with its own children.
        AutoRoute(
          page: RestaurantRoute.page,
          children: [
            AutoRoute(page: RestaurantHomeRoute.page, initial: true),
            AutoRoute(page: RestaurantOrdersRoute.page),
            AutoRoute(page: RestaurantProfileRoute.page),
          ],
        ),
      ];
}
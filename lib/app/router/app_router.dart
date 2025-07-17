import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page),

    AutoRoute(
      initial: true,
      
      page: HomeRoute.page,
      children: [
        AutoRoute(
          page: StoreRoute.page,
          initial: true,
          children: [
            AutoRoute(page: StoreHomeRoute.page, initial: true),
            AutoRoute(page: StoreOrdersRoute.page),
            AutoRoute(page: StoreProfileRoute.page),
          ],
        ),

        AutoRoute(
          page: RestaurantRoute.page,
          children: [
            AutoRoute(page: RestaurantHomeRoute.page, initial: true),
            AutoRoute(page: RestaurantOrdersRoute.page),
            AutoRoute(page: RestaurantProfileRoute.page),
          ],
        ),
      ],
    ),
  ];
}

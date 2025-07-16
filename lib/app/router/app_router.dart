import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),

    // The main entry point is now the HostPage
    AutoRoute(page: HostRoute.page),

    // Define the Market section with its nested tabs
    AutoRoute(
      page: StoreRoute.page,
      children: [
        AutoRoute(page: StoreHomeRoute.page, initial: true),
        AutoRoute(page: StoreOrdersRoute.page),
        AutoRoute(page: StoreProfileRoute.page),
      ],
    ),

    // Define the Restaurant section with its nested tabs
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

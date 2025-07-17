import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),

    // CORRECTED: HostRoute now contains the two main sections as its children.
    AutoRoute(
      page: HostRoute.page,
      children: [
        // Store (Market) section with its nested tabs
        AutoRoute(
          page: StoreRoute.page,
          initial: true, // This is the default child to show
          children: [
            AutoRoute(page: StoreHomeRoute.page, initial: true),
            AutoRoute(page: StoreOrdersRoute.page),
            AutoRoute(page: StoreProfileRoute.page),
          ],
        ),

        // Restaurant section with its nested tabs
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
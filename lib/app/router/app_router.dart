import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Navigation,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: DirectorRoute.page),
    AutoRoute(
      page: MarketBottomRoute.page,
      children: [
        AutoRoute(path: 'home', page: MarketHomeRoute.page),
        AutoRoute(path: 'categories', page: MarketCategoriesRoute.page),
        AutoRoute(path: 'favorites', page: MarketFavoritesRoute.page),
        AutoRoute(path: 'cart', page: MarketCartRoute.page),
        AutoRoute(path: 'profile', page: MarketProfileRoute.page),
      ],
    ),
    AutoRoute(
      page: RestaurantRouter.page,
      children: [
        AutoRoute(
          page: RestaurantBottomRoute.page,
          path: '',
          children: [
            AutoRoute(path: '', page: RestaurantHomeRoute.page),
            AutoRoute(path: 'order', page: RestaurantOrderRoute.page),
            AutoRoute(path: 'favorites', page: RestaurantFavoritesRoute.page),
            AutoRoute(path: 'profile', page: RestaurantProfileRoute.page),
          ],
        ),
        AutoRoute(
          path: 'product/:productId',
          page: RestaurantProductsRoute.page,
        ),
      ],
    ),
  ];
}

@RoutePage(name: 'RestaurantRouter')
class RestaurantRouterPage extends AutoRouter {
  const RestaurantRouterPage({super.key});
}

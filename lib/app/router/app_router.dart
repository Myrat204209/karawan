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
      page: RestaurantBottomRoute.page,
      children: [
        AutoRoute(path: 'home', page: RestaurantHomeRoute.page),
        AutoRoute(path: 'order', page: RestaurantOrderRoute.page),
        AutoRoute(path: 'favorites', page: RestaurantFavoritesRoute.page),
        AutoRoute(path: 'profile', page: RestaurantProfileRoute.page),
        // The Product Details page for the restaurant section.
        AutoRoute(
          path: 'product/:productId',
          page: RestaurantProductsRoute.page,
        ),
      ],
    ),
    // AutoRoute(
    //   page: CombinerRoute.page,

    //   children: [
    //     AutoRoute(
    //       page: MarketBottomRoute.page,
    //       children: [
    //         // Tabs for the Market section
    //         // The Product Details page is a sibling to the tabs.
    //         // AutoRoute(path: 'product/:productId', page: ProductDetailsRoute.page),
    //       ],
    //     ),

    //     // The Restaurant section is a parallel nested router.
    //   ],
    // ),
    // AutoRoute(page: HomeRoute.page),
  ];
}

// These shell pages provide the nested AutoRouter outlets.
// Add these class definitions at the end of your app_router.dart file.
@RoutePage(name: 'MarketRouter')
class MarketRouterPage extends AutoRouter {
  const MarketRouterPage({super.key});
}

@RoutePage(name: 'RestaurantRouter')
class RestaurantRouterPage extends AutoRouter {
  const RestaurantRouterPage({super.key});
}

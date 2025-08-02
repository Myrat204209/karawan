import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Navigation,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // HomePage is the parent container for the entire app.
    // Its children are the two main sections, each with its own router.
    AutoRoute(
      page: CombinerRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: StoreBottomRoute.page,
          children: [
            // Tabs for the Store section
            AutoRoute(path: 'home', page: StoreHomeRoute.page),
            AutoRoute(path: 'categories', page: StoreCategoriesRoute.page),
            AutoRoute(path: 'favorites', page: StoreFavoritesRoute.page),
            AutoRoute(path: 'cart', page: StoreCartRoute.page),
            AutoRoute(path: 'profile', page: StoreProfileRoute.page),
            // The Product Details page is a sibling to the tabs.
            // AutoRoute(path: 'product/:productId', page: ProductDetailsRoute.page),
          ],
        ),
        // The Restaurant section is a parallel nested router.
        AutoRoute(
          page: RestaurantBottomRoute.page, // Also an EmptyRouterPage shell
          // initial: true,
          children: [
            // Tabs for the Restaurant section
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
      ],
    ),
    AutoRoute(page: HomeRoute.page),
  ];
}

// These shell pages provide the nested AutoRouter outlets.
// Add these class definitions at the end of your app_router.dart file.
@RoutePage(name: 'StoreRouter')
class StoreRouterPage extends AutoRouter {
  const StoreRouterPage({super.key});
}

@RoutePage(name: 'RestaurantRouter')
class RestaurantRouterPage extends AutoRouter {
  const RestaurantRouterPage({super.key});
}

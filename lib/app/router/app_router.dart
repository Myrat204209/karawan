import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    
    // This is the main change. We now have a single top-level route
    // for our main content, which is the host page.
    AutoRoute(
      page: MainHostRoute.page,
      children: [
        // The AppBottomNavigation is now a child of the MainHost.
        // This structure allows auto_route to manage the state of the
        // bottom navigation while it lives inside the PageView.
        AutoRoute(
          page: AppBottomNavigation.page,
          initial: true, // It's the initial child of the host
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        // The Restaurant section is also a child route.
        AutoRoute(page: RestaurantRoute.page),
      ]
    ),

    AutoRoute(page: LoginRoute.page),
  ];
}
import 'package:auto_route/auto_route.dart';
import 'package:karawan/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(
      page: AppBottomNavigation.page,
      // initial: true,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],

      // guards: [
      //   AuthGuard(),]
    ),
    AutoRoute(page: LoginRoute.page),

    // AutoRoute(page: LoginRoute.page, initial: true),
  ];
}

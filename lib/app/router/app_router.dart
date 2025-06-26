import 'package:auto_route/auto_route.dart';
import 'package:ojak/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AppBottomNavigation.page, initial: true, children: []),
    // AutoRoute(page: LoginRoute.page, initial: true),
  ];
}

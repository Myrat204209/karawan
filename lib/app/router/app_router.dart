import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [];
}

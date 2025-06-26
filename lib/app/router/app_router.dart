import 'package:auto_route/auto_route.dart';
import 'package:ojak/app/router/router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AppBottomNavigation.page,
      // initial: true,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AutomationRoute.page),
        AutoRoute(page: MarketRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],

      // guards: [
      //   AuthGuard(),]
    ),
    AutoRoute(page: LoginRoute.page, initial: true),

    // AutoRoute(page: LoginRoute.page, initial: true),
  ];
}
/*
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirectUntil to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirectUntil(
        LoginRoute(
          onResult: (success) {
            // if success == true the navigation will be resumed
            // else it will be aborted
            resolver.next(success);
          },
        ),
      );
    }
  }
}
*/
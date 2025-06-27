// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:ojak/app/router/app_bottom_navigation.dart' as _i1;
import 'package:ojak/features/automation/ui/view/automation_page.dart' as _i2;
import 'package:ojak/features/home/view/home_page.dart' as _i3;
import 'package:ojak/features/market/ui/view/market_page.dart' as _i5;
import 'package:ojak/features/profile/ui/view/profile_page.dart' as _i6;
import 'package:ojak/features/splash/splash_screen.dart' as _i7;
import 'package:ojak/login/ui/view/login_page.dart' as _i4;

/// generated route for
/// [_i1.AppBottomNavigation]
class AppBottomNavigation extends _i8.PageRouteInfo<void> {
  const AppBottomNavigation({List<_i8.PageRouteInfo>? children})
    : super(AppBottomNavigation.name, initialChildren: children);

  static const String name = 'AppBottomNavigation';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppBottomNavigation();
    },
  );
}

/// generated route for
/// [_i2.AutomationPage]
class AutomationRoute extends _i8.PageRouteInfo<void> {
  const AutomationRoute({List<_i8.PageRouteInfo>? children})
    : super(AutomationRoute.name, initialChildren: children);

  static const String name = 'AutomationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.AutomationPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.MarketPage]
class MarketRoute extends _i8.PageRouteInfo<void> {
  const MarketRoute({List<_i8.PageRouteInfo>? children})
    : super(MarketRoute.name, initialChildren: children);

  static const String name = 'MarketRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.MarketPage();
    },
  );
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfilePage();
    },
  );
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SplashScreen();
    },
  );
}

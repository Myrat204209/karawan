// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:ojak/app/router/app_bottom_navigation.dart' as _i1;
import 'package:ojak/features/home/view/home_page.dart' as _i2;
import 'package:ojak/login/ui/view/login_page.dart' as _i3;
import 'package:ojak/features/profile/ui/view/profile_page.dart' as _i4;

/// generated route for
/// [_i1.AppBottomNavigation]
class AppBottomNavigation extends _i5.PageRouteInfo<void> {
  const AppBottomNavigation({List<_i5.PageRouteInfo>? children})
    : super(AppBottomNavigation.name, initialChildren: children);

  static const String name = 'AppBottomNavigation';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppBottomNavigation();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute({List<_i5.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfilePage();
    },
  );
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:ojak/app/router/app_bottom_navigation.dart' as _i1;
import 'package:ojak/home/view/home_page.dart' as _i2;
import 'package:ojak/profile/view/profile_page.dart' as _i3;

/// generated route for
/// [_i1.AppBottomNavigation]
class AppBottomNavigation extends _i4.PageRouteInfo<void> {
  const AppBottomNavigation({List<_i4.PageRouteInfo>? children})
    : super(AppBottomNavigation.name, initialChildren: children);

  static const String name = 'AppBottomNavigation';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppBottomNavigation();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute({List<_i4.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfilePage();
    },
  );
}

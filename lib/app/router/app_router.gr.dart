// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:karawan/app/router/store_bottom_navigation.dart' as _i1;
import 'package:karawan/store/cart/view/store_cart_page.dart' as _i2;
import 'package:karawan/store/categories/view/store_categories_page.dart'
    as _i3;
import 'package:karawan/store/favorites/view/store_favorites_page.dart' as _i4;
import 'package:karawan/store/home/view/store_home_page.dart' as _i5;
import 'package:karawan/store/profile/view/store_profile_page.dart' as _i6;

/// generated route for
/// [_i1.StoreBottomNavigation]
class StoreBottomNavigation extends _i7.PageRouteInfo<void> {
  const StoreBottomNavigation({List<_i7.PageRouteInfo>? children})
    : super(StoreBottomNavigation.name, initialChildren: children);

  static const String name = 'StoreBottomNavigation';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.StoreBottomNavigation();
    },
  );
}

/// generated route for
/// [_i2.StoreCartPage]
class StoreCartRoute extends _i7.PageRouteInfo<void> {
  const StoreCartRoute({List<_i7.PageRouteInfo>? children})
    : super(StoreCartRoute.name, initialChildren: children);

  static const String name = 'StoreCartRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.StoreCartPage();
    },
  );
}

/// generated route for
/// [_i3.StoreCategoriesPage]
class StoreCategoriesRoute extends _i7.PageRouteInfo<void> {
  const StoreCategoriesRoute({List<_i7.PageRouteInfo>? children})
    : super(StoreCategoriesRoute.name, initialChildren: children);

  static const String name = 'StoreCategoriesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.StoreCategoriesPage();
    },
  );
}

/// generated route for
/// [_i4.StoreFavoritesPage]
class StoreFavoritesRoute extends _i7.PageRouteInfo<void> {
  const StoreFavoritesRoute({List<_i7.PageRouteInfo>? children})
    : super(StoreFavoritesRoute.name, initialChildren: children);

  static const String name = 'StoreFavoritesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.StoreFavoritesPage();
    },
  );
}

/// generated route for
/// [_i5.StoreHomePage]
class StoreHomeRoute extends _i7.PageRouteInfo<void> {
  const StoreHomeRoute({List<_i7.PageRouteInfo>? children})
    : super(StoreHomeRoute.name, initialChildren: children);

  static const String name = 'StoreHomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.StoreHomePage();
    },
  );
}

/// generated route for
/// [_i6.StoreProfilePage]
class StoreProfileRoute extends _i7.PageRouteInfo<void> {
  const StoreProfileRoute({List<_i7.PageRouteInfo>? children})
    : super(StoreProfileRoute.name, initialChildren: children);

  static const String name = 'StoreProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.StoreProfilePage();
    },
  );
}

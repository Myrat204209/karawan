// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:karawan/app/router/app_router.dart' as _i9;
import 'package:karawan/app/view/combiner_page.dart' as _i1;
import 'package:karawan/app/view/home_page.dart' as _i2;
import 'package:karawan/features/restaurant/favorites/view/restaurant_favorites_page.dart'
    as _i4;
import 'package:karawan/features/restaurant/home/view/restaurant_home_page.dart'
    as _i5;
import 'package:karawan/features/restaurant/order/view/restaurant_order_page.dart'
    as _i6;
import 'package:karawan/features/restaurant/product_details/view/restaurant_products_page.dart'
    as _i7;
import 'package:karawan/features/restaurant/profile/view/restaurant_profile_page.dart'
    as _i8;
import 'package:karawan/features/restaurant/restaurant_bottom_navigation.dart'
    as _i3;
import 'package:karawan/features/store/cart/view/store_cart_page.dart' as _i11;
import 'package:karawan/features/store/categories/view/store_categories_page.dart'
    as _i12;
import 'package:karawan/features/store/favorites/view/store_favorites_page.dart'
    as _i13;
import 'package:karawan/features/store/home/view/store_home_page.dart' as _i14;
import 'package:karawan/features/store/profile/view/store_profile_page.dart'
    as _i15;
import 'package:karawan/features/store/store_bottom_navigation.dart' as _i10;

/// generated route for
/// [_i1.CombinerPage]
class CombinerRoute extends _i16.PageRouteInfo<void> {
  const CombinerRoute({List<_i16.PageRouteInfo>? children})
    : super(CombinerRoute.name, initialChildren: children);

  static const String name = 'CombinerRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.CombinerPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.RestaurantBottomNavigation]
class RestaurantBottomRoute extends _i16.PageRouteInfo<void> {
  const RestaurantBottomRoute({List<_i16.PageRouteInfo>? children})
    : super(RestaurantBottomRoute.name, initialChildren: children);

  static const String name = 'RestaurantBottomRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.RestaurantBottomNavigation();
    },
  );
}

/// generated route for
/// [_i4.RestaurantFavoritesPage]
class RestaurantFavoritesRoute extends _i16.PageRouteInfo<void> {
  const RestaurantFavoritesRoute({List<_i16.PageRouteInfo>? children})
    : super(RestaurantFavoritesRoute.name, initialChildren: children);

  static const String name = 'RestaurantFavoritesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.RestaurantFavoritesPage();
    },
  );
}

/// generated route for
/// [_i5.RestaurantHomePage]
class RestaurantHomeRoute extends _i16.PageRouteInfo<void> {
  const RestaurantHomeRoute({List<_i16.PageRouteInfo>? children})
    : super(RestaurantHomeRoute.name, initialChildren: children);

  static const String name = 'RestaurantHomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.RestaurantHomePage();
    },
  );
}

/// generated route for
/// [_i6.RestaurantOrderPage]
class RestaurantOrderRoute extends _i16.PageRouteInfo<void> {
  const RestaurantOrderRoute({List<_i16.PageRouteInfo>? children})
    : super(RestaurantOrderRoute.name, initialChildren: children);

  static const String name = 'RestaurantOrderRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.RestaurantOrderPage();
    },
  );
}

/// generated route for
/// [_i7.RestaurantProductsPage]
class RestaurantProductsRoute
    extends _i16.PageRouteInfo<RestaurantProductsRouteArgs> {
  RestaurantProductsRoute({
    _i17.Key? key,
    required String productId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         RestaurantProductsRoute.name,
         args: RestaurantProductsRouteArgs(key: key, productId: productId),
         rawPathParams: {'productId': productId},
         initialChildren: children,
       );

  static const String name = 'RestaurantProductsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RestaurantProductsRouteArgs>(
        orElse: () => RestaurantProductsRouteArgs(
          productId: pathParams.getString('productId'),
        ),
      );
      return _i7.RestaurantProductsPage(
        key: args.key,
        productId: args.productId,
      );
    },
  );
}

class RestaurantProductsRouteArgs {
  const RestaurantProductsRouteArgs({this.key, required this.productId});

  final _i17.Key? key;

  final String productId;

  @override
  String toString() {
    return 'RestaurantProductsRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RestaurantProductsRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
}

/// generated route for
/// [_i8.RestaurantProfilePage]
class RestaurantProfileRoute extends _i16.PageRouteInfo<void> {
  const RestaurantProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(RestaurantProfileRoute.name, initialChildren: children);

  static const String name = 'RestaurantProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.RestaurantProfilePage();
    },
  );
}

/// generated route for
/// [_i9.RestaurantRouterPage]
class RestaurantRouter extends _i16.PageRouteInfo<void> {
  const RestaurantRouter({List<_i16.PageRouteInfo>? children})
    : super(RestaurantRouter.name, initialChildren: children);

  static const String name = 'RestaurantRouter';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.RestaurantRouterPage();
    },
  );
}

/// generated route for
/// [_i10.StoreBottomNavigation]
class StoreBottomRoute extends _i16.PageRouteInfo<void> {
  const StoreBottomRoute({List<_i16.PageRouteInfo>? children})
    : super(StoreBottomRoute.name, initialChildren: children);

  static const String name = 'StoreBottomRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.StoreBottomNavigation();
    },
  );
}

/// generated route for
/// [_i11.StoreCartPage]
class StoreCartRoute extends _i16.PageRouteInfo<void> {
  const StoreCartRoute({List<_i16.PageRouteInfo>? children})
    : super(StoreCartRoute.name, initialChildren: children);

  static const String name = 'StoreCartRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.StoreCartPage();
    },
  );
}

/// generated route for
/// [_i12.StoreCategoriesPage]
class StoreCategoriesRoute extends _i16.PageRouteInfo<void> {
  const StoreCategoriesRoute({List<_i16.PageRouteInfo>? children})
    : super(StoreCategoriesRoute.name, initialChildren: children);

  static const String name = 'StoreCategoriesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.StoreCategoriesPage();
    },
  );
}

/// generated route for
/// [_i13.StoreFavoritesPage]
class StoreFavoritesRoute extends _i16.PageRouteInfo<void> {
  const StoreFavoritesRoute({List<_i16.PageRouteInfo>? children})
    : super(StoreFavoritesRoute.name, initialChildren: children);

  static const String name = 'StoreFavoritesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.StoreFavoritesPage();
    },
  );
}

/// generated route for
/// [_i14.StoreHomePage]
class StoreHomeRoute extends _i16.PageRouteInfo<void> {
  const StoreHomeRoute({List<_i16.PageRouteInfo>? children})
    : super(StoreHomeRoute.name, initialChildren: children);

  static const String name = 'StoreHomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.StoreHomePage();
    },
  );
}

/// generated route for
/// [_i15.StoreProfilePage]
class StoreProfileRoute extends _i16.PageRouteInfo<void> {
  const StoreProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(StoreProfileRoute.name, initialChildren: children);

  static const String name = 'StoreProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.StoreProfilePage();
    },
  );
}

/// generated route for
/// [_i9.StoreRouterPage]
class StoreRouter extends _i16.PageRouteInfo<void> {
  const StoreRouter({List<_i16.PageRouteInfo>? children})
    : super(StoreRouter.name, initialChildren: children);

  static const String name = 'StoreRouter';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.StoreRouterPage();
    },
  );
}

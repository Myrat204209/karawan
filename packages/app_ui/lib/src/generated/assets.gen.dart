// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/about_us.png
  AssetGenImage get aboutUs =>
      const AssetGenImage('assets/images/about_us.png');

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/banner_2.png
  AssetGenImage get banner2 =>
      const AssetGenImage('assets/images/banner_2.png');

  /// File path: assets/images/banner_3.png
  AssetGenImage get banner3 =>
      const AssetGenImage('assets/images/banner_3.png');

  /// Directory path: assets/images/brands
  $AssetsImagesBrandsGen get brands => const $AssetsImagesBrandsGen();

  /// File path: assets/images/doner.png
  AssetGenImage get doner => const AssetGenImage('assets/images/doner.png');

  /// Directory path: assets/images/meals
  $AssetsImagesMealsGen get meals => const $AssetsImagesMealsGen();

  /// File path: assets/images/mineral.png
  AssetGenImage get mineral => const AssetGenImage('assets/images/mineral.png');

  /// Directory path: packages/app_ui/assets/images
  String get path => 'packages/app_ui/assets/images';

  /// List of all assets
  List<AssetGenImage> get values => [
    aboutUs,
    banner,
    banner2,
    banner3,
    doner,
    mineral,
  ];
}

class $AssetsNavBarGen {
  const $AssetsNavBarGen();

  /// File path: assets/nav_bar/cart.svg
  SvgGenImage get cart => const SvgGenImage('assets/nav_bar/cart.svg');

  /// File path: assets/nav_bar/cart_on.svg
  SvgGenImage get cartOn => const SvgGenImage('assets/nav_bar/cart_on.svg');

  /// File path: assets/nav_bar/category.svg
  SvgGenImage get category => const SvgGenImage('assets/nav_bar/category.svg');

  /// File path: assets/nav_bar/category_on.svg
  SvgGenImage get categoryOn =>
      const SvgGenImage('assets/nav_bar/category_on.svg');

  /// File path: assets/nav_bar/favorites.svg
  SvgGenImage get favorites =>
      const SvgGenImage('assets/nav_bar/favorites.svg');

  /// File path: assets/nav_bar/favorites_on.svg
  SvgGenImage get favoritesOn =>
      const SvgGenImage('assets/nav_bar/favorites_on.svg');

  /// File path: assets/nav_bar/home.svg
  SvgGenImage get home => const SvgGenImage('assets/nav_bar/home.svg');

  /// File path: assets/nav_bar/home_on.svg
  SvgGenImage get homeOn => const SvgGenImage('assets/nav_bar/home_on.svg');

  /// File path: assets/nav_bar/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/nav_bar/profile.svg');

  /// File path: assets/nav_bar/profile_on.svg
  SvgGenImage get profileOn =>
      const SvgGenImage('assets/nav_bar/profile_on.svg');

  /// Directory path: packages/app_ui/assets/nav_bar
  String get path => 'packages/app_ui/assets/nav_bar';

  /// List of all assets
  List<SvgGenImage> get values => [
    cart,
    cartOn,
    category,
    categoryOn,
    favorites,
    favoritesOn,
    home,
    homeOn,
    profile,
    profileOn,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/caravan.svg
  SvgGenImage get caravan => const SvgGenImage('assets/svg/caravan.svg');

  /// Directory path: packages/app_ui/assets/svg
  String get path => 'packages/app_ui/assets/svg';

  /// List of all assets
  List<SvgGenImage> get values => [caravan];
}

class $AssetsImagesBrandsGen {
  const $AssetsImagesBrandsGen();

  /// File path: assets/images/brands/brend_1.png
  AssetGenImage get brend1 =>
      const AssetGenImage('assets/images/brands/brend_1.png');

  /// File path: assets/images/brands/brend_2.png
  AssetGenImage get brend2 =>
      const AssetGenImage('assets/images/brands/brend_2.png');

  /// File path: assets/images/brands/brend_3.png
  AssetGenImage get brend3 =>
      const AssetGenImage('assets/images/brands/brend_3.png');

  /// File path: assets/images/brands/brend_4.png
  AssetGenImage get brend4 =>
      const AssetGenImage('assets/images/brands/brend_4.png');

  /// Directory path: packages/app_ui/assets/images/brands
  String get path => 'packages/app_ui/assets/images/brands';

  /// List of all assets
  List<AssetGenImage> get values => [brend1, brend2, brend3, brend4];
}

class $AssetsImagesMealsGen {
  const $AssetsImagesMealsGen();

  /// File path: assets/images/meals/meal_1.png
  AssetGenImage get meal1 =>
      const AssetGenImage('assets/images/meals/meal_1.png');

  /// File path: assets/images/meals/meal_2.png
  AssetGenImage get meal2 =>
      const AssetGenImage('assets/images/meals/meal_2.png');

  /// File path: assets/images/meals/meal_3.png
  AssetGenImage get meal3 =>
      const AssetGenImage('assets/images/meals/meal_3.png');

  /// File path: assets/images/meals/meal_4.png
  AssetGenImage get meal4 =>
      const AssetGenImage('assets/images/meals/meal_4.png');

  /// Directory path: packages/app_ui/assets/images/meals
  String get path => 'packages/app_ui/assets/images/meals';

  /// List of all assets
  List<AssetGenImage> get values => [meal1, meal2, meal3, meal4];
}

class Assets {
  const Assets._();

  static const String package = 'app_ui';

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsNavBarGen navBar = $AssetsNavBarGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  static const String package = 'app_ui';

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  static const String package = 'app_ui';

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}

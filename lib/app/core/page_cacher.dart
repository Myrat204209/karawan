import 'package:shared_preferences/shared_preferences.dart';

enum RouteType { market, restaurant }

class PageCacher {
  final SharedPreferences _prefs;

  PageCacher({required SharedPreferences prefs}) : _prefs = prefs;

  static const _isMarketRoute = '__is_market_route__';

  Future<void> setRoute(RouteType routeType) async {
    await _prefs.setBool(_isMarketRoute, routeType == RouteType.market);
  }

  Future<bool?> isMarketRoute() async {
    return _prefs.getBool(_isMarketRoute);
  }
}

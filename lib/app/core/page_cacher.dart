import 'package:shared_preferences/shared_preferences.dart';

enum PageType { market, restaurant }

class PageCacher {
  final SharedPreferences _prefs;

  PageCacher({required SharedPreferences prefs}) : _prefs = prefs;

  static const _isMarketRoute = '__is_market_route__';

  Future<void> setRoute(PageType routeType) async {
    await _prefs.setBool(_isMarketRoute, routeType == PageType.market);
  }

  bool? isMarketRoute() {
    return _prefs.getBool(_isMarketRoute);
  }
}

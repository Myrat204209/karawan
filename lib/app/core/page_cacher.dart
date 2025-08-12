import 'package:app_ui/app_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageCacher {
  PageCacher({required this.prefs});
  final SharedPreferences prefs;
  static const String _routeKey = 'last_route';

  bool _isMarketRoute = false;

  void setRoute(AppSection section) {
    _isMarketRoute = section == AppSection.market;
    prefs.setBool(_routeKey, _isMarketRoute);
  }

  void clearRoute() {
    _isMarketRoute = false;
    prefs.remove(_routeKey);
  }

  bool isMarketRoute() {
    _isMarketRoute = prefs.getBool(_routeKey) ?? false;
    return _isMarketRoute;
  }

  AppSection? getCurrentSection() {
    final isMarket = prefs.getBool(_routeKey);
    if (isMarket == null) return null;
    return isMarket ? AppSection.market : AppSection.restaurant;
  }
}

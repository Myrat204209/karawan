import 'package:app_ui/app_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageCacher {
  PageCacher({required this.prefs});
  final SharedPreferences prefs;
  static const String _routeKey = 'last_route';

  Future<void> setRoute(AppSection section) =>
      prefs.setBool(_routeKey, section == AppSection.market);

  Future<bool> clearRoute() => prefs.remove(_routeKey);

  bool isMarketRoute() {
    return prefs.getBool(_routeKey) ?? false;
  }

  AppSection? getCurrentSection() {
    final isMarket = prefs.getBool(_routeKey);
    if (isMarket == null) return null;
    return isMarket ? AppSection.market : AppSection.restaurant;
  }
}

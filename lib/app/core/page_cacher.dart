import 'package:app_ui/app_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageCacher {
  PageCacher({required this.prefs});
  final SharedPreferences prefs;
  static const String _routeKey = 'last_route';

  bool _isStoreRoute = false;

  void setRoute(AppSection section) {
    _isStoreRoute = section == AppSection.store;
    prefs.setBool(_routeKey, _isStoreRoute);
  }

  void clearRoute() {
    _isStoreRoute = false;
    prefs.remove(_routeKey);
  }

  bool isStoreRoute() {
    _isStoreRoute = prefs.getBool(_routeKey) ?? false;
    return _isStoreRoute;
  }

  AppSection? getCurrentSection() {
    final isStore = prefs.getBool(_routeKey);
    if (isStore == null) return null;
    return isStore ? AppSection.store : AppSection.restaurant;
  }
}

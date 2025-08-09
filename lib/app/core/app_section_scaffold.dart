import 'package:app_ui/app_ui.dart' show AppColors;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// The NavigationItem class remains the same.
class NavigationItem {
  const NavigationItem({
    required this.route,
    required this.icon,
    required this.iconOn,
    required this.label,
  });

  final PageRouteInfo route;
  final IconData icon, iconOn;
  final String label;
}

Color colorFromPage(bool isMarket) {
  return isMarket ? AppColors.mainAccent : AppColors.secondRestAccent;
}

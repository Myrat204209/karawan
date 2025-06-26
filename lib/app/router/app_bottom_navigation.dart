import 'package:app_ui/app_ui.dart' show AppColors;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ojak/app/router/router.dart';

// Your bottomNavigationBarItems list remains the same
const List<IconData> bottomNavigationBarItems = [
  Icons.home,
  Icons.grid_view,
  Icons.emoji_food_beverage_rounded,
  Icons.discount_rounded,
];

@RoutePage()
class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,

      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      routes: [HomeRoute(), AutomationRoute(), MarketRoute(), ProfileRoute()],

      backgroundColor: AppColors.bgMain,
      bottomNavigationBuilder: (context, tabsRouter) {
        return const SizedBox.shrink();
      },

      floatingActionButtonBuilder: (context, tabsRouter) {
        return const SizedBox.shrink();
      },
    );
  }
}

// Your NavigationDestinationIcon class remains the same
class NavigationDestinationIcon extends StatelessWidget {
  const NavigationDestinationIcon({
    super.key,
    required this.tabsRouterIndex,
    required this.destinationIndex,
    required this.icon,
    required this.label,
  });

  final int tabsRouterIndex;
  final int destinationIndex;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: tabsRouterIndex == destinationIndex
            ? AppColors.mainAccent
            : AppColors.iconColor,
      ),
      label: label,
    );
  }
}

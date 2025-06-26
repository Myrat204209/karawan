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

      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          indicatorColor: Colors.transparent,
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: (index) {
            if (tabsRouter.activeIndex != index) {
              tabsRouter.setActiveIndex(index);
            } else {
              tabsRouter
                  .innerRouterOf<StackRouter>(tabsRouter.current.name)
                  ?.popUntilRoot();
            }
          },
          destinations: [
            ...bottomNavigationBarItems.map((icon) {
              int destinationIndex = bottomNavigationBarItems.indexOf(icon);
              return NavigationDestinationIcon(
                tabsRouterIndex: tabsRouter.activeIndex,
                destinationIndex: destinationIndex,
                icon: icon,
                label: 'as$destinationIndex',
              );
            }),
          ],
          height: 56,
          indicatorShape: null,
          backgroundColor: Colors.white,
        );
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

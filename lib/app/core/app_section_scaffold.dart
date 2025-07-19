import 'package:app_ui/app_ui.dart' show AppColors, SvgGenImage;
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
  final SvgGenImage icon;
  final SvgGenImage iconOn;
  final String label;
}

// This is the updated, self-contained scaffold widget.
class AppSectionScaffold extends StatelessWidget {
  const AppSectionScaffold({super.key, required this.navigationItems});

  final List<NavigationItem> navigationItems;

  @override
  Widget build(BuildContext context) {
    // We now use AutoTabsRouter to handle the logic internally.
    return AutoTabsScaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      routes: navigationItems.map((item) => item.route).toList(),
      bottomNavigationBuilder: (context, tabsRouter) {
        // The bottomNavigationBar is built using the tabsRouter's state.
        return NavigationBar(
          elevation: 4,
          shadowColor: Color(0xFF000000).withValues(alpha: 5),
          backgroundColor: const Color(0xFFFFFFFF),
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: AppColors.mainAccent),
          ),
          height: 90,
          selectedIndex: tabsRouter.activeIndex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
            for (final (index, item) in navigationItems.indexed)
              _NavigationDestinationIcon(
                iconOff: item.icon,
                iconOn: item.iconOn,
                label: item.label,
                isSelected: tabsRouter.activeIndex == index,
              ),
          ],
        );
      },
    );
  }
}

/// The private icon widget used by the [AppSectionScaffold].
class _NavigationDestinationIcon extends StatelessWidget {
  const _NavigationDestinationIcon({
    required this.iconOff,
    required this.iconOn,
    required this.label,
    required this.isSelected,
  });

  final SvgGenImage iconOff;
  final SvgGenImage iconOn;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      label: label,
      icon: isSelected ? iconOn.svg() : iconOff.svg(),
      // Icon(
      //   icon,
      //   size: 34,

      // ),
    );
  }
}

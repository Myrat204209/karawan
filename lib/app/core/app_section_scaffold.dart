import 'package:app_ui/app_ui.dart' show AppColors;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// A simple data class to hold information for a navigation bar item.
class NavigationItem {
  const NavigationItem({
    required this.route,
    required this.icon,
    required this.label,
  });
  
  final PageRouteInfo route;
  final IconData icon;
  final String label;
}

/// A reusable scaffold for the main app sections (Store, Restaurant).
/// It sets up an [AutoTabsScaffold] with a consistent [NavigationBar] style.
class AppSectionScaffold extends StatelessWidget {
  const AppSectionScaffold({
    super.key,
    required this.navigationItems,
  });

  /// The list of items to display in the bottom navigation bar.
  final List<NavigationItem> navigationItems;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // The routes are now derived from the navigationItems list.
      routes: navigationItems.map((item) => item.route).toList(),
      
      // Keep the background color to prevent transparency issues.
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      
      // The fade transition is preserved.
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          // The background color is now consistent.
          backgroundColor: const Color(0xFF021618),
          indicatorColor: Colors.transparent,
          height: 73.28,
          selectedIndex: tabsRouter.activeIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          
          // This logic correctly handles tab switching and popping the stack.
          onDestinationSelected: (index) {
            if (tabsRouter.activeIndex != index) {
              tabsRouter.setActiveIndex(index);
            } else {
              // Pop to the root of the current tab's navigator
              tabsRouter.innerRouterOf<StackRouter>(tabsRouter.current.name)
                  ?.popUntilRoot();
            }
          },

          // The destinations are now built dynamically from the navigationItems list.
          destinations: [
            for (final (index, item) in navigationItems.indexed)
              _NavigationDestinationIcon(
                icon: item.icon,
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
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      label: label,
      icon: Icon(
        icon,
        size: 34,
        color: isSelected ? AppColors.mainAccent : AppColors.iconColor,
      ),
    );
  }
}
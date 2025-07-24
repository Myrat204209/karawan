import 'package:app_ui/app_ui.dart' show AppColors, SvgGenImage;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
class AppSectionScaffold extends StatefulWidget {
  const AppSectionScaffold({super.key, required this.navigationItems});

  final List<NavigationItem> navigationItems;

  @override
  State<AppSectionScaffold> createState() => _AppSectionScaffoldState();
}

class _AppSectionScaffoldState extends State<AppSectionScaffold>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // We now use AutoTabsRouter to handle the logic internally.
    return AutoTabsScaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      routes: widget.navigationItems.map((item) => item.route).toList(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF9A88C),
        child: const Icon(Icons.airplanemode_active),
      ),
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
          height: 85.h,
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
            for (final (index, item) in widget.navigationItems.indexed)
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

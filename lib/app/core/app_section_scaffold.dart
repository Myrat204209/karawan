import 'package:app_ui/app_ui.dart' show AppColors;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

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

// This is the updated, self-contained scaffold widget.
class AppSectionScaffold extends StatefulWidget {
  const AppSectionScaffold({
    super.key,
    required this.navigationItems,
    required this.oppositeRoute,
    this.isMarket = false,
  });

  final List<NavigationItem> navigationItems;
  final PageRouteInfo oppositeRoute;
  final bool isMarket;

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

    return AutoTabsScaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      routes: widget.navigationItems.map((item) => item.route).toList(),

      floatingActionButtonBuilder: (context, tabsRouter) =>
          tabsRouter.activeIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              shape: CircleBorder(
                side: BorderSide(
                  color: colorFromPage(widget.isMarket),
                  width: 4,
                ),
              ),

              onPressed: () {
                context.replaceRoute(widget.oppositeRoute);
              },
              child: Icon(
                widget.isMarket
                    ? HugeIcons.strokeRoundedStore01
                    : HugeIcons.strokeRoundedRestaurant03,
                color: colorFromPage(widget.isMarket),
                size: 35,
              ),
            )
          : null,
      bottomNavigationBuilder: (context, tabsRouter) {
        // The bottomNavigationBar is built using the tabsRouter's state.
        return NavigationBar(
          elevation: 4,
          shadowColor: const Color(0xFF000000).withValues(alpha: 0.02),
          backgroundColor: const Color(0xFFFFFFFF),
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: colorFromPage(widget.isMarket)),
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
                color: colorFromPage(widget.isMarket),
                icon: item.icon,
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
    required this.icon,
    required this.iconOn,
    required this.label,
    required this.isSelected,
    required this.color,
  });

  final IconData icon, iconOn;
  final String label;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      label: label,
      icon: isSelected
          ? HugeIcon(icon: iconOn, color: color)
          : HugeIcon(icon: icon, color: Color(0xFF969696)),
    );
  }
}

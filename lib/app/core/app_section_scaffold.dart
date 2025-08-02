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
    // final isLeft = widget.isMarket == false; // Not used in current build
    // We now use AutoTabsRouter to handle the logic internally.
    return AutoTabsScaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      routes: widget.navigationItems.map((item) => item.route).toList(),

      bottomNavigationBuilder: (context, tabsRouter) {
        // The bottomNavigationBar is built using the tabsRouter's state.
        return NavigationBar(
          elevation: 4,
          shadowColor: const Color(
            0xFF000000,
          ).withValues(alpha: 0.02), // Adjusted alpha value access
          backgroundColor: const Color(0xFFFFFFFF),
          indicatorColor: Colors.transparent,
          labelTextStyle: const WidgetStatePropertyAll(
            TextStyle(
              color: AppColors.mainAccent,
            ), // Ensure AppColors.mainAccent is defined
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
                icon: item.icon,
                iconOn: item.iconOn,
                label: item.label,
                isSelected: tabsRouter.activeIndex == index,
              ),
          ],
        );
      },
    );
    // The commented-out Stack/Positioned code for the swipe button is preserved below
    // return Stack(
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.only(
    //         left: isLeft ? 10 : 0,
    //         right: !isLeft ? 10 : 0,
    //       ),
    //       child: // ... (the AutoTabsScaffold part above would go here if not using the swipe button visually)
    //     ),
    //     Positioned(
    //       right: isLeft ? null : 10,
    //       left: !isLeft ? null : 10,
    //       top: MediaQuery.sizeOf(context).height / 2,
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.horizontal(
    //           left: !isLeft ? Radius.elliptical(30, 30) : Radius.zero,
    //           right: isLeft ? Radius.elliptical(30, 30) : Radius.zero,
    //         ),
    //         child: SizedBox(
    //           height: 100,
    //           width: 50,
    //           child: IconButton(
    //             onPressed: () {
    //               context.router.replace(widget.oppositeRoute);
    //             },
    //             icon: Icon(
    //               isLeft
    //                   ? Icons.swipe_right_alt_rounded
    //                   : Icons.swipe_left_alt_rounded,
    //               size: 50,
    //             ),
    //           ).colorize(Colors.red), // .colorize might need adjustment based on your UI package
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

/// The private icon widget used by the [AppSectionScaffold].
class _NavigationDestinationIcon extends StatelessWidget {
  const _NavigationDestinationIcon({
    required this.icon,
    required this.iconOn,
    required this.label,
    required this.isSelected,
  });

  final IconData icon, iconOn;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      label: label,
      icon: isSelected
          ? HugeIcon(icon: iconOn, color: AppColors.secondRestAccent)
          : HugeIcon(icon: icon, color: Color(0xFF969696)),
    );
  }
}

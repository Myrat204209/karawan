import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:karawan/app/core/core.dart';

// The NavigationItem class for GoRouter
class GoRouterNavigationItem {
  const GoRouterNavigationItem({
    required this.path,
    required this.icon,
    required this.iconOn,
    required this.label,
  });

  final String path;
  final IconData icon, iconOn;
  final String label;
}

Color colorFromPage(bool isMarket) {
  return isMarket ? AppColors.mainAccent : AppColors.restaurantAccent;
}

class GoRouterSectionScaffold extends StatefulWidget {
  const GoRouterSectionScaffold({
    super.key,
    required this.config,
    required this.child,
  });

  final SectionConfig config;
  final Widget child;

  @override
  State<GoRouterSectionScaffold> createState() =>
      _GoRouterSectionScaffoldState();
}

class _GoRouterSectionScaffoldState extends State<GoRouterSectionScaffold>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    for (int i = 0; i < widget.config.navigationItems.length; i++) {
      if (location.startsWith(widget.config.navigationItems[i].path)) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final location = GoRouterState.of(context).uri.path;
    final currentIndex = _getCurrentIndex(context);
    final isMarket = widget.config.appSection == AppSection.store;

    return Scaffold(
      body: widget.child,
      floatingActionButton: location == '/${widget.config.pathPrefix}/home'
          ? FloatingActionButton(
              backgroundColor: colorFromPage(isMarket),
              shape: const CircleBorder(),
              onPressed: () {
                context.go(widget.config.oppositePath);
              },
              elevation: 3,
              child: Icon(
                !isMarket
                    ? HugeIcons.strokeRoundedStore01
                    : HugeIcons.strokeRoundedRestaurant03,
                color: Colors.white,
                size: 25,
              ),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        elevation: 4,
        shadowColor: const Color(0xFF000000).withValues(alpha: 0.02),
        backgroundColor: const Color(0xFFFFFFFF),
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: colorFromPage(isMarket)),
        ),
        height: 85.h,
        selectedIndex: currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (index) {
          if (currentIndex != index) {
            context.go(widget.config.navigationItems[index].path);
          }
        },
        destinations: [
          for (final (index, item) in widget.config.navigationItems.indexed)
            _NavigationDestinationIcon(
              color: colorFromPage(isMarket),
              icon: item.icon,
              iconOn: item.iconOn,
              label: item.label,
              isSelected: currentIndex == index,
            ),
        ],
      ),
    );
  }
}

/// The private icon widget used by the [GoRouterSectionScaffold].
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
          : HugeIcon(icon: icon, color: const Color(0xFF969696)),
    );
  }
}

import 'package:app_ui/app_ui.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import 'page_cacher.dart';

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
  return isMarket ? AppColors.mainAccent : AppColors.secondRestAccent;
}

// GoRouter-compatible scaffold widget
class GoRouterSectionScaffold extends StatefulWidget {
  const GoRouterSectionScaffold({
    super.key,
    required this.navigationItems,
    required this.oppositePath,
    this.isMarket = false,
    required this.child,
  });

  final List<GoRouterNavigationItem> navigationItems;
  final String oppositePath;
  final bool isMarket;
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
    for (int i = 0; i < widget.navigationItems.length; i++) {
      if (location.startsWith(widget.navigationItems[i].path)) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final currentIndex = _getCurrentIndex(context);

    return Scaffold(
      body: widget.child,
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              shape: CircleBorder(
                side: BorderSide(
                  color: colorFromPage(widget.isMarket),
                  width: 4,
                ),
              ),
              onPressed: () {
                GetIt.I<PageCacher>().setRoute(
                  widget.isMarket ? PageType.restaurant : PageType.market,
                );
                context.go(widget.oppositePath);
              },
              child: Icon(
                !widget.isMarket
                    ? HugeIcons.strokeRoundedStore01
                    : HugeIcons.strokeRoundedRestaurant03,
                color: colorFromPage(widget.isMarket),
                size: 35,
              ),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        elevation: 4,
        shadowColor: const Color(0xFF000000).withValues(alpha: 0.02),
        backgroundColor: const Color(0xFFFFFFFF),
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: colorFromPage(widget.isMarket)),
        ),
        height: 85.h,
        selectedIndex: currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (index) {
          if (currentIndex != index) {
            context.go(widget.navigationItems[index].path);
          }
        },
        destinations: [
          for (final (index, item) in widget.navigationItems.indexed)
            _NavigationDestinationIcon(
              color: colorFromPage(widget.isMarket),
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
          : HugeIcon(icon: icon, color: Color(0xFF969696)),
    );
  }
}

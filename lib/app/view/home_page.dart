import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // Only include the active router.
      routes: const [
        // TODO: remove after finishing UI elements
        // StoreRouter(),
        RestaurantRouter(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: PageView(
            // The controller is still needed, but swiping will be disabled
            // as there's only one page.
            controller: PageController(initialPage: tabsRouter.activeIndex),
            onPageChanged: tabsRouter.setActiveIndex,
            children: const [
              // This is the outlet where AutoRoute will build the RestaurantBottomNavigation.
              KeepAlivePage(child: AutoRouter()),

              // TODO: remove after finishing UI elements
              // The Store page outlet is commented out.
              // KeepAlivePage(child: AutoRouter()),
            ],
          ),
        );
      },
    );
  }
}

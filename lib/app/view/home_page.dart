import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [StoreRouter(), RestaurantRouter()],
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;

        return Scaffold(
          body: DualSectionView(
            // Pass the two router outlets as pages.
            leftPage: KeepAlivePage(child: StoreRouterPage()),
            rightPage: KeepAlivePage(child: RestaurantRouterPage()),
            onPageChange: (index) {
              if (tabsRouter.activeIndex != index) {
                tabsRouter.setActiveIndex(index);
              }
            },
          ),
        );
      },
    );
  }
}

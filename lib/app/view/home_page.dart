import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget now correctly manages the direct child route from AppRouter.
    return AutoTabsRouter(
      routes: const [
        // This now correctly matches the child defined in your AppRouter.
        RestaurantBottomRoute(),

        // TODO: remove after finishing UI elements
        // When you add the Store back, you will uncomment this line.
        // StoreBottomRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: PageView(
            controller: PageController(initialPage: tabsRouter.activeIndex),
            onPageChanged: tabsRouter.setActiveIndex,
            children: [
              // The `child` provided by the builder is the currently active page,
              // which is the RestaurantBottomNavigation widget.
              KeepAlivePage(child: child),

              // TODO: remove after finishing UI elements
              // When you add the Store back, you will add its KeepAlivePage here.
            ],
          ),
        );
      },
    );
  }
}
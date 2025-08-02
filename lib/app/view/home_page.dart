import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/router/router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,

      routes: const [StoreBottomRoute(), RestaurantBottomRoute()],

      // builder: (context, child) {
      //   final tabsRouter = AutoTabsRouter.of(context);

      //   return Scaffold(
      //     body: PageView(
      //       // Connect the PageController to the router's state.
      //       controller: PageController(initialPage: tabsRouter.activeIndex),
      //       onPageChanged: tabsRouter.setActiveIndex,
      //       children: const [
      //         SizedBox(height: 100, width: 100, child: Text('120912019')),
      //         // This is the outlet where AutoRoute will build the Store section.
      //         // It is the placeholder for your StoreBottomNavigation widget.
      //         KeepAlivePage(child: AutoRouter()),

      //         // This is the outlet for the Restaurant section.
      //         KeepAlivePage(child: AutoRouter()),
      //       ],
      //     ),
      //   );
      // },
    );
  }
}

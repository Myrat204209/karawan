import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/features/features.dart';

part 'main_host_view.dart';

@RoutePage()
class MainHostPage extends StatelessWidget {
  const MainHostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        // The first page is our entire existing e-commerce app with its own
        // nested router and bottom navigation.
        AppBottomNavigation(),

        // The second page is the restaurant section.
        RestaurantPage(),
      ],
    );
    // return BlocProvider(
    //   create: (_) => MainHostBloc(
    //     mainHostRepository: MainHostRepository(
    //       // You'll likely inject this with get_it or another locator
    //       mainHostClient: MainHostClient(),
    //     ),
    //   )..add(const MainHostRequested()),
    //   child:
    //   const Scaffold(
    //     body: MainHostView(),
    //   ),
    // );
    // return const Scaffold(body: MainHostView());
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';
// Import your actual navigation shell widgets

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.router.push(StoreBottomRoute());
          },
          child: Text('Go to stores'),
        ),
      ),
      // StoreBottomNavigation(),

      // PageView(
      //   children: [
      //     // These are the two independent pages.
      //     const StoreBottomNavigation(),
      //     const RestaurantBottomNavigation(),
      //   ],
      // ),
    );
  }
}

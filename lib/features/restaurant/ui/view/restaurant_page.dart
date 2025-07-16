import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

part 'restaurant_view.dart';

@RoutePage()
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepOrange, // Different color for visibility
      body: Center(
        child: Text(
          'Restaurant Section',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      // body: RestaurantView(),
    );
    // return BlocProvider(
    //   create: (_) => RestaurantBloc(
    //     restaurantRepository: RestaurantRepository(
    //       // You'll likely inject this with get_it or another locator
    //       restaurantClient: RestaurantClient(),
    //     ),
    //   )..add(const RestaurantRequested()),
    //   child: const Scaffold(body: RestaurantView()),
    // );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RestaurantOrdersPage extends StatelessWidget {
  const RestaurantOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Restaurant Orders'),
      ),
    );
  }
}
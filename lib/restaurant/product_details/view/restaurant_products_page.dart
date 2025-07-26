import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/restaurant/features.dart';

@RoutePage()
class RestaurantProductsPage extends StatelessWidget {
  const RestaurantProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RestaurantProductsView();
  }
}

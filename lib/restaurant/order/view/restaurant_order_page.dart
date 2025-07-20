import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/restaurant/features.dart';

@RoutePage()
class RestaurantOrderPage extends StatelessWidget {
  const RestaurantOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RestaurantOrderView();
  }
}

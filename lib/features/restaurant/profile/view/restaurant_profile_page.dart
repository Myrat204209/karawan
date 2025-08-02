import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

@RoutePage()
class RestaurantProfilePage extends StatelessWidget {
  const RestaurantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RestaurantProfileView();
  }
}

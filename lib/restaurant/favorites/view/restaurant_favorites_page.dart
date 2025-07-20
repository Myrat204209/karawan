import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/restaurant/features.dart';

@RoutePage()
class RestaurantFavoritesPage extends StatelessWidget {
  const RestaurantFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RestaurantFavoritesView();
  }
}

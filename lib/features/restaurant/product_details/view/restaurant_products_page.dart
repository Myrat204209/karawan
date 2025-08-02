// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

@RoutePage()
class RestaurantProductsPage extends StatelessWidget {
  const RestaurantProductsPage({
    super.key,
    @PathParam('productId') required this.productId,
  });

  final String productId;
  @override
  Widget build(BuildContext context) {
    return RestaurantProductsView();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

class RestaurantProductsPage extends StatelessWidget {
  const RestaurantProductsPage({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    return RestaurantProductsView();
  }
}

import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

class MarketProductsPage extends StatelessWidget {
  const MarketProductsPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return MarketProductsView(productId: productId);
  }
}

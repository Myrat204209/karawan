import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ojak/features/market/market.dart';

@RoutePage()
class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MarketView();
  }
}

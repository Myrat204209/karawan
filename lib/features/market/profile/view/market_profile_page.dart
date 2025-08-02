import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

@RoutePage()
class MarketProfilePage extends StatelessWidget {
  const MarketProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MarketProfileView();
  }
}

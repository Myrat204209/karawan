import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StoreCartPage extends StatelessWidget {
  const StoreCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Store Orders'));
  }
}

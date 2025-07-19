import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/store/features.dart';

@RoutePage()
class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreHomeView();
  }
}

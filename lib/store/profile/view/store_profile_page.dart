import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/store/profile/profile.dart';

@RoutePage()
class StoreProfilePage extends StatelessWidget {
  const StoreProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProfileView();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/router/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      childWidget: SizedBox(
        width: 600 / 1.33,
        height: 200 / 1.33,
        child: Image.asset('assets/images/snail_slogan.png'),
      ),
      backgroundImage: Image.asset('assets/images/Vector.png'),
      setStateTimer: Duration(milliseconds: 1500),
      animationDuration: Duration(milliseconds: 2000),
      onAnimationEnd: () => context.router.replace(StoreRoute()),
    );
  }
}

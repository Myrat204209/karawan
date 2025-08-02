// import 'dart:async';

// import 'package:app_ui/app_ui.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:client/app/app.dart';
// import 'package:flutter/material.dart';

// @RoutePage()
// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   var _opacity = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     // Use a BlocProvider here to create and manage the AppBootstrapBloc
//     // for the lifecycle of this page.
//     _initializeAppAndNavigate();

//     // Trigger the fade-in animation
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) setState(() => _opacity = 1.0);
//     });
//   }

//   Future<void> _initializeAppAndNavigate() async {
//     // 1. Create two Futures: one for the minimum display time,
//     //    and one for determining the destination route from the BLoC.
//     final minimumDisplayTime = Future.delayed(
//       const Duration(milliseconds: 2000),
//     );
//     final destinationRoute = _getDestinationFromBloc();

//     // 2. Use Future.wait to run them concurrently.
//     //    This is much more efficient.
//     final results = await Future.wait([minimumDisplayTime, destinationRoute]);
//     final destination = results[1] as PageRouteInfo;

//     // 3. Navigate when both are complete.
//     if (mounted) {
//       context.router.replace(destination);
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedOpacity(
//           duration: const Duration(milliseconds: 1500),
//           opacity: _opacity,
//           child: Assets.images.logo.image(),
//         ),
//       ).colorize(Colors.white),
//     );
//   }
// }

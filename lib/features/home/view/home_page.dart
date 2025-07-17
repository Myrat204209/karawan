// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:karawan/features/features.dart';
// import 'package:slide_reveal_screen/slider_reveal_screen.dart';

// @RoutePage()
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   late final SlideRevealController _slideRevealController;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the controller from the slide_reveal_screen package
//     _slideRevealController = SlideRevealController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _slideRevealController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // The main layout is now controlled by the SlideRevealScreen widget
//     return SlideRevealScreen(
      
//       controller: _slideRevealController,

//       // The content revealed when you swipe right is the Restaurant section.
//       rightHiddenPage: const RestaurantPage(),

//       // This is the key parameter to allow swiping from anywhere on the screen.
//       // enableFullScreenGestures: true,
//       leftHiddenPage: const StorePage(),

//       // A placeholder can be shown while the page is loading or being revealed.
//       leftPlaceHolderWidget: const Center(child: CircularProgressIndicator()),
//       rightPlaceHolderWidget: const Center(child: CircularProgressIndicator()),

//       // The swipe-left gesture is disabled since we only have two sections.
//       isRightActive: false,

//       // The main content visible by default is the Store (e-commerce) section.
//       child: const StorePage(),
//     );
//   }
// }

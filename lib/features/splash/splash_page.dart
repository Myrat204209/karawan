import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/app.dart';

final _getIt = GetIt.I;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeAppAndNavigate();

    // Trigger the fade-in animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _opacity = 1.0);
    });
  }

  Future<void> _initializeAppAndNavigate() async {
    final minimumDisplayTime = Future.delayed(
      const Duration(milliseconds: 2000),
    );
    final destinationRoute = _getDestinationFromCache();

    final results = await Future.wait([minimumDisplayTime, destinationRoute]);
    final destination = results[1] as String;

    // 3. Navigate when both are complete.
    if (mounted) {
      context.go(destination);
    }
  }

  /// Listens to the BLoC stream and returns a Future that completes
  /// with the correct route when the BLoC reaches a final state.
  Future<String> _getDestinationFromCache() async {
    final pageCacher = _getIt.get<PageCacher>();
    switch (pageCacher.isMarketRoute()) {
      case null:
        return '/director';
      case true:
        return '/market/home';
      case false:
        return '/restaurant/home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1500),
          opacity: _opacity,
          child: Assets.images.logoDark.image(),
        ),
      ).colorize(Colors.white),
    );
  }
}

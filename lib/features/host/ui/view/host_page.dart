import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

@RoutePage()
class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1.0, // Start fully in the Market section
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    // Update the animation value based on the horizontal drag
    _controller.value -= details.primaryDelta! / screenWidth;
  }

  void _onDragEnd(DragEndDetails details) {
    // On drag end, "snap" to the nearest section
    if (_controller.value > 0.5) {
      _controller.forward(); // Snap to Market
    } else {
      _controller.reverse(); // Snap to Restaurant
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Calculate transforms based on animation value (0.0 to 1.0)
          final value = _controller.value;
          final scale = 0.8 + (0.2 * value);
          final offset = MediaQuery.sizeOf(context).width * (value - 1) * 0.7;

          return Stack(
            children: [
              // Bottom Layer: Restaurant Section
              const RestaurantPage(),

              // Top Layer: Market Section (moves with the animation)
              Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Perspective
                  ..translate(offset)
                  ..scale(scale),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(value == 1.0 ? 0 : 20),
                  child: const StorePage(), // Renamed from AppBottomNavigation
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

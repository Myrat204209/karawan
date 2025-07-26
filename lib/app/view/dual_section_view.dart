import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/app/app.dart';

class DualSectionView extends StatelessWidget {
  const DualSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DualSectionCubit>();
    final animationController = cubit.state.animationController;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        final value = animationController.value;
        final scale = 0.85 + (0.15 * (1 - value));
        final offset = MediaQuery.sizeOf(context).width * value;

        return Stack(
          children: [
            // The router outlet for the Restaurant section (bottom layer)
            const AutoRouter(),

            // The router outlet for the Store section (top layer, slides away)
            Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // Perspective
                ..translate(offset)
                ..scale(scale),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(value == 0.0 ? 0 : 20),
                child: const AutoRouter(),
              ),
            ),

            // The Draggable Handle
            Positioned(
              left: offset - 30, // Position handle relative to the sliding page
              top: MediaQuery.sizeOf(context).height / 2 - 50,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) => cubit.handleDragUpdate(
                  details.primaryDelta!,
                  MediaQuery.sizeOf(context).width,
                ),
                onHorizontalDragEnd: (_) => cubit.handleDragEnd(),
                child: Container(
                  // Your stretchable handle widget would go here
                  width: 60,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(Icons.drag_handle, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

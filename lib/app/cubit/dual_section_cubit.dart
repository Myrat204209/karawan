import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/animation.dart';

enum ActiveSection { store, restaurant }

class DualSectionState {
  final ActiveSection activeSection;
  final AnimationController animationController;

  const DualSectionState(this.activeSection, this.animationController);
}

class DualSectionCubit extends Cubit<DualSectionState> {
  DualSectionCubit(TickerProvider vsync)
      : super(
          DualSectionState(
            ActiveSection.store,
            AnimationController(
              vsync: vsync,
              duration: const Duration(milliseconds: 400),
            ),
          ),
        );

  void handleDragUpdate(double delta, double screenWidth) {
    state.animationController.value += delta / screenWidth;
  }

  void handleDragEnd() {
    if (state.animationController.value > 0.5) {
      state.animationController.forward();
      emit(DualSectionState(ActiveSection.restaurant, state.animationController));
    } else {
      state.animationController.reverse();
      emit(DualSectionState(ActiveSection.store, state.animationController));
    }
  }

  void setActiveSection(ActiveSection section) {
    if (section == ActiveSection.restaurant) {
      state.animationController.forward();
    } else {
      state.animationController.reverse();
    }
    emit(DualSectionState(section, state.animationController));
  }

  @override
  Future<void> close() {
    state.animationController.dispose();
    return super.close();
  }
}
import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/features/features.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeDataFetched>(_onDataFetched);
  }

  Future<void> _onDataFetched(
    HomeDataFetched event,
    Emitter<HomeState> emit,
  ) async {
    // Prevent duplicate requests
    if (state.status == HomeStatus.loading) return;

    emit(
      state.copyWith(status: HomeStatus.loading, activeSection: event.section),
    );

    // Your loading logic is now here, decoupled from the UI
    await Future.delayed(const Duration(milliseconds: 200));

    // In a real app, you would fetch data and then build widgets
    final nextItemIndex = state.items.length;
    final newItem = HomeSliderItem(
      promoItems: [Assets.images.banner.image(), Assets.images.banner2.image()],
    );

    emit(
      state.copyWith(
        status: HomeStatus.success,
        items: [...state.items, newItem],
      ),
    );
  }
}

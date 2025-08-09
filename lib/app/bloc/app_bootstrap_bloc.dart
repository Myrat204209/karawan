import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Note: Version check and language/auth repos are placeholders; you said 'No need' for those now.

part 'app_bootstrap_event.dart';
part 'app_bootstrap_state.dart';

class AppBootstrapBloc extends Bloc<AppBootstrapEvent, AppBootstrapState> {
  AppBootstrapBloc() : super(const AppBootstrapState()) {
    on<AppStarted>(_onStarted);
  }

  Future<void> _onStarted(
    AppStarted event,
    Emitter<AppBootstrapState> emit,
  ) async {
    try {
      // For now, minimal flow since you said 'No need' for version/language/auth wiring yet.
      emit(state.copyWith(status: AppStatus.authenticated));
    } catch (e, s) {
      log('Bootstrap failed', error: e, stackTrace: s);
      emit(
        state.copyWith(status: AppStatus.failure, errorMessage: e.toString()),
      );
    }
  }
}

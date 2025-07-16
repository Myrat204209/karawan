// import 'dart:async';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'main_host_event.dart';
// part 'main_host_state.dart';

// class MainHostBloc extends Bloc<MainHostEvent, MainHostState> {
//   MainHostBloc({required MainHostRepository mainHostRepository})
//       : _mainHostRepository = mainHostRepository,
//         super(const MainHostState.initial()) {
//     on<MainHostRequested>(_onRequested);
//     on<MainHostRefreshRequested>(_onRefresh);
//   }

//   final MainHostRepository _mainHostRepository;

//   FutureOr<void> _onRequested(
//     MainHostRequested event,
//     Emitter<MainHostState> emit,
//   ) async {
//     try {
//       emit(state.copyWith(status: MainHostStatus.loading));
//       final mainHosts = await _mainHostRepository.getMainHosts();
//       emit(
//         state.copyWith(
//           status: MainHostStatus.success,
//           mainHosts: mainHosts,
//         ),
//       );
//     } catch (error, stackTrace) {
//       emit(state.copyWith(status: MainHostStatus.failure));
//       addError(error, stackTrace);
//     }
//   }

//   void _onRefresh(
//     MainHostRefreshRequested event,
//     Emitter<MainHostState> emit,
//   ) {
//     emit(state.copyWith(status: MainHostStatus.refreshing));
//     add(const MainHostRequested());
//   }
// }
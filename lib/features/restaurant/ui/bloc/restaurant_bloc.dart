// import 'dart:async';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'restaurant_event.dart';
// part 'restaurant_state.dart';

// class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
//   RestaurantBloc({required RestaurantRepository restaurantRepository})
//       : _restaurantRepository = restaurantRepository,
//         super(const RestaurantState.initial()) {
//     on<RestaurantRequested>(_onRequested);
//     on<RestaurantRefreshRequested>(_onRefresh);
//   }

//   final RestaurantRepository _restaurantRepository;

//   FutureOr<void> _onRequested(
//     RestaurantRequested event,
//     Emitter<RestaurantState> emit,
//   ) async {
//     try {
//       emit(state.copyWith(status: RestaurantStatus.loading));
//       final restaurants = await _restaurantRepository.getRestaurants();
//       emit(
//         state.copyWith(
//           status: RestaurantStatus.success,
//           restaurants: restaurants,
//         ),
//       );
//     } catch (error, stackTrace) {
//       emit(state.copyWith(status: RestaurantStatus.failure));
//       addError(error, stackTrace);
//     }
//   }

//   void _onRefresh(
//     RestaurantRefreshRequested event,
//     Emitter<RestaurantState> emit,
//   ) {
//     emit(state.copyWith(status: RestaurantStatus.refreshing));
//     add(const RestaurantRequested());
//   }
// }
// part of 'restaurant_bloc.dart';

// enum RestaurantStatus { initial, loading, success, failure, refreshing }

// class RestaurantState extends Equatable {
//   const RestaurantState({
//     required this.status,
//     this.restaurants = const [],
//   });

//   const RestaurantState.initial() : this(status: RestaurantStatus.initial);

//   final RestaurantStatus status;
//   final List<RestaurantItem> restaurants;

//   @override
//   List<Object> get props => [status, restaurants];

//   RestaurantState copyWith({
//     RestaurantStatus? status,
//     List<RestaurantItem>? restaurants,
//   }) {
//     return RestaurantState(
//       status: status ?? this.status,
//       restaurants: restaurants ?? this.restaurants,
//     );
//   }
// }
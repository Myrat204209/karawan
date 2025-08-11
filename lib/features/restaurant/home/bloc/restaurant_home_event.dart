part of 'restaurant_home_bloc.dart';

abstract class RestaurantHomeEvent extends Equatable {
  const RestaurantHomeEvent();

  @override
  List<Object?> get props => [];
}

class RestaurantHomeInitialized extends RestaurantHomeEvent {
  const RestaurantHomeInitialized();
}

class RestaurantHomeLoadMore extends RestaurantHomeEvent {
  const RestaurantHomeLoadMore();
}

class RestaurantHomeRefresh extends RestaurantHomeEvent {
  const RestaurantHomeRefresh();
}

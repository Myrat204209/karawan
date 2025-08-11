part of 'restaurant_home_bloc.dart';

enum RestaurantHomeStatus { initial, loading, loadingMore, success, failure }

class RestaurantHomeState extends Equatable {
  const RestaurantHomeState({
    this.status = RestaurantHomeStatus.initial,
    this.products = const [],
    this.currentPage = 0,
    this.hasReachedMax = false,
    this.errorMessage,
  });

  final RestaurantHomeStatus status;
  final List<ProductTemplate> products;
  final int currentPage;
  final bool hasReachedMax;
  final String? errorMessage;

  RestaurantHomeState copyWith({
    RestaurantHomeStatus? status,
    List<ProductTemplate>? products,
    int? currentPage,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return RestaurantHomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    products,
    currentPage,
    hasReachedMax,
    errorMessage,
  ];
}

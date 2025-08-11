import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/repositories/restaurant_repository.dart';

part 'restaurant_home_event.dart';
part 'restaurant_home_state.dart';

class RestaurantHomeBloc
    extends Bloc<RestaurantHomeEvent, RestaurantHomeState> {
  RestaurantHomeBloc({required RestaurantRepository repository})
    : _repository = repository,
      super(const RestaurantHomeState()) {
    on<RestaurantHomeInitialized>(_onInitialized);
    on<RestaurantHomeLoadMore>(_onLoadMore);
    on<RestaurantHomeRefresh>(_onRefresh);
  }

  final RestaurantRepository _repository;

  Future<void> _onInitialized(
    RestaurantHomeInitialized event,
    Emitter<RestaurantHomeState> emit,
  ) async {
    emit(state.copyWith(status: RestaurantHomeStatus.loading));

    try {
      final initialProducts = await _repository.getProducts(page: 0);
      emit(
        state.copyWith(
          status: RestaurantHomeStatus.success,
          products: initialProducts,
          currentPage: 0,
          hasReachedMax: initialProducts.length < _repository.pageSize,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: RestaurantHomeStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadMore(
    RestaurantHomeLoadMore event,
    Emitter<RestaurantHomeState> emit,
  ) async {
    if (state.hasReachedMax ||
        state.status == RestaurantHomeStatus.loadingMore) {
      return;
    }

    emit(state.copyWith(status: RestaurantHomeStatus.loadingMore));

    try {
      final nextPage = state.currentPage + 1;
      final newProducts = await _repository.getProducts(page: nextPage);

      if (newProducts.isEmpty) {
        emit(
          state.copyWith(
            status: RestaurantHomeStatus.success,
            hasReachedMax: true,
          ),
        );
      } else {
        final allProducts = [...state.products, ...newProducts];
        emit(
          state.copyWith(
            status: RestaurantHomeStatus.success,
            products: allProducts,
            currentPage: nextPage,
            hasReachedMax: newProducts.length < _repository.pageSize,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: RestaurantHomeStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onRefresh(
    RestaurantHomeRefresh event,
    Emitter<RestaurantHomeState> emit,
  ) async {
    add(RestaurantHomeInitialized());
  }
}

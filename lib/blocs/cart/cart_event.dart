part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class CartInitialized extends CartEvent {}

final class CartQuantityUpdated extends CartEvent {
  const CartQuantityUpdated({required this.productId, required this.quantity})
    : bulkItems = null;

  const CartQuantityUpdated.bulk(this.bulkItems)
    : productId = null,
      quantity = null;

  final String? productId;
  final int? quantity;
  final Map<String, int>? bulkItems;

  @override
  List<Object?> get props => [productId, quantity, bulkItems];
}

final class CartCleared extends CartEvent {}

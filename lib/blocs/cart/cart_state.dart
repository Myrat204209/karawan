part of 'cart_bloc.dart';

enum CartStatus { initial, idle }

final class CartState extends Equatable {
  const CartState({this.status = CartStatus.initial, this.items = const {}});

  final CartStatus status;
  final Map<String, int> items;

  int get totalQuantity => items.values.fold(0, (sum, q) => sum + q);

  CartState copyWith({CartStatus? status, Map<String, int>? items}) {
    return CartState(status: status ?? this.status, items: items ?? this.items);
  }

  @override
  List<Object?> get props => [status, items];
}

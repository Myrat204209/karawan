import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required CartRepository repository, required AppSection section})
    : _repository = repository,
      _section = section,
      super(const CartState()) {
    on<CartInitialized>(_onInitialized);
    on<CartQuantityUpdated>(_onQuantityUpdated);
    on<CartCleared>(_onCleared);
  }

  final CartRepository _repository;
  final AppSection _section;
  VoidCallback? _listenerDispose;

  Future<void> _onInitialized(
    CartInitialized event,
    Emitter<CartState> emit,
  ) async {
    // Seed from current storage
    emit(state.copyWith(items: _repository.getCart()));

    // Wire listenable to update state on external changes
    _listenerDispose?.call();
    _listenerDispose = () {
      _repository.cartListenable.removeListener(_onCartChanged);
    };
    _repository.cartListenable.addListener(_onCartChanged);
  }

  void _onCartChanged() {
    final latest = _repository.getCart();
    log('Cart changed (${_section.name}): ${latest.length} items');
    add(CartQuantityUpdated.bulk(latest));
  }

  Future<void> _onQuantityUpdated(
    CartQuantityUpdated event,
    Emitter<CartState> emit,
  ) async {
    if (event.bulkItems != null) {
      emit(state.copyWith(items: event.bulkItems));
      return;
    }
    await _repository.updateQuantity(event.productId!, event.quantity!);
    emit(state.copyWith(items: _repository.getCart()));
  }

  Future<void> _onCleared(CartCleared event, Emitter<CartState> emit) async {
    await _repository.clear();
    emit(state.copyWith(items: const {}));
  }

  @override
  Future<void> close() {
    _repository.cartListenable.removeListener(_onCartChanged);
    _listenerDispose?.call();
    return super.close();
  }
}

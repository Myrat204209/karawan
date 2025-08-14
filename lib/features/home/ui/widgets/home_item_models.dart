// Suggested: Create a new file for these models, e.g., home_item_model.dart

// A sealed class to represent any item on the home screen
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/widgets.dart' show Widget;

@immutable
sealed class HomeItem extends Equatable {
  const HomeItem();
}

class HomeSliderItem extends HomeItem {
  final List<Widget> promoItems;
  const HomeSliderItem({required this.promoItems});

  @override
  List<Object> get props => [promoItems];
}

class HomeGridItem extends HomeItem {
  final String title;
  final List<ProductTemplate> products;
  const HomeGridItem({required this.title, required this.products});

  @override
  List<Object> get props => [title, products];
}

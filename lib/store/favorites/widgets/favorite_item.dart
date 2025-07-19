import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, this.title, this.description, this.price});
  final String? title;
  final String? description;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: title,
      description: description,
      price: price,
    );
  }
}

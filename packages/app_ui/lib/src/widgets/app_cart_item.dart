// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({super.key, this.title, this.description, this.price});

  final String? title;
  final String? description;
  final double? price;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      description: description,
      title: title,
      price: price,
      isCart: true,
    );
  }
}

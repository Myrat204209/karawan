import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

class HouseSelectionView extends StatelessWidget {
  const HouseSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [PropertyCard(), PropertyCard()],
    );
  }
}

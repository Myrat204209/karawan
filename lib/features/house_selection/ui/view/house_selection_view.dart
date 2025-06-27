import 'package:flutter/material.dart';
import 'package:ojak/features/features.dart';

class HouseSelectionView extends StatelessWidget {
  const HouseSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PropertyCard(),
        PropertyCard()
      ],
    );
  }
}

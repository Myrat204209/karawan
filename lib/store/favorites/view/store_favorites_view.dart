import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:karawan/store/features.dart';

class StoreFavoritesView extends StatelessWidget {
  const StoreFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Halanlarym',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => FavoriteItem(),
            separatorBuilder: (context, index) => SizedBox(height: 10),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15).paddingOnly(top: 15);
  }
}

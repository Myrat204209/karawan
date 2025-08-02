import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MarketFavoritesView extends StatelessWidget {
  const MarketFavoritesView({super.key});

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
            itemBuilder: (context, index) => AppFavoriteItem(),
            separatorBuilder: (context, index) => SizedBox(height: 10),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15).paddingOnly(top: 15);
  }
}

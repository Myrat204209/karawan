import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class RestaurantOrderView extends StatelessWidget {
  const RestaurantOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Sebedim',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) => AppCartItem(),
            separatorBuilder: (context, index) => SizedBox(height: 10),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15).paddingOnly(top: 15);
  }
}

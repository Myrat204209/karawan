// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantProductsView extends StatelessWidget {
  const RestaurantProductsView({super.key, this.rating = 5.0});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  AppMainImage(
                    image: Assets.images.doner.image(fit: BoxFit.cover),
                    onLiked: () {},
                  ),
                  ListTile(
                    leading: Text(
                      'Doner Kebap',
                      style: AppTextStyle.text()
                          .withFontSize(22.sp)
                          .semiBold()
                          .withColor(AppColors.grey),
                    ),
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    trailing: AppInputQuantity(onAdd: () {}, onRemove: () {}),
                  ),
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: AppColors.mainAccent, size: 25),
                      Text(
                        rating.toStringAsFixed(1),
                        style: AppTextStyle.text()
                            .withFontSize(17.sp)
                            .medium()
                            .withColor(Colors.black),
                      ),
                    ],
                  ),

                  Text(
                    'Mazmuny',
                    style: AppTextStyle.text().xl().semiBold().withColor(
                      Colors.black,
                    ),
                  ),
                  Text(
                    'Stay refreshed with our ultra-pure, mineral-balanced water sourced from natural springs. Perfectly sized for on-the-go hydration, each bottle is BPA-free, recyclable, and sealed for freshness.',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.text().sm().regular().withColor(
                      AppColors.grey,
                    ),
                  ),
                  AppCategoryGrid(title: 'In taze harytlar', itemCount: 4),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Column(children: [Text('Jemi'), Text('20.00 TMT')]),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondRestAccent,
                  ),
                  child: Text('Sebede Gos'),
                ),
              ),
            ],
          ).paddingAll(10).colorize(Colors.white),
        ],
      ).paddingSymmetric(horizontal: 15.w),
    );
  }
}

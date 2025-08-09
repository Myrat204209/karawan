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
      backgroundColor: const Color(0xFFFBFBFD),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  AppCategoryGrid(
                    title: 'In taze harytlar',
                    itemCount: 4,
                    section: AppSection.restaurant,
                    onProductPressed: (index) {
                      // Handle product selection
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            spacing: 20,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jemi',
                    style: AppTextStyle.text().sm().medium().withColor(
                      Colors.black,
                    ),
                  ),
                  Text(
                    'TMT 20.00',
                    style: AppTextStyle.text().md().semiBold().withColor(
                      Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // showModalBottomSheet(
                    //   context: context,

                    //   builder: (context) =>
                    //       SizedBox(height: 200, child: Text('BottomSheed')),
                    // );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          child: Column(
                            spacing: 25,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                shape: CircleBorder(),
                                color: AppColors.secondRestAccent,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 100,
                                ),
                              ),

                              Text(
                                'Hormatly müşderi saýlan harydyňyz sebede goş!',
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.text()
                                    .md()
                                    .medium()
                                    .withColor(Colors.black),
                              ),
                            ],
                          ).paddingSymmetric(vertical: 50, horizontal: 20),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.secondRestAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Sebede Gos'),
                ),
              ),
            ],
          ).paddingAll(10).colorize(Colors.white),
        ],
      ).paddingSymmetric(horizontal: 15.w, vertical: 10),
    );
  }
}

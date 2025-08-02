import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:input_quantity/input_quantity.dart';

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppMainImage(
                    image: Assets.images.doner.image(fit: BoxFit.cover),
                    onLiked: () {},
                  ),
                  ListTile(
                    leading: Text(
                      'Doner Kebap',
                      style: AppTextStyle.text()
                          .withFontSize(20.sp)
                          .semiBold()
                          .withColor(Colors.black),
                    ),

                    contentPadding: EdgeInsets.all(0),
                    trailing: InputQty.int(
                      decoration: QtyDecorationProps(
                        border: OutlineInputBorder(
                          gapPadding: 19,
                          borderRadius: kCircular20Border,
                          borderSide: BorderSide(color: Colors.transparent),
                        ),

                        // btnColor: ,
                        btnColor: const Color(0xFFF3F3F3),
                        iconColor: Color(0xFFD7D7D7),
                        fillColor: const Color(0xFFF3F3F3),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 8,
                        ),
                        borderShape: BorderShapeBtn.circle,
                        minusBtn: Icon(
                          HugeIcons.strokeRoundedArrowLeft01,
                          size: 30,
                        ),
                        plusBtn: Icon(
                          HugeIcons.strokeRoundedArrowRight01,
                          size: 30,
                        ),
                      ),

                      initVal: 1,
                      minVal: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 25),
                      Text(
                        rating.toStringAsFixed(1),
                        style: AppTextStyle.text()
                            .withFontSize(17.sp)
                            .medium()
                            .withColor(Colors.black),
                      ),
                    ],
                  ),
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
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}

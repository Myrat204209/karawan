import 'package:app_ui/app_ui.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSlider extends StatelessWidget {
  final List<Widget> promoItems;

  const AppSlider({super.key, required this.promoItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: promoItems,
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),

            viewportFraction: 388 / 428,
            aspectRatio: 388.w / 155.h,

            enlargeCenterPage: true,
            enlargeFactor: 0.25,

            onPageChanged: (index, reason) {},
          ),
        ),
        // You can add your indicators back here
      ],
    ).paddingSymmetric(vertical: 15);
  }
}

extension AppSliderSliver on AppSlider {
  static Widget sliver({required List<Widget> promoItems}) {
    return SliverToBoxAdapter(child: AppSlider(promoItems: promoItems));
  }
}

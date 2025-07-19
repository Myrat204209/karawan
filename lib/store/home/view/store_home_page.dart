import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AppStatusBar(
          onAddressTap: () {},
          onNotificationTap: () {},
          onBookmarkTap: () {},
          onSearchTap: () {},
        ),
        AppBanner(imageUrls: [], onButtonPressed: () {}, onImageTap: () {}),

        AppCarousel(carouselImages: [], carouselCount: 4),
        AppSlider(promoItems: buildPromoItems()),
        AppCategoryGrid(title: 'Jitter', itemCount: 5),
      ],
    );
  }
}

List<Widget> buildPromoItems() {
  return [
    // Example Banner 1
    Container(
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Coupon 1: -10%')),
    ).paddingSymmetric(horizontal: 10),
    // Example Banner 2
    Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Special Offer!')),
    ).paddingSymmetric(horizontal: 10),
    // Example Banner 3
    Container(
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Buy 1 Get 1 Free')),
    ).paddingSymmetric(horizontal: 10),
    // Add more banners...
  ];
}

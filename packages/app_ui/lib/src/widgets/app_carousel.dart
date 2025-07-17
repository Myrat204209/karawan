// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart' show kCircular15Border;
import 'package:flutter/material.dart';

class AppCarousel extends StatelessWidget {
  const AppCarousel({
    super.key,
    required this.carouselImages,
    required this.carouselCount,
    this.onImageTap,
  });

  final List<String> carouselImages;
  final int carouselCount;
  final VoidCallback? onImageTap;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 360 / 135,
        child: CarouselView(
          itemExtent: 115,
          shrinkExtent: 100,
          enableSplash: true,
          itemSnapping: true,
          shape: RoundedRectangleBorder(borderRadius: kCircular15Border),
          scrollDirection: Axis.horizontal,
          children: List.generate(
            5,
            (index) => Container(
              height: 135,
              color: Colors.red[100 * (index % 9 + 1)],
              alignment: Alignment.center,
              child: Text(index.toString()),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  final List<Widget> promoItems;

  const AppSlider({super.key, required this.promoItems});

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  int _currentIndex = 0;
  final _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 355 / 195,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CarouselSlider(
                items: widget.promoItems,
                controller: _carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  viewportFraction: 0.98,
                  enlargeCenterPage: true,
                  enlargeFactor: 0,
                  aspectRatio: 355 / 172,

                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),

            _buildIndicators(),
          ],
        ),
      ).paddingAll(10),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          widget.promoItems.asMap().entries.map((entry) {
            int index = entry.key;
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(index),
              child: Container(
                width: _currentIndex == index ? 18.0 : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape:
                      _currentIndex == index
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                  borderRadius:
                      _currentIndex == index ? BorderRadius.circular(5) : null,
                  color:
                      _currentIndex == index
                          ? Colors.orangeAccent
                          : Colors.grey,
                ),
              ),
            );
          }).toList(),
    );
  }
}

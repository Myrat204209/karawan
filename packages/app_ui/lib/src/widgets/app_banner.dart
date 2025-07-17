// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    super.key,
    required this.imageUrls,
    required this.onButtonPressed,
    required this.onImageTap,
  });

  final List<String> imageUrls;
  final VoidCallback onButtonPressed;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 362 / 133,
        child: InkWell(
          onTap: onImageTap,
          child: AnimatedContainer(
            onEnd: () {},
            duration: const Duration(milliseconds: 300),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: kCircular15Border,
                color: AppColors.majorAccent,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: OutlinedButton(
                  onPressed: onButtonPressed,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: kCircular15Border),
                    ),
                  ),
                  child: Text(
                    'Применить',
                    style: AppTextStyle.text().description().withColor(
                      Colors.deepPurple,
                    ),
                  ),
                ).paddingAll(10),
              ),
            ),
          ),
        ),
      ).paddingAll(10),
    );
  }
}

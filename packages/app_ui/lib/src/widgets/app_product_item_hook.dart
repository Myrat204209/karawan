// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppProductItemHook extends HookWidget {
  const AppProductItemHook({
    super.key,
    required this.onGridPressed,
    required this.onCartAdded,
    required this.image,
    required this.name,
    this.price = 30.00,
    required this.description,
    required this.rating,
    this.productId,
    this.section,
    this.onFavoriteToggle,
  });

  final Widget image;
  final VoidCallback? onGridPressed;
  final VoidCallback? onCartAdded;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String? productId;
  final AppSection? section;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    // Use the favorites hook if productId and section are provided
    final isFavorite =
        productId != null && section != null
            ? useIsFavorite(productId!, section!)
            : false;

    // Optimistic update state
    final optimisticState = useState<bool?>(null);
    final isOptimistic = optimisticState.value != null;
    final displayFavorite = isOptimistic ? optimisticState.value! : isFavorite;

    return InkWell(
      onTap: onGridPressed ?? () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: kCircular15Border,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 14.1,
              blurStyle: BlurStyle.solid,
              color: Color(0x00000000).withValues(alpha: 0.05),
            ),
          ],
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: kCircular15Border,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    image,
                    if (productId != null && section != null)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: GestureDetector(
                          onTap: () async {
                            // Optimistic update
                            optimisticState.value = !isFavorite;

                            // Call the toggle callback
                            onFavoriteToggle?.call();

                            // Reset optimistic state after a short delay
                            Future.delayed(
                              const Duration(milliseconds: 100),
                              () {
                                optimisticState.value = null;
                              },
                            );
                          },
                          child: AppActionIcon(
                            icon:
                                displayFavorite
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                            onTap: () {}, // Handled by GestureDetector
                            isSmall: true,
                            color:
                                displayFavorite
                                    ? AppColors.getSectionAccent(section!)
                                    : AppColors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: AppTextStyle.text()
                                  .withFontSize(14.sp)
                                  .semiBold()
                                  .withColor(Colors.black),
                            ),
                          ),
                          Text(
                            'TMT ${price.toStringAsFixed(2)}',
                            style: AppTextStyle.text()
                                .semiBold()
                                .withFontSize(14.sp)
                                .withColor(
                                  section != null
                                      ? AppColors.getSectionAccent(section!)
                                      : AppColors.secondRestAccent,
                                ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          description,
                          softWrap: true,
                          style: AppTextStyle.text().copyWith(
                            color: Color(0xFF464646),
                            fontSize: 9.sp,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 15),
                            Text(
                              rating.toStringAsFixed(1),
                              style: AppTextStyle.text()
                                  .withFontSize(13.sp)
                                  .medium()
                                  .withColor(Colors.black),
                            ),
                            Spacer(),
                            OutlinedButton(
                              onPressed: onCartAdded ?? () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    section != null
                                        ? AppColors.getSectionAccent(section!)
                                        : AppColors.secondRestAccent,
                                side: BorderSide(color: Colors.transparent),
                                minimumSize: Size(76.w, 21),
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

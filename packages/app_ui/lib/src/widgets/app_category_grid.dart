// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCategoryGrid extends HookWidget {
  final String title;
  final int itemCount;
  final VoidCallback? onGridPressed;

  final Function(String)? onFavoritePressed;

  const AppCategoryGrid({
    super.key,
    required this.title,
    this.onGridPressed,
    required this.itemCount,
    this.onFavoritePressed,
  });
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.text().md().semiBold().withColor(
                    Colors.black,
                  ),
                ),
                // Text(
                //   'Seretmek',
                //   style: AppTextStyle.text().medium().withColor(
                //     section == AppSection.market
                //         ? AppColors.mainAccent
                //         : AppColors.restaurantAccent,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          sliver: SliverGrid.builder(
            itemCount: itemCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 175 / 210,
            ),
            itemBuilder: (context, index) {
              return AppProductItem(
                onGridPressed: onGridPressed,
                image: Assets.images.meals.values[index % 4].image(
                  fit: BoxFit.contain,
                ),
                name: 'Doner Kebap',
                price: 20.0,
                rating: 4.5,
                onCartAdded: () {},
                description:
                    'Product designers who focuses on simplicity & usability',
                productId: '2',
                onFavoriteToggle: () {
                  onFavoritePressed?.call('2');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

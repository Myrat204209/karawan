// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCategoryGrid extends StatelessWidget {
  final String title;
  final int itemCount;
  final VoidCallback? onGridPressed;
  final Function(int)? onProductPressed;
  final String section;
  final bool _isSliver;

  const AppCategoryGrid({
    super.key,
    required this.title,
    this.onGridPressed,
    this.onProductPressed,
    required this.itemCount,
    this.section = 'market',
  }) : _isSliver = false;

  const AppCategoryGrid.sliver({
    super.key,
    required this.title,
    this.onGridPressed,
    this.onProductPressed,
    required this.itemCount,
    this.section = 'market',
  }) : _isSliver = true;

  @override
  Widget build(BuildContext context) {
    if (_isSliver) {
      return SliverMainAxisGroup(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.text().lg().bold().withColor(
                      Colors.black,
                    ),
                  ),
                  Text(
                    'Seretmek',
                    style: AppTextStyle.text().medium().withColor(
                      AppColors.mainAccent,
                    ),
                  ),
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
                return AppProductItemEnhanced(
                  onGridPressed:
                      onProductPressed != null
                          ? () => onProductPressed!(index)
                          : onGridPressed,
                  image: Assets.images.meals.values[index % 4].image(
                    fit: BoxFit.contain,
                  ),
                  name:
                      '${section == 'market' ? 'Market' : 'Restaurant'} Product ${index + 1}',
                  price: (index + 1) * (section == 'market' ? 5.0 : 8.0),
                  rating: 4.5,
                  description:
                      '${section == 'market' ? 'Market' : 'Restaurant'} product description ${index + 1}',
                  productId: '${section}_product_${index + 1}',
                  section: section,
                  imagePath: 'packages/app_ui/assets/images/meals/meal_${(index % 4) + 1}.png',
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.text().lg().bold().withColor(
                    Colors.black,
                  ),
                ),
                Text(
                  'Seretmek',
                  style: AppTextStyle.text().medium().withColor(
                    AppColors.mainAccent,
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 175 / 210,
            ),
            itemBuilder: (context, index) {
              return AppProductItemEnhanced(
                onGridPressed:
                    onProductPressed != null
                        ? () => onProductPressed!(index)
                        : onGridPressed,
                image: Assets.images.meals.values[index % 4].image(
                  fit: BoxFit.contain,
                ),
                name:
                    '${section == 'market' ? 'Market' : 'Restaurant'} Product ${index + 1}',
                price: (index + 1) * (section == 'market' ? 5.0 : 8.0),
                rating: 4.5,
                description:
                    '${section == 'market' ? 'Market' : 'Restaurant'} product description ${index + 1}',
                productId: '${section}_product_${index + 1}',
                section: section,
                imagePath:
                    'packages/app_ui/assets/images/meals/meal_${(index % 4) + 1}.png',
              );
            },
          ),
        ],
      );
    }
  }
}

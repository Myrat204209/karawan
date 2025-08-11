// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCategoryGrid extends HookWidget {
  final String title;
  final int itemCount;
  final VoidCallback? onGridPressed;
  final bool _isSliver;
  final Function(String)? onFavoritePressed;
  final List<ProductTemplate>? products;
  final AppSection? section;

  const AppCategoryGrid({
    super.key,
    required this.title,
    this.onGridPressed,
    required this.itemCount,
    this.onFavoritePressed,
    this.products,
    this.section,
  }) : _isSliver = false;

  const AppCategoryGrid.sliver({
    super.key,
    required this.title,
    this.onGridPressed,
    required this.itemCount,
    this.onFavoritePressed,
    this.products,
    this.section,
  }) : _isSliver = true;

  @override
  Widget build(BuildContext context) {
    if (_isSliver) {
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
                // Use products if provided, otherwise use default data
                final product =
                    products != null && index < products!.length
                        ? products![index]
                        : null;

                return AppProductItemHook(
                  onGridPressed: onGridPressed,
                  image:
                      product != null
                          ? Image.asset(product.imagePath, fit: BoxFit.cover)
                          : Assets.images.meals.values[index % 4].image(
                            fit: BoxFit.contain,
                          ),
                  name: product?.name ?? 'Doner Kebap',
                  price: product?.price ?? 20.0,
                  rating: product?.rating ?? 4.5,
                  onCartAdded: () {},
                  description:
                      product?.description ??
                      'Product designers who focuses on simplicity & usability',
                  productId: product?.id,
                  section: section,
                  onFavoriteToggle:
                      product != null && section != null
                          ? () {
                            // Dispatch BLoC event for favorite toggle
                            onFavoritePressed?.call(product.id);
                          }
                          : null,
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
              // Use products if provided, otherwise use default data
              final product =
                  products != null && index < products!.length
                      ? products![index]
                      : null;

              return AppProductItemHook(
                onGridPressed: onGridPressed,
                image:
                    product != null
                        ? Image.asset(product.imagePath, fit: BoxFit.cover)
                        : Assets.images.meals.values[index % 4].image(
                          fit: BoxFit.contain,
                        ),
                name: product?.name ?? 'Doner Kebap',
                price: product?.price ?? 20.0,
                rating: product?.rating ?? 4.5,
                onCartAdded: () {},
                description:
                    product?.description ??
                    'Product designers who focuses on simplicity & usability',
                productId: product?.id,
                section: section,
                onFavoriteToggle:
                    product != null && section != null
                        ? () {
                          // Dispatch BLoC event for favorite toggle
                          onFavoritePressed?.call(product.id);
                        }
                        : null,
              );
            },
          ),
        ],
      );
    }
  }
}

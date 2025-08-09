// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCategoryGrid extends StatelessWidget {
  const AppCategoryGrid({
    super.key,
    required this.title,
    required this.itemCount,
    required this.section,
    required this.onProductPressed,
  });

  final String title;
  final int itemCount;
  final AppSection section;
  final ValueChanged<int> onProductPressed;

  @override
  Widget build(BuildContext context) {
    final products = getProductsBySection(section);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            title,
            style: AppTextStyle.text().lg().bold().withColor(Colors.black),
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.63,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index >= products.length) {
              return const SizedBox.shrink();
            }

            final product = products[index];
            return AppProductItemEnhanced(
              onGridPressed: () => onProductPressed(index),
              image: Image.asset(product.imagePath, fit: BoxFit.cover),
              name: product.name,
              price: product.price,
              description: product.description,
              rating: product.rating,
              productId: product.id,
              section: product.section,
              imagePath: product.imagePath,
            );
          },
        ),
      ],
    );
  }
}

extension AppCategoryGridSliver on AppCategoryGrid {
  static Widget sliver({
    required String title,
    required int itemCount,
    required AppSection section,
    required ValueChanged<int> onProductPressed,
  }) {
    return SliverToBoxAdapter(
      child: AppCategoryGrid(
        title: title,
        itemCount: itemCount,
        section: section,
        onProductPressed: onProductPressed,
      ),
    );
  }
}

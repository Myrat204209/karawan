// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/blocs/favorites/favorites_bloc.dart';

class ProductDetailsPage extends HookWidget {
  const ProductDetailsPage({
    super.key,
    required this.section,
    required this.productId,
  });
  final AppSection section;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final product = getProductById(productId, section);
    final storage = useMemoized(() => StorageProvider());
    final quantity = useState(1);

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Not Found'),
          backgroundColor: AppColors.getSectionAccent(section),
        ),
        body: const Center(child: Text('Product not found')),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            product.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).paddingOnly(top: 20),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top,
                        left: AppSpacing.screenPadding + 10,
                        child: AppActionIcon(
                          icon: Icons.arrow_back,
                          onTap: () => context.pop(),
                          isSmall: true,
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top,
                        right: AppSpacing.screenPadding + 10,
                        child: AppActionIcon(
                          icon: true
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          onTap: () {
                            context.read<FavoritesBloc>().add(
                              FavoriteToggled(productId),
                            );
                          }, // Handled by GestureDetector
                          isSmall: true,
                          color: true
                              ? AppColors.getSectionAccent(section)
                              : Color(0xFF151515).withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 30),
                  SizedBox(height: AppSpacing.xl),

                  // Product Info Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Title and Quantity
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.text()
                                    .xxl()
                                    .semiBold()
                                    .withColor(Color(0xFF666666)),
                              ),
                            ),
                            // Quantity Selector
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F3F3),
                                borderRadius: BorderRadius.circular(17),
                                border: null,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 18,
                                children: [
                                  _buildQuantityButton(
                                    onPressed: () {
                                      if (quantity.value > 1) {
                                        quantity.value--;
                                      }
                                    },
                                    icon: Icons.remove,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    quantity.value.toString(),
                                    style: AppTextStyle.text()
                                        .lg()
                                        .semiBold()
                                        .withColor(Color(0xFF6D6D6D)),
                                  ),
                                  _buildQuantityButton(
                                    onPressed: () {
                                      quantity.value++;
                                    },
                                    icon: Icons.add,
                                    color: AppColors.getSectionAccent(section),
                                  ),
                                ],
                              ).paddingAll(5),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.md),

                        // Rating
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: AppColors.getSectionAccent(section),
                            ),
                            SizedBox(width: AppSpacing.xs),
                            Text(
                              product.rating.toString(),
                              style: AppTextStyle.text()
                                  .semiBold()
                                  .lg()
                                  .withColor(Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.lg),

                        // Description
                        Text(
                          'Mazmuny',
                          style: AppTextStyle.text().md().semiBold().withColor(
                            Colors.black,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.text().xs().medium().withColor(
                            Color(0xFF464646),
                          ),
                        ),
                        SizedBox(height: AppSpacing.xl),

                        AppCategoryGrid(
                          title: 'Iň täze harytlar',
                          itemCount: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Action Bar
          SafeArea(
            top: false,
            child: Container(
              padding: EdgeInsets.all(AppSpacing.screenPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jemi:',
                          style: AppTextStyle.text().sm().withColor(
                            Colors.black,
                          ),
                        ),
                        Text(
                          'TMT ${(product.price * quantity.value).toStringAsFixed(2)}',
                          style: AppTextStyle.text().xl().bold().withColor(
                            Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        storage.updateCartQuantity(
                          productId,
                          quantity.value,
                          AppSection.market,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} sebede goşuldy!'),
                            backgroundColor: AppColors.getSectionAccent(
                              section,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.getSectionAccent(section),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Sebede goş',
                        style: AppTextStyle.text().md().bold().withColor(
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox.square(
        dimension: 26,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color == AppColors.getSectionAccent(AppSection.market)
                ? color
                : Color(0xFFD7D7D7),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 22,
            color: color == AppColors.getSectionAccent(AppSection.market)
                ? Colors.white
                : color,
          ),
        ),
      ),
    );
  }
}

// Separate HookWidget for related product cards
class RelatedProductCard extends HookWidget {
  const RelatedProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.section,
  });

  final ProductTemplate product;
  final VoidCallback onTap;
  final AppSection section;

  @override
  Widget build(BuildContext context) {
    final cartQuantity = useCartQuantity(product.id, section);
    // final storage = useMemoized(() => StorageProvider());

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Favorite Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: Image.asset(product.imagePath, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: AppFavoriteButton(
                    productId: product.id,
                    section: section,
                    onToggle: () {
                      context.read<FavoritesBloc>().add(
                        FavoriteToggled(product.id),
                      );
                    },
                    size: 32,
                    iconSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTextStyle.text().sm().semiBold().withColor(
                      Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    'TMT ${product.price.toStringAsFixed(2)}',
                    style: AppTextStyle.text().sm().bold().withColor(
                      AppColors.getSectionAccent(AppSection.market),
                    ),
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 12,
                        color: AppColors.highlightColor,
                      ),
                      SizedBox(width: AppSpacing.xs),
                      Text(
                        product.rating.toString(),
                        style: AppTextStyle.text().xs().withColor(Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  if (cartQuantity > 0)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: AppColors.getSectionAccent(section),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Sebetde $cartQuantity',
                          style: AppTextStyle.text().xs().bold().withColor(
                            Colors.white,
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Sebete goş',
                          style: AppTextStyle.text().xs().bold().withColor(
                            Colors.grey,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

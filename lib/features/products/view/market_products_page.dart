import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/blocs/favorites/favorites_bloc.dart';

class MarketProductsPage extends HookWidget {
  const MarketProductsPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final product = getProductById(productId, AppSection.store);
    final isFavorite = useIsFavorite(productId, AppSection.store);
    final storage = useMemoized(() => StorageProvider());
    final quantity = useState(1);

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Not Found'),
          backgroundColor: AppColors.getSectionAccent(AppSection.store),
        ),
        body: const Center(child: Text('Product not found')),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      body: Column(
        children: [
          // Image with overlayed controls
          // Main Content
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
                        height: 300,
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
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 10,
                        left: AppSpacing.screenPadding,
                        child: _buildCircularIconButton(
                          onPressed: () => context.pop(),
                          icon: Icons.arrow_back,
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 10,
                        right: AppSpacing.screenPadding,
                        child: AppFavoriteButtonCard(
                          productId: productId,
                          section: AppSection.store,
                          onToggle: () {
                            context.read<FavoritesBloc>().add(
                              FavoriteToggled(productId),
                            );
                          },
                          size: 40,
                          iconSize: 20,
                        ),
                      ),
                    ],
                  ),
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
                                style: AppTextStyle.text()
                                    .xl()
                                    .bold()
                                    .withColor(Colors.black),
                              ),
                            ),
                            // Quantity Selector
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
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
                                  Container(
                                    width: 40,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        quantity.value.toString(),
                                        style: AppTextStyle.text()
                                            .md()
                                            .bold()
                                            .withColor(Colors.black),
                                      ),
                                    ),
                                  ),
                                  _buildQuantityButton(
                                    onPressed: () {
                                      quantity.value++;
                                    },
                                    icon: Icons.add,
                                    color: AppColors.getSectionAccent(
                                      AppSection.store,
                                    ),
                                  ),
                                ],
                              ),
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
                              color: AppColors.getSectionAccent(
                                AppSection.store,
                              ),
                            ),
                            SizedBox(width: AppSpacing.xs),
                            Text(
                              product.rating.toString(),
                              style: AppTextStyle.text().md().withColor(
                                Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.lg),

                        // Description
                        Text(
                          'Mazmuny',
                          style: AppTextStyle.text().lg().bold().withColor(
                            Colors.black,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          product.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.text().md().withColor(
                            Colors.grey,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xl),

                        // Related Products
                        Text(
                          'Iň täze harytlar',
                          style: AppTextStyle.text().lg().bold().withColor(
                            Colors.black,
                          ),
                        ),
                        SizedBox(height: AppSpacing.md),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final relatedProduct = getProductsBySection(
                              AppSection.store,
                            )[index];

                            return MarketRelatedProductCard(
                              product: relatedProduct,
                              onTap: () {
                                context.go(
                                  '/store/home/products/${relatedProduct.id}',
                                );
                              },
                            );
                          },
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
                          AppSection.store,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} sebede goşuldy!'),
                            backgroundColor: AppColors.getSectionAccent(
                              AppSection.store,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.getSectionAccent(
                          AppSection.store,
                        ),
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

  Widget _buildCircularIconButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
    double size = 40,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size * 0.4),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          padding: EdgeInsets.all(AppSpacing.xs),
          minimumSize: Size(size, size),
        ),
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
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color == AppColors.getSectionAccent(AppSection.store)
              ? color
              : Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          size: 16,
          color: color == AppColors.getSectionAccent(AppSection.store)
              ? Colors.white
              : color,
        ),
      ),
    );
  }
}

// Separate HookWidget for related product cards
class MarketRelatedProductCard extends HookWidget {
  const MarketRelatedProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final ProductTemplate product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isFavorite = useIsFavorite(product.id, AppSection.store);
    final cartQuantity = useCartQuantity(product.id, AppSection.store);
    final storage = useMemoized(() => StorageProvider());

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
                    section: AppSection.store,
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
                      AppColors.getSectionAccent(AppSection.store),
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
                        color: AppColors.getSectionAccent(AppSection.store),
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

  Widget _buildCircularIconButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
    double size = 40,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size * 0.4),
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: color,
          padding: EdgeInsets.all(AppSpacing.xs),
          minimumSize: Size(size, size),
        ),
      ),
    );
  }
}

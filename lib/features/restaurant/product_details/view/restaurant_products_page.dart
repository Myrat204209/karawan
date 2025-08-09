// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class RestaurantProductsPage extends HookWidget {
  const RestaurantProductsPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final product = getProductById(productId, AppSection.restaurant);
    final isFavorite = useIsFavorite(productId, AppSection.restaurant);
    final storage = useMemoized(() => StorageProvider());
    final quantity = useState(1);

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Not Found'),
          backgroundColor: AppColors.getSectionAccent(AppSection.restaurant),
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
                        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                        left: 16,
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.arrow_back, size: 20),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 10,
                        right: 16,
                        child: GestureDetector(
                          onTap: () {
                            storage.toggleFavorite(
                              productId,
                              AppSection.restaurant,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 20,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Product Info Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                  GestureDetector(
                                    onTap: () {
                                      if (quantity.value > 1) {
                                        quantity.value--;
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: const Icon(Icons.remove, size: 16),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      quantity.value.toString(),
                                      style: AppTextStyle.text().md().bold(),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      quantity.value++;
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: const Icon(Icons.add, size: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Rating
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.getSectionAccent(
                                AppSection.restaurant,
                              ),
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              product.rating.toString(),
                              style: AppTextStyle.text()
                                  .md()
                                  .semiBold()
                                  .withColor(Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Description Section
                        Text(
                          'Mazmuny',
                          style: AppTextStyle.text().lg().semiBold().withColor(
                            Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Stay refreshed with our ultra-pure, mineral-balanced water sourced from natural springs. Perfectly sized for on-the-go hydration, each bottle is BPA-free, recyclable, and sealed for freshness.',
                          style: AppTextStyle.text().md().withColor(
                            Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Menu Section
                        Text(
                          'Iň täze harytlar',
                          style: AppTextStyle.text().lg().bold().withColor(
                            Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Related Products Grid
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
                              AppSection.restaurant,
                            )[index];

                            return RelatedProductCard(
                              product: relatedProduct,
                              onTap: () {
                                context.go(
                                  '/restaurant/home/products/${relatedProduct.id}',
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jemi:',
                        style: AppTextStyle.text().sm().medium().withColor(
                          Colors.black,
                        ),
                      ),
                      Text(
                        'TMT ${(product.price * quantity.value).toStringAsFixed(2)}',
                        style: AppTextStyle.text().md().semiBold().withColor(
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        storage.updateCartQuantity(
                          productId,
                          quantity.value,
                          AppSection.restaurant,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} sebede goşuldy!'),
                            backgroundColor: AppColors.getSectionAccent(
                              AppSection.restaurant,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.getSectionAccent(
                          AppSection.restaurant,
                        ),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
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
}

// Separate HookWidget for related product cards
class RelatedProductCard extends HookWidget {
  const RelatedProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final ProductTemplate product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isFavorite = useIsFavorite(product.id, AppSection.restaurant);
    final cartQuantity = useCartQuantity(product.id, AppSection.restaurant);
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
                    height: 100,
                    child: Image.asset(product.imagePath, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      storage.toggleFavorite(product.id, AppSection.restaurant);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 14,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
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
                  const SizedBox(height: 4),
                  Text(
                    'TMT ${product.price.toStringAsFixed(2)}',
                    style: AppTextStyle.text().sm().bold().withColor(
                      AppColors.getSectionAccent(AppSection.restaurant),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 12,
                        color: AppColors.highlightColor,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toString(),
                        style: AppTextStyle.text().xs().withColor(Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (cartQuantity == 0)
                    GestureDetector(
                      onTap: () {
                        storage.updateCartQuantity(
                          product.id,
                          1,
                          AppSection.restaurant,
                        );
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.getSectionAccent(
                            AppSection.restaurant,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cartQuantity > 1) {
                              storage.updateCartQuantity(
                                product.id,
                                cartQuantity - 1,
                                AppSection.restaurant,
                              );
                            } else {
                              storage.updateCartQuantity(
                                product.id,
                                0,
                                AppSection.restaurant,
                              );
                            }
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          cartQuantity.toString(),
                          style: AppTextStyle.text().xs().bold(),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            storage.updateCartQuantity(
                              product.id,
                              cartQuantity + 1,
                              AppSection.restaurant,
                            );
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.getSectionAccent(
                                AppSection.restaurant,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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

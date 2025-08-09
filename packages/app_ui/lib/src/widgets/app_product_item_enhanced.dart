import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppProductItemEnhanced extends HookWidget {
  const AppProductItemEnhanced({
    super.key,
    required this.onGridPressed,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.productId,
    required this.section,
    required this.imagePath,
  });

  final VoidCallback onGridPressed;
  final Widget image;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String productId;
  final AppSection section;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final isFavorite = useIsFavorite(productId, section);
    final cartQuantity = useCartQuantity(productId, section);
    final storage = useMemoized(() => StorageProvider());

    return GestureDetector(
      onTap: onGridPressed,
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
          mainAxisSize: MainAxisSize.min,
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
                    child: image,
                  ),
                ),
                Positioned(
                  top: AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: GestureDetector(
                    onTap: () {
                      storage.toggleFavorite(productId, section);
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Product Name
                  Text(
                    name,
                    style: AppTextStyle.text().md().semiBold().withColor(
                      Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.xs),

                  // Description
                  Text(
                    description,
                    style: AppTextStyle.text().xs().withColor(Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.sm),

                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: AppColors.highlightColor,
                      ),
                      SizedBox(width: AppSpacing.xs),
                      Text(
                        rating.toString(),
                        style: AppTextStyle.text().xs().withColor(Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),

                  // Price and Cart Button Row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'TMT ${price.toStringAsFixed(2)}',
                          style: AppTextStyle.text().sm().bold().withColor(
                            AppColors.getSectionAccent(section),
                          ),
                        ),
                      ),
                      if (cartQuantity == 0)
                        GestureDetector(
                          onTap: () {
                            storage.updateCartQuantity(productId, 1, section);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.getSectionAccent(section),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 18,
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
                                    productId,
                                    cartQuantity - 1,
                                    section,
                                  );
                                } else {
                                  storage.updateCartQuantity(
                                    productId,
                                    0,
                                    section,
                                  );
                                }
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: AppSpacing.sm),
                            Text(
                              cartQuantity.toString(),
                              style: AppTextStyle.text().sm().bold().withColor(
                                Colors.black,
                              ),
                            ),
                            SizedBox(width: AppSpacing.sm),
                            GestureDetector(
                              onTap: () {
                                storage.updateCartQuantity(
                                  productId,
                                  cartQuantity + 1,
                                  section,
                                );
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: AppColors.getSectionAccent(section),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
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

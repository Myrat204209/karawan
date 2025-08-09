// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({
    super.key,
    this.title,
    this.description,
    this.price,
    this.name,
    this.quantity,
    this.image,
    this.onRemove,
    this.onQuantityChanged,
    this.section = AppSection.restaurant,
  });

  final String? title;
  final String? description;
  final double? price;
  final String? name;
  final int? quantity;
  final Widget? image;
  final VoidCallback? onRemove;
  final ValueChanged<int>? onQuantityChanged;
  final AppSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.cardPadding),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          if (image != null)
            Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: image!,
              ),
            ),
          SizedBox(width: AppSpacing.md),

          // Product Info and Controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Product Name and Delete Button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name ?? title ?? 'Product',
                        style: AppTextStyle.text().md().bold().withColor(
                          Colors.black,
                        ),
                      ),
                    ),
                    if (onRemove != null)
                      _buildCircularIconButton(
                        onPressed: onRemove!,
                        icon: Icons.delete_outline,
                        color: Colors.grey,
                        size: 32,
                      ),
                  ],
                ),
                SizedBox(height: AppSpacing.xs),

                // Rating
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: AppColors.highlightColor),
                    SizedBox(width: AppSpacing.xs),
                    Text(
                      '5.0',
                      style: AppTextStyle.text().sm().withColor(Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.xs),

                // Description
                Text(
                  description ??
                      'Product designers who focuses on simplicity & usability',
                  style: AppTextStyle.text().sm().withColor(Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSpacing.sm),

                // Bottom Row: Price and Quantity Widget
                Row(
                  children: [
                    // Price
                    Text(
                      'TMT ${price?.toStringAsFixed(2) ?? '0.00'}',
                      style: AppTextStyle.text().md().bold().withColor(
                        AppColors.getSectionAccent(section),
                      ),
                    ),
                    const Spacer(),
                    // Quantity Widget
                    if (quantity != null && onQuantityChanged != null)
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
                            // Minus Button
                            _buildQuantityButton(
                              onPressed: () {
                                if (quantity! > 1) {
                                  onQuantityChanged!(quantity! - 1);
                                } else {
                                  onQuantityChanged!(0);
                                }
                              },
                              icon: Icons.remove,
                              color: Colors.black,
                            ),
                            // Quantity Display
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  quantity.toString(),
                                  style: AppTextStyle.text()
                                      .xs()
                                      .bold()
                                      .withColor(Colors.black),
                                ),
                              ),
                            ),
                            // Plus Button
                            _buildQuantityButton(
                              onPressed: () {
                                onQuantityChanged!(quantity! + 1);
                              },
                              icon: Icons.add,
                              color: AppColors.getSectionAccent(section),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
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
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color:
              color == AppColors.getSectionAccent(section)
                  ? color
                  : Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          size: 12,
          color:
              color == AppColors.getSectionAccent(section)
                  ? Colors.white
                  : color,
        ),
      ),
    );
  }
}

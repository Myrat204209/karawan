import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppFavoriteItem extends StatelessWidget {
  const AppFavoriteItem({
    super.key,
    this.title,
    this.description,
    this.price,
    this.name,
    this.rating,
    this.image,
    this.onRemove,
    this.onAddToCart,
    this.section = AppSection.restaurant,
  });

  final String? title;
  final String? description;
  final double? price;
  final String? name;
  final double? rating;
  final Widget? image;
  final VoidCallback? onRemove;
  final VoidCallback? onAddToCart;
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
            offset: const Offset(0, 2),
            blurRadius: 8,
            color: Colors.black.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              if (image != null)
                Container(
                  width: 95,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: image!,
                  ),
                ),
              SizedBox(width: AppSpacing.md),

              // Product Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      name ?? title ?? 'Product',
                      style: AppTextStyle.text().md().bold().withColor(
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: AppSpacing.xs),

                    // Rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.highlightColor,
                        ),
                        SizedBox(width: AppSpacing.xs),
                        Text(
                          rating?.toStringAsFixed(1) ?? '5.0',
                          style: AppTextStyle.text().sm().withColor(
                            Colors.grey,
                          ),
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

                    // Bottom row: Price and Add to Cart button
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
                        // Add to Cart Button
                        if (onAddToCart != null)
                          _buildCircularIconButton(
                            onPressed: onAddToCart!,
                            icon: Icons.shopping_cart,
                            color: AppColors.getSectionAccent(section),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Close button positioned in top right
          if (onRemove != null)
            Positioned(
              top: 0,
              right: 0,
              child: _buildCircularIconButton(
                onPressed: onRemove!,
                icon: Icons.close,
                color: Colors.grey,
                size: 32,
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
}

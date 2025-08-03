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
  });
  final String? title;
  final String? description;
  final double? price;
  final String? name;
  final double? rating;
  final Widget? image;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(width: 80, height: 80, child: image!),
            ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? title ?? 'Product',
                  style: AppTextStyle.text().md().semiBold().withColor(
                    Colors.black,
                  ),
                ),
                if (description != null) ...[
                  SizedBox(height: 4),
                  Text(
                    description!,
                    style: AppTextStyle.text().sm().withColor(Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                SizedBox(height: 8),
                Row(
                  children: [
                    if (rating != null) ...[
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating!.toStringAsFixed(1),
                        style: AppTextStyle.text().sm().withColor(Colors.black),
                      ),
                      SizedBox(width: 12),
                    ],
                    if (price != null)
                      Text(
                        'TMT ${price!.toStringAsFixed(2)}',
                        style: AppTextStyle.text().md().semiBold().withColor(
                          AppColors.mainAccent,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (onRemove != null)
            IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.delete_outline, color: Colors.red),
            ),
        ],
      ),
    );
  }
}

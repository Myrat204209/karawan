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
  });

  final String? title;
  final String? description;
  final double? price;
  final String? name;
  final int? quantity;
  final Widget? image;
  final VoidCallback? onRemove;
  final Function(int)? onQuantityChanged;
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
                    if (price != null)
                      Text(
                        'TMT ${price!.toStringAsFixed(2)}',
                        style: AppTextStyle.text().md().semiBold().withColor(
                          AppColors.mainAccent,
                        ),
                      ),
                    Spacer(),
                    if (quantity != null && onQuantityChanged != null) ...[
                      IconButton(
                        onPressed: () {
                          if (quantity! > 1) {
                            onQuantityChanged!(quantity! - 1);
                          }
                        },
                        icon: Icon(Icons.remove, size: 16),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.mainAccent,
                          foregroundColor: Colors.white,
                          minimumSize: Size(24, 24),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '$quantity',
                          style: AppTextStyle.text().sm().semiBold().withColor(
                            Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          onQuantityChanged!(quantity! + 1);
                        },
                        icon: Icon(Icons.add, size: 16),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.mainAccent,
                          foregroundColor: Colors.white,
                          minimumSize: Size(24, 24),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
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

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppMainImage extends StatelessWidget {
  const AppMainImage({
    super.key,
    required this.image,
    required this.onLiked,
    this.isLiked = false,
  });

  final Widget image;
  final VoidCallback onLiked;
  final bool isLiked;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        Positioned(
          right: 8,
          top: 8,
          child: AppActionIcon(
            icon:
                isLiked
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
            onTap: onLiked,
            isSmall: true,
            color: isLiked ? AppColors.mainAccent : AppColors.grey,
          ),
        ),
      ],
    );
  }
}

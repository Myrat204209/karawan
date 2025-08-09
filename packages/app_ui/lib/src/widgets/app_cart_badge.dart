import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppCartBadge extends HookWidget {
  const AppCartBadge({super.key, required this.section, this.size = 16});

  final AppSection section;
  final double size;

  @override
  Widget build(BuildContext context) {
    final cartItemCount = useCartItemCount(section);

    if (cartItemCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.getSectionAccent(section),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          cartItemCount > 99 ? '99+' : cartItemCount.toString(),
          style: AppTextStyle.text().xs().bold().withColor(Colors.white),
        ),
      ),
    );
  }
}

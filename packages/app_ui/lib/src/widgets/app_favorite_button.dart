import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppFavoriteButton extends HookWidget {
  const AppFavoriteButton({
    super.key,
    required this.productId,
    required this.section,
    required this.onToggle,
    this.size = 20.0,
    this.iconSize,
    this.backgroundColor,
    this.showBackground = true,
  });

  final String productId;
  final AppSection section;
  final VoidCallback onToggle;
  final double size;
  final double? iconSize;
  final Color? backgroundColor;
  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    final isFavorite = useIsFavorite(productId, section);

    // Optimistic update state
    final optimisticState = useState<bool?>(null);
    final isOptimistic = optimisticState.value != null;
    final displayFavorite = isOptimistic ? optimisticState.value! : isFavorite;

    return GestureDetector(
      onTap: () async {
        // Optimistic update
        optimisticState.value = !isFavorite;

        // Call the toggle callback
        onToggle();

        // Reset optimistic state after a short delay
        Future.delayed(const Duration(milliseconds: 100), () {
          optimisticState.value = null;
        });
      },
      child: Container(
        width: size,
        height: size,
        decoration:
            showBackground
                ? BoxDecoration(
                  color: backgroundColor ?? Colors.black.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(size / 2),
                )
                : null,
        child: Icon(
          displayFavorite ? Icons.favorite : Icons.favorite_border,
          size: iconSize ?? (size * 0.6),
          color:
              displayFavorite
                  ? AppColors.getSectionAccent(section)
                  : Colors.white,
        ),
      ),
    );
  }
}

// Alternative version for use in product cards with different styling
class AppFavoriteButtonCard extends HookWidget {
  const AppFavoriteButtonCard({
    super.key,
    required this.productId,
    required this.section,
    required this.onToggle,
    this.size = 32.0,
    this.iconSize,
  });

  final String productId;
  final AppSection section;
  final VoidCallback onToggle;
  final double size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final isFavorite = useIsFavorite(productId, section);

    // Optimistic update state
    final optimisticState = useState<bool?>(null);
    final isOptimistic = optimisticState.value != null;
    final displayFavorite = isOptimistic ? optimisticState.value! : isFavorite;

    return GestureDetector(
      onTap: () async {
        // Optimistic update
        optimisticState.value = !isFavorite;

        // Call the toggle callback
        onToggle();

        // Reset optimistic state after a short delay
        Future.delayed(const Duration(milliseconds: 100), () {
          optimisticState.value = null;
        });
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size / 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          displayFavorite ? Icons.favorite : Icons.favorite_border,
          size: iconSize ?? (size * 0.5),
          color:
              displayFavorite
                  ? AppColors.getSectionAccent(section)
                  : Colors.grey,
        ),
      ),
    );
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationItem extends StatelessWidget {
  const AppBottomNavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.showBadge = false,
    this.badgeCount = 0,
    this.section,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool showBadge;
  final int badgeCount;
  final AppSection? section;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Icon(
                  icon,
                  color:
                      isSelected
                          ? AppColors.getSectionAccent(
                            section ?? AppSection.market,
                          )
                          : Colors.grey,
                  size: 24,
                ),
                if (showBadge && badgeCount > 0)
                  Positioned(
                    right: -8,
                    top: -8,
                    child: AppCartBadge(
                      section: section ?? AppSection.market,
                      size: 16,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color:
                    isSelected
                        ? AppColors.getSectionAccent(
                          section ?? AppSection.market,
                        )
                        : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

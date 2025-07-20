import 'package:flutter/material.dart';

class AppActionIcon extends StatelessWidget {
  const AppActionIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = const Color(0xFF666666),
    this.isSmall = false, // New boolean parameter
  });

  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    // Determine styles based on the isSmall flag
    final double size = isSmall ? 25 : 40.0;
    final double iconSize = isSmall ? 15.0 : 25.0;
    final double blurRadius = isSmall ? 3.44 : 14.1;
    final Offset offset =
        isSmall ? const Offset(0.51, 0.51) : const Offset(0, 4);
    final double shadowOpacity = isSmall ? 0.10 : 0.05;

    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: offset,
              blurRadius: blurRadius,
              color: Colors.black.withValues(alpha: shadowOpacity),
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            icon,
            color: isSmall ? Color(0xFF151515) : color,
            size: iconSize,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppActionIcon extends StatelessWidget {
  const AppActionIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = AppColors.iconColor,
  });

  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 14.1,
            color: Color(0x00000000).withValues(alpha: 0.05),
            blurStyle: BlurStyle.outer,
          ),
        ],
        shape: BoxShape.circle,
      ),

      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: color, size: 30).centralize(),
        style: IconButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
        ),
        onPressed: onTap,
      ),
    );
  }
}

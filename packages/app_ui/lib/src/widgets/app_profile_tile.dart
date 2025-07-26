import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppProfileTile extends StatelessWidget {
  const AppProfileTile({
    super.key,
    required this.text,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.onTilePressed,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData icon;
  final VoidCallback? onTilePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: backgroundColor,
        child: Icon(icon, color: foregroundColor),
      ),
      title: Text(
        text,
        style: AppTextStyle.text().semiBold().withColor(Colors.black),
      ),
      trailing: IconButton(
        onPressed: onTilePressed,
        icon: Icon(
          Icons.chevron_right_rounded,
          size: 30,
          color: Color(0xFFA4A4A4),
        ),
      ),
    );
  }
}

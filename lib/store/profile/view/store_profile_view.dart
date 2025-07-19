import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class StoreProfileView extends StatelessWidget {
  const StoreProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Halanlarym',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        Column(
          spacing: 15,
          children: [
            ProfileTile(
              icon: Icons.notifications_active_rounded,
              backgroundColor: Color(0xFFFFCA60).withValues(alpha: 0.2),
              text: 'Bildirish',
              foregroundColor: Color(0xFFFFCA60),
            ),
            ProfileTile(
              icon: Icons.translate_rounded,
              backgroundColor: Color(0xFFE4FFFF),
              text: 'Turkmen dili',
              foregroundColor: Color(0xFF00C7C9),
            ),
            ProfileTile(
              icon: Icons.contrast_rounded,
              backgroundColor: Color(0xFF63E9B0).withValues(alpha: 0.1),
              text: 'Tema',
              foregroundColor: Color(0xFF63E9B0),
            ),
          ],
        ),
        Text(
          'Beylekiler',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        Column(
          spacing: 15,
          children: [
            ProfileTile(
              icon: Icons.contact_support_rounded,
              backgroundColor: Color(0xFFFFC046).withValues(alpha: 0.1),
              text: 'Biz Barada',
              foregroundColor: Color(0xFFFFC046),
            ),
            ProfileTile(
              icon: Icons.login_rounded,
              backgroundColor: Color(0xFF85D062).withValues(alpha: 0.1),
              text: 'Hasaba girmek',
              foregroundColor: Color(0xFF00C7C9),
            ),
            ProfileTile(
              icon: Icons.delete_outline_rounded,
              backgroundColor: Color(0xFFEF5454).withValues(alpha: 0.1),
              text: 'Hasaby pozmak',
              foregroundColor: Color(0xFFEF5454),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 15).paddingOnly(top: 15);
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
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

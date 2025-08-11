import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Profilim',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        Column(
          spacing: 15,
          children: [
            AppProfileTile(
              icon: Icons.notifications_active_rounded,
              backgroundColor: Color(0xFFFFCA60).withValues(alpha: 0.2),
              text: 'Bildirish',
              foregroundColor: Color(0xFFFFCA60),
            ),
            AppProfileTile(
              icon: Icons.translate_rounded,
              backgroundColor: Color(0xFFE4FFFF),
              text: 'Turkmen dili',
              foregroundColor: Color(0xFF00C7C9),
            ),
            AppProfileTile(
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
            AppProfileTile(
              icon: Icons.contact_support_rounded,
              backgroundColor: Color(0xFFFFC046).withValues(alpha: 0.1),
              text: 'Biz Barada',
              foregroundColor: Color(0xFFFFC046),
            ),
            AppProfileTile(
              icon: Icons.login_rounded,
              backgroundColor: Color(0xFF85D062).withValues(alpha: 0.1),
              text: 'Hasaba girmek',
              foregroundColor: Color(0xFF00C7C9),
            ),
            AppProfileTile(
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

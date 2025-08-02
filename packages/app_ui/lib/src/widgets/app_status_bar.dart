// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStatusBar extends StatelessWidget {
  const AppStatusBar({
    super.key,
    required this.onSearchTap,
    required this.color,
  });

  final VoidCallback onSearchTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // stretch: false,
      backgroundColor: color,

      actionsPadding: EdgeInsets.only(right: 18.w),
      titleSpacing: 0,
      leading: Assets.svg.caravan.svg().paddingOnly(left: 18.w),

      leadingWidth: 120.w,
      elevation: 2,

      automaticallyImplyLeading: false,
      toolbarHeight: 75.h,
      pinned: true,
      actions: [AppActionIcon(icon: Icons.search, onTap: onSearchTap)],
    );
  }
}

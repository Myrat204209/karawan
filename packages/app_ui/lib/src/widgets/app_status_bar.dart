import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStatusBar extends StatelessWidget {
  final VoidCallback onSearchTap;
  final Color color;
  final bool _isSliver;
  final Color? statusBarColor;

  const AppStatusBar({
    super.key,
    required this.onSearchTap,
    required this.color,
    this.statusBarColor = AppColors.mainAccent,
  }) : _isSliver = true;

  const AppStatusBar.box({
    super.key,
    required this.onSearchTap,
    required this.color,
    this.statusBarColor = AppColors.mainAccent,
  }) : _isSliver = false;

  @override
  Widget build(BuildContext context) {
    if (_isSliver) {
      return SliverAppBar(
        backgroundColor: color,
        actionsPadding: EdgeInsets.only(right: AppSpacing.screenPadding),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: statusBarColor,
        ),
        titleSpacing: 0,
        leading: Assets.images.logo.image().withPadding(
          left: AppSpacing.screenPadding,
        ),
        leadingWidth: 120.w,
        elevation: 2,
        automaticallyImplyLeading: false,
        toolbarHeight: AppSpacing.appBarHeight,
        pinned: true,
        title: AnimSearchBar(
          width: 300,
          rtl: true,
          suffixIcon: const Icon(Icons.search),
          textFieldIconColor: Colors.transparent,
          style: AppTextStyle.text().lg().medium().withColor(Colors.black),
          onSubmitted: (p0) {},
          textController: TextEditingController(),
          onSuffixTap: () {
            // Clear search functionality
          },
        ).withPadding(horizontal: AppSpacing.sm),
        centerTitle: true,
      );
    } else {
      return AppBar(
        key: key,
        backgroundColor: color,
        centerTitle: true,
        title: AnimSearchBar(
          width: 300,
          rtl: true,
          onSubmitted: (p0) {},
          textController: TextEditingController(),
          onSuffixTap: () {
            // Clear search functionality
          },
        ).withPadding(horizontal: AppSpacing.sm),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: statusBarColor,
        ),
        titleSpacing: 0,
        leading: Assets.images.logo.image().withPadding(
          left: AppSpacing.screenPadding,
        ),
        leadingWidth: 120.w,
        toolbarHeight: AppSpacing.appBarHeight,
        automaticallyImplyLeading: false,
      );
    }
  }
}

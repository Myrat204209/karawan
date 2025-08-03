import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStatusBar extends StatelessWidget {
  final VoidCallback onSearchTap;
  final Color color;
  final bool _isSliver;

  const AppStatusBar({
    super.key,
    required this.onSearchTap,
    required this.color,
  }) : _isSliver = true;

  const AppStatusBar.box({
    super.key,
    required this.onSearchTap,
    required this.color,
  }) : _isSliver = false;

  @override
  Widget build(BuildContext context) {
    if (_isSliver) {
      return SliverAppBar(
        backgroundColor: color,
        actionsPadding: EdgeInsets.only(right: 18.w),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.blue,
        ),
        titleSpacing: 0,
        leading: Assets.svg.caravan.svg().paddingOnly(left: 18.w),
        leadingWidth: 120.w,
        elevation: 2,
        automaticallyImplyLeading: false,
        toolbarHeight: 75.h,
        pinned: true,
        actions: [AppActionIcon(icon: Icons.search, onTap: onSearchTap)],
      );
    } else {
      return AppBar(
        key: key,
        backgroundColor: color,
        centerTitle: true,
        title: AnimSearchBar(
          width: 400,
          onSubmitted: (p0) {},
          textController: TextEditingController(),
          onSuffixTap: () {
            // setState(() {
            //   textController.clear();
            // });
          },
        ),

        actionsPadding: EdgeInsets.only(right: 18.w),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.blue,
        ),
        titleSpacing: 0,
        leading: Assets.svg.caravan.svg().paddingOnly(left: 18.w),
        leadingWidth: 120.w,
        toolbarHeight: 75.h,
        automaticallyImplyLeading: false,
      );
    }
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class AppStatusBar extends StatelessWidget {
  const AppStatusBar({
    super.key,
    this.locationText,
    required this.onAddressTap,
    required this.onNotificationTap,
    required this.onBookmarkTap,
    required this.onSearchTap,
  });

  final String? locationText;
  final VoidCallback onAddressTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onBookmarkTap;
  final VoidCallback onSearchTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      primary: true,
      actionsPadding: EdgeInsets.zero,
      expandedHeight: 100,
      titleSpacing: 0,
      leading: Icon(
        Icons.directions_bike_outlined,
        size: 30,
        color: AppColors.secondAccent,
      ),

      leadingWidth: 50,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppActionIcon(
            icon: CupertinoIcons.chevron_right,
            onTap: onAddressTap,
            size: 20,
          ),
        ],
      ),
      floating: true,
      pinned: true,
      actions: [
        AppActionIcon(icon: CupertinoIcons.bell, onTap: onNotificationTap),
        AppActionIcon(
          icon: Icons.bookmark_border_outlined,
          onTap: onBookmarkTap,
        ),
      ],
      snap: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppSearchBar(),
      ),
    );
  }
}

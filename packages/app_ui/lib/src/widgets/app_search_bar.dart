import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

part 'app_search_bar.part.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barPadding: WidgetStatePropertyAll(EdgeInsets.only(left: 8)),
      barLeading: Icon(
        CupertinoIcons.search,
        size: 30,
        color: AppColors.iconColor.withValues(alpha: 0.5),
      ),
      constraints: BoxConstraints(minHeight: 43),
      barElevation: WidgetStatePropertyAll(0),
      barHintText: 'Найти в Дикси',
      barHintStyle: WidgetStatePropertyAll(
        AppTextStyle.text(color: AppColors.textLight),
      ),
      barShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: kCircular15Border,
          side: BorderSide(color: AppColors.border),
        ),
      ),

      barTrailing: [
        AppSearchDivider(),
        AppActionIcon(
          icon: CupertinoIcons.barcode_viewfinder,
          size: 29,
          color: AppColors.iconColor.withValues(alpha: 0.5),
          onTap: () {},
        ).paddingSymmetric(horizontal: 4),
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(CupertinoIcons.barcode_viewfinder),
        // ),
      ],
      // barSide: WidgetStatePropertyAll(BorderSide(color: Colors.red)),
      suggestionsBuilder: (context, controller) {
        return [];
      },
    ).paddingSymmetric(horizontal: 8);
  }
}

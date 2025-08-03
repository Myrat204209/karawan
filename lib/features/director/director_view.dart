import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:karawan/app/app.dart';

final _getIt = GetIt.I;

class DirectorView extends StatelessWidget {
  const DirectorView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _getIt<PageCacher>().setRoute(PageType.market);
              context.router.replace(const MarketBottomRoute());
            },

            style: ElevatedButton.styleFrom(
              elevation: 2,
              fixedSize: Size(width * 0.6, 50.h),
              shadowColor: Colors.black.withValues(alpha: 4),
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Market',
              style: AppTextStyle.text().withColor(AppColors.mainAccent),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _getIt<PageCacher>().setRoute(PageType.restaurant);
              context.router.replace(const RestaurantRouter());
            },
            style: ElevatedButton.styleFrom(
              elevation: 2,
              shadowColor: Colors.black.withValues(alpha: 8),
              fixedSize: Size(width * 0.6, 50.h),
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Restoran',
              style: AppTextStyle.text().withColor(AppColors.mainAccent),
            ),
          ),
        ],
      ).centralize(),
    );
  }
}

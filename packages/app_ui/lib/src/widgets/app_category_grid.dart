import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCategoryGrid extends StatelessWidget {
  final String title;
  final int itemCount;

  const AppCategoryGrid({
    super.key,
    required this.title,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.text().lg().bold().withColor(
                    Colors.black,
                  ),
                ),
                Text(
                  'Seretmek',
                  style: AppTextStyle.text().medium().withColor(
                    AppColors.mainAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          sliver: SliverGrid.builder(
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 10,
              childAspectRatio: 175 / 205,
            ),
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: kCircular15Border,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 14.1,
                      blurStyle: BlurStyle.solid,
                      color: Color(0x00000000).withValues(alpha: 0.05),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: kCircular15Border,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            Assets.images.mineral.image(fit: BoxFit.cover),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: AppActionIcon(
                                icon: Icons.favorite_border_rounded,
                                onTap: () {},
                                isSmall: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'Mineral Water',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Product designers who focus on simplicity & usability',
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                                maxLines: 2,
                              ),
                              Text(
                                'TMT 12.00',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

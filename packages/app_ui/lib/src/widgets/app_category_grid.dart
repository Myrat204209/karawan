// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCategoryGrid extends StatelessWidget {
  final String title;
  final int itemCount;
  final VoidCallback? onGridPressed;

  const AppCategoryGrid({
    super.key,
    required this.title,
    this.onGridPressed,
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
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 175 / 210,
            ),
            itemBuilder: (context, index) {
              return AppProductItem(
                onGridPressed: onGridPressed,
                image: Assets.images.meals.values[index % 4].image(
                  fit: BoxFit.contain,
                ),
                name: 'Doner Kebap',
                price: 20.0,
                rating: 4.5,
                onCartAdded: () {},
                description:
                    'Product designers who focuses on simplicity & usability',
              );
            },
          ),
        ),
      ],
    );
  }
}

class AppProductItem extends StatelessWidget {
  const AppProductItem({
    super.key,
    required this.onGridPressed,
    required this.onCartAdded,
    required this.image,
    required this.name,
    this.price = 30.00,
    required this.description,
    required this.rating,
  });
  final Widget image;
  final VoidCallback? onGridPressed;
  final VoidCallback? onCartAdded;
  final String name;
  final double price;
  final String description;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onGridPressed ?? () {},
      child: DecoratedBox(
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
                flex: 6,
                child: AppMainImage(onLiked: () {}, image: image),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: AppTextStyle.text()
                                  .withFontSize(14.sp)
                                  .semiBold()
                                  .withColor(Colors.black),
                            ),
                          ),
                          Text(
                            'TMT ${price.toStringAsFixed(2)}',
                            style: AppTextStyle.text()
                                .semiBold()
                                .withFontSize(14.sp)
                                .withColor(AppColors.secondRestAccent),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          description,
                          softWrap: true,

                          style: AppTextStyle.text().copyWith(
                            color: Color(0xFF464646),
                            fontSize: 9.sp,
                          ),
                          maxLines: 2,
                        ),
                      ),

                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 15),
                            Text(
                              rating.toStringAsFixed(1),
                              style: AppTextStyle.text()
                                  .withFontSize(13.sp)
                                  .medium()
                                  .withColor(Colors.black),
                            ),
                            Spacer(),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: AppColors.secondRestAccent,
                                side: BorderSide(color: Colors.transparent),
                                minimumSize: Size(76.w, 21),
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppMainImage extends StatelessWidget {
  const AppMainImage({super.key, required this.image, required this.onLiked});

  final Widget image;
  final VoidCallback onLiked;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        Positioned(
          right: 8,
          top: 8,
          child: AppActionIcon(
            icon: Icons.favorite_border_rounded,
            onTap: onLiked,
            isSmall: true,
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatelessWidget {
  const AppCarousel({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.screenPadding,
            AppSpacing.xxl,
            AppSpacing.screenPadding,
            AppSpacing.lg,
          ),
          sliver: SliverToBoxAdapter(
            child: Text(
              title,
              style: AppTextStyle.text().md().semiBold().withColor(
                Colors.black,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    log('Pressed');
                  },
                  child: SizedBox.square(
                    dimension: 80,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Assets.images.meals.values[index % 4].image(
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).paddingAll(1).colorize(const Color(0xFFEEEEEE)).clipper(10),
                ).withPadding(
                  left: index == 0 ? AppSpacing.screenPadding : AppSpacing.sm,
                  right: index == 7 ? AppSpacing.screenPadding : 0,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

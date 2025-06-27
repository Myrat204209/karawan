// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 39,
      children: [
        Expanded(
          flex: 264,
          child: ColoredBox(
            color: Color(0xFF232829),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 17),
              scrollDirection: Axis.vertical,
              children: [
                for (int i = 0; i < 10; i++)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF191F20),
                      borderRadius: kCircular35Border,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7.35,
                          spreadRadius: 2.94,
                          blurStyle: BlurStyle.outer,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 288,
                      width: 228,
                      child: Text(
                        'Item $i',
                        style: AppTextStyle.text().md().bold().withColor(
                          Colors.white,
                        ),
                      ).centralize(),
                    ),
                  ).paddingOnly(top: 46.37),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 637,
          child: ClipRRect(
            borderRadius: kCircular35Border,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: kCircular35Border,
                  child: Image.asset(
                    'assets/images/bedroom.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ).paddingOnly(bottom: 38),
                Positioned(
                  top: -20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Color(0xFF161919),
                    ),
                    child:
                        Text(
                              'Living Room',
                              style: AppTextStyle.text().md().bold().withColor(
                                Colors.white,
                              ),
                            )
                            .paddingSymmetric(horizontal: 62)
                            .paddingOnly(top: 24, bottom: 14),
                  ),
                ),
                Positioned(
                  top: -20,
                  right: 5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      color: Color(0xFF232829).withValues(alpha: 0.7),
                    ),
                    child:
                        Text(
                              'Scene',
                              style: AppTextStyle.text().md().bold().withColor(
                                Colors.white,
                              ),
                            )
                            .paddingSymmetric(horizontal: 62)
                            .paddingOnly(top: 24, bottom: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 348,
          child: ColoredBox(
            color: Color(0xFF232829),
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 17),
              children: [
                for (int i = 0; i < 10; i++)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF191F20),
                      borderRadius: kCircular35Border,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7.35,
                          spreadRadius: 2.94,
                          blurStyle: BlurStyle.outer,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 288,
                      width: 306,
                      child: Text(
                        'Item $i',
                        style: AppTextStyle.text().md().bold().withColor(
                          Colors.white,
                        ),
                      ).centralize(),
                    ),
                  ).paddingOnly(top: 46.37),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

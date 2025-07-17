import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
    return SliverList.list(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: 10,
          ),
          child: Text(title, style: AppTextStyle.text().lg().bold()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 115,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return DecoratedBox(
                key: ValueKey('$title-$index'),
                decoration: BoxDecoration(
                  color: Colors.blue[100 * (index % 9 + 1)]!,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Item $index',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.text().lg().bold(),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStatusBar.box(onSearchTap: () {}, color: AppColors.mainAccent),
        TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          indicatorWeight: 0.001,
          indicatorPadding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          dividerColor: Colors.white,
          tabs: [
            Tab(text: 'Kategoriyalar'),
            Tab(text: 'Brendlar'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Column(
                spacing: AppSpacing.sm,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: AppSpacing.md),
                  CategoryButton(icon: Icons.card_giftcard, label: 'Sowgatlar'),
                  CategoryButton(icon: Icons.percent, label: 'Arzanladyş'),
                  CategoryButton(
                    icon: Icons.shopping_basket_outlined,
                    label: 'Gök-bakja',
                  ),
                  CategoryButton(icon: Icons.food_bank, label: 'Et we towuk'),
                  CategoryButton(
                    icon: Icons.emoji_food_beverage,
                    label: 'Süýt önümleri',
                  ),
                  CategoryButton(
                    icon: Icons.local_drink_outlined,
                    label: 'Alkogolsyz içkiler',
                  ),
                ],
              ).withPadding(horizontal: AppSpacing.screenPadding),
              ListView(
                children: [
                  AppCarousel.box(title: 'Top Brendlar'),
                  AppCarousel.box(title: 'Egin-eşik'),
                  AppCarousel.box(title: ''),
                  AppCarousel.box(title: 'Himiki serişdeler'),
                  AppCarousel.box(title: ''),
                  AppCarousel.box(title: 'Top Brendlar'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0.01,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
        shadowColor: AppColors.lightGrey,
        foregroundColor: Colors.black,
        textStyle: AppTextStyle.text().lg().regular(),
        alignment: Alignment.centerLeft,
      ),
      child: Row(
        children: [
          Material(
            shape: const CircleBorder(),
            color: AppColors.mainAccent.withValues(alpha: 0.15),
            child: Icon(
              icon,
              color: AppColors.mainAccent,
            ).withPadding(all: AppSpacing.sm),
          ),
          Text(
            label,
          ).withPadding(vertical: AppSpacing.xl, horizontal: AppSpacing.sm),
        ],
      ),
    );
  }
}

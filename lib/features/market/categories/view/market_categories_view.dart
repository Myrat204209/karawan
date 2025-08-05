import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MarketCategoriesView extends StatefulWidget {
  const MarketCategoriesView({super.key});

  @override
  State<MarketCategoriesView> createState() => _MarketCategoriesViewState();
}

class _MarketCategoriesViewState extends State<MarketCategoriesView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStatusBar.box(
          onSearchTap: () {
            log('asdsad');
          },
          color: AppColors.mainAccent,
        ),
        TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          indicatorWeight: 0.001,

          indicatorPadding: EdgeInsetsGeometry.symmetric(horizontal: 10),
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
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15),
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
                  // ListTile(
                  //   leading: BackButton(),
                  //   titleAlignment: ListTileTitleAlignment.center,
                  //   title: Text('In taze harytlar'),
                  //   trailing: IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.filter_alt_outlined,
                  //       color: AppColors.mainAccent,
                  //     ),
                  //   ),
                  // ),
                ],
              ).paddingSymmetric(horizontal: 20),
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
            shape: CircleBorder(),

            color: AppColors.mainAccent.withValues(alpha: 0.15),
            child: Icon(icon, color: AppColors.mainAccent).paddingAll(10),
          ),
          Text(label).paddingSymmetric(vertical: 20, horizontal: 10),
        ],
      ),
    );
  }
}
// final List<String> _chipLabels = [
//     'Ählisi',
//     'Sowgat',
//     'Arzanladyş',
//     'Gök we bakja',
//     'Miwe', 
//     'Et', 
//   ];
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/features/features.dart';

class MarketCategoriesView extends StatelessWidget {
  const MarketCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          AppStatusBar(onSearchTap: () {},color: colorFromPage(true),),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
            sliver: AppCategoryChips(chipLabels:_chipLabels,),
          ),
          SideCategoryFilter(),
        ],
      
    );
  }
}

final List<String> _chipLabels = [
    'Ählisi',
    'Sowgat',
    'Arzanladyş',
    'Gök we bakja',
    'Miwe', 
    'Et', 
  ];
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:karawan/store/features.dart';

class StoreCategoriesView extends StatelessWidget {
  const StoreCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          AppStatusBar(onSearchTap: () {}),

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
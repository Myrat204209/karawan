// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketHomeView extends StatefulWidget {
  const MarketHomeView({super.key});

  @override
  State<MarketHomeView> createState() => _MarketHomeViewState();
}

class _MarketHomeViewState extends State<MarketHomeView> {
  static const _kIntroDoneKey = 'market_intro_done';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = GetIt.I<SharedPreferences>();
      final done = prefs.getBool(_kIntroDoneKey) ?? false;
      if (!done) {
        Intro.of(context).start();
        await prefs.setBool(_kIntroDoneKey, true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: IntroStepBuilder(
                order: 1,
                text: 'Bu ýerde harytlary gözleýärsiňiz',
                builder: (context, key) => Container(
                  key: key,
                  child: AppStatusBar.box(
                    onSearchTap: _onSearchTap,
                    color: AppColors.mainAccent,
                  ),
                ),
              ),
            ),
            AppCarousel(title: 'Banner'),
            SliverToBoxAdapter(
              child: IntroStepBuilder(
                order: 2,
                text: 'Kategoriýalar boýunça gezmek üçin ulanyň',
                builder: (context, key) => Container(
                  key: key,
                  child: AppCategoryChips(
                    chipLabels: const [
                      'Ählisi',
                      'Sowgat',
                      'Arzanladyş',
                      'Gök we ba',
                    ],
                  ),
                ),
              ),
            ),
            AppCategoryGrid(
              section: AppSection.store,
              title: 'Top brendler',
              itemCount: 4,
              onProductPressed: (index) {
                context.go('/store/home/products/$index');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchTap() {
    debugPrint('Search tapped - implement search functionality');
  }
}

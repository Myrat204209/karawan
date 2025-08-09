// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:karawan/app/core/tutorial_service.dart';

class MarketHomeView extends HookWidget {
  const MarketHomeView({super.key});

  // Global keys for tutorial targets - static to ensure they persist across rebuilds
  static final GlobalKey searchKey = GlobalKey();
  static final GlobalKey categoriesKey = GlobalKey();
  static final GlobalKey bannerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Tutorial steps configuration
    final tutorialSteps = useMemoized(
      () => [
        TutorialStepConfig(
          key: 'welcome',
          title: TutorialService.getText('welcome_title'),
          subtitle: TutorialService.getText('welcome_subtitle'),
          icon: Icons.home,
          iconColor: Colors.blue,
          targetKey: searchKey,
        ),
        TutorialStepConfig(
          key: 'search',
          title: TutorialService.getText('search_title'),
          subtitle: TutorialService.getText('search_subtitle'),
          icon: Icons.search,
          iconColor: Colors.orange,
          targetKey: searchKey,
        ),
        TutorialStepConfig(
          key: 'categories',
          title: TutorialService.getText('categories_title'),
          subtitle: TutorialService.getText('categories_subtitle'),
          icon: Icons.category,
          iconColor: Colors.green,
          targetKey: categoriesKey,
        ),
        TutorialStepConfig(
          key: 'banner',
          title: 'Banner',
          subtitle: 'Promosyonlar we teklifler bu ýerde görüp bilersiňiz.',
          icon: Icons.local_offer,
          iconColor: Colors.purple,
          targetKey: bannerKey,
        ),
      ],
    );

    return TutorialOverlay(
      steps: tutorialSteps,
      onComplete: () {
        debugPrint('Market tutorial completed!');
      },
      onSkip: () {
        debugPrint('Market tutorial skipped!');
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFD),
        body: CustomScrollView(
          slivers: [
            // Status Bar with Search
            SliverToBoxAdapter(
              child: AppStatusBar.box(
                key: searchKey,
                onSearchTap: _onSearchTap,
                color: AppColors.mainAccent,
              ),
            ),

            // Categories
            SliverToBoxAdapter(
              child: AppCategoryChips(
                key: categoriesKey,
                chipLabels: [
                  'Harytlar',
                  'Içgi',
                  'Çaga harytlary',
                  'Elektronika',
                  'Geyim',
                  'Aýakgap',
                ],
              ),
            ),

            // Banner Carousel
            SliverToBoxAdapter(
              child: AppCarousel(key: bannerKey, title: 'Banner'),
            ),

            // Products Grid (commented out for now)
            // SliverToBoxAdapter(
            //   child: AppCategoryGridSliver(
            //     title: 'Harytlar',
            //     products: getProductsBySection(AppSection.store),
            //     onProductPressed: (index) {
            //       final products = getProductsBySection(AppSection.store);
            //       if (index < products.length) {
            //         GoRouter.of(context).go('/store/home/products/${products[index].id}');
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _onSearchTap() {
    // TODO: Implement search functionality
    debugPrint('Search tapped - implement search functionality');
  }
}

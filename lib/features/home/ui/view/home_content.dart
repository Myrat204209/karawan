// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';
import 'package:karawan/app/router/route_names.dart';
import 'package:karawan/features/features.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 200) {
      final activeSection = context.read<HomeBloc>().state.activeSection;
      if (activeSection != null) {
        context.read<HomeBloc>().add(HomeDataFetched(section: activeSection));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeSection = context.select(
      (HomeBloc bloc) => bloc.state.activeSection,
    );
    final isMarket = activeSection == AppSection.market;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return CircularProgressIndicator.adaptive().centralize();
        }
        if (state.status == HomeStatus.success && activeSection != null) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              // --- Your initial, static widgets ---
              AppStatusBar(
                onSearchTap: () {},
                color: colorFromPage(isMarket),
                statusBarColor: colorFromPage(isMarket),
              ),
              AppSlider.sliver(
                promoItems: [
                  Assets.images.banner.image(),
                  Assets.images.banner2.image(),
                ],
              ),
              SliverToBoxAdapter(
                child: AppCategoryChips(
                  chipLabels: const [
                    'Ählisi',
                    'Sowgat',
                    'Arzanladyş',
                    'Gök we bakja',
                    'Miwe',
                    'Et',
                  ],
                  selectedColor: colorFromPage(isMarket),
                ),
              ),
              const AppCarousel(title: 'Top Brendler'),
              AppCategoryGrid(
                title: 'Iň täze harytlar',
                itemCount: 4,
                onGridPressed: () {
                  // Navigate to product details with the first product ID
                },
                onFavoritePressed: (String productId) {
                  // Dispatch BLoC event for favorite toggle
                  context.read<FavoritesBloc>().add(FavoriteToggled(productId));
                },
              ),
              for (final item in state.items)
                switch (item) {
                  HomeSliderItem sliderItem => AppSlider.sliver(
                    promoItems: sliderItem.promoItems,
                  ),
                  HomeGridItem gridItem => AppCategoryGrid(
                    title: gridItem.title,
                    itemCount: gridItem.products.length,
                    onGridPressed: () {
                      if (gridItem.products.isNotEmpty) {
                        context.goNamed(
                          isMarket
                              ? RouteNames.marketProductDetails
                              : RouteNames.restaurantProductDetails,
                          pathParameters: {'productId': 'gridItem.products[0]'},
                        );
                      }
                    },
                    onFavoritePressed: (String productId) {
                      context.read<FavoritesBloc>().add(
                        FavoriteToggled(productId),
                      );
                    },
                  ),
                },

              if (state.status == HomeStatus.loading)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  ),
                ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

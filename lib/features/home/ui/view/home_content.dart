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

  // Future<void> _loadMoreData() async {
  //   if (_isLoading) return;

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   // Simulate a network request
  //   await Future.delayed(const Duration(milliseconds: 800));

  //   // IMPORTANT: Add sliver widgets here, not box widgets.
  //   final nextWidgetIndex = _loadedWidgets.length;
  //   final newWidget = nextWidgetIndex.isEven
  //       ? AppSlider.sliver(
  //           promoItems: [
  //             Assets.images.banner.image(),
  //             Assets.images.banner2.image(),
  //           ],
  //         )
  //       : AppCategoryGrid.sliver(
  //           title: 'New Grid',
  //           itemCount: 4,
  //           section: widget.section,
  //           products: getProductsBySection(widget.section).take(4).toList(),
  //           onGridPressed: () {
  //             // Navigate to product details with the first product ID
  //             final products = getProductsBySection(widget.section);
  //             if (products.isNotEmpty) {
  //               context.goNamed(
  //                 widget.section == AppSection.market
  //                     ? RouteNames.marketProductDetails
  //                     : RouteNames
  //                           .restaurantProductDetails, // Or RouteNames.restaurantProductDetails
  //                 pathParameters: {'productId': products[0].id},
  //               );
  //             }
  //           },
  //           onFavoritePressed: (String productId) {
  //             // Dispatch BLoC event for favorite toggle
  //             context.read<FavoritesBloc>().add(FavoriteToggled(productId));
  //           },
  //         );

  //   _loadedWidgets.add(newWidget);

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

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
              AppCategoryGrid.sliver(
                title: 'Iň täze harytlar',
                itemCount: 4,
                section: activeSection,
                products: getProductsBySection(activeSection).take(4).toList(),
                onGridPressed: () {
                  // Navigate to product details with the first product ID
                  final products = getProductsBySection(activeSection);
                  if (products.isNotEmpty) {
                    context.goNamed(
                      isMarket
                          ? RouteNames.marketProductDetails
                          : RouteNames.restaurantProductDetails,
                      pathParameters: {'productId': products[0].id},
                    );
                  }
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
                  HomeGridItem gridItem => AppCategoryGrid.sliver(
                    title: gridItem.title,
                    itemCount: gridItem.products.length,
                    section: activeSection,
                    products: gridItem.products,
                    onGridPressed: () {
                      if (gridItem.products.isNotEmpty) {
                        context.goNamed(
                          isMarket
                              ? RouteNames.marketProductDetails
                              : RouteNames.restaurantProductDetails,
                          pathParameters: {
                            'productId': gridItem.products[0].id,
                          },
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

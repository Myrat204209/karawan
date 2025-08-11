import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/features/restaurant/home/bloc/restaurant_home_bloc.dart';

class RestaurantHomeViewImproved extends StatefulWidget {
  const RestaurantHomeViewImproved({super.key});

  @override
  State<RestaurantHomeViewImproved> createState() =>
      _RestaurantHomeViewImprovedState();
}

class _RestaurantHomeViewImprovedState
    extends State<RestaurantHomeViewImproved> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Initialize the BLoC
    context.read<RestaurantHomeBloc>().add(const RestaurantHomeInitialized());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = context.read<RestaurantHomeBloc>().state;
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !state.hasReachedMax &&
        state.status != RestaurantHomeStatus.loadingMore) {
      context.read<RestaurantHomeBloc>().add(const RestaurantHomeLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantHomeBloc, RestaurantHomeState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            AppStatusBar(
              onSearchTap: () {},
              color: AppColors.restaurantAccent,
              statusBarColor: AppColors.restaurantAccent,
            ),

            // Initial banner
            AppSliderSliver.sliver(
              promoItems: [
                Assets.images.banner.image(),
                Assets.images.banner3.image(),
              ],
            ),

            // Category chips
            SliverToBoxAdapter(
              child: AppCategoryChips(
                chipLabels: [
                  'Ählisi',
                  'Günortanlyk',
                  'Çorbalar',
                  'Burgeler',
                  'Steýk',
                ],
              ),
            ),

            // Top meals carousel
            const AppCarousel(title: 'Top Naharlar'),

            // Main menu grid
            AppCategoryGrid.sliver(
              title: 'Menu',
              itemCount: 4,
              onGridPressed: () {
                _navigateToProductDetails(state.products);
              },
            ),

            // Dynamic content based on loaded products
            ..._buildDynamicContent(state),

            // Loading indicator
            if (state.status == RestaurantHomeStatus.loadingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
              ),

            // Error state
            if (state.status == RestaurantHomeStatus.failure)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Error: ${state.errorMessage}',
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<RestaurantHomeBloc>().add(
                              const RestaurantHomeRefresh(),
                            );
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  List<Widget> _buildDynamicContent(RestaurantHomeState state) {
    final widgets = <Widget>[];

    // Group products into sections of 4 for grid display
    for (int i = 0; i < state.products.length; i += 4) {
      final sectionProducts = state.products.skip(i).take(4).toList();
      final sectionIndex = i ~/ 4;

      if (sectionIndex % 2 == 0) {
        // Add promotional banner every other section
        widgets.add(
          AppSliderSliver.sliver(
            promoItems: [
              Assets.images.banner.image(),
              Assets.images.banner2.image(),
            ],
          ),
        );
      }

      // Add product grid
      widgets.add(
        AppCategoryGrid.sliver(
          title: 'Menu ${sectionIndex + 1}',
          itemCount: sectionProducts.length,
          onGridPressed: () {
            _navigateToProductDetails(sectionProducts);
          },
        ),
      );
    }

    return widgets;
  }

  void _navigateToProductDetails(List<ProductTemplate> products) {
    if (products.isNotEmpty) {
      final productId = products.first.id;
      context.go('/restaurant/home/products/$productId');
    } else {
      // Show error or fallback navigation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No products available'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

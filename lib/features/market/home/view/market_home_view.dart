// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/blocs/favorites/favorites_bloc.dart';

class MarketHomeView extends StatefulWidget {
  const MarketHomeView({super.key});

  @override
  State<MarketHomeView> createState() => _MarketHomeViewState();
}

class _MarketHomeViewState extends State<MarketHomeView> {
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _loadedWidgets = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Initial load
    _loadMoreData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate a network request
    await Future.delayed(const Duration(milliseconds: 800));

    // IMPORTANT: Add sliver widgets here, not box widgets.
    final nextWidgetIndex = _loadedWidgets.length;
    final newWidget = nextWidgetIndex.isEven
        ? AppSlider.sliver(
            promoItems: [
              Assets.images.banner.image(),
              Assets.images.banner2.image(),
            ],
          )
        : AppCategoryGrid.sliver(
            title: 'New Grid',
            itemCount: 4,
            section: AppSection.store,
            products: getProductsBySection(AppSection.store).take(4).toList(),
            onGridPressed: () {
              // Navigate to product details with the first product ID
              final products = getProductsBySection(AppSection.store);
              if (products.isNotEmpty) {
                context.go('/store/home/products/${products[0].id}');
              }
            },
            onFavoritePressed: (String productId) {
              // Dispatch BLoC event for favorite toggle
              context.read<FavoritesBloc>().add(FavoriteToggled(productId));
            },
          );

    _loadedWidgets.add(newWidget);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        // --- Your initial, static widgets ---
        AppStatusBar(
          onSearchTap: () {},
          color: AppColors.mainAccent,
          statusBarColor: AppColors.mainAccent,
        ),
        AppSlider.sliver(
          promoItems: [
            Assets.images.banner.image(),
            Assets.images.banner2.image(),
          ],
        ),
        SliverToBoxAdapter(
          child: const AppCategoryChips(
            chipLabels: [
              'Ählisi',
              'Sowgat',
              'Arzanladyş',
              'Gök we bakja',
              'Miwe',
              'Et',
            ],
          ),
        ),
        const AppCarousel(title: 'Top Brendler'),
        AppCategoryGrid.sliver(
          title: 'Iň täze harytlar',
          itemCount: 4,
          section: AppSection.store,
          products: getProductsBySection(AppSection.store).take(4).toList(),
          onGridPressed: () {
            // Navigate to product details with the first product ID
            final products = getProductsBySection(AppSection.store);
            if (products.isNotEmpty) {
              context.go('/store/home/products/${products[0].id}');
            }
          },
          onFavoritePressed: (String productId) {
            // Dispatch BLoC event for favorite toggle
            context.read<FavoritesBloc>().add(FavoriteToggled(productId));
          },
        ),

        ..._loadedWidgets,

        if (_isLoading)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
      ],
    );
  }
}

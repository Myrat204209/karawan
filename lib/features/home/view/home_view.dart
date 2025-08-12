// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/core/go_router_scaffold.dart';
import 'package:karawan/blocs/favorites/favorites_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.section});

  final AppSection section;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
            section: widget.section,
            products: getProductsBySection(widget.section).take(4).toList(),
            onGridPressed: () {
              // Navigate to product details with the first product ID
              final products = getProductsBySection(widget.section);
              if (products.isNotEmpty) {
                context.go(
                  '/${widget.section == AppSection.market ? 'market' : 'restaurant'}/home/products/${products[0].id}',
                );
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
          color: colorFromPage(widget.section == AppSection.market),
          statusBarColor: colorFromPage(widget.section == AppSection.market),
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
          section: widget.section,
          products: getProductsBySection(widget.section).take(4).toList(),
          onGridPressed: () {
            // Navigate to product details with the first product ID
            final products = getProductsBySection(widget.section);
            if (products.isNotEmpty) {
              context.go(
                '/${widget.section == AppSection.market ? 'market' : 'restaurant'}/home/products/${products[0].id}',
              );
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

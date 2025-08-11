// lib/restaurant/home/view/restaurant_home_view.dart
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/blocs/favorites/favorites_bloc.dart';

class RestaurantHomeView extends StatefulWidget {
  const RestaurantHomeView({super.key});

  @override
  State<RestaurantHomeView> createState() => _RestaurantHomeViewState();
}

class _RestaurantHomeViewState extends State<RestaurantHomeView> {
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _loadedWidgets = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
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

    await Future.delayed(const Duration(milliseconds: 800));

    final nextWidgetIndex = _loadedWidgets.length;
    final newWidget = nextWidgetIndex.isEven
        ? AppSliderSliver.sliver(
            promoItems: [
              Assets.images.banner.image(),
              Assets.images.banner2.image(),
            ],
          )
        : AppCategoryGrid.sliver(
            title: 'Menu ${nextWidgetIndex ~/ 2}',
            itemCount: 4,
            section: AppSection.restaurant,
            products: getProductsBySection(
              AppSection.restaurant,
            ).take(4).toList(),
            onGridPressed: () {
              // Navigate to product details with the specific product ID
              final products = getProductsBySection(AppSection.restaurant);
              if (products.isNotEmpty) {
                context.go('/restaurant/home/products/${products[0].id}');
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
        AppStatusBar(
          onSearchTap: () {},
          color: colorFromPage(false),
          statusBarColor: colorFromPage(false),
        ),
        AppSliderSliver.sliver(
          promoItems: [
            Assets.images.banner.image(),
            Assets.images.banner3.image(),
          ],
        ),
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
        const AppCarousel(title: 'Top Naharlar'),
        AppCategoryGrid.sliver(
          title: 'Menu',
          itemCount: 4,
          section: AppSection.restaurant,
          products: getProductsBySection(
            AppSection.restaurant,
          ).take(4).toList(),
          onGridPressed: () {
            // Navigate to product details with the specific product ID
            final products = getProductsBySection(AppSection.restaurant);
            if (products.isNotEmpty) {
              context.go('/restaurant/home/products/${products[0].id}');
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

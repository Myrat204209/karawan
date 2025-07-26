// lib/restaurant/home/view/restaurant_home_view.dart
import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

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
        ? AppSlider(
            promoItems: [
              Assets.images.banner.image(),
              Assets.images.banner2.image(),
            ],
          )
        : AppCategoryGrid(title: 'Menu', itemCount: 4);

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
        AppStatusBar(onSearchTap: () {}),
        AppSlider(
          promoItems: [
            Assets.images.banner.image(),
            Assets.images.banner3.image(),
          ],
        ),
        const AppCategoryChips(
          chipLabels: [
            'Ählisi',
            'Günortanlyk',
            'Çorbalar',
            'Burgeler',
            'Steýk',
          ],
        ),
        const AppCarousel(title: 'Top Naharlar'),
        AppCategoryGrid(
          title: 'Menu',
          itemCount: 4,
          onGridPressed: () {
            context.router.push(RestaurantProductsRoute());
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

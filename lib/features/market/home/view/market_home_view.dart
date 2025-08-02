import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

class MarketHomeView extends StatefulWidget {
  const MarketHomeView({super.key});

  @override
  State<MarketHomeView> createState() => _MarketHomeViewState();
}

class _MarketHomeViewState extends State<MarketHomeView> {
  final ScrollController _scrollController = ScrollController();

  // 1. Use a List to store the dynamically loaded widgets.
  final List<Widget> _loadedWidgets = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // No need to load data initially, it will load on first scroll.
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

    // Simulate a network request
    await Future.delayed(const Duration(milliseconds: 800));

    // 2. Add a new widget to the list based on the current list length.
    final nextWidgetIndex = _loadedWidgets.length;
    final newWidget = nextWidgetIndex.isEven
        ? AppSlider(
            promoItems: [
              Assets.images.banner.image(),
              Assets.images.banner2.image(),
            ],
          )
        : AppCategoryGrid(
            title: 'New Grid ${nextWidgetIndex ~/ 2}',
            itemCount: 4,
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
        AppStatusBar(onSearchTap: () {}, color: colorFromPage(true)),
        AppSlider(
          promoItems: [
            Assets.images.banner.image(),
            Assets.images.banner2.image(),
          ],
        ),
        const AppCategoryChips(
          chipLabels: [
            'Ählisi',
            'Sowgat',
            'Arzanladyş',
            'Gök we bakja',
            'Miwe',
            'Et',
          ],
        ),
        const AppCarousel(title: 'Top Brendler'),
        const AppCategoryGrid(title: 'Iň täze harytlar', itemCount: 4),

        // 3. Build the list of dynamically loaded widgets.
        ..._loadedWidgets,

        // 4. Show the loading indicator at the bottom.
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/features/features.dart';

class MarketFilterPage extends StatefulWidget {
  const MarketFilterPage({super.key});

  @override
  State<MarketFilterPage> createState() => _MarketFilterPageState();
}

class _MarketFilterPageState extends State<MarketFilterPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const FilterModalBottomSheet(),
      );
      if (mounted) context.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

import 'package:flutter/material.dart';

/// A wrapper widget that keeps its child alive, preserving its state
/// when it's off-screen in a PageView or TabBarView.
class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({super.key, required this.child});

  final Widget child;

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  // This is the magic line. It tells Flutter to keep this widget's state alive.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // This is required by the mixin.
    super.build(context);
    return widget.child;
  }
}

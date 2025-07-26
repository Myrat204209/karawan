
import 'package:flutter/material.dart';

class DualSectionView extends StatefulWidget {
  const DualSectionView({
    super.key,
    required this.leftPage,
    required this.rightPage,
    required this.onPageChange,
  });

  final Widget leftPage;
  final Widget rightPage;
  final ValueChanged<int> onPageChange;

  @override
  State<DualSectionView> createState() => _DualSectionViewState();
}

class _DualSectionViewState extends State<DualSectionView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _currentPageIndex = 0; // 0 for Store, 1 for Restaurant

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      value: 0.0, // Start with the left page (Store) fully visible
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    // Update the animation value based on the horizontal drag
    _controller.value += details.primaryDelta! / screenWidth;
  }

  void _onDragEnd(DragEndDetails details) {
    // On drag end, "snap" to the nearest section
    if (_controller.value > 0.5) {
      _controller.forward().then((_) => _notifyPageChange(1));
    } else {
      _controller.reverse().then((_) => _notifyPageChange(0));
    }
  }

  void _notifyPageChange(int newIndex) {
    if (_currentPageIndex != newIndex) {
      setState(() {
        _currentPageIndex = newIndex;
      });
      widget.onPageChange(newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The two main pages are always in the stack
        Offstage(offstage: _controller.value == 0, child: widget.rightPage),
        Offstage(offstage: _controller.value == 1, child: widget.leftPage),

        // The custom animated handle
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final handlePosition = (_controller.value * (MediaQuery.sizeOf(context).width - 60));
            return Positioned(
              left: handlePosition,
              top: MediaQuery.sizeOf(context).height / 2 - 50,
              child: GestureDetector(
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: _StretchyHandle(
                  progress: _controller.value,
                  isLeft: _currentPageIndex == 1,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// The custom painter for the stretchy handle effect.
class _StretchyHandle extends StatelessWidget {
  const _StretchyHandle({required this.progress, required this.isLeft});
  final double progress;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HandleClipper(progress: progress),
      child: Container(
        width: 60,
        height: 100,
        color: Colors.blue.withValues(alpha:  0.5),
        child: Icon(
          isLeft ? Icons.chevron_left : Icons.chevron_right,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

class _HandleClipper extends CustomClipper<Path> {
  _HandleClipper({required this.progress});
  final double progress;

  @override
  Path getClip(Size size) {
    final path = Path();
    final controlPointX = size.width / 2 + (progress - 0.5) * size.width * 0.5;
    path.moveTo(0, 0);
    path.quadraticBezierTo(controlPointX, size.height / 2, 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
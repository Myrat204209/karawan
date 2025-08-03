import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  AppSearchBar({
    super.key,
    required this.onTap,
    required this.hintText,
    required this.editTextController,
    this.width = 200,
    this.iconSize = 45,
    this.gutter = 20,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.fastOutSlowIn,
    this.textFieldAnimationDuration = const Duration(milliseconds: 200),
    this.textFieldAnimationCurve = Curves.easeInOut,
    this.iconBoxShadow,
    this.iconColor = AppColors.mainAccent,
    this.iconBackgroundColor = Colors.white,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black38,
        spreadRadius: 4,
        blurRadius: 2,
        offset: Offset(0, 2),
      ),
    ],
    this.backgroundColor = const Color(0xff101010),
  });

  final void Function()? onTap;

  final double? width;

  /// Note: this icon is a sizedBox widget.
  final double? iconSize;

  /// Some extra space for expanded bar.
  final double? gutter;

  /// Hint text for textField inside expandable bar.
  final String? hintText;

  /// Animation duration for expandable bar.
  ///
  /// default is 500 milliseconds
  final Duration animationDuration;

  /// Animation curve for expandable bar.
  ///
  /// Default is Curves.fastOutSlowIn
  ///
  /// Note: Other curves may be glitchy.
  final Cubic animationCurve;

  /// Animation duration for textField.
  ///
  /// Default is 200 milliseconds
  final Duration textFieldAnimationDuration;

  /// Animation curve for textField.
  ///
  /// Default is Curves.easeInOut
  final Cubic textFieldAnimationCurve;

  /// Controller for textfield
  TextEditingController? editTextController;

  /// Shadow for icon button.
  final List<BoxShadow>? iconBoxShadow;

  /// Button Icon color.
  /// If not set default will be:
  /// ```dart
  /// const Color(0xff47E10C)
  /// ```
  final Color iconColor;

  /// Button Icon color.
  /// If not set default will be:
  /// ```dart
  ///const Color(0xff353535)
  /// ```
  final Color iconBackgroundColor;

  /// Shadow for animated bar.
  /// If not set default will be :
  /// ```dart
  /// [
  ///   BoxShadow(
  ///     color: Colors.black38,
  ///     spreadRadius: 4,
  ///     blurRadius: 2,
  ///     offset: Offset(0, 2),
  ///   ),
  /// ]
  /// ```
  final List<BoxShadow>? boxShadow;

  /// Background color for animated bar.
  /// If not set default will be:
  /// ```dart
  /// const Color(0xff101010)
  /// ```
  final Color backgroundColor;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  bool isSearchbarHidden = true;
  @override
  Widget build(BuildContext context) {
    // bool amIHovering = false;
    // Offset exitFrom = const Offset(0, 0);
    return MouseRegion(
      onEnter:
          (details) => setState(() {
            // amIHovering = true;
            isSearchbarHidden = false;
          }),
      onExit:
          (details) => setState(() {
            // amIHovering = false;
            isSearchbarHidden = true;
            // You can use details.position if you are interested in the global position of your pointer.
            // exitFrom = details.localPosition;
          }),
      child: AnimatedContainer(
        width:
            isSearchbarHidden
                ? widget.iconSize
                : widget.width! + (widget.gutter as double),
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        padding:
            isSearchbarHidden
                ? const EdgeInsets.all(0)
                : const EdgeInsets.only(left: 14),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: widget.boxShadow,
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              width:
                  isSearchbarHidden
                      ? 0.0
                      : widget.width! - (widget.iconSize as double),
              height: widget.iconSize,
              duration: widget.textFieldAnimationDuration,
              curve: widget.textFieldAnimationCurve,
              child: TextField(
                controller: widget.editTextController,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                onTap: () {
                  setState(() {
                    isSearchbarHidden = !isSearchbarHidden;
                  });
                  // Call the original onTap if it exists
                  if (widget.onTap != null) {
                    widget.onTap!();
                  }
                },
                child: RoundSearchIcon(
                  width: widget.iconSize,
                  backgroundColor: widget.iconBackgroundColor,
                  iconColor: widget.iconColor,
                  boxShadow: widget.iconBoxShadow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundSearchIcon extends StatelessWidget {
  const RoundSearchIcon({
    super.key,
    this.width = 40,
    this.boxShadow,
    this.iconColor = const Color(0xff47E10C),
    this.backgroundColor = const Color(0xff353535),
  });

  final double? width;
  final List<BoxShadow>? boxShadow;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // We use the same structure as AppActionIcon to ensure consistent styling.
    return SizedBox(
      width: width,
      height: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          // Use the boxShadow passed from the AppSearchBar.
          boxShadow: boxShadow,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.search_rounded, color: iconColor, size: 25),
          style: IconButton.styleFrom(
            // Use the backgroundColor passed from the AppSearchBar.
            backgroundColor: backgroundColor,
            shape: const CircleBorder(),
          ),
          // The onTap is handled by the InkWell wrapper in the parent AppSearchBar.
          onPressed: () {},
        ),
      ),
    );
  }
}

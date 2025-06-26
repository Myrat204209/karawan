import 'package:flutter/material.dart';

extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );
}

extension WidgetCenterX on Widget {
  Widget centralize() => Center(child: this);
}


extension WidgetColorX on Widget {
  Widget colorize(Color color) => ColoredBox(color: color, child: this);
}

extension WidgetRatio on Widget {
  Widget ratio(double ratio) => AspectRatio(aspectRatio: ratio, child: this);
}

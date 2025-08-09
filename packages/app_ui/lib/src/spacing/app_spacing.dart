import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App spacing constants following design system best practices
class AppSpacing {
  // Private constructor to prevent instantiation
  AppSpacing._();

  // Base spacing unit (4dp)
  static const double _baseUnit = 4.0;

  // Extra small spacing (4dp)
  static double get xs => _baseUnit.w;

  // Small spacing (8dp)
  static double get sm => (_baseUnit * 2).w;

  // Medium spacing (12dp)
  static double get md => (_baseUnit * 3).w;

  // Large spacing (16dp)
  static double get lg => (_baseUnit * 4).w;

  // Extra large spacing (20dp)
  static double get xl => (_baseUnit * 5).w;

  // Double extra large spacing (24dp)
  static double get xxl => (_baseUnit * 6).w;

  // Triple extra large spacing (32dp)
  static double get xxxl => (_baseUnit * 8).w;

  // Screen edge padding
  static double get screenPadding => 20.w;

  // Card padding
  static double get cardPadding => 16.w;

  // Button padding
  static double get buttonPadding => 12.w;

  // Input field padding
  static double get inputPadding => 16.w;

  // List item padding
  static double get listItemPadding => 12.w;

  // Section padding
  static double get sectionPadding => 24.w;

  // Bottom navigation height
  static double get bottomNavHeight => 85.h;

  // App bar height
  static double get appBarHeight => 75.h;

  // Status bar height
  static double get statusBarHeight => 44.h;
}

/// Extension for easier spacing usage
extension SpacingExtension on Widget {
  /// Add padding with app spacing
  Widget withPadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? horizontal ?? all ?? 0,
        top: top ?? vertical ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
      ),
      child: this,
    );
  }

  /// Add margin with app spacing
  Widget withMargin({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: left ?? horizontal ?? all ?? 0,
        top: top ?? vertical ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
      ),
      child: this,
    );
  }
}

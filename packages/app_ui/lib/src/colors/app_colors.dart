import 'package:flutter/material.dart';

/// `AppColors` is a utility class that holds color constants
/// for both Light and Dark modes to maintain color consistency
/// across the app.
abstract class AppColors {
  /// Main accent color (Orange) used throughout the app in Light Mode.
  /// Typically applied to buttons, icons, and primary UI elements.
  static const Color mainAccent = Color(0xFFFC8101);

  /// Secondary accent color (Green) for Light Mode.
  /// Used as a subtle complementary color for main accents.
  static const Color secondAccent = Color(0xFF4CAF50);

  /// Background color for primary surfaces in Light Mode.
  /// Typically used as a screen or main content background.
  static const Color bgMain = Color(0xFFF7F7F7);

  /// Secondary background color in Light Mode.
  /// Used for cards, containers, and other secondary surfaces.
  static const Color bgSecond = Color(0xFFF5F5F5);

  /// Light alert background color in Light Mode.
  /// Used for backgrounds of alert or warning UI elements.
  static const Color alertLightAccent = Color(0xFFFFEDEF);

  /// Major accent for light-colored alert backgrounds in Light Mode.
  /// Typically used for background of major alerts or notifications.
  static const Color majorLightAccent = Color(0xFFFFEFD9);

  /// Alert color (Red) used for text and icons in Light Mode.
  /// Ideal for error and critical warnings.
  static const Color alertAccent = Color(0xFFF44336);

  /// Primary text color (Black) for Light Mode.
  /// Typically used for body text and headings.
  static const Color textColor = Color(0xFF000000);

  /// Secondary text color (Gray) for Light Mode.
  /// Used for less prominent text or placeholders.
  static const Color textLight = Color(0xFFa0aab3);

  /// Light title text color (Gray) for Light Mode.
  /// Typically used for subtitles and minor headings.
  static const Color textLightTitle = Color(0xFF6b7278);

  /// Border color (Light Gray) for Light Mode.
  /// Used for dividers, outlines, and card borders.
  static const Color border = Color(0xFFd9dade);

  /// Major accent color (Purple) in Light Mode.
  /// Often used to draw attention to important elements like promotional banners.
  static const Color majorAccent = Color(0xFF5f259e);

  /// Tertiary accent color (Dark Blue) for Light Mode.
  /// Adds a cool accent to the app's color palette, used in payment buttons.
  static const Color thirdAccent = Color(0xFF1976D2);

  /// Light variation of the tertiary accent (Light Blue) in Light Mode.
  /// Used as a soft background or for subtle highlights, like on product labels.
  static const Color thirdLightAccent = Color(0xFFE3F2FD);

  /// Highlight color (Yellow) for Light Mode.
  /// Used for star ratings and emphasis elements.
  static const Color highlightColor = Color(0xFFFFEB3B);

  /// Secondary button background color (Light Gray) in Light Mode.
  /// Used for buttons like "Проверить скидки".
  static const Color buttonBackground = Color(0xFFE8ECEF);

  static const Color iconColor = Color(0xff6b7278);
}

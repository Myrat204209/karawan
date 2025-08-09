import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service class for managing tutorial functionality
class TutorialService {
  static const String _tutorialCompletedKey = 'tutorial_completed';
  static const String _marketTutorialCompletedKey = 'market_tutorial_completed';
  static const String _restaurantTutorialCompletedKey =
      'restaurant_tutorial_completed';

  // Turkmen tutorial texts
  static const Map<String, String> _turkmenTexts = {
    'welcome_title': 'Karawan uygulamasyna hoş geldiňiz!',
    'welcome_subtitle':
        'Uygulamanyň esasy funksiyalaryny öwrenmek üçin gysga bir gýzgaç geçireliň.',

    'search_title': 'Gözleş',
    'search_subtitle': 'Bu ýerde harytlary we restoranlary gözleýärsiňiz.',

    'categories_title': 'Kategoriýalar',
    'categories_subtitle': 'Harytlary kategoriýa boýunça tapyň.',

    'favorites_title': 'Halanlarym',
    'favorites_subtitle': 'Halan harytlaryňyzy bu ýerde görüp bilersiňiz.',

    'cart_title': 'Sebet',
    'cart_subtitle':
        'Satyň almak isleýän harytlaryňyzy bu ýerde görüp bilersiňiz.',

    'profile_title': 'Profil',
    'profile_subtitle':
        'Şahsy maglumatlaryňyzy we sazlamalaryňyzy bu ýerde tapyň.',

    'product_title': 'Haryt',
    'product_subtitle': 'Haryt barada maglumatlary görüp, sebete goşuň.',

    'quantity_title': 'Mukdary',
    'quantity_subtitle': 'Harytyň mukdaryny saýlaň.',

    'add_to_cart_title': 'Sebete goş',
    'add_to_cart_subtitle': 'Bu düwmäni basyp haryty sebete goşuň.',

    'checkout_title': 'Sargyt et',
    'checkout_subtitle': 'Sargydyňyzy tamamlamak üçin bu düwmäni basyň.',

    'payment_title': 'Töleg',
    'payment_subtitle': 'Töleg usulyny saýlaň.',

    'delivery_title': 'Eltip bermek',
    'delivery_subtitle': 'Eltip bermek usulyny saýlaň.',

    'address_title': 'Salgy',
    'address_subtitle': 'Eltip bermek salgysyny giriziň.',

    'phone_title': 'Telefon',
    'phone_subtitle': 'Telefon belgiňizi giriziň.',

    'note_title': 'Bellik',
    'note_subtitle': 'Sargyt barada bellik goşuň.',

    'finish_title': 'Tamam!',
    'finish_subtitle': 'Siz indi uygulamanyň esasy funksiyalaryny bilýärsiňiz.',
  };

  /// Get localized text by key
  static String getText(String key) {
    final text = _turkmenTexts[key];
    if (text == null) {
      debugPrint('Missing tutorial text for key: $key');
      return 'Tutorial step'; // Fallback text
    }
    return text;
  }

  /// Check if general tutorial is completed
  static Future<bool> isTutorialCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_tutorialCompletedKey) ?? false;
    } catch (e) {
      debugPrint('Error checking tutorial completion: $e');
      return false;
    }
  }

  /// Check if market tutorial is completed
  static Future<bool> isMarketTutorialCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_marketTutorialCompletedKey) ?? false;
    } catch (e) {
      debugPrint('Error checking market tutorial completion: $e');
      return false;
    }
  }

  /// Check if restaurant tutorial is completed
  static Future<bool> isRestaurantTutorialCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_restaurantTutorialCompletedKey) ?? false;
    } catch (e) {
      debugPrint('Error checking restaurant tutorial completion: $e');
      return false;
    }
  }

  /// Mark general tutorial as completed
  static Future<void> markTutorialCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_tutorialCompletedKey, true);
    } catch (e) {
      debugPrint('Error marking tutorial completed: $e');
    }
  }

  /// Mark market tutorial as completed
  static Future<void> markMarketTutorialCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_marketTutorialCompletedKey, true);
    } catch (e) {
      debugPrint('Error marking market tutorial completed: $e');
    }
  }

  /// Mark restaurant tutorial as completed
  static Future<void> markRestaurantTutorialCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_restaurantTutorialCompletedKey, true);
    } catch (e) {
      debugPrint('Error marking restaurant tutorial completed: $e');
    }
  }

  /// Reset all tutorial states
  static Future<void> resetAllTutorials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_tutorialCompletedKey, false);
      await prefs.setBool(_marketTutorialCompletedKey, false);
      await prefs.setBool(_restaurantTutorialCompletedKey, false);
    } catch (e) {
      debugPrint('Error resetting tutorials: $e');
    }
  }

  /// Reset specific tutorial
  static Future<void> resetTutorial(String tutorialKey) async {
    try {
      // Validate tutorial key
      final validKeys = [
        _tutorialCompletedKey,
        _marketTutorialCompletedKey,
        _restaurantTutorialCompletedKey,
      ];

      if (!validKeys.contains(tutorialKey)) {
        debugPrint('Invalid tutorial key: $tutorialKey');
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(tutorialKey, false);
    } catch (e) {
      debugPrint('Error resetting tutorial: $e');
    }
  }

  /// Get tutorial completion status for a specific section
  static Future<bool> isTutorialCompletedForSection(AppSection section) async {
    switch (section) {
      case AppSection.store:
        return isMarketTutorialCompleted();
      case AppSection.restaurant:
        return isRestaurantTutorialCompleted();
    }
  }

  /// Mark tutorial as completed for a specific section
  static Future<void> markTutorialCompletedForSection(
    AppSection section,
  ) async {
    switch (section) {
      case AppSection.store:
        await markMarketTutorialCompleted();
        break;
      case AppSection.restaurant:
        await markRestaurantTutorialCompleted();
        break;
    }
  }
}

/// Tutorial step configuration
class TutorialStepConfig {
  final String key;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final GlobalKey? targetKey;

  const TutorialStepConfig({
    required this.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.targetKey,
  });
}

/// Custom tutorial overlay widget
class TutorialOverlay extends StatefulWidget {
  final Widget child;
  final List<TutorialStepConfig> steps;
  final VoidCallback? onComplete;
  final VoidCallback? onSkip;
  final AppSection section;

  const TutorialOverlay({
    super.key,
    required this.child,
    required this.steps,
    this.onComplete,
    this.onSkip,
    this.section = AppSection.store,
  });

  @override
  State<TutorialOverlay> createState() => _TutorialOverlayState();
}

class _TutorialOverlayState extends State<TutorialOverlay>
    with TickerProviderStateMixin {
  int _currentStep = 0;
  bool _isVisible = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Animation constants
  static const Duration _animationDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _checkTutorialStatus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _checkTutorialStatus() async {
    final isCompleted = await TutorialService.isTutorialCompletedForSection(
      widget.section,
    );
    if (mounted && !isCompleted && widget.steps.isNotEmpty) {
      setState(() {
        _isVisible = true;
      });
      _animationController.forward();
    }
  }

  void _nextStep() {
    if (_currentStep < widget.steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      _completeTutorial();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _completeTutorial() async {
    await TutorialService.markTutorialCompletedForSection(widget.section);
    _animationController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
    widget.onComplete?.call();
  }

  void _skipTutorial() async {
    await TutorialService.markTutorialCompletedForSection(widget.section);
    _animationController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
    widget.onSkip?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isVisible && widget.steps.isNotEmpty)
          FadeTransition(opacity: _fadeAnimation, child: _buildOverlay()),
      ],
    );
  }

  Widget _buildOverlay() {
    if (_currentStep >= widget.steps.length) {
      return const SizedBox.shrink();
    }

    final step = widget.steps[_currentStep];

    return Container(
      color: Colors.black.withValues(alpha: 0.8),
      child: Stack(
        children: [
          // Tutorial content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: AppSpacing.screenPadding,
            right: AppSpacing.screenPadding,
            child: _buildTutorialWidget(step),
          ),
        ],
      ),
    );
  }

  Widget _buildTutorialWidget(TutorialStepConfig step) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.screenPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: step.iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(step.icon, size: 32, color: step.iconColor),
          ),
          SizedBox(height: AppSpacing.lg),

          // Title
          Text(
            step.title,
            style: AppTextStyle.text().lg().bold().withColor(Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.sm),

          // Subtitle
          Text(
            step.subtitle,
            style: AppTextStyle.text().md().withColor(Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.xl),

          // Navigation buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _skipTutorial,
                child: Text(
                  'Geç',
                  style: AppTextStyle.text().md().withColor(Colors.grey),
                ),
              ),
              Row(
                children: [
                  if (_currentStep > 0)
                    _buildCircularIconButton(
                      onPressed: _previousStep,
                      icon: Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  SizedBox(width: AppSpacing.sm),
                  Text(
                    '${_currentStep + 1}/${widget.steps.length}',
                    style: AppTextStyle.text().md().withColor(Colors.grey),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  _buildCircularIconButton(
                    onPressed: () {
                      if (_currentStep == widget.steps.length - 1) {
                        _completeTutorial();
                      } else {
                        _nextStep();
                      }
                    },
                    icon: _currentStep == widget.steps.length - 1
                        ? Icons.check
                        : Icons.arrow_forward,
                    color: AppColors.getSectionAccent(widget.section),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIconButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          padding: EdgeInsets.all(AppSpacing.sm),
        ),
      ),
    );
  }
}

// Suggested code for 'lib/app/router/section_config.dart'

import 'package:app_ui/app_ui.dart' show AppSection;
import 'package:karawan/app/core/go_router_scaffold.dart';

/// A configuration model that holds all the unique properties for a major
/// navigation section of the app (e.g., Market or Restaurant).
class SectionConfig {
  final String pathPrefix;
  final AppSection appSection;
  final String productDetailsRouteName;
  final List<GoRouterNavigationItem> navigationItems;
  final String oppositePath;

  const SectionConfig({
    required this.pathPrefix,
    required this.appSection,
    required this.productDetailsRouteName,
    required this.navigationItems,
    required this.oppositePath,
  });
}

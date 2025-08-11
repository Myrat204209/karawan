import 'package:app_ui/app_ui.dart';

/// Repository for restaurant-specific data operations
class RestaurantRepository {
  RestaurantRepository();

  final int pageSize = 10;

  /// Get products for restaurant section with pagination
  Future<List<ProductTemplate>> getProducts({required int page}) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));

    final allProducts = getProductsBySection(AppSection.restaurant);
    final startIndex = page * pageSize;
    final endIndex = startIndex + pageSize;

    if (startIndex >= allProducts.length) {
      return [];
    }

    return allProducts.sublist(
      startIndex,
      endIndex > allProducts.length ? allProducts.length : endIndex,
    );
  }

  /// Get product by ID
  ProductTemplate? findProductById(String id) {
    return getProductById(id, AppSection.restaurant);
  }

  /// Get all products for restaurant section
  List<ProductTemplate> getAllProducts() {
    return getProductsBySection(AppSection.restaurant);
  }
}

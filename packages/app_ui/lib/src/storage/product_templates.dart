import 'package:app_ui/app_ui.dart';

class ProductTemplate {
  final String id;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String imagePath;
  final AppSection section;

  const ProductTemplate({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.imagePath,
    required this.section,
  });
}

// Template products for Store section
const List<ProductTemplate> storeProducts = [
  ProductTemplate(
    id: 'store_product_1',
    name: 'Döner kebap',
    price: 20.00,
    description: 'Fresh grilled meat with vegetables and sauce',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_1.png',
    section: AppSection.market,
  ),
  ProductTemplate(
    id: 'store_product_2',
    name: 'Pizza',
    price: 20.00,
    description: 'Delicious pizza with melted cheese and toppings',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_2.png',
    section: AppSection.market,
  ),
  ProductTemplate(
    id: 'store_product_3',
    name: 'Sushi',
    price: 20.00,
    description: 'Fresh sushi rolls with premium ingredients',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_3.png',
    section: AppSection.market,
  ),
  ProductTemplate(
    id: 'store_product_4',
    name: 'Shaurma',
    price: 20.00,
    description: 'Grilled meat wrapped in flatbread with fresh vegetables',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_4.png',
    section: AppSection.market,
  ),
];

// Template products for Restaurant section
const List<ProductTemplate> restaurantProducts = [
  ProductTemplate(
    id: 'restaurant_product_1',
    name: 'Döner kebap',
    price: 20.00,
    description: 'Fresh grilled meat with vegetables and sauce',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_1.png',
    section: AppSection.restaurant,
  ),
  ProductTemplate(
    id: 'restaurant_product_2',
    name: 'Pizza',
    price: 20.00,
    description: 'Delicious pizza with melted cheese and toppings',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_2.png',
    section: AppSection.restaurant,
  ),
  ProductTemplate(
    id: 'restaurant_product_3',
    name: 'Sushi',
    price: 20.00,
    description: 'Fresh sushi rolls with premium ingredients',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_3.png',
    section: AppSection.restaurant,
  ),
  ProductTemplate(
    id: 'restaurant_product_4',
    name: 'Shaurma',
    price: 20.00,
    description: 'Grilled meat wrapped in flatbread with fresh vegetables',
    rating: 5.0,
    imagePath: 'packages/app_ui/assets/images/meals/meal_4.png',
    section: AppSection.restaurant,
  ),
];

// Helper function to get product by ID
ProductTemplate? getProductById(String id, AppSection section) {
  final products =
      section == AppSection.market ? storeProducts : restaurantProducts;
  try {
    return products.firstWhere((product) => product.id == id);
  } catch (e) {
    return null;
  }
}

// Helper function to get all products for a section
List<ProductTemplate> getProductsBySection(AppSection section) {
  return section == AppSection.market ? storeProducts : restaurantProducts;
}

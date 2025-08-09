// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RestaurantFavoritesView extends HookWidget {
  const RestaurantFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Reactive favorites data
    final favorites = useFavorites(AppSection.restaurant);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Holanlarym',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        SizedBox(height: 20),
        if (favorites.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Holanlaryňyz boş',
                    style: AppTextStyle.text().lg().semiBold().withColor(
                      Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Holanlaryňyzy doldurmak üçin harytlar goşuň',
                    style: AppTextStyle.text().md().withColor(Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: ListView.separated(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final productId = favorites.elementAt(index);
                final product = getProductById(
                  productId,
                  AppSection.restaurant,
                );

                if (product == null) return SizedBox.shrink();

                return AppFavoriteItem(
                  name: product.name,
                  description: product.description,
                  price: product.price,
                  rating: product.rating,
                  image: Image.asset(product.imagePath, fit: BoxFit.cover),
                  onRemove: () {
                    final storage = StorageProvider();
                    storage.toggleFavorite(productId, AppSection.restaurant);
                  },
                  onAddToCart: () {
                    final storage = StorageProvider();
                    storage.updateCartQuantity(
                      productId,
                      1,
                      AppSection.restaurant,
                    );
                  },
                  section: AppSection.restaurant,
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
            ),
          ),
      ],
    );
  }
}

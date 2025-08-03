import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RestaurantFavoritesView extends HookWidget {
  const RestaurantFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = StorageHooks.useFavorites('restaurant');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Halanlarym',
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
                    'Halanlaryňyz yok',
                    style: AppTextStyle.text().lg().semiBold().withColor(
                      Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Halanlaryňyzy görmek üçin harytlara halan belgisi goşuň',
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
                final favorite = favorites[index];
                return AppFavoriteItem(
                  onRemove: () {
                    StorageProvider.service.removeFromFavorites(
                      favorite.id,
                      favorite.section,
                    );
                  },
                  name: favorite.name,
                  price: favorite.price,
                  description: favorite.description,
                  rating: favorite.rating,
                  image: Image.asset(
                    favorite.imagePath.isNotEmpty
                        ? favorite.imagePath
                        : 'assets/images/meals/meal1.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
            ),
          ),
      ],
    ).paddingSymmetric(horizontal: 15).paddingOnly(top: 15);
  }
}

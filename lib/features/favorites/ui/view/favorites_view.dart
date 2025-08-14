import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.select((FavoritesBloc b) => b.state.favorites);

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
                final product = getProductById(productId, AppSection.market);

                if (product == null) return SizedBox.shrink();

                return AppFavoriteItem(
                  name: product.name,
                  description: product.description,
                  price: product.price,
                  rating: product.rating,
                  image: Image.asset(product.imagePath, fit: BoxFit.cover),
                  onRemove: () {
                    context.read<FavoritesBloc>().add(
                      FavoriteToggled(productId),
                    );
                  },
                  onAddToCart: () {
                    final storage = StorageProvider();
                    storage.updateCartQuantity(productId, 1, AppSection.market);
                  },
                  section: AppSection.market,
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
            ),
          ),
      ],
    );
  }
}

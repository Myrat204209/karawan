import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class RestaurantProductsView extends StatelessWidget {
  const RestaurantProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 389 / 250,
                    child: AppMainImage(
                      image: Assets.images.meals.meal1.image(scale: 0.4),
                      onLiked: () {},
                    ).colorize(Colors.red),
                  ),
                  ListTile(
                    leading: Text('Doner Kebap'),
                    trailing: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Column(children: [Text('Jemi'), Text('20.00 TMT')]),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondRestAccent,
                  ),
                  child: Text('Sebede Gos'),
                ),
              ),
            ],
          ).paddingAll(10).colorize(Colors.white),
        ],
      ),
    );
  }
}

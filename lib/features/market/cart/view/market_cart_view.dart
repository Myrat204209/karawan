// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MarketCartView extends HookWidget {
  const MarketCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = StorageHooks.useCartItems('market');
    final cartTotal = StorageHooks.useCartTotal('market');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Sebedim',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        SizedBox(height: 20),
        if (cartItems.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sebediňiz boş',
                    style: AppTextStyle.text().lg().semiBold().withColor(
                      Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sebediňizi doldurmak üçin harytlar goşuň',
                    style: AppTextStyle.text().md().withColor(Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else ...[
          Expanded(
            child: ListView.separated(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return AppCartItem(
                  onRemove: () {
                    StorageProvider.service.removeFromCart(
                      cartItem.id,
                      cartItem.section,
                    );
                  },
                  onQuantityChanged: (quantity) {
                    StorageProvider.service.updateCartItemQuantity(
                      cartItem.id,
                      cartItem.section,
                      quantity,
                    );
                  },
                  name: cartItem.name,
                  price: cartItem.price,
                  description: cartItem.description,
                  quantity: cartItem.quantity,
                  image: Image.asset(
                    cartItem.imagePath.isNotEmpty
                        ? cartItem.imagePath
                        : 'assets/images/meals/meal1.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jemi',
                        style: AppTextStyle.text().md().withColor(Colors.grey),
                      ),
                      Text(
                        'TMT ${cartTotal.toStringAsFixed(2)}',
                        style: AppTextStyle.text().lg().semiBold().withColor(
                          AppColors.mainAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Sargyt et'),
                ),
              ],
            ),
          ),
        ],
      ],
    ).paddingSymmetric(horizontal: 15).paddingOnly(top: 15);
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppProductItemEnhanced extends HookWidget {
  const AppProductItemEnhanced({
    super.key,
    required this.onGridPressed,
    required this.image,
    required this.name,
    this.price = 30.00,
    required this.description,
    required this.rating,
    required this.productId,
    required this.section,
    this.imagePath = '',
    required this.isFavorite,
    this.cartItem,
  });

  final Widget image;
  final VoidCallback? onGridPressed;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String productId;
  final String section;
  final String imagePath;
  final bool isFavorite;
  final CartItem? cartItem;

  @override
  Widget build(BuildContext context) {
    final storageService = useMemoized(() => StorageProvider.service, []);
    final cartItem = StorageHooks.useCartItem(productId, section);
    return InkWell(
      onTap: onGridPressed ?? () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: kCircular15Border,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 14.1,
              blurStyle: BlurStyle.solid,
              color: Color(0x00000000).withValues(alpha: 0.05),
            ),
          ],
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: kCircular15Border,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    AppMainImage(
                      onLiked: () {
                        if (isFavorite) {
                          storageService.removeFromFavorites(
                            productId,
                            section,
                          );
                        } else {
                          storageService.addToFavorites(
                            FavoriteItem(
                              id: productId,
                              name: name,
                              price: price,
                              description: description,
                              rating: rating,
                              imagePath: imagePath,
                              section: section,
                              addedAt: DateTime.now(),
                            ),
                          );
                        }
                      },
                      image: image,
                      isLiked: isFavorite,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color:
                              isFavorite ? AppColors.mainAccent : Colors.grey,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: AppTextStyle.text()
                                  .withFontSize(14.sp)
                                  .semiBold()
                                  .withColor(Colors.black),
                            ),
                          ),
                          Text(
                            'TMT ${price.toStringAsFixed(2)}',
                            style: AppTextStyle.text()
                                .semiBold()
                                .withFontSize(14.sp)
                                .withColor(AppColors.secondRestAccent),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          description,
                          softWrap: true,
                          style: AppTextStyle.text().copyWith(
                            color: Color(0xFF464646),
                            fontSize: 9.sp,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 15),
                            Text(
                              rating.toStringAsFixed(1),
                              style: AppTextStyle.text()
                                  .withFontSize(13.sp)
                                  .medium()
                                  .withColor(Colors.black),
                            ),
                            Spacer(),
                            if (cartItem != null)
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (cartItem.quantity > 1) {
                                        storageService.updateCartItemQuantity(
                                          productId,
                                          section,
                                          cartItem.quantity - 1,
                                        );
                                      } else {
                                        storageService.removeFromCart(
                                          productId,
                                          section,
                                        );
                                      }
                                    },
                                    icon: Icon(Icons.remove, size: 16),
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.mainAccent,
                                      foregroundColor: Colors.white,
                                      minimumSize: Size(24, 24),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      '${cartItem.quantity}',
                                      style: AppTextStyle.text()
                                          .withFontSize(12.sp)
                                          .semiBold()
                                          .withColor(Colors.black),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      storageService.updateCartItemQuantity(
                                        productId,
                                        section,
                                        cartItem.quantity + 1,
                                      );
                                    },
                                    icon: Icon(Icons.add, size: 16),
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.mainAccent,
                                      foregroundColor: Colors.white,
                                      minimumSize: Size(24, 24),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ],
                              )
                            else
                              OutlinedButton(
                                onPressed: () {
                                  storageService.addToCart(
                                    CartItem(
                                      id: productId,
                                      name: name,
                                      price: price,
                                      description: description,
                                      rating: rating,
                                      imagePath: imagePath,
                                      section: section,
                                      quantity: 1,
                                      addedAt: DateTime.now(),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppColors.secondRestAccent,
                                  side: BorderSide(color: Colors.transparent),
                                  minimumSize: Size(76.w, 21),
                                ),
                                child: Icon(
                                  Icons.shopping_cart,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

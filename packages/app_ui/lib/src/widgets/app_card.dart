// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.title,
    this.description,
    this.price,
    this.isCart = false,
  });

  final String? title;
  final String? description;
  final double? price;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 388 / 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Assets.images.mineral.image(fit: BoxFit.cover),
          ).clipper(15).paddingAll(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(top: 10),
                  title: Text(
                    title ?? 'Mineral water',
                    style: AppTextStyle.text().lg().semiBold().withColor(
                      Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    description ??
                        'Product designers who focuses on simplicity & usability',
                    style: AppTextStyle.text().xxs().withColor(Colors.black),
                  ),
                  titleAlignment: ListTileTitleAlignment.bottom,
                  trailing: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.close, color: Color(0xFF979797)),
                  ).paddingOnly(bottom: 25),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Text(
                        'TMT ${price ?? 12.00}',
                        style: AppTextStyle.text().lg().semiBold().withColor(
                          AppColors.mainAccent,
                        ),
                      ),
                    ),
                    AddToCartButton(onCartAdded: () {}),
                  ],
                ).paddingOnly(right: 6),
              ],
            ),
          ),
        ],
      ).colorize(Colors.white).clipper(15),
    ).colorize(Color(0xFFFbFbFd));
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, this.onCartAdded});
  final VoidCallback? onCartAdded;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onCartAdded,

      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 35),
        shape: StadiumBorder(),
        side: BorderSide.none,
        minimumSize: Size(80, 35),
        // fixedSize: Size.fromHeight(20),
        backgroundColor: AppColors.mainAccent,
      ),
      child: Icon(Icons.shopping_cart, size: 20, color: Colors.white),
    );
  }
}

class QuantityButton extends HookWidget {
  const QuantityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final quantity = useState<int>(1);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCartQuantityButton(
          onQuantityChanged: () {
            if (quantity.value > 1) {
              quantity.value--;
            }
          },
        ),
        Text(
          '${quantity.value}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        AppCartQuantityButton(
          isAdd: true,
          onQuantityChanged: () => quantity.value++,
        ),
      ],
    );
  }
}

class AppCartQuantityButton extends StatelessWidget {
  const AppCartQuantityButton({
    super.key,
    this.onQuantityChanged,
    this.isAdd = false,
  });
  final VoidCallback? onQuantityChanged;
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      icon: Icon(isAdd ? Icons.add : Icons.remove, color: Color(0xFF979797)),
      onPressed: onQuantityChanged,
      padding: EdgeInsets.all(5),
      style: IconButton.styleFrom(
        minimumSize: Size(20, 20),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: kCircular8Border,
          side: BorderSide(color: Color(0xFF979797), width: 3),
        ),
      ),
    );
  }
}

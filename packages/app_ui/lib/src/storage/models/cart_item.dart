// import 'package:hive/hive.dart';

// part 'cart_item.g.dart';

// @HiveType(typeId: 1)
// class CartItem extends HiveObject {
//   @HiveField(0)
//   final String id;

//   @HiveField(1)
//   final String name;

//   @HiveField(2)
//   final double price;

//   @HiveField(3)
//   final String description;

//   @HiveField(4)
//   final double rating;

//   @HiveField(5)
//   final String imagePath;

//   @HiveField(6)
//   final String section; // 'market' or 'restaurant'

//   @HiveField(7)
//   int quantity;

//   @HiveField(8)
//   final DateTime addedAt;

//   CartItem({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.rating,
//     required this.imagePath,
//     required this.section,
//     required this.quantity,
//     required this.addedAt,
//   });

//   double get totalPrice => price * quantity;
// }

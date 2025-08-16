// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryItem {
  CategoryItem({
    required this.id,
    required this.name,
    required this.image,

    required this.products,
    required this.subcategories,
  });

  final int id;
  final String name;
  final String image;
  final List<ProductItem> products;
  final List<SubCategoryItem> subcategories;

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}

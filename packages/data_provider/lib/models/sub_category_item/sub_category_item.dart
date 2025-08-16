import 'package:json_annotation/json_annotation.dart';

part 'sub_category_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SubCategoryItem {
  SubCategoryItem({
    required this.id,
    required this.name,
    required this.subCategories,
  });
  final int id;
  final String name;
  final List<SubCategoryItem> subCategories;
  factory SubCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryItemToJson(this);
}

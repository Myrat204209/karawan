import 'package:json_annotation/json_annotation.dart';

part 'brand_item.g.dart';

@JsonSerializable()
class BrandItem {
  BrandItem({required this.id, required this.image, required this.name});
  final int id;
  final String image;
  final String name;
  factory BrandItem.fromJson(Map<String, dynamic> json) =>
      _$BrandItemFromJson(json);
  Map<String, dynamic> toJson() => _$BrandItemToJson(this);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'banner_item.g.dart';

@JsonSerializable(explicitToJson: true)
class BannerItem {
  BannerItem({required this.images});
  final List<String> images;
  
  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);
  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}

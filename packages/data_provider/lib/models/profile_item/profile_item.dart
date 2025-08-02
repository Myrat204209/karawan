// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'profile_item.g.dart';

enum UserRoles { admin, subuser }

@JsonSerializable(explicitToJson: true, createToJson: false)
class ProfileItem {
  const ProfileItem({
    required this.id,
    required this.fullName,
    required this.role,
    required this.phone,
    this.avatar,
    this.subUsers,
  });

  final int id;
  final String fullName;
  final UserRoles role;
  final String phone;
  final String? avatar;
  @JsonKey(name: 'subusers')
  final List<ProfileItem>? subUsers;

  factory ProfileItem.fromJson(Map<String, dynamic> json) =>
      _$ProfileItemFromJson(json);
}

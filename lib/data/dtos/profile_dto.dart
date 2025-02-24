import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/profile_entity.dart';

part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDto extends ProfileEntity {
  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);

  ProfileDto(this.name, this.id, this.userName);

  @override
  String? name;

  @override
  String? get email;

  @override
  String id;

  @override
  String? userName;
}

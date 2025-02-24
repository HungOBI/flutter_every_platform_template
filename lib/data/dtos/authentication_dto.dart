import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/authentication_entity.dart';

part 'authentication_dto.g.dart';

@JsonSerializable()
class AuthenticationDto extends AuthenticationEntity {
  AuthenticationDto(this.accessToken, this.userId);

  @override
  @JsonKey(name: 'authToken')
  String accessToken;

  String get refreshToken => accessToken;

  String userId;

  factory AuthenticationDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationDtoToJson(this);
}

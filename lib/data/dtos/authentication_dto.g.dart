// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationDto _$AuthenticationDtoFromJson(Map<String, dynamic> json) =>
    AuthenticationDto(
      json['authToken'] as String,
      json['userId'] as String,
    );

Map<String, dynamic> _$AuthenticationDtoToJson(AuthenticationDto instance) =>
    <String, dynamic>{
      'authToken': instance.accessToken,
      'userId': instance.userId,
    };

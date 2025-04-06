// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfoModel _$TokenInfoModelFromJson(Map<String, dynamic> json) =>
    TokenInfoModel(
      token: json['token'] as String,
      accessTokenExpiryTime:
          DateTime.parse(json['accessTokenExpiryTime'] as String),
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$TokenInfoModelToJson(TokenInfoModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'accessTokenExpiryTime': instance.accessTokenExpiryTime.toIso8601String(),
      'refreshToken': instance.refreshToken,
    };

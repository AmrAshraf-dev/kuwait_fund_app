// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfoModel _$TokenInfoModelFromJson(Map<String, dynamic> json) =>
    TokenInfoModel(
      token: json['token'] as String,
      expireDate: DateTime.parse(json['expireDate'] as String),
    );

Map<String, dynamic> _$TokenInfoModelToJson(TokenInfoModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expireDate': instance.expireDate.toIso8601String(),
    };

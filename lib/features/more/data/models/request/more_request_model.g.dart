// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreRequestModel _$MoreRequestModelFromJson(Map<String, dynamic> json) =>
    MoreRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$MoreRequestModelToJson(MoreRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

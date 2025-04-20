// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRequestModel _$HomeRequestModelFromJson(Map<String, dynamic> json) =>
    HomeRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$HomeRequestModelToJson(HomeRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsRequestModel _$AdsRequestModelFromJson(Map<String, dynamic> json) =>
    AdsRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$AdsRequestModelToJson(AdsRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

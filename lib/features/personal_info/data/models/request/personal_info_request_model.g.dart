// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeraonalInfoRequestModel _$PeraonalInfoRequestModelFromJson(
        Map<String, dynamic> json) =>
    PeraonalInfoRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$PeraonalInfoRequestModelToJson(
        PeraonalInfoRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

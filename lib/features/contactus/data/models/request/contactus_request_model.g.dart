// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactus_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactusRequestModel _$ContactusRequestModelFromJson(
        Map<String, dynamic> json) =>
    ContactusRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$ContactusRequestModelToJson(
        ContactusRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

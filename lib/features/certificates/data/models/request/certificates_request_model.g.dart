// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificatesRequestModel _$CertificatesRequestModelFromJson(
        Map<String, dynamic> json) =>
    CertificatesRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$CertificatesRequestModelToJson(
        CertificatesRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

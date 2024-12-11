// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificatesModel _$CertificatesModelFromJson(Map<String, dynamic> json) =>
    CertificatesModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$CertificatesModelToJson(CertificatesModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

CertificatesResponseModel _$CertificatesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CertificatesResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CertificatesModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$CertificatesResponseModelToJson(
        CertificatesResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificatesModel _$CertificatesModelFromJson(Map<String, dynamic> json) =>
    CertificatesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CertificatesModelToJson(CertificatesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CertificatesResponseModel _$CertificatesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CertificatesResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CertificatesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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

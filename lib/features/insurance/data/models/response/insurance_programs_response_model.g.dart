// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_programs_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceProgramsModel _$InsuranceProgramsModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceProgramsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$InsuranceProgramsModelToJson(
        InsuranceProgramsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

InsuranceProgramsResponseModel _$InsuranceProgramsResponseModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceProgramsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => InsuranceProgramsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$InsuranceProgramsResponseModelToJson(
        InsuranceProgramsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

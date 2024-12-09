// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institutions_grants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstitutionGrantsModel _$InstitutionGrantsModelFromJson(
        Map<String, dynamic> json) =>
    InstitutionGrantsModel(
      instituteName: json['instituteName'] as String?,
      numberOfGrants: (json['numberOfGrants'] as num?)?.toInt(),
      valueOfGrants: json['valueOfGrants'] as String?,
    );

Map<String, dynamic> _$InstitutionGrantsModelToJson(
        InstitutionGrantsModel instance) =>
    <String, dynamic>{
      'instituteName': instance.instituteName,
      'numberOfGrants': instance.numberOfGrants,
      'valueOfGrants': instance.valueOfGrants,
    };

InstitutionsGrantsResponseModel _$InstitutionsGrantsResponseModelFromJson(
        Map<String, dynamic> json) =>
    InstitutionsGrantsResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => InstitutionGrantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$InstitutionsGrantsResponseModelToJson(
        InstitutionsGrantsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

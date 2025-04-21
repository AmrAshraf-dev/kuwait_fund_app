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
      if (instance.instituteName case final value?) 'instituteName': value,
      if (instance.numberOfGrants case final value?) 'numberOfGrants': value,
      if (instance.valueOfGrants case final value?) 'valueOfGrants': value,
    };

InstitutionsGrantsResponseModel _$InstitutionsGrantsResponseModelFromJson(
        Map<String, dynamic> json) =>
    InstitutionsGrantsResponseModel(
      code: (json['code'] as num?)?.toInt(),
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

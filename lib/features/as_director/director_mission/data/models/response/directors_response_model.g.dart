// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directors_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorsModel _$DirectorsModelFromJson(Map<String, dynamic> json) =>
    DirectorsModel(
      employeeName: json['employeeName'] as String?,
      employeeId: json['employeeId'] as String?,
    );

Map<String, dynamic> _$DirectorsModelToJson(DirectorsModel instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
    };

DirectorsResponseModel _$DirectorsResponseModelFromJson(
        Map<String, dynamic> json) =>
    DirectorsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DirectorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$DirectorsResponseModelToJson(
        DirectorsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

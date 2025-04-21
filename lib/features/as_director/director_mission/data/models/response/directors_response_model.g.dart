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
      if (instance.employeeId case final value?) 'employeeId': value,
      if (instance.employeeName case final value?) 'employeeName': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

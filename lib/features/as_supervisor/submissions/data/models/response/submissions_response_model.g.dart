// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionsModel _$SubmissionsModelFromJson(Map<String, dynamic> json) =>
    SubmissionsModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$SubmissionsModelToJson(SubmissionsModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

SubmissionsResponseModel _$SubmissionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubmissionsResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : SubmissionsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$SubmissionsResponseModelToJson(
        SubmissionsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

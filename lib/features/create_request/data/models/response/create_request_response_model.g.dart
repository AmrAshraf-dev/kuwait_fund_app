// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRequestModel _$CreateRequestModelFromJson(Map<String, dynamic> json) =>
    CreateRequestModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$CreateRequestModelToJson(CreateRequestModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

CreateRequestResponseModel _$CreateRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateRequestResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CreateRequestModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$CreateRequestResponseModelToJson(
        CreateRequestResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

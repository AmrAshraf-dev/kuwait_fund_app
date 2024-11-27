// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationsModel _$OperationsModelFromJson(Map<String, dynamic> json) =>
    OperationsModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$OperationsModelToJson(OperationsModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

OperationsResponseModel _$OperationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    OperationsResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : OperationsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$OperationsResponseModelToJson(
        OperationsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

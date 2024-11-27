// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoresModel _$StoresModelFromJson(Map<String, dynamic> json) => StoresModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$StoresModelToJson(StoresModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

StoresResponseModel _$StoresResponseModelFromJson(Map<String, dynamic> json) =>
    StoresResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : StoresModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$StoresResponseModelToJson(
        StoresResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

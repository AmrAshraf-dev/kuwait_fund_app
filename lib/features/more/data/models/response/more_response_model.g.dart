// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreModel _$MoreModelFromJson(Map<String, dynamic> json) => MoreModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$MoreModelToJson(MoreModel instance) => <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

MoreResponseModel _$MoreResponseModelFromJson(Map<String, dynamic> json) =>
    MoreResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : MoreModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$MoreResponseModelToJson(MoreResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

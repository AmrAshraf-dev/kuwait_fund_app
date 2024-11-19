// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminHomeModel _$AdminHomeModelFromJson(Map<String, dynamic> json) =>
    AdminHomeModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$AdminHomeModelToJson(AdminHomeModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

AdminHomeResponseModel _$AdminHomeResponseModelFromJson(
        Map<String, dynamic> json) =>
    AdminHomeResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AdminHomeModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AdminHomeResponseModelToJson(
        AdminHomeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

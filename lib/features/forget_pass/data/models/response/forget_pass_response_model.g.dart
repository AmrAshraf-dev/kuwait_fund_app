// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_pass_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPassModel _$ForgetPassModelFromJson(Map<String, dynamic> json) =>
    ForgetPassModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$ForgetPassModelToJson(ForgetPassModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

ForgetPassResponseModel _$ForgetPassResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForgetPassResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ForgetPassModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ForgetPassResponseModelToJson(
        ForgetPassResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_pass_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPassResponseModel _$ForgetPassResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForgetPassResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] as bool?,
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ForgetPassResponseModelToJson(
        ForgetPassResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

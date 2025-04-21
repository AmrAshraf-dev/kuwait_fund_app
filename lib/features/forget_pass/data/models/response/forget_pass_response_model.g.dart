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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

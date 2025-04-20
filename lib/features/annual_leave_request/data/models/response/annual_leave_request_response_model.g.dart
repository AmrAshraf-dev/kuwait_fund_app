// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_leave_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualLeaveRequestResponseModel _$AnnualLeaveRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    AnnualLeaveRequestResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] as String?,
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AnnualLeaveRequestResponseModelToJson(
        AnnualLeaveRequestResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

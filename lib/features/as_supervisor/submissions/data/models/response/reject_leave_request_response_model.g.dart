// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_leave_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectLeaveRequestResponseModel _$RejectLeaveRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    RejectLeaveRequestResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] as String?,
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$RejectLeaveRequestResponseModelToJson(
        RejectLeaveRequestResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

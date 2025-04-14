// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_leave_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveLeaveRequestResponseModel _$ApproveLeaveRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    ApproveLeaveRequestResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] as String?,
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ApproveLeaveRequestResponseModelToJson(
        ApproveLeaveRequestResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

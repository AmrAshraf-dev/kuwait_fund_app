// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_leave_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteLeaveModel _$DeleteLeaveModelFromJson(Map<String, dynamic> json) =>
    DeleteLeaveModel(
      leaveRequestId: (json['leaveRequestId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteLeaveModelToJson(DeleteLeaveModel instance) =>
    <String, dynamic>{
      'leaveRequestId': instance.leaveRequestId,
    };

DeleteLeaveResponseModel _$DeleteLeaveResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteLeaveResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : DeleteLeaveModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$DeleteLeaveResponseModelToJson(
        DeleteLeaveResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

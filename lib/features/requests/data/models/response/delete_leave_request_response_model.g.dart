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
      if (instance.leaveRequestId case final value?) 'leaveRequestId': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

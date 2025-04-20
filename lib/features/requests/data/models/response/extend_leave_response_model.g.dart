// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_leave_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendLeaveModel _$ExtendLeaveModelFromJson(Map<String, dynamic> json) =>
    ExtendLeaveModel(
      leaveRequestId: json['leaveRequestId'] as String?,
      extendDate: json['extendDate'] as String?,
    );

Map<String, dynamic> _$ExtendLeaveModelToJson(ExtendLeaveModel instance) =>
    <String, dynamic>{
      if (instance.leaveRequestId case final value?) 'leaveRequestId': value,
      if (instance.extendDate case final value?) 'extendDate': value,
    };

ExtendLeaveResponseModel _$ExtendLeaveResponseModelFromJson(
        Map<String, dynamic> json) =>
    ExtendLeaveResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ExtendLeaveModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ExtendLeaveResponseModelToJson(
        ExtendLeaveResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

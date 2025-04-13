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
      'leaveRequestId': instance.leaveRequestId,
      'extendDate': instance.extendDate,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_leave_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyLeaveRequestModel _$EmergencyLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    EmergencyLeaveRequestModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$EmergencyLeaveRequestModelToJson(
        EmergencyLeaveRequestModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

EmergencyLeaveRequestResponseModel _$EmergencyLeaveRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    EmergencyLeaveRequestResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : EmergencyLeaveRequestModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$EmergencyLeaveRequestResponseModelToJson(
        EmergencyLeaveRequestResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

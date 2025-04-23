// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_leave_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyLeaveRequestModel _$EmergencyLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    EmergencyLeaveRequestModel(
      allowedDays: (json['allowedDays'] as num?)?.toInt(),
      availableDays: (json['availableDays'] as num?)?.toInt(),
      availableHours: (json['availableHours'] as num?)?.toInt(),
      availableMinutes: (json['availableMinutes'] as num?)?.toInt(),
      canTakeLeaveFlg: json['canTakeLeaveFlg'] as bool?,
      emergencyLabel: json['emergencyLabel'] as String?,
      emergencyLabelDays: json['emergencyLabelDays'] as String?,
      emergencyString: json['emergencyString'] as String?,
      isEmergencyLeave: json['isEmergencyLeave'] as bool?,
    );

Map<String, dynamic> _$EmergencyLeaveRequestModelToJson(
        EmergencyLeaveRequestModel instance) =>
    <String, dynamic>{
      if (instance.emergencyString case final value?) 'emergencyString': value,
      if (instance.canTakeLeaveFlg case final value?) 'canTakeLeaveFlg': value,
      if (instance.isEmergencyLeave case final value?)
        'isEmergencyLeave': value,
      if (instance.emergencyLabel case final value?) 'emergencyLabel': value,
      if (instance.allowedDays case final value?) 'allowedDays': value,
      if (instance.emergencyLabelDays case final value?)
        'emergencyLabelDays': value,
      if (instance.availableDays case final value?) 'availableDays': value,
      if (instance.availableHours case final value?) 'availableHours': value,
      if (instance.availableMinutes case final value?)
        'availableMinutes': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

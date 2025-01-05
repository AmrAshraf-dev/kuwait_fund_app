// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_leave_request_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyLeaveRequestRequestModel _$EmergencyLeaveRequestRequestModelFromJson(
        Map<String, dynamic> json) =>
    EmergencyLeaveRequestRequestModel(
      leaveType: (json['leaveType'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      exitDate: json['exitDate'] as String?,
      requestedDays: (json['requestedDays'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmergencyLeaveRequestRequestModelToJson(
        EmergencyLeaveRequestRequestModel instance) =>
    <String, dynamic>{
      'leaveType': instance.leaveType,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'exitDate': instance.exitDate,
      'requestedDays': instance.requestedDays,
    };

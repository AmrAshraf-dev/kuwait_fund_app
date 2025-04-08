// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_leave_request_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualLeaveRequestRequestModel _$AnnualLeaveRequestRequestModelFromJson(
        Map<String, dynamic> json) =>
    AnnualLeaveRequestRequestModel(
      leaveType: (json['leaveType'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      exitDate: json['exitDate'] as String?,
    );

Map<String, dynamic> _$AnnualLeaveRequestRequestModelToJson(
        AnnualLeaveRequestRequestModel instance) =>
    <String, dynamic>{
      'leaveType': instance.leaveType,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'exitDate': instance.exitDate,
    };

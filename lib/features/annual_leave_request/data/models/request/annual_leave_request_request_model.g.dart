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
      if (instance.leaveType case final value?) 'leaveType': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.endDate case final value?) 'endDate': value,
      if (instance.exitDate case final value?) 'exitDate': value,
    };

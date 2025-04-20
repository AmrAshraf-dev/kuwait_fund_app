// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendLeaveRequestModel _$ExtendLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    ExtendLeaveRequestModel(
      leaveRequestId: json['leaveRequestId'] as String?,
      extendDate: json['extendDate'] as String?,
    );

Map<String, dynamic> _$ExtendLeaveRequestModelToJson(
        ExtendLeaveRequestModel instance) =>
    <String, dynamic>{
      if (instance.leaveRequestId case final value?) 'leaveRequestId': value,
      if (instance.extendDate case final value?) 'extendDate': value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveLeaveRequestModel _$ApproveLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    ApproveLeaveRequestModel(
      leaveRequestID: json['leaveRequestID'] as String?,
    );

Map<String, dynamic> _$ApproveLeaveRequestModelToJson(
        ApproveLeaveRequestModel instance) =>
    <String, dynamic>{
      if (instance.leaveRequestID case final value?) 'leaveRequestID': value,
    };

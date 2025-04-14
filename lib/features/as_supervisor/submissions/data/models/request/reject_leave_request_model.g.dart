// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectLeaveRequestModel _$RejectLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    RejectLeaveRequestModel(
      leaveRequestID: json['leaveRequestID'] as String?,
      rejectReason: json['rejectReason'] as String?,
    );

Map<String, dynamic> _$RejectLeaveRequestModelToJson(
        RejectLeaveRequestModel instance) =>
    <String, dynamic>{
      'leaveRequestID': instance.leaveRequestID,
      'rejectReason': instance.rejectReason,
    };

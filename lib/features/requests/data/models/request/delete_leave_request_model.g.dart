// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteLeaveRequestModel _$DeleteLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    DeleteLeaveRequestModel(
      leaveRequestID: (json['leaveRequestID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteLeaveRequestModelToJson(
        DeleteLeaveRequestModel instance) =>
    <String, dynamic>{
      if (instance.leaveRequestID case final value?) 'leaveRequestID': value,
    };

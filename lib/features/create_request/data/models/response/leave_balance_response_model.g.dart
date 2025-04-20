// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveBalanceModel _$LeaveBalanceModelFromJson(Map<String, dynamic> json) =>
    LeaveBalanceModel(
      data: json['data'] as String?,
    );

Map<String, dynamic> _$LeaveBalanceModelToJson(LeaveBalanceModel instance) =>
    <String, dynamic>{
      if (instance.data case final value?) 'data': value,
    };

LeaveBalanceResponseModel _$LeaveBalanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    LeaveBalanceResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'],
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$LeaveBalanceResponseModelToJson(
        LeaveBalanceResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

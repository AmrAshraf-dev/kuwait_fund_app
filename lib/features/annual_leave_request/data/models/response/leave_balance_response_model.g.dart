// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

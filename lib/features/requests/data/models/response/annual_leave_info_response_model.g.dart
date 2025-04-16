// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_leave_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualDetailsInfoModel _$AnnualDetailsInfoModelFromJson(
        Map<String, dynamic> json) =>
    AnnualDetailsInfoModel(
      leaveType: json['leaveType'] as String?,
      leaveStatus: json['leaveStatus'] as String?,
      leaveStatusCode: json['leaveStatusCode'] as String?,
      requestDate: json['requestDate'] as String?,
      leaveStartDate: json['leaveStartDate'] as String?,
      leaveEndDate: json['leaveEndDate'] as String?,
    );

Map<String, dynamic> _$AnnualDetailsInfoModelToJson(
        AnnualDetailsInfoModel instance) =>
    <String, dynamic>{
      'leaveStatus': instance.leaveStatus,
      'leaveStatusCode': instance.leaveStatusCode,
      'leaveType': instance.leaveType,
      'requestDate': instance.requestDate,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
    };

AnnualDetailsInfoResponseModel _$AnnualDetailsInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    AnnualDetailsInfoResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AnnualDetailsInfoModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AnnualDetailsInfoResponseModelToJson(
        AnnualDetailsInfoResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

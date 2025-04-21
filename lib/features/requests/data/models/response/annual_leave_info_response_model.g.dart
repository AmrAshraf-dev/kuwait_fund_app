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
      if (instance.leaveStatus case final value?) 'leaveStatus': value,
      if (instance.leaveStatusCode case final value?) 'leaveStatusCode': value,
      if (instance.leaveType case final value?) 'leaveType': value,
      if (instance.requestDate case final value?) 'requestDate': value,
      if (instance.leaveStartDate case final value?) 'leaveStartDate': value,
      if (instance.leaveEndDate case final value?) 'leaveEndDate': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

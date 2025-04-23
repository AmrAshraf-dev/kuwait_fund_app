// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnualLeaveScreenInfoModel _$AnnualLeaveScreenInfoModelFromJson(
        Map<String, dynamic> json) =>
    AnnualLeaveScreenInfoModel(
      availableBalance: json['availableBalance'] as String?,
      displayExitDate: json['displayExitDate'] as bool?,
    );

Map<String, dynamic> _$AnnualLeaveScreenInfoModelToJson(
        AnnualLeaveScreenInfoModel instance) =>
    <String, dynamic>{
      if (instance.availableBalance case final value?)
        'availableBalance': value,
      if (instance.displayExitDate case final value?) 'displayExitDate': value,
    };

AnnualLeaveScreenInfoResponseModel _$AnnualLeaveScreenInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    AnnualLeaveScreenInfoResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AnnualLeaveScreenInfoModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$AnnualLeaveScreenInfoResponseModelToJson(
        AnnualLeaveScreenInfoResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

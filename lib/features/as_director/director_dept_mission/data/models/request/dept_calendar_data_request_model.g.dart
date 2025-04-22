// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dept_calendar_data_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeptCalenderDataRequestModel _$DeptCalenderDataRequestModelFromJson(
        Map<String, dynamic> json) =>
    DeptCalenderDataRequestModel(
      deptCode: json['deptCode'] as String?,
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeptCalenderDataRequestModelToJson(
        DeptCalenderDataRequestModel instance) =>
    <String, dynamic>{
      if (instance.year case final value?) 'year': value,
      if (instance.month case final value?) 'month': value,
      if (instance.deptCode case final value?) 'deptCode': value,
    };

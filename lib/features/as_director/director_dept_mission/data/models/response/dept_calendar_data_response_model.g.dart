// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dept_calendar_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeptCalendarDataModel _$DeptCalendarDataModelFromJson(
        Map<String, dynamic> json) =>
    DeptCalendarDataModel(
      leave_type: json['leave_type'] as String?,
      asDate: json['asDate'] as String?,
    );

Map<String, dynamic> _$DeptCalendarDataModelToJson(
        DeptCalendarDataModel instance) =>
    <String, dynamic>{
      if (instance.asDate case final value?) 'asDate': value,
      if (instance.leave_type case final value?) 'leave_type': value,
    };

DeptCalendarDataResponseModel _$DeptCalendarDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeptCalendarDataResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => DeptCalendarDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$DeptCalendarDataResponseModelToJson(
        DeptCalendarDataResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

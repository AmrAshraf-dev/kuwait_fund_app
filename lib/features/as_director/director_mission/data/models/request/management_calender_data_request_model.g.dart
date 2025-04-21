// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_calender_data_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagementCalenderDataRequestModel _$ManagementCalenderDataRequestModelFromJson(
        Map<String, dynamic> json) =>
    ManagementCalenderDataRequestModel(
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      empID: (json['empID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ManagementCalenderDataRequestModelToJson(
        ManagementCalenderDataRequestModel instance) =>
    <String, dynamic>{
      if (instance.month case final value?) 'month': value,
      if (instance.year case final value?) 'year': value,
      if (instance.empID case final value?) 'empID': value,
    };

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
      'month': instance.month,
      'year': instance.year,
      'empID': instance.empID,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_calender_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagementCalenderDataModel _$ManagementCalenderDataModelFromJson(
        Map<String, dynamic> json) =>
    ManagementCalenderDataModel(
      asDate: json['asDate'] as String?,
      leave_type: json['leave_type'] as String?,
    );

Map<String, dynamic> _$ManagementCalenderDataModelToJson(
        ManagementCalenderDataModel instance) =>
    <String, dynamic>{
      if (instance.asDate case final value?) 'asDate': value,
      if (instance.leave_type case final value?) 'leave_type': value,
    };

ManagementCalenderDataResponseModel
    _$ManagementCalenderDataResponseModelFromJson(Map<String, dynamic> json) =>
        ManagementCalenderDataResponseModel(
          code: (json['code'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => ManagementCalenderDataModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          message: json['message'] as String?,
          totalRecords: (json['totalRecords'] as num?)?.toInt(),
          hasMorePages: json['hasMorePages'] as bool?,
        );

Map<String, dynamic> _$ManagementCalenderDataResponseModelToJson(
        ManagementCalenderDataResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

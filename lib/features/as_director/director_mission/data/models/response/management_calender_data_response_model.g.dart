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
      'asDate': instance.asDate,
      'leave_type': instance.leave_type,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

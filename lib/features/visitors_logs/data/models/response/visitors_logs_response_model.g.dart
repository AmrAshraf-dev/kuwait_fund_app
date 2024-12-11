// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_logs_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsLogsModel _$VisitorsLogsModelFromJson(Map<String, dynamic> json) =>
    VisitorsLogsModel(
      var1: json['var1'] as String?,
      var2: json['var2'] as String?,
    );

Map<String, dynamic> _$VisitorsLogsModelToJson(VisitorsLogsModel instance) =>
    <String, dynamic>{
      'var1': instance.var1,
      'var2': instance.var2,
    };

VisitorsLogsResponseModel _$VisitorsLogsResponseModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : VisitorsLogsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$VisitorsLogsResponseModelToJson(
        VisitorsLogsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

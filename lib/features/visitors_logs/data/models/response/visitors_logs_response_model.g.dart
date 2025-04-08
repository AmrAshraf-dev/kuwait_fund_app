// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_logs_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsLogsModel _$VisitorsLogsModelFromJson(Map<String, dynamic> json) =>
    VisitorsLogsModel(
      date: json['date'] as String?,
      visitType: json['visitType'] as String?,
    );

Map<String, dynamic> _$VisitorsLogsModelToJson(VisitorsLogsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'visitType': instance.visitType,
    };

VisitorsLogsResponseModel _$VisitorsLogsResponseModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VisitorsLogsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_logs_hosts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsLogsHostsModel _$VisitorsLogsHostsModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsHostsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VisitorsLogsHostsModelToJson(
        VisitorsLogsHostsModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };

VisitorsLogsHostsResponseModel _$VisitorsLogsHostsResponseModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsHostsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => VisitorsLogsHostsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$VisitorsLogsHostsResponseModelToJson(
        VisitorsLogsHostsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

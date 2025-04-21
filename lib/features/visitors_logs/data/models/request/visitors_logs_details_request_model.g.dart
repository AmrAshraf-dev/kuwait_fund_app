// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_logs_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsLogsDetailsRequestModel _$VisitorsLogsDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsDetailsRequestModel(
      hostName: json['hostName'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$VisitorsLogsDetailsRequestModelToJson(
        VisitorsLogsDetailsRequestModel instance) =>
    <String, dynamic>{
      if (instance.hostName case final value?) 'hostName': value,
      if (instance.date case final value?) 'date': value,
    };

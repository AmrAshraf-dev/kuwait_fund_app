// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_logs_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsLogsRequestModel _$VisitorsLogsRequestModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsRequestModel(
      month: json['month'] as String?,
      year: json['year'] as String?,
    );

Map<String, dynamic> _$VisitorsLogsRequestModelToJson(
        VisitorsLogsRequestModel instance) =>
    <String, dynamic>{
      if (instance.month case final value?) 'month': value,
      if (instance.year case final value?) 'year': value,
    };

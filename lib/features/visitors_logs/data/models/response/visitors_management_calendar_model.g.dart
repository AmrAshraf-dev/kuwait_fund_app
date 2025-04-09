// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_management_calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsManagementCalendarModel _$VisitorsManagementCalendarModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsManagementCalendarModel(
      date: json['date'] as String,
      visitType: json['visitType'] as String,
    );

Map<String, dynamic> _$VisitorsManagementCalendarModelToJson(
        VisitorsManagementCalendarModel instance) =>
    <String, dynamic>{
      'visitType': instance.visitType,
      'date': instance.date,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_logs_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorsLogsDetailsModel _$VisitorsLogsDetailsModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsDetailsModel(
      remarks: json['remarks'] as String,
      visitDate: json['visitDate'] as String,
      visitType: json['visitType'] as String,
      visitTime: json['visitTime'] as String?,
      visitorName: json['visitorName'] as String,
      visitorsCount: json['visitorsCount'] as String?,
      visitTypeName: json['visitTypeName'] as String?,
    );

Map<String, dynamic> _$VisitorsLogsDetailsModelToJson(
        VisitorsLogsDetailsModel instance) =>
    <String, dynamic>{
      'visitorName': instance.visitorName,
      'visitType': instance.visitType,
      'remarks': instance.remarks,
      'visitDate': instance.visitDate,
      if (instance.visitTime case final value?) 'visitTime': value,
      if (instance.visitorsCount case final value?) 'visitorsCount': value,
      if (instance.visitTypeName case final value?) 'visitTypeName': value,
    };

VisitorsLogsDetailsResponseModel _$VisitorsLogsDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    VisitorsLogsDetailsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              VisitorsLogsDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$VisitorsLogsDetailsResponseModelToJson(
        VisitorsLogsDetailsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

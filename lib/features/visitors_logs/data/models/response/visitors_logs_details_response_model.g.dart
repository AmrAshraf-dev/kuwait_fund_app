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
    );

Map<String, dynamic> _$VisitorsLogsDetailsModelToJson(
        VisitorsLogsDetailsModel instance) =>
    <String, dynamic>{
      'visitorName': instance.visitorName,
      'visitType': instance.visitType,
      'remarks': instance.remarks,
      'visitDate': instance.visitDate,
      'visitTime': instance.visitTime,
      'visitorsCount': instance.visitorsCount,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

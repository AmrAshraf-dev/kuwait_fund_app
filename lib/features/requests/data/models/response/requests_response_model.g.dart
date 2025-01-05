// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestsModel _$RequestsModelFromJson(Map<String, dynamic> json) =>
    RequestsModel(
      requestID: json['requestID'] as String?,
      requestType: json['requestType'] as String?,
      status: json['status'] as String?,
      statusCode: json['statusCode'] as String?,
      requestDate: json['requestDate'] == null
          ? null
          : DateTime.parse(json['requestDate'] as String),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      courseName: json['courseName'] as String?,
      loanReason: json['loanReason'] as String?,
      loanAmount: json['loanAmount'] as String?,
    );

Map<String, dynamic> _$RequestsModelToJson(RequestsModel instance) =>
    <String, dynamic>{
      'requestID': instance.requestID,
      'requestType': instance.requestType,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'requestDate': instance.requestDate?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'courseName': instance.courseName,
      'loanReason': instance.loanReason,
      'loanAmount': instance.loanAmount,
    };

RequestsResponseModel _$RequestsResponseModelFromJson(
        Map<String, dynamic> json) =>
    RequestsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RequestsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$RequestsResponseModelToJson(
        RequestsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

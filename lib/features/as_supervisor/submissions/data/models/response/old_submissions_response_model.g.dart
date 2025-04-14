// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_submissions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OldSubmissionsModel _$OldSubmissionsModelFromJson(Map<String, dynamic> json) =>
    OldSubmissionsModel(
      courseName: json['courseName'] as String?,
      endDate: json['endDate'] as String?,
      loanAmount: json['loanAmount'] as String?,
      loanReason: json['loanReason'] as String?,
      requestDate: json['requestDate'] as String?,
      requestID: json['requestID'] as String?,
      requestType: json['requestType'] as String?,
      startDate: json['startDate'] as String?,
      statusCode: json['statusCode'] as String?,
    );

Map<String, dynamic> _$OldSubmissionsModelToJson(
        OldSubmissionsModel instance) =>
    <String, dynamic>{
      'requestID': instance.requestID,
      'requestType': instance.requestType,
      'statusCode': instance.statusCode,
      'requestDate': instance.requestDate,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'courseName': instance.courseName,
      'loanReason': instance.loanReason,
      'loanAmount': instance.loanAmount,
    };

OldSubmissionsResponseModel _$OldSubmissionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    OldSubmissionsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OldSubmissionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$OldSubmissionsResponseModelToJson(
        OldSubmissionsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

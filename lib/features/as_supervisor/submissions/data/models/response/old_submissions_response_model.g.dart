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
      if (instance.requestID case final value?) 'requestID': value,
      if (instance.requestType case final value?) 'requestType': value,
      if (instance.statusCode case final value?) 'statusCode': value,
      if (instance.requestDate case final value?) 'requestDate': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.endDate case final value?) 'endDate': value,
      if (instance.courseName case final value?) 'courseName': value,
      if (instance.loanReason case final value?) 'loanReason': value,
      if (instance.loanAmount case final value?) 'loanAmount': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

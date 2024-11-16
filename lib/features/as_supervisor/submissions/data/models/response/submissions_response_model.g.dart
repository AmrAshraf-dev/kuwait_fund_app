// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionsModel _$SubmissionsModelFromJson(Map<String, dynamic> json) =>
    SubmissionsModel(
      type: json['type'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      requesterName: json['requesterName'] as String?,
    );

Map<String, dynamic> _$SubmissionsModelToJson(SubmissionsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'date': instance.date,
      'type': instance.type,
      'from': instance.from,
      'to': instance.to,
      'requesterName': instance.requesterName,
    };

SubmissionsResponseModel _$SubmissionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubmissionsResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : SubmissionsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$SubmissionsResponseModelToJson(
        SubmissionsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestsModel _$RequestsModelFromJson(Map<String, dynamic> json) =>
    RequestsModel(
      leaveID: json['leaveID'] as String?,
      requestDate: json['requestDate'] as String?,
      leaveStatus: json['leaveStatus'] as String?,
      leaveStartDate: json['leaveStartDate'] as String?,
      leaveEndDate: json['leaveEndDate'] as String?,
      leaveType: json['leaveType'] as String?,
      leaveExtendDate: json['leaveExtendDate'] as String?,
      leaveExtendedFlag: json['leaveExtendedFlag'] as bool?,
      showExtendButton: json['showExtendButton'] as bool?,
      showCancelButton: json['showCancelButton'] as bool?,
    );

Map<String, dynamic> _$RequestsModelToJson(RequestsModel instance) =>
    <String, dynamic>{
      'leaveID': instance.leaveID,
      'requestDate': instance.requestDate,
      'leaveStatus': instance.leaveStatus,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
      'leaveType': instance.leaveType,
      'leaveExtendDate': instance.leaveExtendDate,
      'leaveExtendedFlag': instance.leaveExtendedFlag,
      'showExtendButton': instance.showExtendButton,
      'showCancelButton': instance.showCancelButton,
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

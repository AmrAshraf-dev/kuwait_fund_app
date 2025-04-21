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
      if (instance.leaveID case final value?) 'leaveID': value,
      if (instance.requestDate case final value?) 'requestDate': value,
      if (instance.leaveStatus case final value?) 'leaveStatus': value,
      if (instance.leaveStartDate case final value?) 'leaveStartDate': value,
      if (instance.leaveEndDate case final value?) 'leaveEndDate': value,
      if (instance.leaveType case final value?) 'leaveType': value,
      if (instance.leaveExtendDate case final value?) 'leaveExtendDate': value,
      if (instance.leaveExtendedFlag case final value?)
        'leaveExtendedFlag': value,
      if (instance.showExtendButton case final value?)
        'showExtendButton': value,
      if (instance.showCancelButton case final value?)
        'showCancelButton': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

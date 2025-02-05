// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestsModel _$RequestsModelFromJson(Map<String, dynamic> json) =>
    RequestsModel(
      requestID: json['requestID'] as String?,
      requestTypeID: json['requestTypeID'] as String?,
      requestDate: json['requestDate'] as String?,
      requestStatus: json['requestStatus'] as String?,
      requestTitle: json['requestTitle'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$RequestsModelToJson(RequestsModel instance) =>
    <String, dynamic>{
      'requestID': instance.requestID,
      'requestTypeID': instance.requestTypeID,
      'requestDate': instance.requestDate,
      'requestStatus': instance.requestStatus,
      'requestTitle': instance.requestTitle,
      'details': instance.details,
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

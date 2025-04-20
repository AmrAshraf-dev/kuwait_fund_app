// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_type_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTypeModel _$RequestTypeModelFromJson(Map<String, dynamic> json) =>
    RequestTypeModel(
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$RequestTypeModelToJson(RequestTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

RequestTypeResponseModel _$RequestTypeResponseModelFromJson(
        Map<String, dynamic> json) =>
    RequestTypeResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RequestTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$RequestTypeResponseModelToJson(
        RequestTypeResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

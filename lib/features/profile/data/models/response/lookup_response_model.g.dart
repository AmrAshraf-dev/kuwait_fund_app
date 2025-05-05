// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupModel _$LookupModelFromJson(Map<String, dynamic> json) => LookupModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LookupModelToJson(LookupModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };

LookupResponseModel _$LookupResponseModelFromJson(Map<String, dynamic> json) =>
    LookupResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$LookupResponseModelToJson(
        LookupResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

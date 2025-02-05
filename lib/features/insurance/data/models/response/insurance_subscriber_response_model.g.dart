// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_subscriber_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriberModel _$SubscriberModelFromJson(Map<String, dynamic> json) =>
    SubscriberModel(
      name: json['name'] as String?,
      relation: json['relation'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );

Map<String, dynamic> _$SubscriberModelToJson(SubscriberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'relation': instance.relation,
      'dateOfBirth': instance.dateOfBirth,
    };

SubscriberResponseModel _$SubscriberResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubscriberResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubscriberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$SubscriberResponseModelToJson(
        SubscriberResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

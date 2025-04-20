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
      if (instance.name case final value?) 'name': value,
      if (instance.relation case final value?) 'relation': value,
      if (instance.dateOfBirth case final value?) 'dateOfBirth': value,
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
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

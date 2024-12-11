// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) =>
    NotificationsModel(
      date: json['date'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$NotificationTypeEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$NotificationsModelToJson(NotificationsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'title': instance.title,
      'description': instance.description,
      'type': _$NotificationTypeEnumEnumMap[instance.type]!,
    };

const _$NotificationTypeEnumEnumMap = {
  NotificationTypeEnum.normal: 'normal',
  NotificationTypeEnum.withResponse: 'withResponse',
  NotificationTypeEnum.loan: 'loan',
};

NotificationsResponseModel _$NotificationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : NotificationsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$NotificationsResponseModelToJson(
        NotificationsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsRequestModel _$NotificationsRequestModelFromJson(
        Map<String, dynamic> json) =>
    NotificationsRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$NotificationsRequestModelToJson(
        NotificationsRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

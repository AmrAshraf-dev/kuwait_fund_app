// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequestModel _$AuthRequestModelFromJson(Map<String, dynamic> json) =>
    AuthRequestModel(
      userId: json['userId'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthRequestModelToJson(AuthRequestModel instance) =>
    <String, dynamic>{
      if (instance.userId case final value?) 'userId': value,
      if (instance.password case final value?) 'password': value,
    };

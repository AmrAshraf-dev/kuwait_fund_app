// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_pass_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPassRequestModel _$ForgetPassRequestModelFromJson(
        Map<String, dynamic> json) =>
    ForgetPassRequestModel(
      userName: json['userName'] as String?,
      otp: json['otp'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$ForgetPassRequestModelToJson(
        ForgetPassRequestModel instance) =>
    <String, dynamic>{
      if (instance.userName case final value?) 'userName': value,
      if (instance.otp case final value?) 'otp': value,
      if (instance.password case final value?) 'password': value,
    };

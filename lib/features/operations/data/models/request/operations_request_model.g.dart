// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationsRequestModel _$OperationsRequestModelFromJson(
        Map<String, dynamic> json) =>
    OperationsRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$OperationsRequestModelToJson(
        OperationsRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

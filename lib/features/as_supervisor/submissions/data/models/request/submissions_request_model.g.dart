// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionsRequestModel _$SubmissionsRequestModelFromJson(
        Map<String, dynamic> json) =>
    SubmissionsRequestModel(
      requestTypeID: json['requestTypeID'] as String?,
    );

Map<String, dynamic> _$SubmissionsRequestModelToJson(
        SubmissionsRequestModel instance) =>
    <String, dynamic>{
      if (instance.requestTypeID case final value?) 'requestTypeID': value,
    };

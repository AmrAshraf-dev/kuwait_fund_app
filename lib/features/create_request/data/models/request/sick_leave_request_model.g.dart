// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sick_leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SickLeaveRequestModel _$SickLeaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    SickLeaveRequestModel(
      fileExtention: json['fileExtention'] as String?,
      bytes: json['bytes'] as String?,
    );

Map<String, dynamic> _$SickLeaveRequestModelToJson(
        SickLeaveRequestModel instance) =>
    <String, dynamic>{
      if (instance.fileExtention case final value?) 'fileExtention': value,
      if (instance.bytes case final value?) 'bytes': value,
    };

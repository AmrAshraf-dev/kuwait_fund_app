// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dept_mission_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDeptMissionRequestModel _$AdminDeptMissionRequestModelFromJson(
        Map<String, dynamic> json) =>
    AdminDeptMissionRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$AdminDeptMissionRequestModelToJson(
        AdminDeptMissionRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

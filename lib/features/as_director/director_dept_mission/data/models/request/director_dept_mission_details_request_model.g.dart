// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director_dept_mission_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorDeptMissionDetailsRequestModel
    _$DirectorDeptMissionDetailsRequestModelFromJson(
            Map<String, dynamic> json) =>
        DirectorDeptMissionDetailsRequestModel(
          asDate: json['asDate'] as String?,
          deptCode: json['deptCode'] as String?,
        );

Map<String, dynamic> _$DirectorDeptMissionDetailsRequestModelToJson(
        DirectorDeptMissionDetailsRequestModel instance) =>
    <String, dynamic>{
      if (instance.asDate case final value?) 'asDate': value,
      if (instance.deptCode case final value?) 'deptCode': value,
    };

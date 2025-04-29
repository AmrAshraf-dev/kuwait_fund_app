// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director_dept_mission_details_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorDeptMissionDetailsModel _$DirectorDeptMissionDetailsModelFromJson(
        Map<String, dynamic> json) =>
    DirectorDeptMissionDetailsModel(
      employee_name: json['employee_name'] as String?,
      evant_name: json['evant_name'] as String?,
      location: json['location'] as String?,
      from_date: json['from_date'] as String?,
      leave_type: json['leave_type'] as String?,
      to_date: json['to_date'] as String?,
      missionCount: json['missionCount'] as String?,
      leave_type_name: json['leave_type_name'] as String?,
    );

Map<String, dynamic> _$DirectorDeptMissionDetailsModelToJson(
        DirectorDeptMissionDetailsModel instance) =>
    <String, dynamic>{
      if (instance.employee_name case final value?) 'employee_name': value,
      if (instance.leave_type case final value?) 'leave_type': value,
      if (instance.location case final value?) 'location': value,
      if (instance.from_date case final value?) 'from_date': value,
      if (instance.to_date case final value?) 'to_date': value,
      if (instance.evant_name case final value?) 'evant_name': value,
      if (instance.missionCount case final value?) 'missionCount': value,
      if (instance.leave_type_name case final value?) 'leave_type_name': value,
    };

DirectorDeptMissionDetailsResponseModel
    _$DirectorDeptMissionDetailsResponseModelFromJson(
            Map<String, dynamic> json) =>
        DirectorDeptMissionDetailsResponseModel(
          code: (json['code'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => DirectorDeptMissionDetailsModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          message: json['message'] as String?,
          totalRecords: (json['totalRecords'] as num?)?.toInt(),
          hasMorePages: json['hasMorePages'] as bool?,
        );

Map<String, dynamic> _$DirectorDeptMissionDetailsResponseModelToJson(
        DirectorDeptMissionDetailsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director_mission_details_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorMissionDetailsModel _$DirectorMissionDetailsModelFromJson(
        Map<String, dynamic> json) =>
    DirectorMissionDetailsModel(
      employee_name: json['employee_name'] as String?,
      evant_name: json['evant_name'] as String?,
      location: json['location'] as String?,
      from_date: json['from_date'] as String?,
      leave_type: json['leave_type'] as String?,
      to_date: json['to_date'] as String?,
      missionCount: json['missionCount'] as String?,
    );

Map<String, dynamic> _$DirectorMissionDetailsModelToJson(
        DirectorMissionDetailsModel instance) =>
    <String, dynamic>{
      if (instance.employee_name case final value?) 'employee_name': value,
      if (instance.leave_type case final value?) 'leave_type': value,
      if (instance.location case final value?) 'location': value,
      if (instance.from_date case final value?) 'from_date': value,
      if (instance.to_date case final value?) 'to_date': value,
      if (instance.evant_name case final value?) 'evant_name': value,
      if (instance.missionCount case final value?) 'missionCount': value,
    };

DirectorMissionDetailsResponseModel
    _$DirectorMissionDetailsResponseModelFromJson(Map<String, dynamic> json) =>
        DirectorMissionDetailsResponseModel(
          code: (json['code'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => DirectorMissionDetailsModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          message: json['message'] as String?,
          totalRecords: (json['totalRecords'] as num?)?.toInt(),
          hasMorePages: json['hasMorePages'] as bool?,
        );

Map<String, dynamic> _$DirectorMissionDetailsResponseModelToJson(
        DirectorMissionDetailsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

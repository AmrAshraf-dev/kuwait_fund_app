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
      'employee_name': instance.employee_name,
      'leave_type': instance.leave_type,
      'location': instance.location,
      'from_date': instance.from_date,
      'to_date': instance.to_date,
      'evant_name': instance.evant_name,
      'missionCount': instance.missionCount,
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
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director_mission_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorMissionDetailsRequestModel _$DirectorMissionDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    DirectorMissionDetailsRequestModel(
      asDate: json['asDate'] as String?,
      empID: (json['empID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DirectorMissionDetailsRequestModelToJson(
        DirectorMissionDetailsRequestModel instance) =>
    <String, dynamic>{
      if (instance.asDate case final value?) 'asDate': value,
      if (instance.empID case final value?) 'empID': value,
    };

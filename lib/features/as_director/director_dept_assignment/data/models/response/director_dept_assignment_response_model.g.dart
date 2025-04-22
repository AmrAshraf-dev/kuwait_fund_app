// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director_dept_assignment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorDeptAssignmentModel _$DirectorDeptAssignmentModelFromJson(
        Map<String, dynamic> json) =>
    DirectorDeptAssignmentModel(
      countriesCount: (json['countriesCount'] as num?)?.toInt(),
      employeesCount: (json['employeesCount'] as num?)?.toInt(),
      missionCount: (json['missionCount'] as num?)?.toInt(),
      employeesArray: (json['employeesArray'] as List<dynamic>?)
          ?.map((e) => DirectorDeptAssignmentEmployeeModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DirectorDeptAssignmentModelToJson(
        DirectorDeptAssignmentModel instance) =>
    <String, dynamic>{
      if (instance.missionCount case final value?) 'missionCount': value,
      if (instance.employeesCount case final value?) 'employeesCount': value,
      if (instance.countriesCount case final value?) 'countriesCount': value,
      if (instance.employeesArray?.map((e) => e.toJson()).toList()
          case final value?)
        'employeesArray': value,
    };

DirectorDeptAssignmentResponseModel
    _$DirectorDeptAssignmentResponseModelFromJson(Map<String, dynamic> json) =>
        DirectorDeptAssignmentResponseModel(
          code: (json['code'] as num?)?.toInt(),
          data: json['data'] == null
              ? null
              : DirectorDeptAssignmentModel.fromJson(
                  json['data'] as Map<String, dynamic>),
          message: json['message'] as String?,
          totalRecords: (json['totalRecords'] as num?)?.toInt(),
          hasMorePages: json['hasMorePages'] as bool?,
        );

Map<String, dynamic> _$DirectorDeptAssignmentResponseModelToJson(
        DirectorDeptAssignmentResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

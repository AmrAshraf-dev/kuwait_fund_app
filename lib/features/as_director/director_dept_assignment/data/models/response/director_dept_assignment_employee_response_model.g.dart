// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director_dept_assignment_employee_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectorDeptAssignmentEmployeeModel
    _$DirectorDeptAssignmentEmployeeModelFromJson(Map<String, dynamic> json) =>
        DirectorDeptAssignmentEmployeeModel(
          employeeName: json['employeeName'] as String,
          count: (json['count'] as num).toInt(),
        );

Map<String, dynamic> _$DirectorDeptAssignmentEmployeeModelToJson(
        DirectorDeptAssignmentEmployeeModel instance) =>
    <String, dynamic>{
      'employeeName': instance.employeeName,
      'count': instance.count,
    };

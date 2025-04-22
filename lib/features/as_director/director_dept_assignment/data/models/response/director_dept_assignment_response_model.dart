import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/response/director_dept_assignment_employee_response_model.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/director_dept_assignment_entity.dart';

part 'director_dept_assignment_response_model.g.dart';

/// Model that transforms the AdminDeptMission data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class DirectorDeptAssignmentModel extends DirectorDeptAssignmentEntity {
  DirectorDeptAssignmentModel({
    required super.countriesCount,
    required super.employeesCount,
    required super.missionCount,
    required super.employeesArray,
  });

  factory DirectorDeptAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorDeptAssignmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorDeptAssignmentModelToJson(this);
}

@JsonSerializable()
class DirectorDeptAssignmentResponseModel extends BaseEntity<DirectorDeptAssignmentModel> {
  const DirectorDeptAssignmentResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory DirectorDeptAssignmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorDeptAssignmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorDeptAssignmentResponseModelToJson(this);
}

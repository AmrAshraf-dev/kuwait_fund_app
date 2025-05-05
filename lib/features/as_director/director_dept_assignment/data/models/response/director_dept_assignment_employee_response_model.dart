import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/director_dept_assignment_employee_entity.dart';

 
part 'director_dept_assignment_employee_response_model.g.dart';

/// Model that transforms the AdminDeptMission data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class DirectorDeptAssignmentEmployeeModel extends DirectorDeptAssignmentEmployeeEntity {
  DirectorDeptAssignmentEmployeeModel({
    required super.employeeName,
    required super.count,
   });

  factory DirectorDeptAssignmentEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorDeptAssignmentEmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorDeptAssignmentEmployeeModelToJson(this);
}

 
 

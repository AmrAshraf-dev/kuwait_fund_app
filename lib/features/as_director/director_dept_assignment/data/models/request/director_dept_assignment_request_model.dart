import 'package:json_annotation/json_annotation.dart';

part 'director_dept_assignment_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class DirectorDeptAssignmentRequestModel {
  DirectorDeptAssignmentRequestModel({required this.deptCode});

  factory DirectorDeptAssignmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorDeptAssignmentRequestModelFromJson(json);
 
  final String? deptCode;

  Map<String, dynamic> toJson() => _$DirectorDeptAssignmentRequestModelToJson(this);
}

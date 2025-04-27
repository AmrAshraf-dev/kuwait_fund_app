import 'package:json_annotation/json_annotation.dart';

part 'director_dept_mission_details_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class DirectorDeptMissionDetailsRequestModel {
  DirectorDeptMissionDetailsRequestModel({required this.asDate,   required this.deptCode});

  factory DirectorDeptMissionDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorDeptMissionDetailsRequestModelFromJson(json);
  final String? asDate;
   final String? deptCode;

  Map<String, dynamic> toJson() => _$DirectorDeptMissionDetailsRequestModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/director_dept_mission_details_entity.dart';

part 'director_dept_mission_details_reponse_model.g.dart';

/// Model that transforms the AdminHome data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class DirectorDeptMissionDetailsModel extends DirectorDeptMissionDetailsEntity {
  DirectorDeptMissionDetailsModel({
    required super.employee_name,
    required super.evant_name,
    required super.location,
    required super.from_date,
    required super.leave_type,
    required super.to_date,
    required super.missionCount,
    required super.leave_type_name
    

  });

  factory DirectorDeptMissionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorDeptMissionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorDeptMissionDetailsModelToJson(this);
}

@JsonSerializable()
class DirectorDeptMissionDetailsResponseModel extends BaseEntity<List<DirectorDeptMissionDetailsModel>> {
  const DirectorDeptMissionDetailsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory DirectorDeptMissionDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorDeptMissionDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorDeptMissionDetailsResponseModelToJson(this);
}

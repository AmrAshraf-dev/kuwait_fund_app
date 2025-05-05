import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/director_mission_details_entity.dart';

import '../../../../../shared/entity/base_entity.dart';
 
part 'director_mission_details_reponse_model.g.dart';

/// Model that transforms the AdminHome data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class DirectorMissionDetailsModel extends DirectorMissionDetailsEntity {
  DirectorMissionDetailsModel({
    required super.employee_name,
    required super.evant_name,
    required super.location,
    required super.from_date,
    required super.leave_type,
    required super.to_date,
    required super.missionCount,
    required super.leave_type_name,
    

  });

  factory DirectorMissionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorMissionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorMissionDetailsModelToJson(this);
}

@JsonSerializable()
class DirectorMissionDetailsResponseModel extends BaseEntity<List<DirectorMissionDetailsModel>> {
  const DirectorMissionDetailsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory DirectorMissionDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorMissionDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorMissionDetailsResponseModelToJson(this);
}

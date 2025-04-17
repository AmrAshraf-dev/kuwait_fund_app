import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/director_director_mission_entity.dart';

part 'admin_director_mission_response_model.g.dart';

/// Model that transforms the AdminDirectorMission data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class AdminDirectorMissionModel extends AdminDirectorMissionEntity {
  AdminDirectorMissionModel({
    required super.var1,
    required super.var2,
  });

  factory AdminDirectorMissionModel.fromJson(Map<String, dynamic> json) =>
      _$AdminDirectorMissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminDirectorMissionModelToJson(this);
}

@JsonSerializable()
class AdminDirectorMissionResponseModel
    extends BaseEntity<AdminDirectorMissionModel> {
  const AdminDirectorMissionResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AdminDirectorMissionResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$AdminDirectorMissionResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AdminDirectorMissionResponseModelToJson(this);
}

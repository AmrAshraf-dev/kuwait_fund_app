import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/director_dept_mission_entity.dart';

part 'dept_response_model.g.dart';

/// Model that transforms the AdminDirectorMission data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class DeptModel extends DeptEntity {
  DeptModel({
    required super.     name,
    required super.departmentCode,
    
  });

  factory DeptModel.fromJson(Map<String, dynamic> json) =>
      _$DeptModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeptModelToJson(this);
}

@JsonSerializable()
class DeptResponseModel
    extends BaseEntity<List<DeptModel>> {
  const DeptResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory DeptResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$DeptResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeptResponseModelToJson(this);
}

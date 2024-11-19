import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/admin_dept_mission_entity.dart';

part 'admin_dept_mission_response_model.g.dart';

/// Model that transforms the AdminDeptMission data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class AdminDeptMissionModel extends AdminDeptMissionEntity {
  AdminDeptMissionModel({
    required super.var1,
    required super.var2,
  });

  factory AdminDeptMissionModel.fromJson(Map<String, dynamic> json) =>
      _$AdminDeptMissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminDeptMissionModelToJson(this);
}

@JsonSerializable()
class AdminDeptMissionResponseModel extends BaseEntity<AdminDeptMissionModel> {
  const AdminDeptMissionResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AdminDeptMissionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdminDeptMissionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminDeptMissionResponseModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/director_entity.dart';

import '../../../../../shared/entity/base_entity.dart';
 
part 'directors_response_model.g.dart';

/// Model that transforms the AdminHome data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class DirectorsModel extends DirectorEntity {
  DirectorsModel({
    required super.employeeName,
    required super.employeeId,
  });

  factory DirectorsModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorsModelToJson(this);
}

@JsonSerializable()
class DirectorsResponseModel extends BaseEntity<List<DirectorsModel>> {
  const DirectorsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory DirectorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DirectorsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorsResponseModelToJson(this);
}

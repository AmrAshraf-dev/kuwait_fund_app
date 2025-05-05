import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/experiences_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'experiences_response_model.g.dart';

/// Model that transforms the Expriences data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class ExperiencesModel extends ExperiencesEntity {
  const ExperiencesModel({
    super.id,
    super.employerName,
    super.jobTitle,
    super.joinDate,
    super.resignDate,
  });

  factory ExperiencesModel.fromJson(Map<String, dynamic> json) =>
      _$ExperiencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperiencesModelToJson(this);
}

@JsonSerializable()
class ExperiencesResponseModel extends BaseEntity<List<ExperiencesModel>> {
  const ExperiencesResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory ExperiencesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExperiencesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperiencesResponseModelToJson(this);
}

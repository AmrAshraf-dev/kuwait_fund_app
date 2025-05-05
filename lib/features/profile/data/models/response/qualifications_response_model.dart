import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/qualifications_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'qualifications_response_model.g.dart';

/// Model that transforms the Qualifications data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class QualificationsModel extends QualificationsEntity {
  const QualificationsModel({
    super.id,
    super.educationName,
    super.graduationDate,
  });

  factory QualificationsModel.fromJson(Map<String, dynamic> json) =>
      _$QualificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$QualificationsModelToJson(this);
}

@JsonSerializable()
class QualificationsResponseModel
    extends BaseEntity<List<QualificationsModel>> {
  const QualificationsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory QualificationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QualificationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QualificationsResponseModelToJson(this);
}

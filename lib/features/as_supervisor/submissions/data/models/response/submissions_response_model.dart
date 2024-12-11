import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/submissions_entity.dart';

part 'submissions_response_model.g.dart';

/// Model that transforms the Submissions data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class SubmissionsModel extends SubmissionsEntity {
  const SubmissionsModel({
    required super.type,
    required super.date,
    required super.status,
    required super.from,
    required super.to,
    required super.requesterName,
  });

  factory SubmissionsModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionsModelToJson(this);
}

@JsonSerializable()
class SubmissionsResponseModel extends BaseEntity<SubmissionsModel> {
  const SubmissionsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SubmissionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionsResponseModelToJson(this);
}

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
  SubmissionsModel({
    required super.var1,
    required super.var2,
  });

  factory SubmissionsModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionsModelToJson(this);
}

@JsonSerializable()
class SubmissionsResponseModel extends BaseEntity<SubmissionsModel> {
  const SubmissionsResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SubmissionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionsResponseModelToJson(this);
}

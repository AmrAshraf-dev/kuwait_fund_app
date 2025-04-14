import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/old_submissions_entity.dart';

part 'old_submissions_response_model.g.dart';

/// Model that transforms the Submissions data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class OldSubmissionsModel extends OldSubmissionsEntity {
  const OldSubmissionsModel({
    required super.courseName,
    required super.endDate,
    required super.loanAmount,
    required super.loanReason,
    required super.requestDate,
    required super.requestID,
    required super.requestType,
    required super.startDate,
    required super.statusCode,
  });

  factory OldSubmissionsModel.fromJson(Map<String, dynamic> json) =>
      _$OldSubmissionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OldSubmissionsModelToJson(this);
}

@JsonSerializable()
class OldSubmissionsResponseModel
    extends BaseEntity<List<OldSubmissionsModel>> {
  const OldSubmissionsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory OldSubmissionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OldSubmissionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OldSubmissionsResponseModelToJson(this);
}

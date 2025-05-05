import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/submission_entity.dart';

import '../../../../../shared/entity/base_entity.dart';

part 'submission_response_model.g.dart';

/// Model that transforms the LeaveRequestWaiting data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class SubmissionModel extends SubmissionEntity {
  const SubmissionModel({
    required super.id,
    required super.empLoginName,
    required super.createDate,
    required super.mobile,
    required super.leaveStatus,
    required super.leaveType,
    required super.startDate,
    required super.endDate,
  });

  factory SubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionModelToJson(this);
}

@JsonSerializable()
class SubmissionResponseModel extends BaseEntity<List<SubmissionModel>> {
  const SubmissionResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SubmissionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionResponseModelToJson(this);
}

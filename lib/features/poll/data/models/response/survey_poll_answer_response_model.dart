import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';

part 'survey_poll_answer_response_model.g.dart';

/// Model that transforms the AnnualLeaveRequest data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use.
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class SurveyPollAnswerResponseModel extends BaseEntity<String> {
  const SurveyPollAnswerResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SurveyPollAnswerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyPollAnswerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyPollAnswerResponseModelToJson(this);
}

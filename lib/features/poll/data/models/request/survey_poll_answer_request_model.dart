import 'package:json_annotation/json_annotation.dart';

part 'survey_poll_answer_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API.
  It is also responsible for converting the data into a format that the API can use.
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class SurveyPollAnswerRequestModel {
  SurveyPollAnswerRequestModel(
      {required this.questionId, required this.answerId});

  factory SurveyPollAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyPollAnswerRequestModelFromJson(json);
  final int questionId;
  final int answerId;

  Map<String, dynamic> toJson() => _$SurveyPollAnswerRequestModelToJson(this);
}

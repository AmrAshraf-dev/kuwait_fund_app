// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_poll_answer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyPollAnswerRequestModel _$SurveyPollAnswerRequestModelFromJson(
        Map<String, dynamic> json) =>
    SurveyPollAnswerRequestModel(
      questionId: (json['questionId'] as num).toInt(),
      answerId: (json['answerId'] as num).toInt(),
    );

Map<String, dynamic> _$SurveyPollAnswerRequestModelToJson(
        SurveyPollAnswerRequestModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answerId': instance.answerId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyDetailsModel _$SurveyDetailsModelFromJson(Map<String, dynamic> json) =>
    SurveyDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      pollQuestions: (json['pollQuestions'] as List<dynamic>?)
          ?.map((e) => PollQuestionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$SurveyDetailsModelToJson(SurveyDetailsModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.title case final value?) 'title': value,
      if (instance.pollQuestions?.map((e) => e.toJson()).toList()
          case final value?)
        'pollQuestions': value,
    };

SurveyDetailsResponseModel _$SurveyDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SurveyDetailsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : SurveyDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$SurveyDetailsResponseModelToJson(
        SurveyDetailsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

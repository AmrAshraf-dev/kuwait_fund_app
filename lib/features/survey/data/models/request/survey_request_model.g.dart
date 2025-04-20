// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyRequestModel _$SurveyRequestModelFromJson(Map<String, dynamic> json) =>
    SurveyRequestModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$SurveyRequestModelToJson(SurveyRequestModel instance) =>
    <String, dynamic>{
      if (instance.email case final value?) 'email': value,
      if (instance.lang case final value?) 'lang': value,
    };

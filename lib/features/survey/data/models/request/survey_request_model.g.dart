// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyRequestModel _$SurveyRequestModelFromJson(Map<String, dynamic> json) =>
    SurveyRequestModel(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SurveyRequestModelToJson(SurveyRequestModel instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      if (instance.pageSize case final value?) 'pageSize': value,
    };

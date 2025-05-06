// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollDetailsModel _$PollDetailsModelFromJson(Map<String, dynamic> json) =>
    PollDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      pollAnswers: (json['pollAnswers'] as List<dynamic>?)
          ?.map((e) => PollAnswersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      question: json['question'] as String?,
    );

Map<String, dynamic> _$PollDetailsModelToJson(PollDetailsModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.question case final value?) 'question': value,
      if (instance.pollAnswers?.map((e) => e.toJson()).toList()
          case final value?)
        'pollAnswers': value,
    };

PollDetailsResponseModel _$PollDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    PollDetailsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PollDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$PollDetailsResponseModelToJson(
        PollDetailsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };

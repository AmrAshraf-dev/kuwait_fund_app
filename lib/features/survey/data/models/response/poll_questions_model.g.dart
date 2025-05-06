// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollQuestionsModel _$PollQuestionsModelFromJson(Map<String, dynamic> json) =>
    PollQuestionsModel(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      pollAnswers: (json['pollAnswers'] as List<dynamic>?)
          ?.map((e) => PollAnswersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PollQuestionsModelToJson(PollQuestionsModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.question case final value?) 'question': value,
      if (instance.pollAnswers?.map((e) => e.toJson()).toList()
          case final value?)
        'pollAnswers': value,
    };

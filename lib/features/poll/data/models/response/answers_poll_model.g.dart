// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers_poll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollAnswersModel _$PollAnswersModelFromJson(Map<String, dynamic> json) =>
    PollAnswersModel(
      id: (json['id'] as num?)?.toInt(),
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$PollAnswersModelToJson(PollAnswersModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.answer case final value?) 'answer': value,
    };

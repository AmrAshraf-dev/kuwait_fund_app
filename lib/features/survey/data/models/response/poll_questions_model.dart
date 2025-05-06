
import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/survey/data/models/response/answers_poll_model.dart';
 import 'package:kf_ess_mobile_app/features/survey/domain/entities/poll_questions_entity.dart';


part 'poll_questions_model.g.dart';



/// Model that transforms the Poll data from the API to the
/// application entity

  /*
  The model is responsible for converting the data into a format that the rest of the application can use.
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */



@JsonSerializable()
class PollQuestionsModel extends PollQuestionsEntity {
  PollQuestionsModel(
      {
   required super.id,
    required super.question,
    required super.pollAnswers,
     });


  factory PollQuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$PollQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PollQuestionsModelToJson(this);
}

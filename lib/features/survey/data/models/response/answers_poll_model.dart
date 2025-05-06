
import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_answers_entity.dart';


part 'answers_poll_model.g.dart';



/// Model that transforms the Poll data from the API to the
/// application entity

  /*
  The model is responsible for converting the data into a format that the rest of the application can use.
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */



@JsonSerializable()
class PollAnswersModel extends PollAnswersEntity {
  PollAnswersModel(
      {
   required super.id,
    required super.answer,
    });

  factory PollAnswersModel.fromJson(Map<String, dynamic> json) =>
      _$PollAnswersModelFromJson(json);

  Map<String, dynamic> toJson() => _$PollAnswersModelToJson(this);
}


import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/response/answers_poll_model.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_details_entity.dart';
import '../../../../shared/entity/base_entity.dart';
part 'poll_details_response_model.g.dart';



/// Model that transforms the PollDetails data from the API to the
/// application entity

  /*
  The model is responsible for converting the data into a format that the rest of the application can use.
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */



@JsonSerializable()
class PollDetailsModel extends PollDetailsEntity {
 const PollDetailsModel(
      {
   required super.id,
    required super.pollAnswers,
    required super.question,

    });

  factory PollDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PollDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PollDetailsModelToJson(this);
}

@JsonSerializable()
class PollDetailsResponseModel extends BaseEntity<PollDetailsModel> {
  const PollDetailsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory PollDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PollDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PollDetailsResponseModelToJson(this);
}
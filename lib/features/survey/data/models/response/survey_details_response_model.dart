
import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/survey/data/models/response/poll_questions_model.dart';
 import 'package:kf_ess_mobile_app/features/survey/domain/entities/survey_details_entity.dart';
  import '../../../../shared/entity/base_entity.dart';
part 'survey_details_response_model.g.dart';



/// Model that transforms the SurveyDetails data from the API to the
/// application entity

  /*
  The model is responsible for converting the data into a format that the rest of the application can use.
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */



@JsonSerializable()
class SurveyDetailsModel extends SurveyDetailsEntity {
 const SurveyDetailsModel(
      {
   required super.id,
    required super.pollQuestions,
    required super.title,

    });

  factory SurveyDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyDetailsModelToJson(this);
}

@JsonSerializable()
class SurveyDetailsResponseModel extends BaseEntity<SurveyDetailsModel> {
  const SurveyDetailsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory SurveyDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyDetailsResponseModelToJson(this);
}
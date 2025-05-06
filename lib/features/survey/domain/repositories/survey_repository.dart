


import "package:kf_ess_mobile_app/features/survey/domain/entities/survey_details_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/survey_request_model.dart";
import "../entities/survey_entity.dart";



/// Data operations for the Survey collection
abstract class SurveyRepository {

  /*
  A repository is a collection of data operations. It is responsible for
  abstracting the data layer from the business logic layer.
  */


  Future<CustomResponseType<BaseEntity< List<SurveyEntity>>>> getSurvey({
    required SurveyRequestModel surveyParams,
  });

  Future<CustomResponseType<BaseEntity<SurveyDetailsEntity>>> getSurveyById({required int pollParams}) ;
}

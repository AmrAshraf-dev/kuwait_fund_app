import "package:kf_ess_mobile_app/features/poll/data/models/request/survey_poll_answer_request_model.dart";
import "package:kf_ess_mobile_app/features/poll/domain/entities/poll_details_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/poll_request_model.dart";
import "../entities/poll_entity.dart";

/// Data operations for the Poll collection
abstract class PollRepository {
  /*
  A repository is a collection of data operations. It is responsible for
  abstracting the data layer from the business logic layer.
  */

  Future<CustomResponseType<BaseEntity<List<PollEntity>>>> getPoll({
    required PollRequestModel pollParams,
  });

  Future<CustomResponseType<BaseEntity<PollDetailsEntity>>> getPollById(
      {required int pollParams});

  Future<CustomResponseType<BaseEntity<String>>> surveyPollAnswer({
    required SurveyPollAnswerRequestModel surveyPollAnswerRequestModel,
  });
}

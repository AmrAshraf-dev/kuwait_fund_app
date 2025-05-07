import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/request/survey_poll_answer_request_model.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/repositories/poll_repository.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';

@injectable
class SurveyPollAnswerRequestUseCase
    implements UseCase<BaseEntity<String>, SurveyPollAnswerRequestModel> {
  SurveyPollAnswerRequestUseCase(
      {required this.surveyPollAnswerRequestRepository});

  final PollRepository surveyPollAnswerRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    SurveyPollAnswerRequestModel surveyPollAnswerRequestModel,
  ) {
    return surveyPollAnswerRequestRepository.surveyPollAnswer(
        surveyPollAnswerRequestModel: surveyPollAnswerRequestModel);
  }
}

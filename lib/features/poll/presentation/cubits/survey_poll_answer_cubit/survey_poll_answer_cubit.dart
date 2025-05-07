import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/request/survey_poll_answer_request_model.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/use_cases/survey_poll_answer_request_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'survey_poll_answer_state.dart';

@injectable
class SurveyPollAnswerCubit extends Cubit<SurveyPollAnswerState> {
  final SurveyPollAnswerRequestUseCase surveyPollAnswerUseCase;
  SurveyPollAnswerCubit({
    required this.surveyPollAnswerUseCase,
  }) : super(SurveyPollAnswerInitialState());

  void submitSurveyPollAnswer(
      SurveyPollAnswerRequestModel surveyPollAnswerRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(SurveyPollAnswerLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await surveyPollAnswerUseCase(surveyPollAnswerRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SurveyPollAnswerErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(SurveyPollAnswerReadyState(response));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_survey_usecase.dart';
import '../../domain/entities/survey_entity.dart';
import '../../data/models/request/survey_request_model.dart';

part 'survey_state.dart';





@injectable
class SurveyCubit extends Cubit<SurveyState> {
  final GetSurveyUseCase getSurveyUseCase;
  SurveyCubit({required this.getSurveyUseCase}) : super(SurveyInitialState());

  Future<void> getSurvey(
      {required SurveyRequestModel surveyModel}) async {
    emit(SurveyLoadingState());

    final CustomResponseType<BaseEntity<SurveyEntity>> eitherPackagesOrFailure =
        await getSurveyUseCase(surveyModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SurveyErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<SurveyEntity> response) {
      emit(SurveyReadyState(response));
    });
  }
}
















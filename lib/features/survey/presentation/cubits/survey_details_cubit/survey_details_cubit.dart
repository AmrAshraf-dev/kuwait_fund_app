import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';

import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/survey/domain/entities/survey_details_entity.dart';
import 'package:kf_ess_mobile_app/features/survey/domain/use_cases/get_survey_by_id_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';




part 'survey_details_state.dart';

@injectable
class SurveyDetailsCubit extends Cubit<SurveyDetailsState> {
  final GetSurveyByIdUseCase getSurveyByIdUseCase;
  SurveyDetailsCubit({required this.getSurveyByIdUseCase}) : super(SurveyDetailsInitialState());

  void getSurveyById({required int surveyId}) async {
    await Future.delayed(const Duration(milliseconds: 50));
    emit(SurveyDetailsLoadingState());
    final CustomResponseType<BaseEntity<SurveyDetailsEntity>> eitherPackagesOrFailure =
        await getSurveyByIdUseCase(surveyId);
    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SurveyDetailsErrorState(message: massage.mapFailureToMessage(failure)));
    }, (BaseEntity<SurveyDetailsEntity> response) {
      emit(SurveyDetailsReadyState(response));
    });
  }



}
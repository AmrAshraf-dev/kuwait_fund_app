import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_survey_usecase.dart';
import '../../domain/entities/survey_entity.dart';
import '../../data/models/request/survey_request_model.dart';

part 'survey_state.dart';

@injectable
class SurveyCubit extends Cubit<PagingState<int, SurveyEntity>> {
  final GetSurveyUseCase getSurveyUseCase;
   int totalRecords = 0; // Track total records
  int pageSize = 10; // Set the page size

  SurveyCubit({required this.getSurveyUseCase}) : super(PagingState());


  Future<void> fetchNextSurveysPage() async {
    final currentState = state;

    emit(currentState.copyWith(isLoading: true, error: null));

    try {
      final pageNumber = (currentState.keys?.last ?? 0) + 1;
      final newItems = await getPolls(SurveyRequestModel(pageNumber: pageNumber, pageSize: pageSize));
      final isLastPage = newItems.isEmpty;

      emit(state.copyWith(
        pages: [...?currentState.pages, newItems],
        keys: [...?currentState.keys, pageNumber],
        hasNextPage: !isLastPage,
        isLoading: false,
      ));
    } catch (error) {
      emit(state.copyWith(
        error: error,
        isLoading: false,
      ));
    }
  }

  Future<List<SurveyEntity>> getPolls(SurveyRequestModel surveyRequestModel) async {
    final CustomResponseType<BaseEntity<List<SurveyEntity>>> eitherPackagesOrFailure =
        await getSurveyUseCase(surveyRequestModel);

    return eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      final String errorMessage = massage.mapFailureToMessage(failure);
      return [];
    }, (BaseEntity<List<SurveyEntity>> response) {
      if (response.data != null) {
        return response.data!;
      } else {
        return [];
      }
    });
  }


}
















import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/response/experiences_response_model.dart';
import '../../domain/use_cases/get_experiences_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";

part 'experiences_state.dart';

@injectable
class ExperiencesCubit extends Cubit<ExperiencesState> {
  final GetExperiencesUseCase getExperiencesUseCase;
  ExperiencesCubit({required this.getExperiencesUseCase})
      : super(ExperiencesInitialState());

  Future<void> getExperiences() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(ExperiencesLoadingState());

    final CustomResponseType<BaseEntity<List<ExperiencesModel>>>
        eitherPackagesOrFailure = await getExperiencesUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ExperiencesErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<ExperiencesModel>> response) {
      if (response.data?.isEmpty ?? true) {
        emit(ExperiencesEmptyState());
        return;
      } else {
        emit(ExperiencesReadyState(response));
      }
    });
  }
}

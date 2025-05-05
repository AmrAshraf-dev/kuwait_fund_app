import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/submission_entity.dart';
import '../../domain/use_cases/submissions_usecase.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";

part 'submission_state.dart';

@injectable
class SubmissionCubit extends Cubit<SubmissionState> {
  final GetSubmissionUseCase getSubmissionUseCase;
  SubmissionCubit({required this.getSubmissionUseCase})
      : super(SubmissionInitialState()) {
    getSubmissions();
  }

  Future<void> getSubmissions() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(SubmissionLoadingState());

    final CustomResponseType<BaseEntity<List<SubmissionEntity>>>
        eitherPackagesOrFailure = await getSubmissionUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SubmissionErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<SubmissionEntity>> response) {
      if (response.data?.isEmpty ?? true) {
        emit(SubmissionEmptyState());
        return;
      } else {
        emit(SubmissionReadyState(response));
      }
    });
  }
}

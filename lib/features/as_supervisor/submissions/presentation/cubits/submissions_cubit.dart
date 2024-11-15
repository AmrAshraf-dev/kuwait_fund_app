import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../data/models/request/submissions_request_model.dart';
import '../../domain/entities/submissions_entity.dart';
import '../../domain/use_cases/get_submissions_usecase.dart';

part 'submissions_state.dart';

@injectable
class SubmissionsCubit extends Cubit<SubmissionsState> {
  final GetSubmissionsUseCase getSubmissionsUseCase;
  SubmissionsCubit({required this.getSubmissionsUseCase})
      : super(SubmissionsInitialState());

  Future<void> getSubmissions(
      {required SubmissionsRequestModel submissionsModel}) async {
    emit(SubmissionsLoadingState());

    final CustomResponseType<BaseEntity<SubmissionsEntity>>
        eitherPackagesOrFailure = await getSubmissionsUseCase(submissionsModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SubmissionsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<SubmissionsEntity> response) {
      emit(SubmissionsReadyState(response));
    });
  }
}

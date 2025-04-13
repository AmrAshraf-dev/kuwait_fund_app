import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../data/models/request/submissions_request_model.dart';
import '../../domain/entities/old_submissions_entity.dart';
import '../../domain/use_cases/get_old_submissions_usecase.dart';

part 'old_submissions_state.dart';

@injectable
class OldSubmissionsCubit extends Cubit<OldSubmissionsState> {
  final GetOldSubmissionsUseCase getOldSubmissionsUseCase;
  OldSubmissionsCubit({required this.getOldSubmissionsUseCase})
      : super(OldSubmissionsInitialState()) {
    getOldSubmissions(oldSubmissionsModel: SubmissionsRequestModel());
  }

  Future<void> getOldSubmissions(
      {required SubmissionsRequestModel oldSubmissionsModel}) async {
    emit(OldSubmissionsLoadingState());

    final CustomResponseType<BaseEntity<List<OldSubmissionsEntity>>>
        eitherPackagesOrFailure =
        await getOldSubmissionsUseCase(oldSubmissionsModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(OldSubmissionsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<OldSubmissionsEntity>> response) {
      if (response.data?.isEmpty ?? true) {
        emit(OldSubmissionsEmptyState());
        return;
      } else {
        emit(OldSubmissionsReadyState(response));
      }
    });
  }
}

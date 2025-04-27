import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/domain/use_cases/get_director_dept_assignment_usecase.dart';

import '../../../../../core/network/base_handling.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../domain/entities/director_dept_assignment_entity.dart';

part 'director_dept_assignment_state.dart';

@injectable
class DirectorDeptAssignmentCubit extends Cubit<DirectorDeptAssignmentState> {
   final GetDirectorDeptAssignmentUsecase getDirectorDeptAssignmentUseCase;
  DirectorDeptAssignmentCubit(   this.getDirectorDeptAssignmentUseCase)
      : super(DirectorDeptAssignmentInitialState());

  Future<void> getDirectorDeptAssignment(directorDeptAssignmentRequestModel, 
    ) async {
    emit(DirectorDeptAssignmentLoadingState());

    final CustomResponseType<BaseEntity<DirectorDeptAssignmentEntity>>
        eitherPackagesOrFailure =
        await getDirectorDeptAssignmentUseCase(directorDeptAssignmentRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(DirectorDeptAssignmentErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<DirectorDeptAssignmentEntity> response) {
      emit(DirectorDeptAssignmentReadyState(response));
    });
      }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../data/models/request/director_dept_assignment_request_model.dart';
import '../../domain/entities/director_dept_assignment_entity.dart';
import '../../domain/use_cases/get_director_dept_assignment_usecase.dart';
import '../../../../shared/entity/base_entity.dart';


part 'director_dept_assignment_state.dart';

@injectable
class DirectorDeptAssignmentCubit extends Cubit<DirectorDeptAssignmentState> {
   final GetDirectorDeptAssignmentUsecase getDirectorDeptAssignmentUseCase;
  DirectorDeptAssignmentCubit(   this.getDirectorDeptAssignmentUseCase)
      : super(DirectorDeptAssignmentInitialState());

  Future<void> getDirectorDeptAssignment
  (DirectorDeptAssignmentRequestModel directorDeptAssignmentRequestModel, 
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

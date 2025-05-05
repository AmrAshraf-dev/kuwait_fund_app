import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../error/failure.dart';
import '../../../data/models/request/approve_leave_request_model.dart';
import '../../../domain/use_cases/approve_leave_request_usecase.dart';
import '../../../../../shared/entity/base_entity.dart';

part 'approve_leave_request_state.dart';

@injectable
class ApproveLeaveRequestCubit extends Cubit<ApproveLeaveRequestState> {
  final ApproveLeaveRequestUseCase approveLeaveRequestUseCase;
  ApproveLeaveRequestCubit({required this.approveLeaveRequestUseCase})
      : super(ApproveLeaveRequestInitialState());

  void createApproveLeaveRequest(
      ApproveLeaveRequestModel approveLeaveRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(ApproveLeaveRequestLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await approveLeaveRequestUseCase(approveLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ApproveLeaveRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      //emit(ApproveLeaveRequestReadyState(response)
      if (response.code != 404) {
        emit(ApproveLeaveRequestReadyState(response));
      } else {
        emit(ApproveLeaveRequestErrorState(
          message: response.message ?? "Error",
        ));
      }
    });
  }
}

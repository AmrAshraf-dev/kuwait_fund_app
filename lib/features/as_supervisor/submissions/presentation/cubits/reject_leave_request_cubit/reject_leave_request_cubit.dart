import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/models/request/reject_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/use_cases/reject_leave_request_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'reject_leave_request_state.dart';

@injectable
class RejectLeaveRequestCubit extends Cubit<RejectLeaveRequestState> {
  final RejectLeaveRequestUseCase rejectLeaveRequestUseCase;
  RejectLeaveRequestCubit({required this.rejectLeaveRequestUseCase})
      : super(RejectLeaveRequestInitialState());

  void createRejectLeaveRequest(
      RejectLeaveRequestModel rejectLeaveRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(RejectLeaveRequestLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await rejectLeaveRequestUseCase(rejectLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(RejectLeaveRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      //emit(RejectLeaveRequestReadyState(response));
      if (response.code != 404) {
        emit(RejectLeaveRequestReadyState(response));
      } else {
        emit(RejectLeaveRequestErrorState(
          message: response.message ?? "Error",
        ));
      }
    });
  }
}

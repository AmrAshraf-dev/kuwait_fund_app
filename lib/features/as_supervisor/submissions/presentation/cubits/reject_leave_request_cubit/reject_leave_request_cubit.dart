import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/network/base_handling.dart';
import '../../../../../../error/failure.dart';
import '../../../data/models/request/reject_leave_request_model.dart';
import '../../../domain/use_cases/reject_leave_request_usecase.dart';
import '../../../../../shared/entity/base_entity.dart';

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

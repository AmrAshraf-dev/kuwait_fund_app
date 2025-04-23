import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
 import '../../data/models/request/annual_leave_request_request_model.dart';
import '../../domain/use_cases/annual_leave_request_usecase.dart';

part 'annual_leave_request_state.dart';

@injectable
class AnnualLeaveRequestCubit extends Cubit<AnnualLeaveRequestState> {
  final AnnualLeaveRequestUseCase annualLeaveRequestUseCase;
  AnnualLeaveRequestCubit({required this.annualLeaveRequestUseCase})
      : super(AnnualLeaveRequestInitialState());

  void createAnnualLeaveRequest(
      AnnualLeaveRequestRequestModel annualLeaveRequestModel) async {
    emit(AnnualLeaveRequestLoadingState());

    final CustomResponseType< String > eitherPackagesOrFailure =
        await annualLeaveRequestUseCase(annualLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AnnualLeaveRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, ( String  response) {
      emit(AnnualLeaveRequestReadyState(response));
    });
  }
}

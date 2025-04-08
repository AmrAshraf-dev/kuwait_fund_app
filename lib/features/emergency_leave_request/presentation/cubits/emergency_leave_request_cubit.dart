import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/use_cases/get_emergency_eligible_days_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/emergency_leave_request_request_model.dart';
 import '../../domain/use_cases/create_emergency_leave_request_usecase.dart';

part 'emergency_leave_request_state.dart';

@injectable
class EmergencyLeaveRequestCubit extends Cubit<EmergencyLeaveRequestState> {
  final CreateEmergencyLeaveRequestUseCase createEmergencyLeaveRequestUseCase;

  final GetEmergencyEligibleDaysUseCase getEmergencyEligibleDaysUseCase;
  EmergencyLeaveRequestCubit({required this.createEmergencyLeaveRequestUseCase ,required this.getEmergencyEligibleDaysUseCase})
      : super(EmergencyLeaveRequestInitialState());

  Future<void> createEmergencyLeaveRequest(
      {required EmergencyLeaveRequestRequestModel
          emergencyLeaveRequestModel}) async {
    emit(EmergencyLeaveRequestLoadingState());

    final CustomResponseType<BaseEntity<String>>
        eitherPackagesOrFailure =
        await createEmergencyLeaveRequestUseCase(emergencyLeaveRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EmergencyLeaveRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(EmergencyLeaveRequestReadyState(response));
    });
  }

  getEmergencyEligibleDays() async {
    emit(EmergencyEligibleDaysLoadingState());

    final CustomResponseType<int>
        eitherPackagesOrFailure =
        await getEmergencyEligibleDaysUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EmergencyEligibleDaysErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (int response) {
      emit(EmergencyEligibleDaysReadyState(response));
    });
  }
}

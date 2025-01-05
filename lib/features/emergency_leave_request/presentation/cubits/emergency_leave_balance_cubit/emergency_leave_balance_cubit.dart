import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/use_cases/get_emergency_balance_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'emergency_leave_balance_state.dart';

@injectable
class EmergencyLeaveBalanceCubit extends Cubit<EmergencyLeaveBalanceState> {
  final GetEmergencyLeaveBalanceUseCase getEmergencyLeaveBalanceUseCase;
  EmergencyLeaveBalanceCubit({required this.getEmergencyLeaveBalanceUseCase})
      : super(EmergencyLeaveBalanceInitialState());

  getEmergencyLeaveBalance() async {
    emit(EmergencyLeaveBalanceLoadingState());

    final CustomResponseType<BaseEntity<dynamic>> eitherPackagesOrFailure =
        await getEmergencyLeaveBalanceUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EmergencyLeaveBalanceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<dynamic> response) {
      emit(EmergencyLeaveBalanceReadyState(response));
    });
  }
}

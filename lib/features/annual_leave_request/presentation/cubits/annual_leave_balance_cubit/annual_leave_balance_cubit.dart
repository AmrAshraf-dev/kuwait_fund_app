import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/domain/use_cases/get_annual_leave_balance_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'lannual_eave_balance_state.dart';

@injectable
class AnnualLeaveBalanceCubit extends Cubit<LeaveBalanceState> {
  final GetAnnualLeaveBalanceUseCase getAnnualLeaveBalanceUseCase;

  AnnualLeaveBalanceCubit({
    required this.getAnnualLeaveBalanceUseCase,
  }) : super(LeaveBalanceInitialState());

  Future<void> getAnnualLeaveBalance() async {
    emit(LeaveBalanceLoadingState());

    final CustomResponseType<BaseEntity<dynamic>> eitherPackagesOrFailure =
        await getAnnualLeaveBalanceUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LeaveBalanceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<dynamic> response) {
      emit(LeaveBalanceReadyState(response));
    });
  }
}

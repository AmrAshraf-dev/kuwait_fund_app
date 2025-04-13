import 'package:kf_ess_mobile_app/features/create_request/data/models/response/leave_balance_response_model.dart';
import 'package:kf_ess_mobile_app/features/create_request/domain/entities/leave_balance_entity.dart';
import 'package:kf_ess_mobile_app/features/create_request/domain/use_cases/leave_balance_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'leave_balance_state.dart';

@injectable
class LeaveBalanceCubit extends Cubit<LeaveBalanceState> {
  LeaveBalanceCubit(this.getLeaveBalanceUseCase)
      : super(LeaveBalanceInitial()) {
    getLeaveBalanceData();
  }

  final GetLeaveBalanceUseCase getLeaveBalanceUseCase;

  //void changeTab(int index) => emit(RequestTypesChanged(index));

  Future<void> getLeaveBalanceData() async {
    emit(LeaveBalanceLoading());
    final result = await getLeaveBalanceUseCase();
    result.fold(
      (failure) => emit(LeaveBalanceErrorState(
          message: FailureToMassage().mapFailureToMessage(failure))),
      (leaveBalance) =>
          emit(LeaveBalanceReadyState(leaveBalance: leaveBalance)),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/annual_leave_request_entity.dart';
import '../../../domain/use_cases/get_annual_leave_balance_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

part 'lannual_eave_balance_state.dart';

@injectable
class AnnualLeaveBalanceCubit extends Cubit<LeaveBalanceState> {
  final GetAnnualLeaveBalanceUseCase getAnnualLeaveBalanceUseCase;

  AnnualLeaveBalanceCubit({
    required this.getAnnualLeaveBalanceUseCase,
  }) : super(LeaveBalanceInitialState());

  Future<void> getAnnualLeaveBalance() async {
    emit(LeaveBalanceLoadingState());

    final CustomResponseType<BaseEntity<AnnualLeaveRequestEntity>> eitherPackagesOrFailure =
        await getAnnualLeaveBalanceUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LeaveBalanceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<AnnualLeaveRequestEntity> response) {
      emit(LeaveBalanceReadyState(response));
    });
  }
}

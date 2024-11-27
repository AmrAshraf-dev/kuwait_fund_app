import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/use_cases/get_loan_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'loan_state.dart';

@injectable
class LoanCubit extends Cubit<LoanState> {
  final GetLoanUseCase getLoanUseCase;
  LoanCubit({required this.getLoanUseCase}) : super(LoanInitialState()) {
    getLoan();
  }

  Future<void> getLoan() async {
    emit(LoanLoadingState());

    final CustomResponseType<BaseEntity<List<LoanEntity>>>
        eitherSuccessOrFailure = await getLoanUseCase();

    eitherSuccessOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LoanErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<LoanEntity>> response) {
      emit(LoanReadyState(response));
    });
  }
}

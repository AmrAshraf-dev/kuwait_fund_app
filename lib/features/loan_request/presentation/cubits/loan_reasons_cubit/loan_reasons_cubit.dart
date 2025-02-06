import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_reason_entity.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/use_cases/get_loan_request_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'loan_reasons_state.dart';

@injectable
class LoanReasonsCubit extends Cubit<LoanReasonsState> {
  final GetLoanReasonsUseCase getLoanReasonsUseCase;

  LoanReasonsCubit({
    required this.getLoanReasonsUseCase,
  }) : super(LoanReasonsInitialState()) {
    getLoanReasons();
  }

  Future<void> getLoanReasons() async {
    emit(LoanReasonsLoadingState());

    final CustomResponseType<BaseEntity<List<PersonalLoanReasonEntity>>>
        eitherPackagesOrFailure = await getLoanReasonsUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LoanReasonsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<PersonalLoanReasonEntity>> response) {
      emit(LoanReasonsReadyState(response));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_reason_entity.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/use_cases/create_loan_request_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_loan_request_usecase.dart';

part 'loan_request_state.dart';

@injectable
class LoanRequestCubit extends Cubit<LoanRequestState> {
  final GetLoanReasonsUseCase getLoanReasonsUseCase;
  final CreateLoanReasonsUseCase createLoanReasonsUseCase;

  BaseEntity<List<PersonalLoanReasonEntity>>? _loanReasonsResponse;

  LoanRequestCubit(
      {required this.getLoanReasonsUseCase,
      required this.createLoanReasonsUseCase})
      : super(LoanRequestInitialState()) {
    getLoanReasons();
  }

  Future<void> getLoanReasons() async {
    emit(LoanRequestLoadingState());

    final CustomResponseType<BaseEntity<List<PersonalLoanReasonEntity>>>
        eitherPackagesOrFailure = await getLoanReasonsUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LoanRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<PersonalLoanReasonEntity>> response) {
      _loanReasonsResponse = response;
      emit(LoanRequestReadyState(response));
    });
  }

  void calculateInstallments(int loanAmount, int numberOfInstallments) {
    if (loanAmount == 0 || numberOfInstallments == 0) {
      //    emit(LoanRequestErrorState(message: "Invalid input values"));
      return;
    }

    final monthlyInstallment = loanAmount / numberOfInstallments;
    emit(LoanRequestInstallmentCalculatedState(
      numberOfInstallments: numberOfInstallments,
      monthlyInstallment: monthlyInstallment,
      loanReasonsResponse: _loanReasonsResponse,
    ));
  }

  void createAnnualLeaveRequest(loanRequestModel) async {
    emit(LoanRequestLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await createLoanReasonsUseCase(loanRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(LoanRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      CustomMainRouter.push(ThankYouRoute(
        subtitle: "you_loan_request_submitted_successfully",
      ));
    });
  }
}

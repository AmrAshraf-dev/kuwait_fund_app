part of 'loan_request_cubit.dart';

class LoanRequestErrorState extends LoanRequestState {
  final String? message;

  LoanRequestErrorState({this.message});
}

final class LoanRequestInitialState extends LoanRequestState {}

final class LoanRequestLoadingState extends LoanRequestState {}

final class LoanRequestReadyState extends LoanRequestState {
  LoanRequestReadyState(this.response);
  BaseEntity<List<PersonalLoanReasonEntity>> response;
}

// Define a new state for the calculated installments
class LoanRequestInstallmentCalculatedState extends LoanRequestState {
  final int numberOfInstallments;
  final double monthlyInstallment;
  final BaseEntity<List<PersonalLoanReasonEntity>>? loanReasonsResponse;

  LoanRequestInstallmentCalculatedState({
    required this.numberOfInstallments,
    required this.monthlyInstallment,
    this.loanReasonsResponse,
  });
}

abstract class LoanRequestState {}

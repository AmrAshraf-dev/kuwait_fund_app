part of 'loan_request_cubit.dart';

class LoanRequestErrorState extends LoanRequestState {
  final String? message;

  LoanRequestErrorState({this.message});
}

final class LoanRequestInitialState extends LoanRequestState {}

final class LoanRequestLoadingState extends LoanRequestState {}

final class LoanRequestReadyState extends LoanRequestState {}

// Define a new state for the calculated installments

final class CanAddLoanRequestState extends LoanRequestState {
  CanAddLoanRequestState(this.response);
  BaseEntity<PersonalLoanMasterInfoEntity> response;
}

final class CanNotAddLoanRequestState extends LoanRequestState {}

abstract class LoanRequestState {}

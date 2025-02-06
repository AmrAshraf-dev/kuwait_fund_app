part of 'loan_reasons_cubit.dart';

class LoanReasonsErrorState extends LoanReasonsState {
  final String? message;

  LoanReasonsErrorState({this.message});
}

final class LoanReasonsInitialState extends LoanReasonsState {}

final class LoanReasonsLoadingState extends LoanReasonsState {}

final class LoanReasonsReadyState extends LoanReasonsState {
  LoanReasonsReadyState(this.response);
  BaseEntity<List<PersonalLoanReasonEntity>> response;
}

abstract class LoanReasonsState {}

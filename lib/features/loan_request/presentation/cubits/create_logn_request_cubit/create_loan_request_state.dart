part of 'create_loan_request_cubit.dart';

class CreateLoanRequestErrorState extends CreateLoanRequestState {
  final String? message;

  CreateLoanRequestErrorState({this.message});
}

final class CreateLoanRequestInitialState extends CreateLoanRequestState {}

final class CreateLoanRequestLoadingState extends CreateLoanRequestState {}

final class CreateLoanRequestReadyState extends CreateLoanRequestState {}

abstract class CreateLoanRequestState {}

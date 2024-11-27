part of 'loan_cubit.dart';

class LoanErrorState extends LoanState {
  final String? message;

  LoanErrorState({this.message});
}

final class LoanInitialState extends LoanState {}

final class LoanLoadingState extends LoanState {}

final class LoanReadyState extends LoanState {
  LoanReadyState(this.response);
  BaseEntity<List<LoanEntity>> response;
}

abstract class LoanState {}

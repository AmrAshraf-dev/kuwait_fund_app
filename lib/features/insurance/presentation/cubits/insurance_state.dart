part of 'insurance_cubit.dart';

class InsuranceErrorState extends InsuranceState {
  final String? message;

  InsuranceErrorState({this.message});
}

final class InsuranceInitialState extends InsuranceState {}

final class InsuranceLoadingState extends InsuranceState {}

final class InsuranceReadyState extends InsuranceState {
  InsuranceReadyState(this.response);
  BaseEntity<List<InsuranceEntity>> response;
}

final class InsuranceUnsubscribedState extends InsuranceState {}

final class InsuranceDetailsReadyState extends InsuranceState {
  InsuranceDetailsReadyState(this.response);
  BaseEntity<InsuranceEntity> response;
}

abstract class InsuranceState {}

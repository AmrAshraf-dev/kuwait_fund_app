part of 'insurance_cubit.dart';

class InsuranceErrorState extends InsuranceState {
  final String? message;

  InsuranceErrorState({this.message});
}

final class InsuranceInitialState extends InsuranceState {}

final class InsuranceLoadingState extends InsuranceState {}

final class InsuranceReadyState extends InsuranceState {
  InsuranceReadyState(this.response);
    BaseEntity<InsuranceEntity> response;

}

abstract class InsuranceState {}

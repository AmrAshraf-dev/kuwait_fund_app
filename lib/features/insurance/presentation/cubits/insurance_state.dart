part of 'insurance_cubit.dart';

class InsuranceErrorState extends InsuranceState {
  final String? message;

  InsuranceErrorState({this.message});
}

final class InsuranceInitialState extends InsuranceState {}

final class InsuranceLoadingState extends InsuranceState {}

final class InsuranceReadyState extends InsuranceState {
  InsuranceReadyState(this.response);
  BaseEntity<List<InsuranceProgramsEntity>> response;
}

final class InsuranceUnsubscribedState extends InsuranceState {}

final class CanAddInsuranceState extends InsuranceState {
  final InsuranceEntity insuranceEntity;

  CanAddInsuranceState(this.insuranceEntity);
}

final class CanNotAddInsuranceState extends InsuranceState {
  final InsuranceEntity insuranceEntity;

  CanNotAddInsuranceState(this.insuranceEntity);
}

final class ViewOnlyInsuranceState extends InsuranceState {
  final InsuranceEntity insuranceEntity;
  final bool showCancelButton;

  ViewOnlyInsuranceState(this.insuranceEntity,
      {required this.showCancelButton});
}

abstract class InsuranceState {}

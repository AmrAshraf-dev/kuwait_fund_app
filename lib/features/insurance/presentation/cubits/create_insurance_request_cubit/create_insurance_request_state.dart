part of 'create_insurance_request_cubit.dart';

class CreateInsuranceRequestErrorState extends CreateInsuranceRequestState {
  final String? message;

  CreateInsuranceRequestErrorState({this.message});
}

final class CreateInsuranceRequestInitialState
    extends CreateInsuranceRequestState {}

final class CreateInsuranceRequestLoadingState
    extends CreateInsuranceRequestState {}

final class CreateInsuranceRequestReadyState
    extends CreateInsuranceRequestState {
  CreateInsuranceRequestReadyState(this.response);
  BaseEntity<InsuranceEntity> response;
}

abstract class CreateInsuranceRequestState {}

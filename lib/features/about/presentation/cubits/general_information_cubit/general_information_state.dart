part of 'general_information_cubit.dart';

class GeneralInformationErrorState extends GeneralInformationState {
  final String? message;

  GeneralInformationErrorState({this.message});
}

final class GeneralInformationInitialState extends GeneralInformationState {}

final class GeneralInformationLoadingState extends GeneralInformationState {}

final class GeneralInformationReadyState extends GeneralInformationState {
  GeneralInformationReadyState(this.response);
  BaseEntity<List<GeneralInformationEntity>> response;
}

abstract class GeneralInformationState {}

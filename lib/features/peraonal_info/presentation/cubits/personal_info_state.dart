part of 'personal_info_cubit.dart';

class PersonalInfoErrorState extends PersonalInfoState {
  final String? message;

  PersonalInfoErrorState({this.message});
}

final class PersonalInfoInitialState extends PersonalInfoState {}

final class PersonalInfoLoadingState extends PersonalInfoState {}

final class PersonalInfoReadyState extends PersonalInfoState {
  PersonalInfoReadyState(this.response);
  BaseEntity<PersonalInfoEntity> response;
}

abstract class PersonalInfoState {}

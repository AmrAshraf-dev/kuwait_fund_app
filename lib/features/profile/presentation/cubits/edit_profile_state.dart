part of 'edit_profile_cubit.dart';

class EditProfileErrorState extends EditProfileState {
  final String? message;

  EditProfileErrorState({this.message});
}

final class EditProfileInitialState extends EditProfileState {}

final class EditProfileLoadingState extends EditProfileState {}

final class EditProfileReadyState extends EditProfileState {
  EditProfileReadyState(this.response);
  BaseEntity<String> response;
}

abstract class EditProfileState {}

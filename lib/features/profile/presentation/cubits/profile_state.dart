part of 'profile_cubit.dart';

class ProfileErrorState extends ProfileState {
  final String? message;

  ProfileErrorState({this.message});
}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileReadyState extends ProfileState {
  ProfileReadyState(this.response);
  BaseEntity<MainProfileEntity> response;
}

abstract class ProfileState {}

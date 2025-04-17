part of 'director_director_mission_cubit.dart';

class AdminDirectorMissionErrorState extends AdminDirectorMissionState {
  final String? message;

  AdminDirectorMissionErrorState({this.message});
}

final class AdminDirectorMissionInitialState extends AdminDirectorMissionState {}

final class AdminDirectorMissionLoadingState extends AdminDirectorMissionState {}

final class AdminDirectorMissionReadyState extends AdminDirectorMissionState {
  AdminDirectorMissionReadyState(this.response);
    BaseEntity<AdminDirectorMissionEntity> response;

}

abstract class AdminDirectorMissionState {}

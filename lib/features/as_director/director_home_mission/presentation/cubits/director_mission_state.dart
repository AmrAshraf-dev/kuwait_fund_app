part of 'director_mission_cubit.dart';

class DirectorMissionErrorState extends DirectorMissionState {
  final String? message;

  DirectorMissionErrorState({this.message});
}

final class DirectorMissionInitialState extends DirectorMissionState {}

final class DirectorMissionLoadingState extends DirectorMissionState {}

final class DirectorMissionReadyState extends DirectorMissionState {
  DirectorMissionReadyState(this.response);
    BaseEntity<List<ManagementCalenderDataEntity>> response;

}

final class DirectorsListReadyState extends DirectorMissionState {
  DirectorsListReadyState(this.response);
  BaseEntity<List<DirectorEntity>> response;
}

final class DirectorMissionDetailsReadyState extends DirectorMissionState {
  DirectorMissionDetailsReadyState(this.response ,{
    required this.showNewBottomSheet,
  });
  BaseEntity<List<DirectorMissionDetailsEntity>> response;
  bool showNewBottomSheet;
}
final class DirectorMissionListErrorState extends DirectorMissionState {
  final String? message;

  DirectorMissionListErrorState({this.message});
}
abstract class DirectorMissionState {}

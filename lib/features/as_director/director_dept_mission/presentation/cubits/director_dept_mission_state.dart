part of 'director_dept_mission_cubit.dart';

class DirectorDeptMissionErrorState extends DirectorDeptMissionState {
  final String? message;

  DirectorDeptMissionErrorState({this.message});
}

final class DirectorDeptMissionInitialState extends DirectorDeptMissionState {}

final class DirectorDeptMissionLoadingState extends DirectorDeptMissionState {}

final class DirectorDeptMissionReadyState extends DirectorDeptMissionState {
  DirectorDeptMissionReadyState(this.response);
    BaseEntity<List<DirectorDeptCalendarDataEntity>> response;

}

final class DirectorDeptsListReadyState
    extends DirectorDeptMissionState {
  DirectorDeptsListReadyState(this.response);
  BaseEntity<List<DeptEntity>> response;
}


final class DirectorDeptMissionDetailsReadyState
    extends DirectorDeptMissionState {
  DirectorDeptMissionDetailsReadyState(this.response);
  BaseEntity<List<DirectorDeptMissionDetailsEntity>> response;
}

abstract class DirectorDeptMissionState {}

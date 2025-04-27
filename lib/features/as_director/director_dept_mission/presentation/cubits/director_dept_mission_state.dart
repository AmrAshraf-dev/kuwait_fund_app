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
  DirectorDeptMissionDetailsReadyState(this.response , {required this.showNewBottomSheet});
  BaseEntity<List<DirectorDeptMissionDetailsEntity>> response;
  final bool showNewBottomSheet;
}

final class DirectorDeptDropMenuMissionErrorState
    extends DirectorDeptMissionState {
  final String? message;

  DirectorDeptDropMenuMissionErrorState({this.message});
}

final class DirectorDeptCalendarMissionErrorState extends DirectorDeptMissionState {
  final String? message;

  DirectorDeptCalendarMissionErrorState({this.message});
}

abstract class DirectorDeptMissionState {}

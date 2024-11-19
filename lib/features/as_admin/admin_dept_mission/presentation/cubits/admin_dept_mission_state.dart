part of 'admin_dept_mission_cubit.dart';

class AdminDeptMissionErrorState extends AdminDeptMissionState {
  final String? message;

  AdminDeptMissionErrorState({this.message});
}

final class AdminDeptMissionInitialState extends AdminDeptMissionState {}

final class AdminDeptMissionLoadingState extends AdminDeptMissionState {}

final class AdminDeptMissionReadyState extends AdminDeptMissionState {
  AdminDeptMissionReadyState(this.response);
    BaseEntity<AdminDeptMissionEntity> response;

}

abstract class AdminDeptMissionState {}

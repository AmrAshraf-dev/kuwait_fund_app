part of 'director_dept_assignment_cubit.dart';

class DirectorDeptAssignmentErrorState extends DirectorDeptAssignmentState {
  final String? message;

  DirectorDeptAssignmentErrorState({this.message});
}

final class DirectorDeptAssignmentInitialState extends DirectorDeptAssignmentState {}

final class DirectorDeptAssignmentLoadingState extends DirectorDeptAssignmentState {}

final class DirectorDeptAssignmentReadyState extends DirectorDeptAssignmentState {
  DirectorDeptAssignmentReadyState(this.response);
    BaseEntity<DirectorDeptAssignmentEntity> response;

}

abstract class DirectorDeptAssignmentState {}

part of 'delete_leave_cubit.dart';

class DeleteLeaveErrorState extends DeleteLeaveState {
  final String? message;

  DeleteLeaveErrorState({this.message});
}

final class DeleteLeaveInitialState extends DeleteLeaveState {}

final class DeleteLeaveLoadingState extends DeleteLeaveState {}

final class DeleteLeaveEmptyState extends DeleteLeaveState {}

final class DeleteLeaveReadyState extends DeleteLeaveState {
  DeleteLeaveReadyState(this.response);
  String response;
}

abstract class DeleteLeaveState {}

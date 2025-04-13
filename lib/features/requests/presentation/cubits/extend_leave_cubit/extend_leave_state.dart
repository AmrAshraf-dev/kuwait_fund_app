part of 'extend_leave_cubit.dart';

class ExtendLeaveErrorState extends ExtendLeaveState {
  final String? message;

  ExtendLeaveErrorState({this.message});
}

final class ExtendLeaveInitialState extends ExtendLeaveState {}

final class ExtendLeaveLoadingState extends ExtendLeaveState {}

final class ExtendLeaveEmptyState extends ExtendLeaveState {}

final class ExtendLeaveReadyState extends ExtendLeaveState {
  ExtendLeaveReadyState(this.response);
  BaseEntity<CreateExtendLeaveEntity> response;
}

abstract class ExtendLeaveState {}

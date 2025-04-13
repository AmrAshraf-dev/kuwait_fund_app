part of 'sick_leave_request_cubit.dart';

class CreateSickLeaveRequestErrorState extends CreateSickLeaveRequestState {
  final String? message;

  CreateSickLeaveRequestErrorState({this.message});
}

final class CreateSickLeaveRequestInitialState
    extends CreateSickLeaveRequestState {}

final class CreateSickLeaveRequestLoadingState
    extends CreateSickLeaveRequestState {}

final class CreateSickLeaveRequestReadyState
    extends CreateSickLeaveRequestState {}

abstract class CreateSickLeaveRequestState {}

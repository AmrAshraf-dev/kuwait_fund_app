part of 'reject_leave_request_cubit.dart';

class RejectLeaveRequestErrorState extends RejectLeaveRequestState {
  final String? message;

  RejectLeaveRequestErrorState({this.message});
}

final class RejectLeaveRequestInitialState extends RejectLeaveRequestState {}

final class RejectLeaveRequestLoadingState extends RejectLeaveRequestState {}

final class RejectLeaveRequestReadyState extends RejectLeaveRequestState {
  RejectLeaveRequestReadyState(this.response);
  BaseEntity<String> response;
}

abstract class RejectLeaveRequestState {}

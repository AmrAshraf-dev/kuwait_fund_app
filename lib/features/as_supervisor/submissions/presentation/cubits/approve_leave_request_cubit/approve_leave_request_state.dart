part of 'approve_leave_request_cubit.dart';

class ApproveLeaveRequestErrorState extends ApproveLeaveRequestState {
  final String? message;

  ApproveLeaveRequestErrorState({this.message});
}

final class ApproveLeaveRequestInitialState extends ApproveLeaveRequestState {}

final class ApproveLeaveRequestLoadingState extends ApproveLeaveRequestState {}

final class ApproveLeaveRequestReadyState extends ApproveLeaveRequestState {
  ApproveLeaveRequestReadyState(this.response);
  BaseEntity<String> response;
}

abstract class ApproveLeaveRequestState {}

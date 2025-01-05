part of 'annual_leave_request_cubit.dart';

class AnnualLeaveRequestErrorState extends AnnualLeaveRequestState {
  final String? message;

  AnnualLeaveRequestErrorState({this.message});
}

final class AnnualLeaveRequestInitialState extends AnnualLeaveRequestState {}

final class AnnualLeaveRequestLoadingState extends AnnualLeaveRequestState {}

final class AnnualLeaveRequestReadyState extends AnnualLeaveRequestState {
  AnnualLeaveRequestReadyState(this.response);
  BaseEntity<String> response;
}

abstract class AnnualLeaveRequestState {}

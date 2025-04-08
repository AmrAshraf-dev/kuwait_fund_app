part of 'emergency_leave_request_cubit.dart';

class EmergencyLeaveRequestErrorState extends EmergencyLeaveRequestState {
  final String? message;

  EmergencyLeaveRequestErrorState({this.message});
}

final class EmergencyLeaveRequestInitialState extends EmergencyLeaveRequestState {}

final class EmergencyLeaveRequestLoadingState extends EmergencyLeaveRequestState {}

final class EmergencyLeaveRequestReadyState extends EmergencyLeaveRequestState {
  EmergencyLeaveRequestReadyState(this.response);
    BaseEntity<String> response;

}

final class EmergencyEligibleDaysReadyState extends EmergencyLeaveRequestState {
  EmergencyEligibleDaysReadyState(this.response);
  int response;
}

final class EmergencyEligibleDaysLoadingState
    extends EmergencyLeaveRequestState {}
final class EmergencyEligibleDaysErrorState extends EmergencyLeaveRequestState {
  final String? message;

  EmergencyEligibleDaysErrorState({this.message});
}
abstract class EmergencyLeaveRequestState {}

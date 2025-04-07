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

abstract class EmergencyLeaveRequestState {}

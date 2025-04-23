part of 'emergency_leave_request_cubit.dart';

class EmergencyLeaveRequestErrorState extends EmergencyLeaveScreenState {
  final String? message;

  EmergencyLeaveRequestErrorState({this.message});
}

final class EmergencyLeaveRequestInitialState extends EmergencyLeaveScreenState {}

final class EmergencyLeaveRequestLoadingState extends EmergencyLeaveScreenState {}

final class EmergencyLeaveRequestReadyState extends EmergencyLeaveScreenState {
  EmergencyLeaveRequestReadyState(this.response);
    String response;

}

final class EmergencyLeaveScreenReadyState extends EmergencyLeaveScreenState {
  EmergencyLeaveScreenReadyState(this.response);
  BaseEntity<EmergencyLeaveEntity> response;
}

final class EmergencyLeaveScreenLoadingState
    extends EmergencyLeaveScreenState {}
final class EmergencyLeaveScreenErrorState extends EmergencyLeaveScreenState {
  final String? message;

  EmergencyLeaveScreenErrorState({this.message});
}
abstract class EmergencyLeaveScreenState {}

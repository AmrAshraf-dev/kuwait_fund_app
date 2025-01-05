part of 'emergency_leave_balance_cubit.dart';

class EmergencyLeaveBalanceErrorState extends EmergencyLeaveBalanceState {
  final String? message;

  EmergencyLeaveBalanceErrorState({this.message});
}

final class EmergencyLeaveBalanceInitialState
    extends EmergencyLeaveBalanceState {}

final class EmergencyLeaveBalanceLoadingState
    extends EmergencyLeaveBalanceState {}

final class EmergencyLeaveBalanceReadyState extends EmergencyLeaveBalanceState {
  EmergencyLeaveBalanceReadyState(this.response);
  BaseEntity<dynamic> response;
}

abstract class EmergencyLeaveBalanceState {}

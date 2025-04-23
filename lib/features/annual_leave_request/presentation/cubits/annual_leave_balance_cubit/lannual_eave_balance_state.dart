part of 'annual_leave_balance_cubit.dart';

class LeaveBalanceErrorState extends LeaveBalanceState {
  final String? message;

  LeaveBalanceErrorState({this.message});
}

final class LeaveBalanceInitialState extends LeaveBalanceState {}

final class LeaveBalanceLoadingState extends LeaveBalanceState {}

final class LeaveBalanceReadyState extends LeaveBalanceState {
  LeaveBalanceReadyState(this.response);
  BaseEntity<AnnualLeaveRequestEntity> response;
}

abstract class LeaveBalanceState {}
